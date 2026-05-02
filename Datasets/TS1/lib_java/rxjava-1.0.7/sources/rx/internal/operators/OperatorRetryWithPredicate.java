package rx.internal.operators;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Observable;
import rx.Scheduler;
import rx.Subscriber;
import rx.functions.Action0;
import rx.functions.Func2;
import rx.schedulers.Schedulers;
import rx.subscriptions.SerialSubscription;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorRetryWithPredicate.class */
public final class OperatorRetryWithPredicate<T> implements Observable.Operator<T, Observable<T>> {
    final Func2<Integer, Throwable, Boolean> predicate;

    public OperatorRetryWithPredicate(Func2<Integer, Throwable, Boolean> predicate) {
        this.predicate = predicate;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super Observable<T>> call(Subscriber<? super T> child) {
        Scheduler.Worker inner = Schedulers.trampoline().createWorker();
        child.add(inner);
        SerialSubscription serialSubscription = new SerialSubscription();
        child.add(serialSubscription);
        return new SourceSubscriber(child, this.predicate, inner, serialSubscription);
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorRetryWithPredicate$SourceSubscriber.class */
    static final class SourceSubscriber<T> extends Subscriber<Observable<T>> {
        final Subscriber<? super T> child;
        final Func2<Integer, Throwable, Boolean> predicate;
        final Scheduler.Worker inner;
        final SerialSubscription serialSubscription;
        volatile int attempts;
        static final AtomicIntegerFieldUpdater<SourceSubscriber> ATTEMPTS_UPDATER = AtomicIntegerFieldUpdater.newUpdater(SourceSubscriber.class, "attempts");

        public SourceSubscriber(Subscriber<? super T> child, Func2<Integer, Throwable, Boolean> predicate, Scheduler.Worker inner, SerialSubscription serialSubscription) {
            this.child = child;
            this.predicate = predicate;
            this.inner = inner;
            this.serialSubscription = serialSubscription;
        }

        @Override // rx.Observer
        public void onCompleted() {
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.child.onError(e);
        }

        @Override // rx.Observer
        public void onNext(final Observable<T> o) {
            this.inner.schedule(new Action0() { // from class: rx.internal.operators.OperatorRetryWithPredicate.SourceSubscriber.1
                @Override // rx.functions.Action0
                public void call() {
                    SourceSubscriber.ATTEMPTS_UPDATER.incrementAndGet(SourceSubscriber.this);
                    Subscriber<T> subscriber = new Subscriber<T>() { // from class: rx.internal.operators.OperatorRetryWithPredicate.SourceSubscriber.1.1
                        @Override // rx.Observer
                        public void onCompleted() {
                            SourceSubscriber.this.child.onCompleted();
                        }

                        @Override // rx.Observer
                        public void onError(Throwable e) {
                            if (SourceSubscriber.this.predicate.call(Integer.valueOf(SourceSubscriber.this.attempts), e).booleanValue() && !SourceSubscriber.this.inner.isUnsubscribed()) {
                                SourceSubscriber.this.inner.schedule(this);
                            } else {
                                SourceSubscriber.this.child.onError(e);
                            }
                        }

                        @Override // rx.Observer
                        public void onNext(T v) {
                            SourceSubscriber.this.child.onNext(v);
                        }
                    };
                    SourceSubscriber.this.serialSubscription.set(subscriber);
                    o.unsafeSubscribe(subscriber);
                }
            });
        }
    }
}
