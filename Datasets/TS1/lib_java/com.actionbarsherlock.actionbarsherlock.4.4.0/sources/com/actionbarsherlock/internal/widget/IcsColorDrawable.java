package com.actionbarsherlock.internal.widget;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsColorDrawable.class */
public class IcsColorDrawable extends Drawable {
    private int color;
    private final Paint paint = new Paint();

    public IcsColorDrawable(ColorDrawable drawable) {
        Bitmap bitmap = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(bitmap);
        drawable.draw(c);
        this.color = bitmap.getPixel(0, 0);
        bitmap.recycle();
    }

    public IcsColorDrawable(int color) {
        this.color = color;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if ((this.color >>> 24) != 0) {
            this.paint.setColor(this.color);
            canvas.drawRect(getBounds(), this.paint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        if (alpha != (this.color >>> 24)) {
            this.color = (this.color & 16777215) | (alpha << 24);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return this.color >>> 24;
    }
}
