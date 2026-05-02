package org.ligi.axt.extensions;

import android.graphics.Paint;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/extensions/PaintAXT.class */
public class PaintAXT {
    final Paint paint;

    public PaintAXT(Paint paint) {
        this.paint = paint;
    }

    public float getTextWidth(String text) {
        float[] widths = new float[text.length()];
        this.paint.getTextWidths(text, widths);
        float res = 0.0f;
        for (float f : widths) {
            res += f;
        }
        return res;
    }
}
