package com.google.android.exoplayer.text.ttml;

import com.google.android.exoplayer.text.Cue;
import com.google.android.exoplayer.text.Subtitle;
import com.google.android.exoplayer.util.Util;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/text/ttml/TtmlSubtitle.class */
public final class TtmlSubtitle implements Subtitle {
    private final TtmlNode root;
    private final long[] eventTimesUs;
    private final Map<String, TtmlStyle> globalStyles;

    public TtmlSubtitle(TtmlNode root, Map<String, TtmlStyle> globalStyles) {
        this.root = root;
        this.globalStyles = globalStyles != null ? Collections.unmodifiableMap(globalStyles) : Collections.emptyMap();
        this.eventTimesUs = root.getEventTimesUs();
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public int getNextEventTimeIndex(long timeUs) {
        int index = Util.binarySearchCeil(this.eventTimesUs, timeUs, false, false);
        if (index < this.eventTimesUs.length) {
            return index;
        }
        return -1;
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public int getEventTimeCount() {
        return this.eventTimesUs.length;
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public long getEventTime(int index) {
        return this.eventTimesUs[index];
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public long getLastEventTime() {
        if (this.eventTimesUs.length == 0) {
            return -1L;
        }
        return this.eventTimesUs[this.eventTimesUs.length - 1];
    }

    TtmlNode getRoot() {
        return this.root;
    }

    @Override // com.google.android.exoplayer.text.Subtitle
    public List<Cue> getCues(long timeUs) {
        CharSequence cueText = this.root.getText(timeUs, this.globalStyles);
        if (cueText == null) {
            return Collections.emptyList();
        }
        Cue cue = new Cue(cueText);
        return Collections.singletonList(cue);
    }

    Map<String, TtmlStyle> getGlobalStyles() {
        return this.globalStyles;
    }
}
