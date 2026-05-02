package com.google.android.exoplayer.text.eia608;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/text/eia608/ClosedCaption.class */
abstract class ClosedCaption {
    public static final int TYPE_CTRL = 0;
    public static final int TYPE_TEXT = 1;
    public final int type;

    protected ClosedCaption(int type) {
        this.type = type;
    }
}
