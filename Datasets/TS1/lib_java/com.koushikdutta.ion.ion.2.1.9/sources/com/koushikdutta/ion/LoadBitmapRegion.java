package com.koushikdutta.ion;

import android.graphics.Bitmap;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Point;
import android.graphics.Rect;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.IonBitmapCache;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/LoadBitmapRegion.class */
public class LoadBitmapRegion extends BitmapCallback {
    public LoadBitmapRegion(Ion ion, final String key, final BitmapRegionDecoder decoder, final Rect region, final int inSampleSize) {
        super(ion, key, true);
        Ion.getBitmapLoadExecutorService().execute(new Runnable() { // from class: com.koushikdutta.ion.LoadBitmapRegion.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Bitmap bitmap = IonBitmapCache.loadRegion(decoder, region, inSampleSize);
                    if (bitmap == null) {
                        throw new Exception("failed to load bitmap region");
                    }
                    BitmapInfo info = new BitmapInfo(key, null, bitmap, new Point(bitmap.getWidth(), bitmap.getHeight()));
                    LoadBitmapRegion.this.report(null, info);
                } catch (Exception e) {
                    LoadBitmapRegion.this.report(e, null);
                }
            }
        });
    }
}
