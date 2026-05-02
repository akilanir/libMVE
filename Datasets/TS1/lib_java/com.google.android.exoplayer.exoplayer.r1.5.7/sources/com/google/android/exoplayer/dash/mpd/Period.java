package com.google.android.exoplayer.dash.mpd;

import java.util.Collections;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/Period.class */
public class Period {
    public final String id;
    public final long startMs;
    public final List<AdaptationSet> adaptationSets;

    public Period(String id, long start, List<AdaptationSet> adaptationSets) {
        this.id = id;
        this.startMs = start;
        this.adaptationSets = Collections.unmodifiableList(adaptationSets);
    }

    public int getAdaptationSetIndex(int type) {
        int adaptationCount = this.adaptationSets.size();
        for (int i = 0; i < adaptationCount; i++) {
            if (this.adaptationSets.get(i).type == type) {
                return i;
            }
        }
        return -1;
    }
}
