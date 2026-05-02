package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable;
import rx.Scheduler;
import rx.Subscriber;
import rx.functions.Action0;
import rx.observers.SerializedSubscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorTakeTimed.class */
public final class OperatorTakeTimed<T> implements Observable.Operator<T, T> {
    final long time;
    final TimeUnit unit;
    final Scheduler scheduler;

    public OperatorTakeTimed(long time, TimeUnit unit, Scheduler scheduler) {
        this.time = time;
        this.unit = unit;
        this.scheduler = scheduler;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> child) {
        Scheduler.Worker worker = this.scheduler.createWorker();
        child.add(worker);
        TakeSubscriber<T> ts = new TakeSubscriber<>(new SerializedSubscriber(child));
        worker.schedule(ts, this.time, this.unit);
        return ts;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorTakeTimed$TakeSubscriber.class */
    static final class TakeSubscriber<T> extends Subscriber<T> implements Action0 {
        final Subscriber<? super T> child;

        public TakeSubscriber(Subscriber<? super T> child) {
            super(child);
            this.child = child;
        }

        @Override // rx.Observer
        public void onNext(T t) {
            this.child.onNext(t);
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.child.onError(e);
            unsubscribe();
        }

        @Override // rx.Observer
        public void onCompleted() {
            this.child.onCompleted();
            unsubscribe();
        }

        @Override // rx.functions.Action0
        public void call() {
            onCompleted();
        }
    }
}
