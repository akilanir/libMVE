package com.google.android.exoplayer.dash.mpd;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/dash/mpd/UtcTimingElement.class */
public final class UtcTimingElement {
    public final String schemeIdUri;
    public final String value;

    public UtcTimingElement(String schemeIdUri, String value) {
        this.schemeIdUri = schemeIdUri;
        this.value = value;
    }

    public String toString() {
        return this.schemeIdUri + ", " + this.value;
    }
}
