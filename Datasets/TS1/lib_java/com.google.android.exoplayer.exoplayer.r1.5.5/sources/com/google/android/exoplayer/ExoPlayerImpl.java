package com.google.android.exoplayer;

import android.annotation.SuppressLint;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.android.exoplayer.ExoPlayer;
import java.util.Arrays;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/ExoPlayerImpl.class */
final class ExoPlayerImpl implements ExoPlayer {
    private static final String TAG = "ExoPlayerImpl";
    private final Handler eventHandler;
    private final ExoPlayerImplInternal internalPlayer;
    private final CopyOnWriteArraySet<ExoPlayer.Listener> listeners;
    private final MediaFormat[][] trackFormats;
    private final int[] selectedTrackIndices;
    private boolean playWhenReady;
    private int playbackState;
    private int pendingPlayWhenReadyAcks;

    /* JADX WARN: Type inference failed for: r1v5, types: [com.google.android.exoplayer.MediaFormat[], com.google.android.exoplayer.MediaFormat[][]] */
    @SuppressLint({"HandlerLeak"})
    public ExoPlayerImpl(int rendererCount, int minBufferMs, int minRebufferMs) {
        Log.i(TAG, "Init 1.5.5");
        this.playWhenReady = false;
        this.playbackState = 1;
        this.listeners = new CopyOnWriteArraySet<>();
        this.trackFormats = new MediaFormat[rendererCount];
        this.selectedTrackIndices = new int[rendererCount];
        this.eventHandler = new Handler() { // from class: com.google.android.exoplayer.ExoPlayerImpl.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                ExoPlayerImpl.this.handleEvent(msg);
            }
        };
        this.internalPlayer = new ExoPlayerImplInternal(this.eventHandler, this.playWhenReady, this.selectedTrackIndices, minBufferMs, minRebufferMs);
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public Looper getPlaybackLooper() {
        return this.internalPlayer.getPlaybackLooper();
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public void addListener(ExoPlayer.Listener listener) {
        this.listeners.add(listener);
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public void removeListener(ExoPlayer.Listener listener) {
        this.listeners.remove(listener);
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public int getPlaybackState() {
        return this.playbackState;
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public void prepare(TrackRenderer... renderers) {
        Arrays.fill(this.trackFormats, (Object) null);
        this.internalPlayer.prepare(renderers);
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public int getTrackCount(int rendererIndex) {
        if (this.trackFormats[rendererIndex] != null) {
            return this.trackFormats[rendererIndex].length;
        }
        return 0;
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public MediaFormat getTrackFormat(int rendererIndex, int trackIndex) {
        return this.trackFormats[rendererIndex][trackIndex];
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public void setSelectedTrack(int rendererIndex, int trackIndex) {
        if (this.selectedTrackIndices[rendererIndex] != trackIndex) {
            this.selectedTrackIndices[rendererIndex] = trackIndex;
            this.internalPlayer.setRendererSelectedTrack(rendererIndex, trackIndex);
        }
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public int getSelectedTrack(int rendererIndex) {
        return this.selectedTrackIndices[rendererIndex];
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public void setPlayWhenReady(boolean playWhenReady) {
        if (this.playWhenReady != playWhenReady) {
            this.playWhenReady = playWhenReady;
            this.pendingPlayWhenReadyAcks++;
            this.internalPlayer.setPlayWhenReady(playWhenReady);
            Iterator i$ = this.listeners.iterator();
            while (i$.hasNext()) {
                ExoPlayer.Listener listener = i$.next();
                listener.onPlayerStateChanged(playWhenReady, this.playbackState);
            }
        }
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public boolean getPlayWhenReady() {
        return this.playWhenReady;
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public boolean isPlayWhenReadyCommitted() {
        return this.pendingPlayWhenReadyAcks == 0;
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public void seekTo(long positionMs) {
        this.internalPlayer.seekTo(positionMs);
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public void stop() {
        this.internalPlayer.stop();
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public void release() {
        this.internalPlayer.release();
        this.eventHandler.removeCallbacksAndMessages(null);
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public void sendMessage(ExoPlayer.ExoPlayerComponent target, int messageType, Object message) {
        this.internalPlayer.sendMessage(target, messageType, message);
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public void blockingSendMessage(ExoPlayer.ExoPlayerComponent target, int messageType, Object message) {
        this.internalPlayer.blockingSendMessage(target, messageType, message);
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public long getDuration() {
        return this.internalPlayer.getDuration();
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public long getCurrentPosition() {
        return this.internalPlayer.getCurrentPosition();
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public long getBufferedPosition() {
        return this.internalPlayer.getBufferedPosition();
    }

    @Override // com.google.android.exoplayer.ExoPlayer
    public int getBufferedPercentage() {
        long bufferedPosition = getBufferedPosition();
        long duration = getDuration();
        if (bufferedPosition == -1 || duration == -1) {
            return 0;
        }
        return (int) (duration == 0 ? 100L : (bufferedPosition * 100) / duration);
    }

    void handleEvent(Message msg) {
        switch (msg.what) {
            case 1:
                System.arraycopy(msg.obj, 0, this.trackFormats, 0, this.trackFormats.length);
                this.playbackState = msg.arg1;
                Iterator i$ = this.listeners.iterator();
                while (i$.hasNext()) {
                    ExoPlayer.Listener listener = i$.next();
                    listener.onPlayerStateChanged(this.playWhenReady, this.playbackState);
                }
                break;
            case 2:
                this.playbackState = msg.arg1;
                Iterator i$2 = this.listeners.iterator();
                while (i$2.hasNext()) {
                    ExoPlayer.Listener listener2 = i$2.next();
                    listener2.onPlayerStateChanged(this.playWhenReady, this.playbackState);
                }
                break;
            case 3:
                this.pendingPlayWhenReadyAcks--;
                if (this.pendingPlayWhenReadyAcks == 0) {
                    Iterator i$3 = this.listeners.iterator();
                    while (i$3.hasNext()) {
                        ExoPlayer.Listener listener3 = i$3.next();
                        listener3.onPlayWhenReadyCommitted();
                    }
                    break;
                }
                break;
            case 4:
                ExoPlaybackException exception = (ExoPlaybackException) msg.obj;
                Iterator i$4 = this.listeners.iterator();
                while (i$4.hasNext()) {
                    ExoPlayer.Listener listener4 = i$4.next();
                    listener4.onPlayerError(exception);
                }
                break;
        }
    }
}
