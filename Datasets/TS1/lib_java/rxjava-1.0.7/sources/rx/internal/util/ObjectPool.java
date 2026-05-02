package rx.internal.util;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.TimeUnit;
import rx.Scheduler;
import rx.functions.Action0;
import rx.internal.util.unsafe.MpmcArrayQueue;
import rx.internal.util.unsafe.UnsafeAccess;
import rx.schedulers.Schedulers;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/ObjectPool.class */
public abstract class ObjectPool<T> {
    private Queue<T> pool;
    private final int maxSize;
    private Scheduler.Worker schedulerWorker;

    /* renamed from: createObject */
    protected abstract T createObject2();

    public ObjectPool() {
        this(0, 0, 67L);
    }

    private ObjectPool(final int min, final int max, long validationInterval) {
        this.maxSize = max;
        initialize(min);
        this.schedulerWorker = Schedulers.computation().createWorker();
        this.schedulerWorker.schedulePeriodically(new Action0() { // from class: rx.internal.util.ObjectPool.1
            @Override // rx.functions.Action0
            public void call() {
                int size = ObjectPool.this.pool.size();
                if (size < min) {
                    int sizeToBeAdded = max - size;
                    for (int i = 0; i < sizeToBeAdded; i++) {
                        ObjectPool.this.pool.add(ObjectPool.this.createObject2());
                    }
                    return;
                }
                if (size > max) {
                    int sizeToBeRemoved = size - max;
                    for (int i2 = 0; i2 < sizeToBeRemoved; i2++) {
                        ObjectPool.this.pool.poll();
                    }
                }
            }
        }, validationInterval, validationInterval, TimeUnit.SECONDS);
    }

    public T borrowObject() {
        T poll = this.pool.poll();
        T object = poll;
        if (poll == null) {
            object = createObject2();
        }
        return object;
    }

    public void returnObject(T object) {
        if (object == null) {
            return;
        }
        this.pool.offer(object);
    }

    public void shutdown() {
        this.schedulerWorker.unsubscribe();
    }

    private void initialize(int min) {
        if (UnsafeAccess.isUnsafeAvailable()) {
            this.pool = new MpmcArrayQueue(Math.max(this.maxSize, 1024));
        } else {
            this.pool = new ConcurrentLinkedQueue();
        }
        for (int i = 0; i < min; i++) {
            this.pool.add(createObject2());
        }
    }
}
