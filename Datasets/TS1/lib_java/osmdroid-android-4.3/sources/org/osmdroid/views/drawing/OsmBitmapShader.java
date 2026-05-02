package org.osmdroid.views.drawing;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.Shader;
import org.osmdroid.views.Projection;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/drawing/OsmBitmapShader.class */
public class OsmBitmapShader extends BitmapShader {
    private static final Point sPoint = new Point();
    private final Matrix mMatrix;
    private int mBitmapWidth;
    private int mBitmapHeight;

    public OsmBitmapShader(Bitmap bitmap, Shader.TileMode tileX, Shader.TileMode tileY) {
        super(bitmap, tileX, tileY);
        this.mMatrix = new Matrix();
        this.mBitmapWidth = bitmap.getWidth();
        this.mBitmapHeight = bitmap.getHeight();
    }

    public void onDrawCycle(Projection projection) {
        projection.toMercatorPixels(0, 0, sPoint);
        this.mMatrix.setTranslate((-sPoint.x) % this.mBitmapWidth, (-sPoint.y) % this.mBitmapHeight);
        setLocalMatrix(this.mMatrix);
    }
}
