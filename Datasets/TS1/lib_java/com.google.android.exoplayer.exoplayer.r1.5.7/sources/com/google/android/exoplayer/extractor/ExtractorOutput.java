package com.google.android.exoplayer.extractor;

import com.google.android.exoplayer.drm.DrmInitData;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ExtractorOutput.class */
public interface ExtractorOutput {
    TrackOutput track(int i);

    void endTracks();

    void seekMap(SeekMap seekMap);

    void drmInitData(DrmInitData drmInitData);
}
