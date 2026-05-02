package uk.co.chrisjenx.calligraphy;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.TextPaint;
import android.text.style.MetricAffectingSpan;

/* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/CalligraphyTypefaceSpan.class */
public class CalligraphyTypefaceSpan extends MetricAffectingSpan {
    private final Typeface typeface;

    public CalligraphyTypefaceSpan(Typeface typeface) {
        if (typeface == null) {
            throw new IllegalArgumentException("typeface is null");
        }
        this.typeface = typeface;
    }

    @Override // android.text.style.CharacterStyle
    public void updateDrawState(TextPaint drawState) {
        apply(drawState);
    }

    @Override // android.text.style.MetricAffectingSpan
    public void updateMeasureState(TextPaint paint) {
        apply(paint);
    }

    private void apply(Paint paint) {
        Typeface oldTypeface = paint.getTypeface();
        int oldStyle = oldTypeface != null ? oldTypeface.getStyle() : 0;
        int fakeStyle = oldStyle & (this.typeface.getStyle() ^ (-1));
        if ((fakeStyle & 1) != 0) {
            paint.setFakeBoldText(true);
        }
        if ((fakeStyle & 2) != 0) {
            paint.setTextSkewX(-0.25f);
        }
        paint.setTypeface(this.typeface);
    }
}
