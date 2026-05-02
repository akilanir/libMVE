package com.bumptech.glide.load.engine.cache;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.content.Context;
import android.os.Build;
import android.text.format.Formatter;
import android.util.DisplayMetrics;
import android.util.Log;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/cache/MemorySizeCalculator.class */
public class MemorySizeCalculator {
    private static final String TAG = "MemorySizeCalculator";
    static final int BYTES_PER_ARGB_8888_PIXEL = 4;
    static final int MEMORY_CACHE_TARGET_SCREENS = 2;
    static final int BITMAP_POOL_TARGET_SCREENS = 4;
    static final float MAX_SIZE_MULTIPLIER = 0.4f;
    static final float LOW_MEMORY_MAX_SIZE_MULTIPLIER = 0.33f;
    private final int bitmapPoolSize;
    private final int memoryCacheSize;
    private final Context context;

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/cache/MemorySizeCalculator$ScreenDimensions.class */
    interface ScreenDimensions {
        int getWidthPixels();

        int getHeightPixels();
    }

    public MemorySizeCalculator(Context context) {
        this(context, (ActivityManager) context.getSystemService("activity"), new DisplayMetricsScreenDimensions(context.getResources().getDisplayMetrics()));
    }

    MemorySizeCalculator(Context context, ActivityManager activityManager, ScreenDimensions screenDimensions) {
        this.context = context;
        int maxSize = getMaxSize(activityManager);
        int screenSize = screenDimensions.getWidthPixels() * screenDimensions.getHeightPixels() * 4;
        int targetPoolSize = screenSize * 4;
        int targetMemoryCacheSize = screenSize * 2;
        if (targetMemoryCacheSize + targetPoolSize <= maxSize) {
            this.memoryCacheSize = targetMemoryCacheSize;
            this.bitmapPoolSize = targetPoolSize;
        } else {
            int part = Math.round(maxSize / 6.0f);
            this.memoryCacheSize = part * 2;
            this.bitmapPoolSize = part * 4;
        }
        if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, "Calculated memory cache size: " + toMb(this.memoryCacheSize) + " pool size: " + toMb(this.bitmapPoolSize) + " memory class limited? " + (targetMemoryCacheSize + targetPoolSize > maxSize) + " max size: " + toMb(maxSize) + " memoryClass: " + activityManager.getMemoryClass() + " isLowMemoryDevice: " + isLowMemoryDevice(activityManager));
        }
    }

    public int getMemoryCacheSize() {
        return this.memoryCacheSize;
    }

    public int getBitmapPoolSize() {
        return this.bitmapPoolSize;
    }

    private static int getMaxSize(ActivityManager activityManager) {
        int memoryClassBytes = activityManager.getMemoryClass() * 1024 * 1024;
        boolean isLowMemoryDevice = isLowMemoryDevice(activityManager);
        return Math.round(memoryClassBytes * (isLowMemoryDevice ? LOW_MEMORY_MAX_SIZE_MULTIPLIER : MAX_SIZE_MULTIPLIER));
    }

    private String toMb(int bytes) {
        return Formatter.formatFileSize(this.context, bytes);
    }

    @TargetApi(19)
    private static boolean isLowMemoryDevice(ActivityManager activityManager) {
        int sdkInt = Build.VERSION.SDK_INT;
        return sdkInt < 11 || (sdkInt >= 19 && activityManager.isLowRamDevice());
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/cache/MemorySizeCalculator$DisplayMetricsScreenDimensions.class */
    private static class DisplayMetricsScreenDimensions implements ScreenDimensions {
        private final DisplayMetrics displayMetrics;

        public DisplayMetricsScreenDimensions(DisplayMetrics displayMetrics) {
            this.displayMetrics = displayMetrics;
        }

        @Override // com.bumptech.glide.load.engine.cache.MemorySizeCalculator.ScreenDimensions
        public int getWidthPixels() {
            return this.displayMetrics.widthPixels;
        }

        @Override // com.bumptech.glide.load.engine.cache.MemorySizeCalculator.ScreenDimensions
        public int getHeightPixels() {
            return this.displayMetrics.heightPixels;
        }
    }
}
