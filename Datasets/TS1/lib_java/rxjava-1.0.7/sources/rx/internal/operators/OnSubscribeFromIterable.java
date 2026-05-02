package rx.internal.operators;

import java.util.Iterator;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeFromIterable.class */
public final class OnSubscribeFromIterable<T> implements Observable.OnSubscribe<T> {
    final Iterable<? extends T> is;

    public OnSubscribeFromIterable(Iterable<? extends T> iterable) {
        if (iterable == null) {
            throw new NullPointerException("iterable must not be null");
        }
        this.is = iterable;
    }

    @Override // rx.functions.Action1
    public void call(Subscriber<? super T> o) {
        Iterator<? extends T> it = this.is.iterator();
        o.setProducer(new IterableProducer(o, it));
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeFromIterable$IterableProducer.class */
    private static final class IterableProducer<T> implements Producer {
        private final Subscriber<? super T> o;
        private final Iterator<? extends T> it;
        private volatile long requested;
        private static final AtomicLongFieldUpdater<IterableProducer> REQUESTED_UPDATER = AtomicLongFieldUpdater.newUpdater(IterableProducer.class, "requested");

        private IterableProducer(Subscriber<? super T> o, Iterator<? extends T> it) {
            this.requested = 0L;
            this.o = o;
            this.it = it;
        }

        @Override // rx.Producer
        public void request(long j) {
            long j2;
            if (REQUESTED_UPDATER.get(this) == Long.MAX_VALUE) {
                return;
            }
            if (j == Long.MAX_VALUE) {
                REQUESTED_UPDATER.set(this, j);
                while (this.it.hasNext()) {
                    if (this.o.isUnsubscribed()) {
                        return;
                    } else {
                        this.o.onNext(this.it.next());
                    }
                }
                if (!this.o.isUnsubscribed()) {
                    this.o.onCompleted();
                    return;
                }
                return;
            }
            if (j > 0 && BackpressureUtils.getAndAddRequest(REQUESTED_UPDATER, this, j) == 0) {
                do {
                    j2 = this.requested;
                    long j3 = j2;
                    while (this.it.hasNext()) {
                        long j4 = j3 - 1;
                        j3 = j4;
                        if (j4 < 0) {
                            break;
                        } else if (this.o.isUnsubscribed()) {
                            return;
                        } else {
                            this.o.onNext(this.it.next());
                        }
                    }
                    if (!this.it.hasNext()) {
                        if (!this.o.isUnsubscribed()) {
                            this.o.onCompleted();
                            return;
                        }
                        return;
                    }
                } while (REQUESTED_UPDATER.addAndGet(this, -j2) != 0);
            }
        }
    }
}
