package com.google.android.exoplayer.text;

import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/PlayableSubtitle.class */
final class PlayableSubtitle implements Subtitle {
    public final long startTimeUs;
    private final Subtitle subtitle;
    private final long offsetUs;

    public PlayableSubtitle(Subtitle subtitle, boolean isRelative, long startTimeUs, long offsetUs) {
        this.subtitle = subtitle;
        this.startTimeUs = startTimeUs;
        this.offsetUs = (isRelative ? startTimeUs : 0L) + offsetUs;
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public int getEventTimeCount() {
        return this.subtitle.getEventTimeCount();
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public long getEventTime(int index) {
        return this.subtitle.getEventTime(index) + this.offsetUs;
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public long getLastEventTime() {
        return this.subtitle.getLastEventTime() + this.offsetUs;
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public int getNextEventTimeIndex(long timeUs) {
        return this.subtitle.getNextEventTimeIndex(timeUs - this.offsetUs);
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public List<Cue> getCues(long timeUs) {
        return this.subtitle.getCues(timeUs - this.offsetUs);
    }
}
