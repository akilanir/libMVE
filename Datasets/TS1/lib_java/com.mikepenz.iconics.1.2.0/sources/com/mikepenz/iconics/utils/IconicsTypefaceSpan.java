package com.mikepenz.iconics.utils;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.TextPaint;
import android.text.style.TypefaceSpan;

/* loaded from: com.mikepenz.iconics.1.2.0.jar:com/mikepenz/iconics/utils/IconicsTypefaceSpan.class */
public class IconicsTypefaceSpan extends TypefaceSpan {
    private final Typeface newType;

    public IconicsTypefaceSpan(String family, Typeface type) {
        super(family);
        this.newType = type;
    }

    @Override // android.text.style.TypefaceSpan, android.text.style.CharacterStyle
    public void updateDrawState(TextPaint ds) {
        applyCustomTypeFace(ds, this.newType);
    }

    @Override // android.text.style.TypefaceSpan, android.text.style.MetricAffectingSpan
    public void updateMeasureState(TextPaint paint) {
        applyCustomTypeFace(paint, this.newType);
    }

    private static void applyCustomTypeFace(Paint paint, Typeface tf) {
        int oldStyle;
        Typeface old = paint.getTypeface();
        if (old == null) {
            oldStyle = 0;
        } else {
            oldStyle = old.getStyle();
        }
        int fake = oldStyle & (tf.getStyle() ^ (-1));
        if ((fake & 1) != 0) {
            paint.setFakeBoldText(true);
        }
        if ((fake & 2) != 0) {
            paint.setTextSkewX(-0.25f);
        }
        paint.setTypeface(tf);
    }
}
