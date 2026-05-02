package com.koushikdutta.ion.bitmap;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.WindowManager;
import com.koushikdutta.async.util.StreamUtility;
import com.koushikdutta.ion.Ion;
import com.koushikdutta.ion.IonLog;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/bitmap/IonBitmapCache.class */
public class IonBitmapCache {
    public static final long DEFAULT_ERROR_CACHE_DURATION = 30000;
    Resources resources;
    DisplayMetrics metrics;
    LruBitmapCache cache;
    Ion ion;
    long errorCacheDuration = DEFAULT_ERROR_CACHE_DURATION;
    double heapRatio = 0.14285714285714285d;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !IonBitmapCache.class.desiredAssertionStatus();
    }

    public long getErrorCacheDuration() {
        return this.errorCacheDuration;
    }

    public void setErrorCacheDuration(long errorCacheDuration) {
        this.errorCacheDuration = errorCacheDuration;
    }

    public IonBitmapCache(Ion ion) {
        Context context = ion.getContext().getApplicationContext();
        this.ion = ion;
        this.metrics = new DisplayMetrics();
        ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(this.metrics);
        AssetManager mgr = context.getAssets();
        this.resources = new Resources(mgr, this.metrics, context.getResources().getConfiguration());
        this.cache = new LruBitmapCache(getHeapSize(context) / 7);
    }

    public BitmapInfo remove(String key) {
        return this.cache.removeBitmapInfo(key);
    }

    public void clear() {
        this.cache.evictAllBitmapInfo();
    }

    public double getHeapRatio() {
        return this.heapRatio;
    }

    public void setHeapRatio(double heapRatio) {
        this.heapRatio = heapRatio;
    }

    public void put(BitmapInfo info) {
        if (!$assertionsDisabled && Thread.currentThread() != Looper.getMainLooper().getThread()) {
            throw new AssertionError();
        }
        int maxSize = (int) (getHeapSize(this.ion.getContext()) * this.heapRatio);
        if (maxSize != this.cache.maxSize()) {
            this.cache.setMaxSize(maxSize);
        }
        this.cache.put(info.key, info);
    }

    public void putSoft(BitmapInfo info) {
        if (!$assertionsDisabled && Thread.currentThread() != Looper.getMainLooper().getThread()) {
            throw new AssertionError();
        }
        this.cache.putSoft(info.key, info);
    }

    public BitmapInfo get(String key) {
        BitmapInfo ret;
        if (key == null || (ret = this.cache.getBitmapInfo(key)) == null) {
            return null;
        }
        if (ret.bitmap != null && ret.bitmap.isRecycled()) {
            Log.w(IonLog.LOGTAG, "Cached bitmap was recycled.");
            Log.w(IonLog.LOGTAG, "This may happen if passing Ion bitmaps directly to notification builders or remote media clients.");
            Log.w(IonLog.LOGTAG, "Create a deep copy before doing this.");
            this.cache.remove(key);
            return null;
        }
        if (ret.exception == null) {
            return ret;
        }
        if (ret.loadTime + this.errorCacheDuration > System.currentTimeMillis()) {
            return ret;
        }
        this.cache.remove(key);
        return null;
    }

    public void dump() {
        Log.i("IonBitmapCache", "bitmap cache: " + this.cache.size());
        Log.i("IonBitmapCache", "freeMemory: " + Runtime.getRuntime().freeMemory());
    }

    private Point computeTarget(int minx, int miny) {
        int targetWidth = minx;
        int targetHeight = miny;
        if (targetWidth == 0) {
            targetWidth = this.metrics.widthPixels;
        }
        if (targetWidth <= 0) {
            targetWidth = Integer.MAX_VALUE;
        }
        if (targetHeight == 0) {
            targetHeight = this.metrics.heightPixels;
        }
        if (targetHeight <= 0) {
            targetHeight = Integer.MAX_VALUE;
        }
        return new Point(targetWidth, targetHeight);
    }

    private BitmapFactory.Options prepareBitmapOptions(BitmapFactory.Options o, int minx, int miny) throws BitmapDecodeException {
        if (o.outWidth < 0 || o.outHeight < 0) {
            throw new BitmapDecodeException(o.outWidth, o.outHeight);
        }
        Point target = computeTarget(minx, miny);
        int scale = Math.round(Math.max(o.outWidth / target.x, o.outHeight / target.y));
        BitmapFactory.Options ret = new BitmapFactory.Options();
        ret.inSampleSize = scale;
        ret.outWidth = o.outWidth;
        ret.outHeight = o.outHeight;
        ret.outMimeType = o.outMimeType;
        return ret;
    }

    public BitmapFactory.Options prepareBitmapOptions(File file, int minx, int miny) throws BitmapDecodeException {
        BitmapFactory.Options o = new BitmapFactory.Options();
        o.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.toString(), o);
        return prepareBitmapOptions(o, minx, miny);
    }

    public BitmapFactory.Options prepareBitmapOptions(byte[] bytes, int offset, int length, int minx, int miny) throws BitmapDecodeException {
        BitmapFactory.Options o = new BitmapFactory.Options();
        o.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, offset, length, o);
        return prepareBitmapOptions(o, minx, miny);
    }

    public BitmapFactory.Options prepareBitmapOptions(Resources res, int id, int minx, int miny) throws BitmapDecodeException {
        BitmapFactory.Options o = new BitmapFactory.Options();
        o.inJustDecodeBounds = true;
        BitmapFactory.decodeResource(res, id, o);
        return prepareBitmapOptions(o, minx, miny);
    }

    public BitmapFactory.Options prepareBitmapOptions(InputStream in, int minx, int miny) throws BitmapDecodeException {
        BitmapFactory.Options o = new BitmapFactory.Options();
        o.inJustDecodeBounds = true;
        BitmapFactory.decodeStream(in, null, o);
        return prepareBitmapOptions(o, minx, miny);
    }

    private static Bitmap getRotatedBitmap(Bitmap bitmap, int rotation) {
        if (bitmap == null) {
            return null;
        }
        if (rotation == 0) {
            return bitmap;
        }
        Matrix matrix = new Matrix();
        matrix.postRotate(rotation);
        return Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
    }

    public static Bitmap loadBitmap(byte[] bytes, int offset, int length, BitmapFactory.Options o) {
        if (!$assertionsDisabled && Thread.currentThread() == Looper.getMainLooper().getThread()) {
            throw new AssertionError();
        }
        Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, offset, length, o);
        if (bitmap == null) {
            return null;
        }
        int rotation = Exif.getOrientation(bytes, offset, length);
        return getRotatedBitmap(bitmap, rotation);
    }

    @TargetApi(10)
    public static Bitmap loadRegion(BitmapRegionDecoder decoder, Rect sourceRect, int inSampleSize) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = inSampleSize;
        return decoder.decodeRegion(sourceRect, options);
    }

    public static Bitmap loadBitmap(Resources res, int id, BitmapFactory.Options o) {
        int rotation;
        if (!$assertionsDisabled && Thread.currentThread() == Looper.getMainLooper().getThread()) {
            throw new AssertionError();
        }
        InputStream in = null;
        try {
            in = res.openRawResource(id);
            byte[] bytes = new byte[50000];
            int length = in.read(bytes);
            rotation = Exif.getOrientation(bytes, 0, length);
        } catch (Exception e) {
            rotation = 0;
        }
        StreamUtility.closeQuietly(new Closeable[]{in});
        Bitmap bitmap = BitmapFactory.decodeResource(res, id, o);
        return getRotatedBitmap(bitmap, rotation);
    }

    public static Bitmap loadBitmap(InputStream stream, BitmapFactory.Options o) throws IOException {
        int rotation;
        if (!$assertionsDisabled && Thread.currentThread() == Looper.getMainLooper().getThread()) {
            throw new AssertionError();
        }
        MarkableInputStream in = new MarkableInputStream(stream);
        in.mark(50000);
        try {
            byte[] bytes = new byte[50000];
            int length = in.read(bytes);
            rotation = Exif.getOrientation(bytes, 0, length);
        } catch (Exception e) {
            rotation = 0;
        }
        in.reset();
        Bitmap bitmap = BitmapFactory.decodeStream(in, null, o);
        return getRotatedBitmap(bitmap, rotation);
    }

    public static Bitmap loadBitmap(File file, BitmapFactory.Options o) {
        int rotation;
        if (!$assertionsDisabled && Thread.currentThread() == Looper.getMainLooper().getThread()) {
            throw new AssertionError();
        }
        FileInputStream fin = null;
        try {
            fin = new FileInputStream(file);
            byte[] bytes = new byte[50000];
            int length = fin.read(bytes);
            rotation = Exif.getOrientation(bytes, 0, length);
        } catch (Exception e) {
            rotation = 0;
        }
        StreamUtility.closeQuietly(new Closeable[]{fin});
        Bitmap bitmap = BitmapFactory.decodeFile(file.toString(), o);
        return getRotatedBitmap(bitmap, rotation);
    }

    private static int getHeapSize(Context context) {
        return ((ActivityManager) context.getSystemService("activity")).getMemoryClass() * 1024 * 1024;
    }
}
