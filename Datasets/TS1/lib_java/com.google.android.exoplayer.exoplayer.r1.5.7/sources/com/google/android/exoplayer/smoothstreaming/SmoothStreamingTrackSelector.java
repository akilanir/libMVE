package com.google.android.exoplayer.smoothstreaming;

import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingTrackSelector.class */
public interface SmoothStreamingTrackSelector {

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingTrackSelector$Output.class */
    public interface Output {
        void adaptiveTrack(SmoothStreamingManifest smoothStreamingManifest, int i, int[] iArr);

        void fixedTrack(SmoothStreamingManifest smoothStreamingManifest, int i, int i2);
    }

    void selectTracks(SmoothStreamingManifest smoothStreamingManifest, Output output) throws IOException;
}
