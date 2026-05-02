package org.osmdroid.tileprovider;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/ExpirableBitmapDrawable.class */
public class ExpirableBitmapDrawable extends BitmapDrawable {
    private static final int EXPIRED = -1;
    private int[] mState;

    public ExpirableBitmapDrawable(Bitmap pBitmap) {
        super(pBitmap);
        this.mState = new int[0];
    }

    @Override // android.graphics.drawable.Drawable
    public int[] getState() {
        return this.mState;
    }

    @Override // android.graphics.drawable.BitmapDrawable, android.graphics.drawable.Drawable
    public boolean isStateful() {
        return this.mState.length > 0;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean setState(int[] pStateSet) {
        this.mState = pStateSet;
        return true;
    }

    public static boolean isDrawableExpired(Drawable pTile) {
        if (!pTile.isStateful()) {
            return false;
        }
        int[] state = pTile.getState();
        for (int i : state) {
            if (i == EXPIRED) {
                return true;
            }
        }
        return false;
    }

    public static void setDrawableExpired(Drawable pTile) {
        pTile.setState(new int[]{EXPIRED});
    }
}
