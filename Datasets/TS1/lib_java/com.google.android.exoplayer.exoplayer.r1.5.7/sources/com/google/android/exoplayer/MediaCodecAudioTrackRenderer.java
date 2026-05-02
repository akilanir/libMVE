package com.google.android.exoplayer;

import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.PlaybackParams;
import android.os.Handler;
import android.os.SystemClock;
import android.view.Surface;
import com.google.android.exoplayer.MediaCodecTrackRenderer;
import com.google.android.exoplayer.MediaCodecUtil;
import com.google.android.exoplayer.audio.AudioCapabilities;
import com.google.android.exoplayer.audio.AudioTrack;
import com.google.android.exoplayer.drm.DrmSessionManager;
import com.google.android.exoplayer.extractor.mp4.Atom;
import com.google.android.exoplayer.util.MimeTypes;
import java.nio.ByteBuffer;

@TargetApi(Atom.LONG_HEADER_SIZE)
/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/MediaCodecAudioTrackRenderer.class */
public class MediaCodecAudioTrackRenderer extends MediaCodecTrackRenderer implements MediaClock {
    public static final int MSG_SET_VOLUME = 1;
    public static final int MSG_SET_PLAYBACK_PARAMS = 2;
    private final EventListener eventListener;
    private final AudioTrack audioTrack;
    private boolean passthroughEnabled;
    private android.media.MediaFormat passthroughMediaFormat;
    private int audioSessionId;
    private long currentPositionUs;
    private boolean allowPositionDiscontinuity;
    private boolean audioTrackHasData;
    private long lastFeedElapsedRealtimeMs;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener.class */
    public interface EventListener extends MediaCodecTrackRenderer.EventListener {
        void onAudioTrackInitializationError(AudioTrack.InitializationException initializationException);

        void onAudioTrackWriteError(AudioTrack.WriteException writeException);

        void onAudioTrackUnderrun(int i, long j, long j2);
    }

    public MediaCodecAudioTrackRenderer(SampleSource source, MediaCodecSelector mediaCodecSelector) {
        this(source, mediaCodecSelector, (DrmSessionManager) null, true);
    }

    public MediaCodecAudioTrackRenderer(SampleSource source, MediaCodecSelector mediaCodecSelector, DrmSessionManager drmSessionManager, boolean playClearSamplesWithoutKeys) {
        this(source, mediaCodecSelector, drmSessionManager, playClearSamplesWithoutKeys, null, null);
    }

    public MediaCodecAudioTrackRenderer(SampleSource source, MediaCodecSelector mediaCodecSelector, Handler eventHandler, EventListener eventListener) {
        this(source, mediaCodecSelector, null, true, eventHandler, eventListener);
    }

    public MediaCodecAudioTrackRenderer(SampleSource source, MediaCodecSelector mediaCodecSelector, DrmSessionManager drmSessionManager, boolean playClearSamplesWithoutKeys, Handler eventHandler, EventListener eventListener) {
        this(source, mediaCodecSelector, drmSessionManager, playClearSamplesWithoutKeys, eventHandler, eventListener, (AudioCapabilities) null, 3);
    }

    public MediaCodecAudioTrackRenderer(SampleSource source, MediaCodecSelector mediaCodecSelector, DrmSessionManager drmSessionManager, boolean playClearSamplesWithoutKeys, Handler eventHandler, EventListener eventListener, AudioCapabilities audioCapabilities, int streamType) {
        this(new SampleSource[]{source}, mediaCodecSelector, drmSessionManager, playClearSamplesWithoutKeys, eventHandler, eventListener, audioCapabilities, streamType);
    }

    public MediaCodecAudioTrackRenderer(SampleSource[] sources, MediaCodecSelector mediaCodecSelector, DrmSessionManager drmSessionManager, boolean playClearSamplesWithoutKeys, Handler eventHandler, EventListener eventListener, AudioCapabilities audioCapabilities, int streamType) {
        super(sources, mediaCodecSelector, drmSessionManager, playClearSamplesWithoutKeys, eventHandler, eventListener);
        this.eventListener = eventListener;
        this.audioSessionId = 0;
        this.audioTrack = new AudioTrack(audioCapabilities, streamType);
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer
    protected boolean handlesTrack(MediaCodecSelector mediaCodecSelector, MediaFormat mediaFormat) throws MediaCodecUtil.DecoderQueryException {
        String mimeType = mediaFormat.mimeType;
        return MimeTypes.isAudio(mimeType) && (MimeTypes.AUDIO_UNKNOWN.equals(mimeType) || ((allowPassthrough(mimeType) && mediaCodecSelector.getPassthroughDecoderName() != null) || mediaCodecSelector.getDecoderInfo(mimeType, false) != null));
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer
    protected DecoderInfo getDecoderInfo(MediaCodecSelector mediaCodecSelector, String mimeType, boolean requiresSecureDecoder) throws MediaCodecUtil.DecoderQueryException {
        String passthroughDecoderName;
        if (allowPassthrough(mimeType) && (passthroughDecoderName = mediaCodecSelector.getPassthroughDecoderName()) != null) {
            this.passthroughEnabled = true;
            return new DecoderInfo(passthroughDecoderName, false);
        }
        this.passthroughEnabled = false;
        return super.getDecoderInfo(mediaCodecSelector, mimeType, requiresSecureDecoder);
    }

    protected boolean allowPassthrough(String mimeType) {
        return this.audioTrack.isPassthroughSupported(mimeType);
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer
    protected void configureCodec(MediaCodec codec, boolean codecIsAdaptive, android.media.MediaFormat format, MediaCrypto crypto) {
        String mimeType = format.getString("mime");
        if (this.passthroughEnabled) {
            format.setString("mime", MimeTypes.AUDIO_RAW);
            codec.configure(format, (Surface) null, crypto, 0);
            format.setString("mime", mimeType);
            this.passthroughMediaFormat = format;
            return;
        }
        codec.configure(format, (Surface) null, crypto, 0);
        this.passthroughMediaFormat = null;
    }

    @Override // com.google.android.exoplayer.TrackRenderer
    protected MediaClock getMediaClock() {
        return this;
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer
    protected void onOutputFormatChanged(android.media.MediaFormat outputFormat) {
        boolean passthrough = this.passthroughMediaFormat != null;
        this.audioTrack.configure(passthrough ? this.passthroughMediaFormat : outputFormat, passthrough);
    }

    protected void onAudioSessionId(int audioSessionId) {
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected void onStarted() {
        super.onStarted();
        this.audioTrack.play();
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected void onStopped() {
        this.audioTrack.pause();
        super.onStopped();
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected boolean isEnded() {
        return super.isEnded() && !this.audioTrack.hasPendingData();
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected boolean isReady() {
        return this.audioTrack.hasPendingData() || super.isReady();
    }

    @Override // com.google.android.exoplayer.MediaClock
    public long getPositionUs() {
        long newCurrentPositionUs = this.audioTrack.getCurrentPositionUs(isEnded());
        if (newCurrentPositionUs != Long.MIN_VALUE) {
            this.currentPositionUs = this.allowPositionDiscontinuity ? newCurrentPositionUs : Math.max(this.currentPositionUs, newCurrentPositionUs);
            this.allowPositionDiscontinuity = false;
        }
        return this.currentPositionUs;
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer, com.google.android.exoplayer.SampleSourceTrackRenderer, com.google.android.exoplayer.TrackRenderer
    protected void onDisabled() throws ExoPlaybackException {
        this.audioSessionId = 0;
        try {
            this.audioTrack.release();
            super.onDisabled();
        } catch (Throwable th) {
            super.onDisabled();
            throw th;
        }
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer, com.google.android.exoplayer.SampleSourceTrackRenderer
    protected void onDiscontinuity(long positionUs) throws ExoPlaybackException {
        super.onDiscontinuity(positionUs);
        this.audioTrack.reset();
        this.currentPositionUs = positionUs;
        this.allowPositionDiscontinuity = true;
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer
    protected boolean processOutputBuffer(long positionUs, long elapsedRealtimeUs, MediaCodec codec, ByteBuffer buffer, MediaCodec.BufferInfo bufferInfo, int bufferIndex, boolean shouldSkip) throws ExoPlaybackException {
        if (this.passthroughEnabled && (bufferInfo.flags & 2) != 0) {
            codec.releaseOutputBuffer(bufferIndex, false);
            return true;
        }
        if (shouldSkip) {
            codec.releaseOutputBuffer(bufferIndex, false);
            this.codecCounters.skippedOutputBufferCount++;
            this.audioTrack.handleDiscontinuity();
            return true;
        }
        if (!this.audioTrack.isInitialized()) {
            try {
                if (this.audioSessionId != 0) {
                    this.audioTrack.initialize(this.audioSessionId);
                } else {
                    this.audioSessionId = this.audioTrack.initialize();
                    onAudioSessionId(this.audioSessionId);
                }
                this.audioTrackHasData = false;
                if (getState() == 3) {
                    this.audioTrack.play();
                }
            } catch (AudioTrack.InitializationException e) {
                notifyAudioTrackInitializationError(e);
                throw new ExoPlaybackException(e);
            }
        } else {
            boolean audioTrackHadData = this.audioTrackHasData;
            this.audioTrackHasData = this.audioTrack.hasPendingData();
            if (audioTrackHadData && !this.audioTrackHasData && getState() == 3) {
                long elapsedSinceLastFeedMs = SystemClock.elapsedRealtime() - this.lastFeedElapsedRealtimeMs;
                long bufferSizeUs = this.audioTrack.getBufferSizeUs();
                long bufferSizeMs = bufferSizeUs == -1 ? -1L : bufferSizeUs / 1000;
                notifyAudioTrackUnderrun(this.audioTrack.getBufferSize(), bufferSizeMs, elapsedSinceLastFeedMs);
            }
        }
        try {
            int handleBufferResult = this.audioTrack.handleBuffer(buffer, bufferInfo.offset, bufferInfo.size, bufferInfo.presentationTimeUs);
            this.lastFeedElapsedRealtimeMs = SystemClock.elapsedRealtime();
            if ((handleBufferResult & 1) != 0) {
                handleAudioTrackDiscontinuity();
                this.allowPositionDiscontinuity = true;
            }
            if ((handleBufferResult & 2) != 0) {
                codec.releaseOutputBuffer(bufferIndex, false);
                this.codecCounters.renderedOutputBufferCount++;
                return true;
            }
            return false;
        } catch (AudioTrack.WriteException e2) {
            notifyAudioTrackWriteError(e2);
            throw new ExoPlaybackException(e2);
        }
    }

    @Override // com.google.android.exoplayer.MediaCodecTrackRenderer
    protected void onOutputStreamEnded() {
        this.audioTrack.handleEndOfStream();
    }

    protected void handleAudioTrackDiscontinuity() {
    }

    @Override // com.google.android.exoplayer.TrackRenderer, com.google.android.exoplayer.ExoPlayer.ExoPlayerComponent
    public void handleMessage(int messageType, Object message) throws ExoPlaybackException {
        switch (messageType) {
            case 1:
                this.audioTrack.setVolume(((Float) message).floatValue());
                break;
            case 2:
                this.audioTrack.setPlaybackParams((PlaybackParams) message);
                break;
            default:
                super.handleMessage(messageType, message);
                break;
        }
    }

    private void notifyAudioTrackInitializationError(final AudioTrack.InitializationException e) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.MediaCodecAudioTrackRenderer.1
                @Override // java.lang.Runnable
                public void run() {
                    MediaCodecAudioTrackRenderer.this.eventListener.onAudioTrackInitializationError(e);
                }
            });
        }
    }

    private void notifyAudioTrackWriteError(final AudioTrack.WriteException e) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.MediaCodecAudioTrackRenderer.2
                @Override // java.lang.Runnable
                public void run() {
                    MediaCodecAudioTrackRenderer.this.eventListener.onAudioTrackWriteError(e);
                }
            });
        }
    }

    private void notifyAudioTrackUnderrun(final int bufferSize, final long bufferSizeMs, final long elapsedSinceLastFeedMs) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.MediaCodecAudioTrackRenderer.3
                @Override // java.lang.Runnable
                public void run() {
                    MediaCodecAudioTrackRenderer.this.eventListener.onAudioTrackUnderrun(bufferSize, bufferSizeMs, elapsedSinceLastFeedMs);
                }
            });
        }
    }
}
