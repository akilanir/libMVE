package rx.internal.util.unsafe;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/unsafe/SpmcArrayQueue.class */
public final class SpmcArrayQueue<E> extends SpmcArrayQueueL3Pad<E> {
    public SpmcArrayQueue(int capacity) {
        super(capacity);
    }

    @Override // java.util.Queue, rx.internal.util.unsafe.MessagePassingQueue
    public boolean offer(E e) {
        if (null == e) {
            throw new NullPointerException("Null is not a valid element");
        }
        E[] lb = this.buffer;
        long lMask = this.mask;
        long currProducerIndex = lvProducerIndex();
        long offset = calcElementOffset(currProducerIndex);
        if (null != lvElement(lb, offset)) {
            long size = currProducerIndex - lvConsumerIndex();
            if (size > lMask) {
                return false;
            }
            while (null != lvElement(lb, offset)) {
            }
        }
        spElement(lb, offset, e);
        soTail(currProducerIndex + 1);
        return true;
    }

    @Override // java.util.Queue, rx.internal.util.unsafe.MessagePassingQueue
    public E poll() {
        long currentConsumerIndex;
        long currProducerIndexCache = lvProducerIndexCache();
        do {
            currentConsumerIndex = lvConsumerIndex();
            if (currentConsumerIndex >= currProducerIndexCache) {
                long currProducerIndex = lvProducerIndex();
                if (currentConsumerIndex >= currProducerIndex) {
                    return null;
                }
                svProducerIndexCache(currProducerIndex);
            }
        } while (!casHead(currentConsumerIndex, currentConsumerIndex + 1));
        long offset = calcElementOffset(currentConsumerIndex);
        E[] lb = this.buffer;
        E e = lpElement(lb, offset);
        soElement(lb, offset, null);
        return e;
    }

    @Override // java.util.Queue, rx.internal.util.unsafe.MessagePassingQueue
    public E peek() {
        E e;
        long currProducerIndexCache = lvProducerIndexCache();
        do {
            long currentConsumerIndex = lvConsumerIndex();
            if (currentConsumerIndex >= currProducerIndexCache) {
                long currProducerIndex = lvProducerIndex();
                if (currentConsumerIndex >= currProducerIndex) {
                    return null;
                }
                svProducerIndexCache(currProducerIndex);
            }
            e = lvElement(calcElementOffset(currentConsumerIndex));
        } while (null == e);
        return e;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, rx.internal.util.unsafe.MessagePassingQueue
    public int size() {
        long before;
        long currentProducerIndex;
        long after = lvConsumerIndex();
        do {
            before = after;
            currentProducerIndex = lvProducerIndex();
            after = lvConsumerIndex();
        } while (before != after);
        return (int) (currentProducerIndex - after);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, rx.internal.util.unsafe.MessagePassingQueue
    public boolean isEmpty() {
        return lvConsumerIndex() == lvProducerIndex();
    }
}
