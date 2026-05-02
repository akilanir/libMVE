package com.mikepenz.materialdrawer.holder;

import android.content.Context;
import android.support.annotation.DimenRes;
import com.mikepenz.materialize.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/holder/DimenHolder.class */
public class DimenHolder {
    private int mPixel = Integer.MIN_VALUE;
    private int mDp = Integer.MIN_VALUE;
    private int mResource = Integer.MIN_VALUE;

    public static DimenHolder fromPixel(int pixel) {
        DimenHolder dimenHolder = new DimenHolder();
        dimenHolder.mPixel = pixel;
        return dimenHolder;
    }

    public static DimenHolder fromDp(int dp) {
        DimenHolder dimenHolder = new DimenHolder();
        dimenHolder.mDp = dp;
        return dimenHolder;
    }

    public static DimenHolder fromResource(@DimenRes int resource) {
        DimenHolder dimenHolder = new DimenHolder();
        dimenHolder.mResource = resource;
        return dimenHolder;
    }

    public int getPixel() {
        return this.mPixel;
    }

    public int getDp() {
        return this.mDp;
    }

    public int getResource() {
        return this.mResource;
    }

    public int asPixel(Context ctx) {
        if (this.mPixel != Integer.MIN_VALUE) {
            return this.mPixel;
        }
        if (this.mDp != Integer.MIN_VALUE) {
            return (int) UIUtils.convertDpToPixel(this.mDp, ctx);
        }
        if (this.mResource != Integer.MIN_VALUE) {
            return ctx.getResources().getDimensionPixelSize(this.mResource);
        }
        return 0;
    }
}
