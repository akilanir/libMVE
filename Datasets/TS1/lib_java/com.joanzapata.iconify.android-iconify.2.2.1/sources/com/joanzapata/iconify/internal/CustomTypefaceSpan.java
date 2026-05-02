package com.joanzapata.iconify.internal;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.text.style.ReplacementSpan;
import com.joanzapata.iconify.Icon;

/* loaded from: com.joanzapata.iconify.android-iconify.2.2.1.jar:com/joanzapata/iconify/internal/CustomTypefaceSpan.class */
public class CustomTypefaceSpan extends ReplacementSpan {
    private static final int ROTATION_DURATION = 2000;
    private static final Rect TEXT_BOUNDS = new Rect();
    private static final Paint LOCAL_PAINT = new Paint();
    private static final float BASELINE_RATIO = 0.14285715f;
    private final String icon;
    private final Typeface type;
    private final float iconSizePx;
    private final float iconSizeRatio;
    private final int iconColor;
    private final boolean rotate;
    private final boolean baselineAligned;
    private final long rotationStartTime = System.currentTimeMillis();

    public CustomTypefaceSpan(Icon icon, Typeface type, float iconSizePx, float iconSizeRatio, int iconColor, boolean rotate, boolean baselineAligned) {
        this.rotate = rotate;
        this.baselineAligned = baselineAligned;
        this.icon = String.valueOf(icon.character());
        this.type = type;
        this.iconSizePx = iconSizePx;
        this.iconSizeRatio = iconSizeRatio;
        this.iconColor = iconColor;
    }

    @Override // android.text.style.ReplacementSpan
    public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
        LOCAL_PAINT.set(paint);
        applyCustomTypeFace(LOCAL_PAINT, this.type);
        LOCAL_PAINT.getTextBounds(this.icon, 0, 1, TEXT_BOUNDS);
        if (fm != null) {
            float baselineRatio = this.baselineAligned ? 0.0f : BASELINE_RATIO;
            fm.descent = (int) (TEXT_BOUNDS.height() * baselineRatio);
            fm.ascent = -(TEXT_BOUNDS.height() - fm.descent);
            fm.top = fm.ascent;
            fm.bottom = fm.descent;
        }
        return TEXT_BOUNDS.width();
    }

    @Override // android.text.style.ReplacementSpan
    public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
        applyCustomTypeFace(paint, this.type);
        paint.getTextBounds(this.icon, 0, 1, TEXT_BOUNDS);
        canvas.save();
        float baselineRatio = this.baselineAligned ? 0.0f : BASELINE_RATIO;
        if (this.rotate) {
            float rotation = ((System.currentTimeMillis() - this.rotationStartTime) / 2000.0f) * 360.0f;
            float centerX = x + (TEXT_BOUNDS.width() / 2.0f);
            float centerY = (y - (TEXT_BOUNDS.height() / 2.0f)) + (TEXT_BOUNDS.height() * baselineRatio);
            canvas.rotate(rotation, centerX, centerY);
        }
        canvas.drawText(this.icon, x - TEXT_BOUNDS.left, (y - TEXT_BOUNDS.bottom) + (TEXT_BOUNDS.height() * baselineRatio), paint);
        canvas.restore();
    }

    public boolean isAnimated() {
        return this.rotate;
    }

    private void applyCustomTypeFace(Paint paint, Typeface tf) {
        paint.setFakeBoldText(false);
        paint.setTextSkewX(0.0f);
        paint.setTypeface(tf);
        if (this.rotate) {
            paint.clearShadowLayer();
        }
        if (this.iconSizeRatio > 0.0f) {
            paint.setTextSize(paint.getTextSize() * this.iconSizeRatio);
        } else if (this.iconSizePx > 0.0f) {
            paint.setTextSize(this.iconSizePx);
        }
        if (this.iconColor < Integer.MAX_VALUE) {
            paint.setColor(this.iconColor);
        }
    }
}
