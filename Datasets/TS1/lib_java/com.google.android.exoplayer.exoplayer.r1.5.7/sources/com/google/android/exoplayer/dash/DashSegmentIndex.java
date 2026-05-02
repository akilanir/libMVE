package com.google.android.exoplayer.dash;

import com.google.android.exoplayer.dash.mpd.RangedUri;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/DashSegmentIndex.class */
public interface DashSegmentIndex {
    public static final int INDEX_UNBOUNDED = -1;

    int getSegmentNum(long j, long j2);

    long getTimeUs(int i);

    long getDurationUs(int i, long j);

    RangedUri getSegmentUrl(int i);

    int getFirstSegmentNum();

    int getLastSegmentNum(long j);

    boolean isExplicit();
}
