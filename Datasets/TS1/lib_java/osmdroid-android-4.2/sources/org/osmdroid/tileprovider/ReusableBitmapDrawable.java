package org.osmdroid.tileprovider;

import android.graphics.Bitmap;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/ReusableBitmapDrawable.class */
public class ReusableBitmapDrawable extends ExpirableBitmapDrawable {
    private boolean mBitmapRecycled;
    private int mUsageRefCount;

    public ReusableBitmapDrawable(Bitmap pBitmap) {
        super(pBitmap);
        this.mBitmapRecycled = false;
        this.mUsageRefCount = 0;
    }

    public void beginUsingDrawable() {
        synchronized (this) {
            this.mUsageRefCount++;
        }
    }

    public void finishUsingDrawable() {
        synchronized (this) {
            this.mUsageRefCount--;
            if (this.mUsageRefCount < 0) {
                throw new IllegalStateException("Unbalanced endUsingDrawable() called.");
            }
        }
    }

    public Bitmap tryRecycle() {
        synchronized (this) {
            if (this.mUsageRefCount == 0) {
                this.mBitmapRecycled = true;
                return getBitmap();
            }
            return null;
        }
    }

    public boolean isBitmapValid() {
        boolean z;
        synchronized (this) {
            z = !this.mBitmapRecycled;
        }
        return z;
    }
}
