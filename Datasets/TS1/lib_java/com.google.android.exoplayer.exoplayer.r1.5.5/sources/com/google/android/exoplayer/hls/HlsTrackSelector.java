package com.google.android.exoplayer.hls;

import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/hls/HlsTrackSelector.class */
public interface HlsTrackSelector {

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/hls/HlsTrackSelector$Output.class */
    public interface Output {
        void adaptiveTrack(HlsMasterPlaylist hlsMasterPlaylist, Variant[] variantArr);

        void fixedTrack(HlsMasterPlaylist hlsMasterPlaylist, Variant variant);
    }

    void selectTracks(HlsMasterPlaylist hlsMasterPlaylist, Output output) throws IOException;
}
