package rx.internal.util.unsafe;

/* compiled from: SpscArrayQueue.java */
/* loaded from: rxjava-1.0.7.jar:rx/internal/util/unsafe/SpscArrayQueueProducerFields.class */
abstract class SpscArrayQueueProducerFields<E> extends SpscArrayQueueL1Pad<E> {
    protected static final long P_INDEX_OFFSET;
    protected long producerIndex;
    protected long producerLookAhead;

    static {
        try {
            P_INDEX_OFFSET = UnsafeAccess.UNSAFE.objectFieldOffset(SpscArrayQueueProducerFields.class.getDeclaredField("producerIndex"));
        } catch (NoSuchFieldException e) {
            throw new RuntimeException(e);
        }
    }

    public SpscArrayQueueProducerFields(int capacity) {
        super(capacity);
    }
}
