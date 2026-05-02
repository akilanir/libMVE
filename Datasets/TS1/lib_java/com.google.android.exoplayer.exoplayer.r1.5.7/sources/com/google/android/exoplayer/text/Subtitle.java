package com.google.android.exoplayer.text;

import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/Subtitle.class */
public interface Subtitle {
    int getNextEventTimeIndex(long j);

    int getEventTimeCount();

    long getEventTime(int i);

    long getLastEventTime();

    List<Cue> getCues(long j);
}
