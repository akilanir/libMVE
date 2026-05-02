package com.bumptech.glide.load.engine.bitmap_recycle;

import com.bumptech.glide.load.engine.bitmap_recycle.Poolable;
import com.bumptech.glide.util.Util;
import java.util.Queue;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool.class */
abstract class BaseKeyPool<T extends Poolable> {
    private static final int MAX_SIZE = 20;
    private final Queue<T> keyPool = Util.createQueue(MAX_SIZE);

    protected abstract T create();

    BaseKeyPool() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v7, types: [com.bumptech.glide.load.engine.bitmap_recycle.Poolable] */
    protected T get() {
        T result = this.keyPool.poll();
        if (result == null) {
            result = create();
        }
        return result;
    }

    public void offer(T key) {
        if (this.keyPool.size() < MAX_SIZE) {
            this.keyPool.offer(key);
        }
    }
}
