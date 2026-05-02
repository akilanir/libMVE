package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import rx.Observable;
import rx.Scheduler;
import rx.Subscriber;
import rx.functions.Action0;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSkipTimed.class */
public final class OperatorSkipTimed<T> implements Observable.Operator<T, T> {
    final long time;
    final TimeUnit unit;
    final Scheduler scheduler;

    public OperatorSkipTimed(long time, TimeUnit unit, Scheduler scheduler) {
        this.time = time;
        this.unit = unit;
        this.scheduler = scheduler;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super T> subscriber) {
        Scheduler.Worker createWorker = this.scheduler.createWorker();
        subscriber.add(createWorker);
        final AtomicBoolean atomicBoolean = new AtomicBoolean();
        createWorker.schedule(new Action0() { // from class: rx.internal.operators.OperatorSkipTimed.1
            @Override // rx.functions.Action0
            public void call() {
                atomicBoolean.set(true);
            }
        }, this.time, this.unit);
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorSkipTimed.2
            @Override // rx.Observer
            public void onNext(T t) {
                if (atomicBoolean.get()) {
                    subscriber.onNext(t);
                }
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                try {
                    subscriber.onError(e);
                    unsubscribe();
                } catch (Throwable th) {
                    unsubscribe();
                    throw th;
                }
            }

            @Override // rx.Observer
            public void onCompleted() {
                try {
                    subscriber.onCompleted();
                    unsubscribe();
                } catch (Throwable th) {
                    unsubscribe();
                    throw th;
                }
            }
        };
    }
}
