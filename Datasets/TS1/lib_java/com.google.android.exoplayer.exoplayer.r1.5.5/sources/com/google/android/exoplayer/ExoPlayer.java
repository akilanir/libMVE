package com.google.android.exoplayer;

import android.os.Looper;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/ExoPlayer.class */
public interface ExoPlayer {
    public static final int STATE_IDLE = 1;
    public static final int STATE_PREPARING = 2;
    public static final int STATE_BUFFERING = 3;
    public static final int STATE_READY = 4;
    public static final int STATE_ENDED = 5;
    public static final int TRACK_DISABLED = -1;
    public static final int TRACK_DEFAULT = 0;
    public static final long UNKNOWN_TIME = -1;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/ExoPlayer$ExoPlayerComponent.class */
    public interface ExoPlayerComponent {
        void handleMessage(int i, Object obj) throws ExoPlaybackException;
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/ExoPlayer$Listener.class */
    public interface Listener {
        void onPlayerStateChanged(boolean z, int i);

        void onPlayWhenReadyCommitted();

        void onPlayerError(ExoPlaybackException exoPlaybackException);
    }

    Looper getPlaybackLooper();

    void addListener(Listener listener);

    void removeListener(Listener listener);

    int getPlaybackState();

    void prepare(TrackRenderer... trackRendererArr);

    int getTrackCount(int i);

    MediaFormat getTrackFormat(int i, int i2);

    void setSelectedTrack(int i, int i2);

    int getSelectedTrack(int i);

    void setPlayWhenReady(boolean z);

    boolean getPlayWhenReady();

    boolean isPlayWhenReadyCommitted();

    void seekTo(long j);

    void stop();

    void release();

    void sendMessage(ExoPlayerComponent exoPlayerComponent, int i, Object obj);

    void blockingSendMessage(ExoPlayerComponent exoPlayerComponent, int i, Object obj);

    long getDuration();

    long getCurrentPosition();

    long getBufferedPosition();

    int getBufferedPercentage();

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/ExoPlayer$Factory.class */
    public static final class Factory {
        public static final int DEFAULT_MIN_BUFFER_MS = 2500;
        public static final int DEFAULT_MIN_REBUFFER_MS = 5000;

        private Factory() {
        }

        public static ExoPlayer newInstance(int rendererCount, int minBufferMs, int minRebufferMs) {
            return new ExoPlayerImpl(rendererCount, minBufferMs, minRebufferMs);
        }

        public static ExoPlayer newInstance(int rendererCount) {
            return new ExoPlayerImpl(rendererCount, DEFAULT_MIN_BUFFER_MS, DEFAULT_MIN_REBUFFER_MS);
        }
    }
}
