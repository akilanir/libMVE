package org.ligi.axt.extensions;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Point;
import android.view.View;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/extensions/BitmapAXT.class */
public class BitmapAXT {
    private final Bitmap bitmap;

    public BitmapAXT(Bitmap bitmap) {
        this.bitmap = bitmap;
    }

    public Bitmap scaleRelative2View(View view, float inScaleX, float inScaleY) {
        return scaleRelative(view.getWidth(), view.getHeight(), inScaleX, inScaleY);
    }

    public Bitmap scaleRelative(int w, int h, float inScaleX, float inScaleY) {
        float outScaleY;
        float outScaleX;
        Matrix matrix = new Matrix();
        if (inScaleY != 0.0f) {
            outScaleY = (h * inScaleY) / this.bitmap.getHeight();
        } else {
            outScaleY = (w * inScaleX) / this.bitmap.getWidth();
        }
        if (inScaleX != 0.0f) {
            outScaleX = (w * inScaleX) / this.bitmap.getWidth();
        } else {
            outScaleX = (h * inScaleY) / this.bitmap.getHeight();
        }
        matrix.postScale(outScaleX, outScaleY);
        return Bitmap.createBitmap(this.bitmap, 0, 0, this.bitmap.getWidth(), this.bitmap.getHeight(), matrix, true);
    }

    public Point getSizeAsPoint() {
        return new Point(this.bitmap.getWidth(), this.bitmap.getHeight());
    }

    public Point scaleToFitMaxPixels(int maxPixels, Point point) {
        float scale;
        if (point.x < maxPixels && point.y < maxPixels) {
            scale = 1.0f;
        } else if (point.x > point.y) {
            scale = point.x / maxPixels;
        } else {
            scale = point.y / maxPixels;
        }
        return new Point((int) (point.x * scale), (int) (point.y * scale));
    }
}
