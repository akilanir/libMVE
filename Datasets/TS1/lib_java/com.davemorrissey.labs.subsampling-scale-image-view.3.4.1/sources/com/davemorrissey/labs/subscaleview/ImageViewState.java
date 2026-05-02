package com.davemorrissey.labs.subscaleview;

import android.graphics.PointF;
import java.io.Serializable;

/* loaded from: com.davemorrissey.labs.subsampling-scale-image-view.3.4.1.jar:com/davemorrissey/labs/subscaleview/ImageViewState.class */
public class ImageViewState implements Serializable {
    private float scale;
    private float centerX;
    private float centerY;
    private int orientation;

    public ImageViewState(float scale, PointF center, int orientation) {
        this.scale = scale;
        this.centerX = center.x;
        this.centerY = center.y;
        this.orientation = orientation;
    }

    public float getScale() {
        return this.scale;
    }

    public PointF getCenter() {
        return new PointF(this.centerX, this.centerY);
    }

    public int getOrientation() {
        return this.orientation;
    }
}
