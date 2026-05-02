package rx.internal.util.unsafe;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/unsafe/SpscArrayQueue.class */
public final class SpscArrayQueue<E> extends SpscArrayQueueL3Pad<E> {
    public SpscArrayQueue(int capacity) {
        super(capacity);
    }

    @Override // java.util.Queue, rx.internal.util.unsafe.MessagePassingQueue
    public boolean offer(E e) {
        E[] lElementBuffer = this.buffer;
        long index = this.producerIndex;
        long offset = calcElementOffset(index);
        if (null != lvElement(lElementBuffer, offset)) {
            return false;
        }
        soProducerIndex(index + 1);
        soElement(lElementBuffer, offset, e);
        return true;
    }

    @Override // java.util.Queue, rx.internal.util.unsafe.MessagePassingQueue
    public E poll() {
        long index = this.consumerIndex;
        long offset = calcElementOffset(index);
        E[] lElementBuffer = this.buffer;
        E e = lvElement(lElementBuffer, offset);
        if (null == e) {
            return null;
        }
        soConsumerIndex(index + 1);
        soElement(lElementBuffer, offset, null);
        return e;
    }

    @Override // java.util.Queue, rx.internal.util.unsafe.MessagePassingQueue
    public E peek() {
        return lvElement(calcElementOffset(this.consumerIndex));
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

    private void soProducerIndex(long v) {
        UnsafeAccess.UNSAFE.putOrderedLong(this, P_INDEX_OFFSET, v);
    }

    private void soConsumerIndex(long v) {
        UnsafeAccess.UNSAFE.putOrderedLong(this, C_INDEX_OFFSET, v);
    }

    private long lvProducerIndex() {
        return UnsafeAccess.UNSAFE.getLongVolatile(this, P_INDEX_OFFSET);
    }

    private long lvConsumerIndex() {
        return UnsafeAccess.UNSAFE.getLongVolatile(this, C_INDEX_OFFSET);
    }
}
