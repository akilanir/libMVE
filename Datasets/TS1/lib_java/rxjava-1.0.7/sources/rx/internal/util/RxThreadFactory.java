package rx.internal.util;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/RxThreadFactory.class */
public final class RxThreadFactory implements ThreadFactory {
    final String prefix;
    volatile long counter;
    static final AtomicLongFieldUpdater<RxThreadFactory> COUNTER_UPDATER = AtomicLongFieldUpdater.newUpdater(RxThreadFactory.class, "counter");

    public RxThreadFactory(String prefix) {
        this.prefix = prefix;
    }

    @Override // java.util.concurrent.ThreadFactory
    public Thread newThread(Runnable r) {
        Thread t = new Thread(r, this.prefix + COUNTER_UPDATER.incrementAndGet(this));
        t.setDaemon(true);
        return t;
    }
}
