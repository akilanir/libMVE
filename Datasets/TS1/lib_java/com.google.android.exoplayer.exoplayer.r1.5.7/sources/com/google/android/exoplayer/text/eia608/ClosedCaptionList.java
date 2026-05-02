package com.google.android.exoplayer.text.eia608;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/eia608/ClosedCaptionList.class */
final class ClosedCaptionList implements Comparable<ClosedCaptionList> {
    public final long timeUs;
    public final boolean decodeOnly;
    public final ClosedCaption[] captions;

    public ClosedCaptionList(long timeUs, boolean decodeOnly, ClosedCaption[] captions) {
        this.timeUs = timeUs;
        this.decodeOnly = decodeOnly;
        this.captions = captions;
    }

    @Override // java.lang.Comparable
    public int compareTo(ClosedCaptionList other) {
        long delta = this.timeUs - other.timeUs;
        if (delta == 0) {
            return 0;
        }
        return delta > 0 ? 1 : -1;
    }
}
