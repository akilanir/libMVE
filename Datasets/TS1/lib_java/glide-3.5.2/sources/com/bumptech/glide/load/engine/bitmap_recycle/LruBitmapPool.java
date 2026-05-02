package com.bumptech.glide.load.engine.bitmap_recycle;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.os.Build;
import android.util.Log;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool.class */
public class LruBitmapPool implements BitmapPool {
    private static final String TAG = "LruBitmapPool";
    private static final Bitmap.Config DEFAULT_CONFIG = Bitmap.Config.ARGB_8888;
    private final LruPoolStrategy strategy;
    private final Set<Bitmap.Config> allowedConfigs;
    private final int initialMaxSize;
    private final BitmapTracker tracker;
    private int maxSize;
    private int currentSize;
    private int hits;
    private int misses;
    private int puts;
    private int evictions;

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool$BitmapTracker.class */
    private interface BitmapTracker {
        void add(Bitmap bitmap);

        void remove(Bitmap bitmap);
    }

    LruBitmapPool(int maxSize, LruPoolStrategy strategy, Set<Bitmap.Config> allowedConfigs) {
        this.initialMaxSize = maxSize;
        this.maxSize = maxSize;
        this.strategy = strategy;
        this.allowedConfigs = allowedConfigs;
        this.tracker = new NullBitmapTracker();
    }

    public LruBitmapPool(int maxSize) {
        this(maxSize, getDefaultStrategy(), getDefaultAllowedConfigs());
    }

    public LruBitmapPool(int maxSize, Set<Bitmap.Config> allowedConfigs) {
        this(maxSize, getDefaultStrategy(), allowedConfigs);
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public int getMaxSize() {
        return this.maxSize;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public synchronized void setSizeMultiplier(float sizeMultiplier) {
        this.maxSize = Math.round(this.initialMaxSize * sizeMultiplier);
        evict();
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public synchronized boolean put(Bitmap bitmap) {
        if (bitmap == null) {
            throw new NullPointerException("Bitmap must not be null");
        }
        if (!bitmap.isMutable() || this.strategy.getSize(bitmap) > this.maxSize || !this.allowedConfigs.contains(bitmap.getConfig())) {
            if (Log.isLoggable(TAG, 2)) {
                Log.v(TAG, "Reject bitmap from pool, bitmap: " + this.strategy.logBitmap(bitmap) + ", is mutable: " + bitmap.isMutable() + ", is allowed config: " + this.allowedConfigs.contains(bitmap.getConfig()));
                return false;
            }
            return false;
        }
        int size = this.strategy.getSize(bitmap);
        this.strategy.put(bitmap);
        this.tracker.add(bitmap);
        this.puts++;
        this.currentSize += size;
        if (Log.isLoggable(TAG, 2)) {
            Log.v(TAG, "Put bitmap in pool=" + this.strategy.logBitmap(bitmap));
        }
        dump();
        evict();
        return true;
    }

    private void evict() {
        trimToSize(this.maxSize);
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public synchronized Bitmap get(int width, int height, Bitmap.Config config) {
        Bitmap result = getDirty(width, height, config);
        if (result != null) {
            result.eraseColor(0);
        }
        return result;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    @TargetApi(12)
    public synchronized Bitmap getDirty(int width, int height, Bitmap.Config config) {
        Bitmap result = this.strategy.get(width, height, config != null ? config : DEFAULT_CONFIG);
        if (result == null) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Missing bitmap=" + this.strategy.logBitmap(width, height, config));
            }
            this.misses++;
        } else {
            this.hits++;
            this.currentSize -= this.strategy.getSize(result);
            this.tracker.remove(result);
            if (Build.VERSION.SDK_INT >= 12) {
                result.setHasAlpha(true);
            }
        }
        if (Log.isLoggable(TAG, 2)) {
            Log.v(TAG, "Get bitmap=" + this.strategy.logBitmap(width, height, config));
        }
        dump();
        return result;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public void clearMemory() {
        if (Log.isLoggable(TAG, 2)) {
            Log.d(TAG, "clearMemory");
        }
        trimToSize(0);
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    @SuppressLint({"InlinedApi"})
    public void trimMemory(int level) {
        if (Log.isLoggable(TAG, 2)) {
            Log.d(TAG, "trimMemory, level=" + level);
        }
        if (level >= 60) {
            clearMemory();
        } else if (level >= 40) {
            trimToSize(this.maxSize / 2);
        }
    }

    private synchronized void trimToSize(int size) {
        while (this.currentSize > size) {
            Bitmap removed = this.strategy.removeLast();
            if (removed == null) {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Size mismatch, resetting");
                    dumpUnchecked();
                }
                this.currentSize = 0;
                return;
            }
            this.tracker.remove(removed);
            this.currentSize -= this.strategy.getSize(removed);
            removed.recycle();
            this.evictions++;
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Evicting bitmap=" + this.strategy.logBitmap(removed));
            }
            dump();
        }
    }

    private void dump() {
        if (Log.isLoggable(TAG, 2)) {
            dumpUnchecked();
        }
    }

    private void dumpUnchecked() {
        Log.v(TAG, "Hits=" + this.hits + ", misses=" + this.misses + ", puts=" + this.puts + ", evictions=" + this.evictions + ", currentSize=" + this.currentSize + ", maxSize=" + this.maxSize + "\nStrategy=" + this.strategy);
    }

    private static LruPoolStrategy getDefaultStrategy() {
        LruPoolStrategy strategy;
        if (Build.VERSION.SDK_INT >= 19) {
            strategy = new SizeConfigStrategy();
        } else {
            strategy = new AttributeStrategy();
        }
        return strategy;
    }

    private static Set<Bitmap.Config> getDefaultAllowedConfigs() {
        Set<Bitmap.Config> configs = new HashSet<>();
        configs.addAll(Arrays.asList(Bitmap.Config.values()));
        if (Build.VERSION.SDK_INT >= 19) {
            configs.add(null);
        }
        return Collections.unmodifiableSet(configs);
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool$ThrowingBitmapTracker.class */
    private static class ThrowingBitmapTracker implements BitmapTracker {
        private final Set<Bitmap> bitmaps = Collections.synchronizedSet(new HashSet());

        private ThrowingBitmapTracker() {
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool.BitmapTracker
        public void add(Bitmap bitmap) {
            if (this.bitmaps.contains(bitmap)) {
                throw new IllegalStateException("Can't add already added bitmap: " + bitmap + " [" + bitmap.getWidth() + "x" + bitmap.getHeight() + "]");
            }
            this.bitmaps.add(bitmap);
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool.BitmapTracker
        public void remove(Bitmap bitmap) {
            if (!this.bitmaps.contains(bitmap)) {
                throw new IllegalStateException("Cannot remove bitmap not in tracker");
            }
            this.bitmaps.remove(bitmap);
        }
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool$NullBitmapTracker.class */
    private static class NullBitmapTracker implements BitmapTracker {
        private NullBitmapTracker() {
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool.BitmapTracker
        public void add(Bitmap bitmap) {
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool.BitmapTracker
        public void remove(Bitmap bitmap) {
        }
    }
}
