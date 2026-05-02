package rx.internal.util.unsafe;

/* compiled from: SpscArrayQueue.java */
/* loaded from: rxjava-1.0.7.jar:rx/internal/util/unsafe/SpscArrayQueueConsumerField.class */
abstract class SpscArrayQueueConsumerField<E> extends SpscArrayQueueL2Pad<E> {
    protected long consumerIndex;
    protected static final long C_INDEX_OFFSET;

    static {
        try {
            C_INDEX_OFFSET = UnsafeAccess.UNSAFE.objectFieldOffset(SpscArrayQueueConsumerField.class.getDeclaredField("consumerIndex"));
        } catch (NoSuchFieldException e) {
            throw new RuntimeException(e);
        }
    }

    public SpscArrayQueueConsumerField(int capacity) {
        super(capacity);
    }
}
