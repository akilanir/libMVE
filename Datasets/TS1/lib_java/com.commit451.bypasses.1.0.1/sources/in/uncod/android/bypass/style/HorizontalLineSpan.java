package in.uncod.android.bypass.style;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.text.style.ReplacementSpan;

/* loaded from: com.commit451.bypasses.1.0.1.jar:in/uncod/android/bypass/style/HorizontalLineSpan.class */
public class HorizontalLineSpan extends ReplacementSpan {
    private Paint mPaint = new Paint();
    private int mLineHeight;
    private int mTopBottomPadding;

    public HorizontalLineSpan(int color, int lineHeight, int topBottomPadding) {
        this.mPaint.setColor(color);
        this.mLineHeight = lineHeight;
        this.mTopBottomPadding = topBottomPadding;
    }

    @Override // android.text.style.ReplacementSpan
    public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
        if (fm != null) {
            fm.ascent = (-this.mLineHeight) - this.mTopBottomPadding;
            fm.descent = 0;
            fm.top = fm.ascent;
            fm.bottom = 0;
            return Integer.MAX_VALUE;
        }
        return Integer.MAX_VALUE;
    }

    @Override // android.text.style.ReplacementSpan
    public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
        int middle = (top + bottom) / 2;
        int halfLineHeight = this.mLineHeight / 2;
        canvas.drawRect(x, middle - halfLineHeight, 2.14748365E9f, middle + halfLineHeight, this.mPaint);
    }
}
