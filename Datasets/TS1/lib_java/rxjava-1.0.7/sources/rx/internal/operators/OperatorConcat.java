package rx.internal.operators;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;
import rx.functions.Action0;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.SerialSubscription;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorConcat.class */
public final class OperatorConcat<T> implements Observable.Operator<T, Observable<? extends T>> {

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorConcat$Holder.class */
    private static final class Holder {
        static final OperatorConcat<Object> INSTANCE = new OperatorConcat<>();

        private Holder() {
        }
    }

    public static <T> OperatorConcat<T> instance() {
        return (OperatorConcat<T>) Holder.INSTANCE;
    }

    private OperatorConcat() {
    }

    @Override // rx.functions.Func1
    public Subscriber<? super Observable<? extends T>> call(Subscriber<? super T> child) {
        SerializedSubscriber<T> s = new SerializedSubscriber<>(child);
        SerialSubscription current = new SerialSubscription();
        child.add(current);
        ConcatSubscriber<T> cs = new ConcatSubscriber<>(s, current);
        ConcatProducer<T> cp = new ConcatProducer<>(cs);
        child.setProducer(cp);
        return cs;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorConcat$ConcatProducer.class */
    static final class ConcatProducer<T> implements Producer {
        final ConcatSubscriber<T> cs;

        ConcatProducer(ConcatSubscriber<T> cs) {
            this.cs = cs;
        }

        @Override // rx.Producer
        public void request(long n) {
            this.cs.requestFromChild(n);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorConcat$ConcatSubscriber.class */
    static final class ConcatSubscriber<T> extends Subscriber<Observable<? extends T>> {
        final NotificationLite<Observable<? extends T>> nl;
        private final Subscriber<T> child;
        private final SerialSubscription current;
        final ConcurrentLinkedQueue<Object> queue;
        volatile ConcatInnerSubscriber<T> currentSubscriber;
        volatile int wip;
        private volatile long requested;
        static final AtomicIntegerFieldUpdater<ConcatSubscriber> WIP_UPDATER = AtomicIntegerFieldUpdater.newUpdater(ConcatSubscriber.class, "wip");
        private static final AtomicLongFieldUpdater<ConcatSubscriber> REQUESTED_UPDATER = AtomicLongFieldUpdater.newUpdater(ConcatSubscriber.class, "requested");

        public ConcatSubscriber(Subscriber<T> s, SerialSubscription current) {
            super(s);
            this.nl = NotificationLite.instance();
            this.child = s;
            this.current = current;
            this.queue = new ConcurrentLinkedQueue<>();
            add(Subscriptions.create(new Action0() { // from class: rx.internal.operators.OperatorConcat.ConcatSubscriber.1
                @Override // rx.functions.Action0
                public void call() {
                    ConcatSubscriber.this.queue.clear();
                }
            }));
        }

        @Override // rx.Subscriber
        public void onStart() {
            request(2L);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void requestFromChild(long n) {
            if (REQUESTED_UPDATER.getAndAdd(this, n) == 0 && this.currentSubscriber == null && this.wip > 0) {
                subscribeNext();
            } else if (this.currentSubscriber != null) {
                this.currentSubscriber.requestMore(n);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void decrementRequested() {
            REQUESTED_UPDATER.decrementAndGet(this);
        }

        @Override // rx.Observer
        public void onNext(Observable<? extends T> t) {
            this.queue.add(this.nl.next(t));
            if (WIP_UPDATER.getAndIncrement(this) == 0) {
                subscribeNext();
            }
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.child.onError(e);
            unsubscribe();
        }

        @Override // rx.Observer
        public void onCompleted() {
            this.queue.add(this.nl.completed());
            if (WIP_UPDATER.getAndIncrement(this) == 0) {
                subscribeNext();
            }
        }

        void completeInner() {
            request(1L);
            this.currentSubscriber = null;
            if (WIP_UPDATER.decrementAndGet(this) > 0) {
                subscribeNext();
            }
        }

        void subscribeNext() {
            if (this.requested > 0) {
                Object o = this.queue.poll();
                if (this.nl.isCompleted(o)) {
                    this.child.onCompleted();
                    return;
                } else {
                    if (o != null) {
                        Observable<? extends T> obs = this.nl.getValue(o);
                        this.currentSubscriber = new ConcatInnerSubscriber<>(this, this.child, this.requested);
                        this.current.set(this.currentSubscriber);
                        obs.unsafeSubscribe(this.currentSubscriber);
                        return;
                    }
                    return;
                }
            }
            if (this.nl.isCompleted(this.queue.peek())) {
                this.child.onCompleted();
            }
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorConcat$ConcatInnerSubscriber.class */
    static class ConcatInnerSubscriber<T> extends Subscriber<T> {
        private final Subscriber<T> child;
        private final ConcatSubscriber<T> parent;
        private volatile int once = 0;
        private static final AtomicIntegerFieldUpdater<ConcatInnerSubscriber> ONCE_UPDATER = AtomicIntegerFieldUpdater.newUpdater(ConcatInnerSubscriber.class, "once");

        public ConcatInnerSubscriber(ConcatSubscriber<T> parent, Subscriber<T> child, long initialRequest) {
            this.parent = parent;
            this.child = child;
            request(initialRequest);
        }

        void requestMore(long n) {
            request(n);
        }

        @Override // rx.Observer
        public void onNext(T t) {
            this.parent.decrementRequested();
            this.child.onNext(t);
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            if (ONCE_UPDATER.compareAndSet(this, 0, 1)) {
                this.parent.onError(e);
            }
        }

        @Override // rx.Observer
        public void onCompleted() {
            if (ONCE_UPDATER.compareAndSet(this, 0, 1)) {
                this.parent.completeInner();
            }
        }
    }
}
