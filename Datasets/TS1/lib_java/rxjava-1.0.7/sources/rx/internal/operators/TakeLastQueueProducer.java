package rx.internal.operators;

import java.util.Deque;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Producer;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/TakeLastQueueProducer.class */
final class TakeLastQueueProducer<T> implements Producer {
    private final NotificationLite<T> notification;
    private final Deque<Object> deque;
    private final Subscriber<? super T> subscriber;
    private volatile boolean emittingStarted = false;
    private volatile long requested = 0;
    private static final AtomicLongFieldUpdater<TakeLastQueueProducer> REQUESTED_UPDATER = AtomicLongFieldUpdater.newUpdater(TakeLastQueueProducer.class, "requested");

    public TakeLastQueueProducer(NotificationLite<T> n, Deque<Object> q, Subscriber<? super T> subscriber) {
        this.notification = n;
        this.deque = q;
        this.subscriber = subscriber;
    }

    void startEmitting() {
        if (!this.emittingStarted) {
            this.emittingStarted = true;
            emit(0L);
        }
    }

    @Override // rx.Producer
    public void request(long n) {
        long _c;
        if (this.requested == Long.MAX_VALUE) {
            return;
        }
        if (n == Long.MAX_VALUE) {
            _c = REQUESTED_UPDATER.getAndSet(this, Long.MAX_VALUE);
        } else {
            _c = REQUESTED_UPDATER.getAndAdd(this, n);
        }
        if (!this.emittingStarted) {
            return;
        }
        emit(_c);
    }

    void emit(long previousRequested) {
        Object o;
        if (this.requested == Long.MAX_VALUE) {
            try {
                if (previousRequested == 0) {
                    try {
                        for (Object value : this.deque) {
                            if (this.subscriber.isUnsubscribed()) {
                                this.deque.clear();
                                return;
                            }
                            this.notification.accept(this.subscriber, value);
                        }
                        this.deque.clear();
                        return;
                    } catch (Throwable e) {
                        this.subscriber.onError(e);
                        this.deque.clear();
                        return;
                    }
                }
                return;
            } catch (Throwable th) {
                this.deque.clear();
                throw th;
            }
        }
        if (previousRequested != 0) {
            return;
        }
        while (true) {
            long numToEmit = this.requested;
            int emitted = 0;
            while (true) {
                long j = numToEmit - 1;
                numToEmit = j;
                if (j < 0 || (o = this.deque.poll()) == null) {
                    break;
                }
                if (this.subscriber.isUnsubscribed() || this.notification.accept(this.subscriber, o)) {
                    return;
                } else {
                    emitted++;
                }
            }
            while (true) {
                long oldRequested = this.requested;
                long newRequested = oldRequested - emitted;
                if (oldRequested != Long.MAX_VALUE) {
                    if (REQUESTED_UPDATER.compareAndSet(this, oldRequested, newRequested)) {
                        if (newRequested == 0) {
                            return;
                        }
                    }
                }
            }
        }
    }
}
