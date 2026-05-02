package com.davemorrissey.labs.subscaleview.decoder;

import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Point;
import android.graphics.Rect;
import android.net.Uri;
import android.text.TextUtils;
import java.util.List;

/* loaded from: com.davemorrissey.labs.subsampling-scale-image-view.3.4.1.jar:com/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder.class */
public class SkiaImageRegionDecoder implements ImageRegionDecoder {
    private BitmapRegionDecoder decoder;
    private final Object decoderLock = new Object();
    private static final String FILE_PREFIX = "file://";
    private static final String ASSET_PREFIX = "file:///android_asset/";
    private static final String RESOURCE_PREFIX = "android.resource://";

    @Override // com.davemorrissey.labs.subscaleview.decoder.ImageRegionDecoder
    public Point init(Context context, Uri uri) throws Exception {
        Resources res;
        String uriString = uri.toString();
        if (uriString.startsWith(RESOURCE_PREFIX)) {
            String packageName = uri.getAuthority();
            if (context.getPackageName().equals(packageName)) {
                res = context.getResources();
            } else {
                PackageManager pm = context.getPackageManager();
                res = pm.getResourcesForApplication(packageName);
            }
            int id = 0;
            List<String> segments = uri.getPathSegments();
            int size = segments.size();
            if (size == 2 && segments.get(0).equals("drawable")) {
                String resName = segments.get(1);
                id = res.getIdentifier(resName, "drawable", packageName);
            } else if (size == 1 && TextUtils.isDigitsOnly(segments.get(0))) {
                try {
                    id = Integer.parseInt(segments.get(0));
                } catch (NumberFormatException e) {
                }
            }
            this.decoder = BitmapRegionDecoder.newInstance(context.getResources().openRawResource(id), false);
        } else if (uriString.startsWith(ASSET_PREFIX)) {
            String assetName = uriString.substring(ASSET_PREFIX.length());
            this.decoder = BitmapRegionDecoder.newInstance(context.getAssets().open(assetName, 1), false);
        } else if (uriString.startsWith(FILE_PREFIX)) {
            this.decoder = BitmapRegionDecoder.newInstance(uriString.substring(FILE_PREFIX.length()), false);
        } else {
            ContentResolver contentResolver = context.getContentResolver();
            this.decoder = BitmapRegionDecoder.newInstance(contentResolver.openInputStream(uri), false);
        }
        return new Point(this.decoder.getWidth(), this.decoder.getHeight());
    }

    @Override // com.davemorrissey.labs.subscaleview.decoder.ImageRegionDecoder
    public Bitmap decodeRegion(Rect sRect, int sampleSize) {
        Bitmap bitmap;
        synchronized (this.decoderLock) {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = sampleSize;
            options.inPreferredConfig = Bitmap.Config.RGB_565;
            bitmap = this.decoder.decodeRegion(sRect, options);
            if (bitmap == null) {
                throw new RuntimeException("Skia image decoder returned null bitmap - image format may not be supported");
            }
        }
        return bitmap;
    }

    @Override // com.davemorrissey.labs.subscaleview.decoder.ImageRegionDecoder
    public boolean isReady() {
        return (this.decoder == null || this.decoder.isRecycled()) ? false : true;
    }

    @Override // com.davemorrissey.labs.subscaleview.decoder.ImageRegionDecoder
    public void recycle() {
        this.decoder.recycle();
    }
}
