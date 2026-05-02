package com.google.android.exoplayer.text;

import android.text.Layout;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/Cue.class */
public class Cue {
    public static final float DIMEN_UNSET = Float.MIN_VALUE;
    public static final int TYPE_UNSET = Integer.MIN_VALUE;
    public static final int ANCHOR_TYPE_START = 0;
    public static final int ANCHOR_TYPE_MIDDLE = 1;
    public static final int ANCHOR_TYPE_END = 2;
    public static final int LINE_TYPE_FRACTION = 0;
    public static final int LINE_TYPE_NUMBER = 1;
    public final CharSequence text;
    public final Layout.Alignment textAlignment;
    public final float line;
    public final int lineType;
    public final int lineAnchor;
    public final float position;
    public final int positionAnchor;
    public final float size;

    public Cue() {
        this(null);
    }

    public Cue(CharSequence text) {
        this(text, null, Float.MIN_VALUE, TYPE_UNSET, TYPE_UNSET, Float.MIN_VALUE, TYPE_UNSET, Float.MIN_VALUE);
    }

    public Cue(CharSequence text, Layout.Alignment textAlignment, float line, int lineType, int lineAnchor, float position, int positionAnchor, float size) {
        this.text = text;
        this.textAlignment = textAlignment;
        this.line = line;
        this.lineType = lineType;
        this.lineAnchor = lineAnchor;
        this.position = position;
        this.positionAnchor = positionAnchor;
        this.size = size;
    }
}
