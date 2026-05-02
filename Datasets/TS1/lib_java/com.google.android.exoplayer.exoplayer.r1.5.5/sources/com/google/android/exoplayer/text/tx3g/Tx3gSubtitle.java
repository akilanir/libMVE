package com.google.android.exoplayer.text.tx3g;

import com.google.android.exoplayer.text.Cue;
import com.google.android.exoplayer.text.Subtitle;
import com.google.android.exoplayer.util.Assertions;
import java.util.Collections;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/text/tx3g/Tx3gSubtitle.class */
final class Tx3gSubtitle implements Subtitle {
    private final List<Cue> cues;

    public Tx3gSubtitle(Cue cue) {
        this.cues = Collections.singletonList(cue);
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public int getNextEventTimeIndex(long timeUs) {
        return timeUs < 0 ? 0 : -1;
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public int getEventTimeCount() {
        return 1;
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public long getEventTime(int index) {
        Assertions.checkArgument(index == 0);
        return 0L;
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public long getLastEventTime() {
        return 0L;
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public List<Cue> getCues(long timeUs) {
        return timeUs >= 0 ? this.cues : Collections.emptyList();
    }
}
