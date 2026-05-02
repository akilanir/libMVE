package rx.internal.util;

import java.util.Queue;
import rx.Observer;
import rx.Subscription;
import rx.exceptions.MissingBackpressureException;
import rx.internal.operators.NotificationLite;
import rx.internal.util.unsafe.SpmcArrayQueue;
import rx.internal.util.unsafe.SpscArrayQueue;
import rx.internal.util.unsafe.UnsafeAccess;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/RxRingBuffer.class */
public class RxRingBuffer implements Subscription {
    private static final NotificationLite<Object> on = NotificationLite.instance();
    private Queue<Object> queue;
    private final int size;
    private final ObjectPool<Queue<Object>> pool;
    public volatile Object terminalState;
    static int _size;
    public static final int SIZE;
    private static ObjectPool<Queue<Object>> SPSC_POOL;
    private static ObjectPool<Queue<Object>> SPMC_POOL;

    public static RxRingBuffer getSpscInstance() {
        if (UnsafeAccess.isUnsafeAvailable()) {
            return new RxRingBuffer(SPSC_POOL, SIZE);
        }
        return new RxRingBuffer();
    }

    public static RxRingBuffer getSpmcInstance() {
        if (UnsafeAccess.isUnsafeAvailable()) {
            return new RxRingBuffer(SPMC_POOL, SIZE);
        }
        return new RxRingBuffer();
    }

    static {
        _size = 128;
        if (PlatformDependent.isAndroid()) {
            _size = 16;
        }
        String sizeFromProperty = System.getProperty("rx.ring-buffer.size");
        if (sizeFromProperty != null) {
            try {
                _size = Integer.parseInt(sizeFromProperty);
            } catch (Exception e) {
                System.err.println("Failed to set 'rx.buffer.size' with value " + sizeFromProperty + " => " + e.getMessage());
            }
        }
        SIZE = _size;
        SPSC_POOL = new ObjectPool<Queue<Object>>() { // from class: rx.internal.util.RxRingBuffer.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // rx.internal.util.ObjectPool
            /* renamed from: createObject, reason: merged with bridge method [inline-methods] */
            public Queue<Object> createObject2() {
                return new SpscArrayQueue(RxRingBuffer.SIZE);
            }
        };
        SPMC_POOL = new ObjectPool<Queue<Object>>() { // from class: rx.internal.util.RxRingBuffer.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // rx.internal.util.ObjectPool
            /* renamed from: createObject */
            public Queue<Object> createObject2() {
                return new SpmcArrayQueue(RxRingBuffer.SIZE);
            }
        };
    }

    private RxRingBuffer(Queue<Object> queue, int size) {
        this.queue = queue;
        this.pool = null;
        this.size = size;
    }

    private RxRingBuffer(ObjectPool<Queue<Object>> pool, int size) {
        this.pool = pool;
        this.queue = pool.borrowObject();
        this.size = size;
    }

    public synchronized void release() {
        Queue<Object> q = this.queue;
        ObjectPool<Queue<Object>> p = this.pool;
        if (p != null && q != null) {
            q.clear();
            this.queue = null;
            p.returnObject(q);
        }
    }

    @Override // rx.Subscription
    public void unsubscribe() {
        release();
    }

    RxRingBuffer() {
        this(new SynchronizedQueue(SIZE), SIZE);
    }

    public void onNext(Object o) throws MissingBackpressureException {
        boolean iae = false;
        boolean mbe = false;
        synchronized (this) {
            Queue<Object> q = this.queue;
            if (q != null) {
                mbe = !q.offer(on.next(o));
            } else {
                iae = true;
            }
        }
        if (iae) {
            throw new IllegalStateException("This instance has been unsubscribed and the queue is no longer usable.");
        }
        if (mbe) {
            throw new MissingBackpressureException();
        }
    }

    public void onCompleted() {
        if (this.terminalState == null) {
            this.terminalState = on.completed();
        }
    }

    public void onError(Throwable t) {
        if (this.terminalState == null) {
            this.terminalState = on.error(t);
        }
    }

    public int available() {
        return this.size - count();
    }

    public int capacity() {
        return this.size;
    }

    public int count() {
        Queue<Object> q = this.queue;
        if (q == null) {
            return 0;
        }
        return q.size();
    }

    public boolean isEmpty() {
        Queue<Object> q = this.queue;
        if (q == null) {
            return true;
        }
        return q.isEmpty();
    }

    public Object poll() {
        synchronized (this) {
            Queue<Object> q = this.queue;
            if (q == null) {
                return null;
            }
            Object o = q.poll();
            Object ts = this.terminalState;
            if (o == null && ts != null && q.peek() == null) {
                o = ts;
                this.terminalState = null;
            }
            return o;
        }
    }

    public Object peek() {
        synchronized (this) {
            Queue<Object> q = this.queue;
            if (q == null) {
                return null;
            }
            Object o = q.peek();
            Object ts = this.terminalState;
            if (o == null && ts != null && q.peek() == null) {
                o = ts;
            }
            return o;
        }
    }

    public boolean isCompleted(Object o) {
        return on.isCompleted(o);
    }

    public boolean isError(Object o) {
        return on.isError(o);
    }

    public Object getValue(Object o) {
        return on.getValue(o);
    }

    public boolean accept(Object o, Observer child) {
        return on.accept(child, o);
    }

    public Throwable asError(Object o) {
        return on.getError(o);
    }

    @Override // rx.Subscription
    public boolean isUnsubscribed() {
        return this.queue == null;
    }
}
