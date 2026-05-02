package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.os.Build;
import org.osmdroid.ResourceProxy;
import org.osmdroid.views.MapView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/overlay/NonAcceleratedOverlay.class */
public abstract class NonAcceleratedOverlay extends Overlay {
    private static final Logger logger = LoggerFactory.getLogger(NonAcceleratedOverlay.class);
    private Bitmap mBackingBitmap;
    private Canvas mBackingCanvas;
    private final Matrix mBackingMatrix;
    private final Matrix mCanvasIdentityMatrix;

    protected abstract void onDraw(Canvas canvas, MapView mapView, boolean z);

    public NonAcceleratedOverlay(Context ctx) {
        super(ctx);
        this.mBackingMatrix = new Matrix();
        this.mCanvasIdentityMatrix = new Matrix();
    }

    public NonAcceleratedOverlay(ResourceProxy pResourceProxy) {
        super(pResourceProxy);
        this.mBackingMatrix = new Matrix();
        this.mCanvasIdentityMatrix = new Matrix();
    }

    protected void onDraw(Canvas c, Canvas acceleratedCanvas, MapView osmv, boolean shadow) {
        onDraw(c, osmv, shadow);
    }

    public boolean isUsingBackingBitmap() {
        return true;
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public void onDetach(MapView mapView) {
        this.mBackingBitmap = null;
        this.mBackingCanvas = null;
        super.onDetach(mapView);
    }

    @Override // org.osmdroid.views.overlay.Overlay
    protected final void draw(Canvas c, MapView osmv, boolean shadow) {
        boolean atLeastHoneycomb = Build.VERSION.SDK_INT >= 11;
        if (isUsingBackingBitmap() && atLeastHoneycomb && c.isHardwareAccelerated()) {
            if (shadow || c.getWidth() == 0 || c.getHeight() == 0) {
                return;
            }
            if (this.mBackingBitmap == null || this.mBackingBitmap.getWidth() != c.getWidth() || this.mBackingBitmap.getHeight() != c.getHeight()) {
                this.mBackingBitmap = null;
                this.mBackingCanvas = null;
                try {
                    this.mBackingBitmap = Bitmap.createBitmap(c.getWidth(), c.getHeight(), Bitmap.Config.ARGB_8888);
                    this.mBackingCanvas = new Canvas(this.mBackingBitmap);
                } catch (OutOfMemoryError e) {
                    logger.error("OutOfMemoryError creating backing bitmap in NonAcceleratedOverlay.");
                    System.gc();
                    return;
                }
            }
            this.mBackingCanvas.drawColor(0, PorterDuff.Mode.CLEAR);
            c.getMatrix(this.mBackingMatrix);
            this.mBackingCanvas.setMatrix(this.mBackingMatrix);
            onDraw(this.mBackingCanvas, c, osmv, shadow);
            c.save();
            c.getMatrix(this.mCanvasIdentityMatrix);
            this.mCanvasIdentityMatrix.invert(this.mCanvasIdentityMatrix);
            c.concat(this.mCanvasIdentityMatrix);
            c.drawBitmap(this.mBackingBitmap, 0.0f, 0.0f, (Paint) null);
            c.restore();
            return;
        }
        onDraw(c, c, osmv, shadow);
    }
}
