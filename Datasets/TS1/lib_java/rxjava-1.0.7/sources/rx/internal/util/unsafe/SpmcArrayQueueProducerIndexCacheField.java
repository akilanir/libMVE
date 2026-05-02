package rx.internal.util.unsafe;

/* compiled from: SpmcArrayQueue.java */
/* loaded from: rxjava-1.0.7.jar:rx/internal/util/unsafe/SpmcArrayQueueProducerIndexCacheField.class */
abstract class SpmcArrayQueueProducerIndexCacheField<E> extends SpmcArrayQueueMidPad<E> {
    private volatile long producerIndexCache;

    public SpmcArrayQueueProducerIndexCacheField(int capacity) {
        super(capacity);
    }

    protected final long lvProducerIndexCache() {
        return this.producerIndexCache;
    }

    protected final void svProducerIndexCache(long v) {
        this.producerIndexCache = v;
    }
}
