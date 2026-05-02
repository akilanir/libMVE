package com.larvalabs.svgandroid;

import android.graphics.Picture;
import android.graphics.RectF;
import android.graphics.drawable.PictureDrawable;

/* loaded from: svg-android-2.0.0.jar:com/larvalabs/svgandroid/SVG.class */
public class SVG {
    private final Picture picture;
    private final RectF bounds;
    private RectF limits = null;
    private PictureDrawable drawable = null;

    SVG(Picture picture, RectF bounds) {
        this.picture = picture;
        this.bounds = bounds;
    }

    void setLimits(RectF limits) {
        this.limits = limits;
    }

    public PictureDrawable getDrawable() {
        if (this.drawable == null) {
            this.drawable = new PictureDrawable(this.picture);
        }
        return this.drawable;
    }

    public Picture getPicture() {
        return this.picture;
    }

    public RectF getBounds() {
        return this.bounds;
    }

    public RectF getLimits() {
        return this.limits;
    }
}
