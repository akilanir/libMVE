package com.bumptech.glide.load.model;

import com.bumptech.glide.util.LruCache;
import com.bumptech.glide.util.Util;
import java.util.Queue;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/model/ModelCache.class */
public class ModelCache<A, B> {
    private static final int DEFAULT_SIZE = 250;
    private final LruCache<ModelKey<A>, B> cache;

    public ModelCache() {
        this(DEFAULT_SIZE);
    }

    public ModelCache(int size) {
        this.cache = new LruCache<ModelKey<A>, B>(size) { // from class: com.bumptech.glide.load.model.ModelCache.1
            @Override // com.bumptech.glide.util.LruCache
            protected /* bridge */ /* synthetic */ void onItemEvicted(Object x0, Object x1) {
                onItemEvicted((ModelKey) x0, (ModelKey<A>) x1);
            }

            protected void onItemEvicted(ModelKey<A> key, B item) {
                key.release();
            }
        };
    }

    public B get(A model, int width, int height) {
        ModelKey<A> key = ModelKey.get(model, width, height);
        B result = this.cache.get(key);
        key.release();
        return result;
    }

    public void put(A model, int width, int height, B value) {
        ModelKey<A> key = ModelKey.get(model, width, height);
        this.cache.put(key, value);
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/model/ModelCache$ModelKey.class */
    static final class ModelKey<A> {
        private static final Queue<ModelKey<?>> KEY_QUEUE = Util.createQueue(0);
        private int height;
        private int width;
        private A model;

        static <A> ModelKey<A> get(A a, int i, int i2) {
            ModelKey<?> poll = KEY_QUEUE.poll();
            if (poll == null) {
                poll = new ModelKey<>();
            }
            poll.init(a, i, i2);
            return (ModelKey<A>) poll;
        }

        private ModelKey() {
        }

        private void init(A model, int width, int height) {
            this.model = model;
            this.width = width;
            this.height = height;
        }

        public void release() {
            KEY_QUEUE.offer(this);
        }

        public boolean equals(Object o) {
            if (o instanceof ModelKey) {
                ModelKey other = (ModelKey) o;
                return this.width == other.width && this.height == other.height && this.model.equals(other.model);
            }
            return false;
        }

        public int hashCode() {
            int result = this.height;
            return (31 * ((31 * result) + this.width)) + this.model.hashCode();
        }
    }
}
