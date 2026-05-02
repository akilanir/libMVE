package rx.internal.operators;

import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/BackpressureUtils.class */
final class BackpressureUtils {
    BackpressureUtils() {
    }

    static <T> long getAndAddRequest(AtomicLongFieldUpdater<T> requested, T object, long n) {
        long current;
        long next;
        do {
            current = requested.get(object);
            next = current + n;
            if (next < 0) {
                next = Long.MAX_VALUE;
            }
        } while (!requested.compareAndSet(object, current, next));
        return current;
    }

    static <T> long getAndAddRequest(AtomicLong requested, long n) {
        long current;
        long next;
        do {
            current = requested.get();
            next = current + n;
            if (next < 0) {
                next = Long.MAX_VALUE;
            }
        } while (!requested.compareAndSet(current, next));
        return current;
    }
}
