package com.koushikdutta.ion;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import com.koushikdutta.ion.bitmap.Transform;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/DefaultTransform.class */
class DefaultTransform implements Transform {
    final ScaleMode scaleMode;
    final int resizeWidth;
    final int resizeHeight;
    static final Paint bilinearSamplingPaint = new Paint(2);

    public DefaultTransform(int width, int height, ScaleMode scaleMode) {
        this.resizeWidth = width;
        this.resizeHeight = height;
        if (scaleMode == null) {
            this.scaleMode = ScaleMode.FitXY;
        } else {
            this.scaleMode = scaleMode;
        }
    }

    @Override // com.koushikdutta.ion.bitmap.Transform
    public Bitmap transform(Bitmap b) {
        float ratio;
        Bitmap.Config config = b.getConfig();
        if (config == null) {
            config = Bitmap.Config.ARGB_8888;
        }
        int resizeWidth = this.resizeWidth;
        int resizeHeight = this.resizeHeight;
        if (resizeWidth <= 0) {
            float ratio2 = b.getWidth() / b.getHeight();
            resizeWidth = (int) (ratio2 * resizeHeight);
        } else if (resizeHeight <= 0) {
            float ratio3 = b.getHeight() / b.getWidth();
            resizeHeight = (int) (ratio3 * resizeWidth);
        }
        RectF destination = new RectF(0.0f, 0.0f, resizeWidth, resizeHeight);
        ScaleMode scaleMode = this.scaleMode;
        if (scaleMode == ScaleMode.CenterInside && (resizeWidth <= b.getWidth() || resizeHeight <= b.getHeight())) {
            scaleMode = ScaleMode.FitCenter;
        }
        if (scaleMode == ScaleMode.CenterInside) {
            float marginx = (resizeWidth - b.getWidth()) / 2.0f;
            float marginy = (resizeHeight - b.getHeight()) / 2.0f;
            destination.set(marginx, marginy, marginx + b.getWidth(), marginy + b.getHeight());
        } else if (scaleMode != ScaleMode.FitXY) {
            float xratio = resizeWidth / b.getWidth();
            float yratio = resizeHeight / b.getHeight();
            if (scaleMode == ScaleMode.CenterCrop) {
                ratio = Math.max(xratio, yratio);
            } else {
                ratio = Math.min(xratio, yratio);
            }
            if (ratio == 0.0f) {
                return b;
            }
            float postWidth = b.getWidth() * ratio;
            float postHeight = b.getHeight() * ratio;
            float transx = (resizeWidth - postWidth) / 2.0f;
            float transy = (resizeHeight - postHeight) / 2.0f;
            destination.set(transx, transy, resizeWidth - transx, resizeHeight - transy);
        }
        if (destination.width() == b.getWidth() && destination.height() == b.getHeight() && destination.top == 0.0f && destination.left == 0.0f) {
            return b;
        }
        Bitmap ret = Bitmap.createBitmap(resizeWidth, resizeHeight, config);
        Canvas canvas = new Canvas(ret);
        canvas.drawBitmap(b, (Rect) null, destination, bilinearSamplingPaint);
        return ret;
    }

    @Override // com.koushikdutta.ion.bitmap.Transform
    public String key() {
        return this.scaleMode.name() + this.resizeWidth + "x" + this.resizeHeight;
    }
}
