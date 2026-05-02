package com.bumptech.glide.load.engine.bitmap_recycle;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import com.bumptech.glide.util.Util;
import java.util.TreeMap;

@TargetApi(19)
/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy.class */
class SizeStrategy implements LruPoolStrategy {
    private static final int MAX_SIZE_MULTIPLE = 8;
    private final KeyPool keyPool = new KeyPool();
    private final GroupedLinkedMap<Key, Bitmap> groupedMap = new GroupedLinkedMap<>();
    private final TreeMap<Integer, Integer> sortedSizes = new PrettyPrintTreeMap();

    SizeStrategy() {
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruPoolStrategy
    public void put(Bitmap bitmap) {
        int size = Util.getBitmapByteSize(bitmap);
        Key key = this.keyPool.get(size);
        this.groupedMap.put(key, bitmap);
        Integer current = this.sortedSizes.get(Integer.valueOf(key.size));
        this.sortedSizes.put(Integer.valueOf(key.size), Integer.valueOf(current == null ? 1 : current.intValue() + 1));
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruPoolStrategy
    public Bitmap get(int width, int height, Bitmap.Config config) {
        int size = Util.getBitmapByteSize(width, height, config);
        Key key = this.keyPool.get(size);
        Integer possibleSize = this.sortedSizes.ceilingKey(Integer.valueOf(size));
        if (possibleSize != null && possibleSize.intValue() != size && possibleSize.intValue() <= size * MAX_SIZE_MULTIPLE) {
            this.keyPool.offer(key);
            key = this.keyPool.get(possibleSize.intValue());
        }
        Bitmap result = this.groupedMap.get(key);
        if (result != null) {
            result.reconfigure(width, height, config);
            decrementBitmapOfSize(possibleSize);
        }
        return result;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruPoolStrategy
    public Bitmap removeLast() {
        Bitmap removed = this.groupedMap.removeLast();
        if (removed != null) {
            int removedSize = Util.getBitmapByteSize(removed);
            decrementBitmapOfSize(Integer.valueOf(removedSize));
        }
        return removed;
    }

    private void decrementBitmapOfSize(Integer size) {
        Integer current = this.sortedSizes.get(size);
        if (current.intValue() == 1) {
            this.sortedSizes.remove(size);
        } else {
            this.sortedSizes.put(size, Integer.valueOf(current.intValue() - 1));
        }
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruPoolStrategy
    public String logBitmap(Bitmap bitmap) {
        return getBitmapString(bitmap);
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruPoolStrategy
    public String logBitmap(int width, int height, Bitmap.Config config) {
        int size = Util.getBitmapByteSize(width, height, config);
        return getBitmapString(size);
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruPoolStrategy
    public int getSize(Bitmap bitmap) {
        return Util.getBitmapByteSize(bitmap);
    }

    public String toString() {
        return "SizeStrategy:\n  " + this.groupedMap + "\n  SortedSizes" + this.sortedSizes;
    }

    private static String getBitmapString(Bitmap bitmap) {
        int size = Util.getBitmapByteSize(bitmap);
        return getBitmapString(size);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String getBitmapString(int size) {
        return "[" + size + "]";
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$KeyPool.class */
    static class KeyPool extends BaseKeyPool<Key> {
        KeyPool() {
        }

        public Key get(int size) {
            Key result = get();
            result.init(size);
            return result;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.bumptech.glide.load.engine.bitmap_recycle.BaseKeyPool
        public Key create() {
            return new Key(this);
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key.class */
    static final class Key implements Poolable {
        private final KeyPool pool;
        private int size;

        Key(KeyPool pool) {
            this.pool = pool;
        }

        public void init(int size) {
            this.size = size;
        }

        public boolean equals(Object o) {
            if (o instanceof Key) {
                Key other = (Key) o;
                return this.size == other.size;
            }
            return false;
        }

        public int hashCode() {
            return this.size;
        }

        public String toString() {
            return SizeStrategy.getBitmapString(this.size);
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.Poolable
        public void offer() {
            this.pool.offer(this);
        }
    }
}
