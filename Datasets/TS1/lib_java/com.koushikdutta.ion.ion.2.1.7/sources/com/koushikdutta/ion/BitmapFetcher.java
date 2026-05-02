package com.koushikdutta.ion;

import android.os.Handler;
import com.koushikdutta.async.AsyncServer;
import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.parser.ByteBufferListParser;
import com.koushikdutta.async.util.FileCache;
import com.koushikdutta.ion.IonRequestBuilder;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.PostProcess;
import com.koushikdutta.ion.bitmap.Transform;
import com.koushikdutta.ion.loader.MediaFile;
import java.io.File;
import java.net.URI;
import java.util.ArrayList;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/BitmapFetcher.class */
class BitmapFetcher implements IonRequestBuilder.LoadRequestCallback {
    String decodeKey;
    String bitmapKey;
    BitmapInfo info;
    boolean hasTransforms;
    ArrayList<Transform> transforms;
    IonRequestBuilder builder;
    int sampleWidth;
    int sampleHeight;
    boolean animateGif;
    boolean deepZoom;
    ArrayList<PostProcess> postProcess;
    public static final int MAX_IMAGEVIEW_LOAD = 5;

    BitmapFetcher() {
    }

    public void recomputeDecodeKey() {
        this.decodeKey = IonBitmapRequestBuilder.computeDecodeKey(this.builder, this.sampleWidth, this.sampleHeight, this.animateGif, this.deepZoom);
        this.bitmapKey = IonBitmapRequestBuilder.computeBitmapKey(this.decodeKey, this.transforms);
    }

    private boolean fastLoad(String uri) {
        Ion ion = this.builder.ion;
        if (this.deepZoom) {
            if (uri == null || !uri.startsWith("file:/")) {
                return false;
            }
            File file = new File(URI.create(uri));
            if (!file.exists()) {
                return false;
            }
            MediaFile.MediaFileType type = MediaFile.getFileType(file.getAbsolutePath());
            if (type == null || !MediaFile.isVideoFileType(type.fileType)) {
                LoadDeepZoom loadDeepZoom = new LoadDeepZoom(ion, this.decodeKey, this.animateGif, null);
                loadDeepZoom.onCompleted((Exception) null, new Response<>(null, ResponseServedFrom.LOADED_FROM_CACHE, null, null, file));
                return true;
            }
        }
        boolean put = !this.hasTransforms;
        for (Loader loader : ion.configure().getLoaders()) {
            Future<BitmapInfo> future = loader.loadBitmap(this.builder.contextReference.getContext(), ion, this.decodeKey, uri, this.sampleWidth, this.sampleHeight, this.animateGif);
            if (future != null) {
                final BitmapCallback callback = new LoadBitmapBase(ion, this.decodeKey, put);
                future.setCallback(new FutureCallback<BitmapInfo>() { // from class: com.koushikdutta.ion.BitmapFetcher.1
                    public void onCompleted(Exception e, BitmapInfo result) {
                        callback.report(e, result);
                    }
                });
                return true;
            }
        }
        return false;
    }

    public static boolean shouldDeferImageView(Ion ion) {
        if (ion.bitmapsPending.keySet().size() <= 5) {
            return false;
        }
        int loadCount = 0;
        for (String key : ion.bitmapsPending.keySet()) {
            Object owner = ion.bitmapsPending.tag(key);
            if (owner instanceof LoadBitmapBase) {
                loadCount++;
                if (loadCount > 5) {
                    return true;
                }
            }
        }
        return false;
    }

    public DeferredLoadBitmap defer() {
        DeferredLoadBitmap ret = new DeferredLoadBitmap(this.builder.ion, this.decodeKey, this);
        executeTransforms(this.builder.ion);
        return ret;
    }

    private void executeTransforms(Ion ion) {
        if (this.hasTransforms && ion.bitmapsPending.tag(this.bitmapKey) == null) {
            ion.bitmapsPending.add(this.decodeKey, new TransformBitmap(ion, this.bitmapKey, this.decodeKey, this.transforms, this.postProcess));
        }
    }

    @Override // com.koushikdutta.ion.IonRequestBuilder.LoadRequestCallback
    public boolean loadRequest(AsyncHttpRequest request) {
        return !fastLoad(request.getUri().toString());
    }

    public void execute() {
        final Ion ion = this.builder.ion;
        FileCache fileCache = ion.responseCache.getFileCache();
        if (!this.builder.noCache && fileCache.exists(this.bitmapKey) && !this.deepZoom) {
            BitmapCallback.getBitmapSnapshot(ion, this.bitmapKey, this.postProcess);
            return;
        }
        if (ion.bitmapsPending.tag(this.decodeKey) == null && !fastLoad(this.builder.uri)) {
            this.builder.setHandler((Handler) null);
            this.builder.loadRequestCallback = this;
            if (!this.deepZoom) {
                Future<Response<ByteBufferList>> emitterTransform = this.builder.execute(new ByteBufferListParser(), new Runnable() { // from class: com.koushikdutta.ion.BitmapFetcher.2
                    @Override // java.lang.Runnable
                    public void run() {
                        AsyncServer.post(Ion.mainHandler, new Runnable() { // from class: com.koushikdutta.ion.BitmapFetcher.2.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ion.bitmapsPending.remove(BitmapFetcher.this.decodeKey);
                            }
                        });
                    }
                }).withResponse();
                emitterTransform.setCallback(new LoadBitmap(ion, this.decodeKey, !this.hasTransforms, this.sampleWidth, this.sampleHeight, this.animateGif));
            } else {
                File file = fileCache.getTempFile();
                Future<Response<File>> emitterTransform2 = this.builder.write(file).withResponse();
                LoadDeepZoom loadDeepZoom = new LoadDeepZoom(ion, this.decodeKey, this.animateGif, fileCache);
                emitterTransform2.setCallback(loadDeepZoom);
            }
        }
        executeTransforms(ion);
    }
}
