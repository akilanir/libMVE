package com.google.android.exoplayer.dash;

import com.google.android.exoplayer.dash.mpd.MediaPresentationDescription;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/DashTrackSelector.class */
public interface DashTrackSelector {

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/DashTrackSelector$Output.class */
    public interface Output {
        void adaptiveTrack(MediaPresentationDescription mediaPresentationDescription, int i, int i2, int[] iArr);

        void fixedTrack(MediaPresentationDescription mediaPresentationDescription, int i, int i2, int i3);
    }

    void selectTracks(MediaPresentationDescription mediaPresentationDescription, int i, Output output) throws IOException;
}
