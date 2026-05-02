package org.osmdroid.tileprovider;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import java.util.Iterator;
import java.util.LinkedList;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/BitmapPool.class */
public class BitmapPool {
    final LinkedList<Bitmap> mPool = new LinkedList<>();
    private static BitmapPool sInstance;

    public static BitmapPool getInstance() {
        if (sInstance == null) {
            sInstance = new BitmapPool();
        }
        return sInstance;
    }

    public void returnDrawableToPool(ReusableBitmapDrawable drawable) {
        Bitmap b = drawable.tryRecycle();
        if (b != null && b.isMutable()) {
            synchronized (this.mPool) {
                this.mPool.addLast(b);
            }
        }
    }

    public void applyReusableOptions(BitmapFactory.Options aBitmapOptions) {
        if (Build.VERSION.SDK_INT >= 11) {
            aBitmapOptions.inBitmap = obtainBitmapFromPool();
            aBitmapOptions.inSampleSize = 1;
            aBitmapOptions.inMutable = true;
        }
    }

    public Bitmap obtainBitmapFromPool() {
        synchronized (this.mPool) {
            if (this.mPool.isEmpty()) {
                return null;
            }
            Bitmap bitmap = this.mPool.removeFirst();
            if (bitmap.isRecycled()) {
                return obtainBitmapFromPool();
            }
            return bitmap;
        }
    }

    public Bitmap obtainSizedBitmapFromPool(int aWidth, int aHeight) {
        synchronized (this.mPool) {
            if (this.mPool.isEmpty()) {
                return null;
            }
            Iterator i$ = this.mPool.iterator();
            while (i$.hasNext()) {
                Bitmap bitmap = i$.next();
                if (bitmap.isRecycled()) {
                    this.mPool.remove(bitmap);
                    return obtainSizedBitmapFromPool(aWidth, aHeight);
                }
                if (bitmap.getWidth() == aWidth && bitmap.getHeight() == aHeight) {
                    this.mPool.remove(bitmap);
                    return bitmap;
                }
            }
            return null;
        }
    }

    public void clearBitmapPool() {
        synchronized (sInstance.mPool) {
            while (!sInstance.mPool.isEmpty()) {
                Bitmap bitmap = sInstance.mPool.remove();
                bitmap.recycle();
            }
        }
    }
}
