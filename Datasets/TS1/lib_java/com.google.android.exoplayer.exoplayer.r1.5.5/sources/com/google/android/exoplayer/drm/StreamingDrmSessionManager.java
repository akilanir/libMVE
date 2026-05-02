package com.google.android.exoplayer.drm;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.media.DeniedByServerException;
import android.media.MediaCrypto;
import android.media.MediaDrm;
import android.media.NotProvisionedException;
import android.media.UnsupportedSchemeException;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import com.google.android.exoplayer.drm.DrmInitData;
import com.google.android.exoplayer.extractor.mp4.PsshAtomUtil;
import com.google.android.exoplayer.util.Util;
import java.util.HashMap;
import java.util.UUID;

@TargetApi(18)
/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/drm/StreamingDrmSessionManager.class */
public class StreamingDrmSessionManager implements DrmSessionManager {
    public static final UUID WIDEVINE_UUID = new UUID(-1301668207276963122L, -6645017420763422227L);
    public static final UUID PLAYREADY_UUID = new UUID(-7348484286925749626L, -6083546864340672619L);
    public static final String PLAYREADY_CUSTOM_DATA_KEY = "PRCustomData";
    private static final int MSG_PROVISION = 0;
    private static final int MSG_KEYS = 1;
    private final Handler eventHandler;
    private final EventListener eventListener;
    private final MediaDrm mediaDrm;
    private final HashMap<String, String> optionalKeyRequestParameters;
    final MediaDrmHandler mediaDrmHandler;
    final MediaDrmCallback callback;
    final PostResponseHandler postResponseHandler;
    final UUID uuid;
    private HandlerThread requestHandlerThread;
    private Handler postRequestHandler;
    private int openCount;
    private boolean provisioningInProgress;
    private int state;
    private MediaCrypto mediaCrypto;
    private Exception lastException;
    private DrmInitData.SchemeInitData schemeInitData;
    private byte[] sessionId;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener.class */
    public interface EventListener {
        void onDrmKeysLoaded();

        void onDrmSessionManagerError(Exception exc);
    }

    public static StreamingDrmSessionManager newWidevineInstance(Looper playbackLooper, MediaDrmCallback callback, HashMap<String, String> optionalKeyRequestParameters, Handler eventHandler, EventListener eventListener) throws UnsupportedDrmException {
        return new StreamingDrmSessionManager(WIDEVINE_UUID, playbackLooper, callback, optionalKeyRequestParameters, eventHandler, eventListener);
    }

    public static StreamingDrmSessionManager newPlayReadyInstance(Looper playbackLooper, MediaDrmCallback callback, String customData, Handler eventHandler, EventListener eventListener) throws UnsupportedDrmException {
        HashMap<String, String> optionalKeyRequestParameters;
        if (!TextUtils.isEmpty(customData)) {
            optionalKeyRequestParameters = new HashMap<>();
            optionalKeyRequestParameters.put(PLAYREADY_CUSTOM_DATA_KEY, customData);
        } else {
            optionalKeyRequestParameters = null;
        }
        return new StreamingDrmSessionManager(PLAYREADY_UUID, playbackLooper, callback, optionalKeyRequestParameters, eventHandler, eventListener);
    }

    public StreamingDrmSessionManager(UUID uuid, Looper playbackLooper, MediaDrmCallback callback, HashMap<String, String> optionalKeyRequestParameters, Handler eventHandler, EventListener eventListener) throws UnsupportedDrmException {
        this.uuid = uuid;
        this.callback = callback;
        this.optionalKeyRequestParameters = optionalKeyRequestParameters;
        this.eventHandler = eventHandler;
        this.eventListener = eventListener;
        try {
            this.mediaDrm = new MediaDrm(uuid);
            this.mediaDrm.setOnEventListener(new MediaDrmEventListener());
            this.mediaDrmHandler = new MediaDrmHandler(playbackLooper);
            this.postResponseHandler = new PostResponseHandler(playbackLooper);
            this.state = 1;
        } catch (UnsupportedSchemeException e) {
            throw new UnsupportedDrmException(1, e);
        } catch (Exception e2) {
            throw new UnsupportedDrmException(2, e2);
        }
    }

    @Override // com.google.android.exoplayer.drm.DrmSessionManager
    public final int getState() {
        return this.state;
    }

    @Override // com.google.android.exoplayer.drm.DrmSessionManager
    public final MediaCrypto getMediaCrypto() {
        if (this.state != 3 && this.state != 4) {
            throw new IllegalStateException();
        }
        return this.mediaCrypto;
    }

    @Override // com.google.android.exoplayer.drm.DrmSessionManager
    public boolean requiresSecureDecoderComponent(String mimeType) {
        if (this.state != 3 && this.state != 4) {
            throw new IllegalStateException();
        }
        return this.mediaCrypto.requiresSecureDecoderComponent(mimeType);
    }

    @Override // com.google.android.exoplayer.drm.DrmSessionManager
    public final Exception getError() {
        if (this.state == 0) {
            return this.lastException;
        }
        return null;
    }

    public final String getPropertyString(String key) {
        return this.mediaDrm.getPropertyString(key);
    }

    public final void setPropertyString(String key, String value) {
        this.mediaDrm.setPropertyString(key, value);
    }

    public final byte[] getPropertyByteArray(String key) {
        return this.mediaDrm.getPropertyByteArray(key);
    }

    public final void setPropertyByteArray(String key, byte[] value) {
        this.mediaDrm.setPropertyByteArray(key, value);
    }

    @Override // com.google.android.exoplayer.drm.DrmSessionManager
    public void open(DrmInitData drmInitData) {
        byte[] psshData;
        int i = this.openCount + 1;
        this.openCount = i;
        if (i != 1) {
            return;
        }
        if (this.postRequestHandler == null) {
            this.requestHandlerThread = new HandlerThread("DrmRequestHandler");
            this.requestHandlerThread.start();
            this.postRequestHandler = new PostRequestHandler(this.requestHandlerThread.getLooper());
        }
        if (this.schemeInitData == null) {
            this.schemeInitData = drmInitData.get(this.uuid);
            if (this.schemeInitData == null) {
                onError(new IllegalStateException("Media does not support uuid: " + this.uuid));
                return;
            } else if (Util.SDK_INT < 21 && (psshData = PsshAtomUtil.parseSchemeSpecificData(this.schemeInitData.data, WIDEVINE_UUID)) != null) {
                this.schemeInitData = new DrmInitData.SchemeInitData(this.schemeInitData.mimeType, psshData);
            }
        }
        this.state = 2;
        openInternal(true);
    }

    @Override // com.google.android.exoplayer.drm.DrmSessionManager
    public void close() {
        int i = this.openCount - 1;
        this.openCount = i;
        if (i != 0) {
            return;
        }
        this.state = 1;
        this.provisioningInProgress = false;
        this.mediaDrmHandler.removeCallbacksAndMessages(null);
        this.postResponseHandler.removeCallbacksAndMessages(null);
        this.postRequestHandler.removeCallbacksAndMessages(null);
        this.postRequestHandler = null;
        this.requestHandlerThread.quit();
        this.requestHandlerThread = null;
        this.schemeInitData = null;
        this.mediaCrypto = null;
        this.lastException = null;
        if (this.sessionId != null) {
            this.mediaDrm.closeSession(this.sessionId);
            this.sessionId = null;
        }
    }

    private void openInternal(boolean allowProvisioning) {
        try {
            this.sessionId = this.mediaDrm.openSession();
            this.mediaCrypto = new MediaCrypto(this.uuid, this.sessionId);
            this.state = 3;
            postKeyRequest();
        } catch (NotProvisionedException e) {
            if (allowProvisioning) {
                postProvisionRequest();
            } else {
                onError(e);
            }
        } catch (Exception e2) {
            onError(e2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postProvisionRequest() {
        if (this.provisioningInProgress) {
            return;
        }
        this.provisioningInProgress = true;
        MediaDrm.ProvisionRequest request = this.mediaDrm.getProvisionRequest();
        this.postRequestHandler.obtainMessage(0, request).sendToTarget();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onProvisionResponse(Object response) {
        this.provisioningInProgress = false;
        if (this.state != 2 && this.state != 3 && this.state != 4) {
            return;
        }
        if (response instanceof Exception) {
            onError((Exception) response);
            return;
        }
        try {
            this.mediaDrm.provideProvisionResponse((byte[]) response);
            if (this.state == 2) {
                openInternal(false);
            } else {
                postKeyRequest();
            }
        } catch (DeniedByServerException e) {
            onError(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postKeyRequest() {
        try {
            MediaDrm.KeyRequest keyRequest = this.mediaDrm.getKeyRequest(this.sessionId, this.schemeInitData.data, this.schemeInitData.mimeType, 1, this.optionalKeyRequestParameters);
            this.postRequestHandler.obtainMessage(1, keyRequest).sendToTarget();
        } catch (NotProvisionedException e) {
            onKeysError(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onKeyResponse(Object response) {
        if (this.state != 3 && this.state != 4) {
            return;
        }
        if (response instanceof Exception) {
            onKeysError((Exception) response);
            return;
        }
        try {
            this.mediaDrm.provideKeyResponse(this.sessionId, (byte[]) response);
            this.state = 4;
            if (this.eventHandler != null && this.eventListener != null) {
                this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.drm.StreamingDrmSessionManager.1
                    @Override // java.lang.Runnable
                    public void run() {
                        StreamingDrmSessionManager.this.eventListener.onDrmKeysLoaded();
                    }
                });
            }
        } catch (Exception e) {
            onKeysError(e);
        }
    }

    private void onKeysError(Exception e) {
        if (e instanceof NotProvisionedException) {
            postProvisionRequest();
        } else {
            onError(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onError(final Exception e) {
        this.lastException = e;
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.drm.StreamingDrmSessionManager.2
                @Override // java.lang.Runnable
                public void run() {
                    StreamingDrmSessionManager.this.eventListener.onDrmSessionManagerError(e);
                }
            });
        }
        if (this.state != 4) {
            this.state = 0;
        }
    }

    @SuppressLint({"HandlerLeak"})
    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmHandler.class */
    private class MediaDrmHandler extends Handler {
        public MediaDrmHandler(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (StreamingDrmSessionManager.this.openCount != 0) {
                if (StreamingDrmSessionManager.this.state == 3 || StreamingDrmSessionManager.this.state == 4) {
                    switch (msg.what) {
                        case 1:
                            StreamingDrmSessionManager.this.state = 3;
                            StreamingDrmSessionManager.this.postProvisionRequest();
                            break;
                        case 2:
                            StreamingDrmSessionManager.this.postKeyRequest();
                            break;
                        case 3:
                            StreamingDrmSessionManager.this.state = 3;
                            StreamingDrmSessionManager.this.onError(new KeysExpiredException());
                            break;
                    }
                }
            }
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmEventListener.class */
    private class MediaDrmEventListener implements MediaDrm.OnEventListener {
        private MediaDrmEventListener() {
        }

        @Override // android.media.MediaDrm.OnEventListener
        public void onEvent(MediaDrm md, byte[] sessionId, int event, int extra, byte[] data) {
            StreamingDrmSessionManager.this.mediaDrmHandler.sendEmptyMessage(event);
        }
    }

    @SuppressLint({"HandlerLeak"})
    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/drm/StreamingDrmSessionManager$PostResponseHandler.class */
    private class PostResponseHandler extends Handler {
        public PostResponseHandler(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 0:
                    StreamingDrmSessionManager.this.onProvisionResponse(msg.obj);
                    break;
                case 1:
                    StreamingDrmSessionManager.this.onKeyResponse(msg.obj);
                    break;
            }
        }
    }

    @SuppressLint({"HandlerLeak"})
    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/drm/StreamingDrmSessionManager$PostRequestHandler.class */
    private class PostRequestHandler extends Handler {
        public PostRequestHandler(Looper backgroundLooper) {
            super(backgroundLooper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            Object response;
            try {
                switch (msg.what) {
                    case 0:
                        response = StreamingDrmSessionManager.this.callback.executeProvisionRequest(StreamingDrmSessionManager.this.uuid, (MediaDrm.ProvisionRequest) msg.obj);
                        break;
                    case 1:
                        response = StreamingDrmSessionManager.this.callback.executeKeyRequest(StreamingDrmSessionManager.this.uuid, (MediaDrm.KeyRequest) msg.obj);
                        break;
                    default:
                        throw new RuntimeException();
                }
            } catch (Exception e) {
                response = e;
            }
            StreamingDrmSessionManager.this.postResponseHandler.obtainMessage(msg.what, response).sendToTarget();
        }
    }
}
