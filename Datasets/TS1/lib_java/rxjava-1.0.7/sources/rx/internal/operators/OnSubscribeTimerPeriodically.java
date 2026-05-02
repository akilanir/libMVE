package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable;
import rx.Scheduler;
import rx.Subscriber;
import rx.functions.Action0;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeTimerPeriodically.class */
public final class OnSubscribeTimerPeriodically implements Observable.OnSubscribe<Long> {
    final long initialDelay;
    final long period;
    final TimeUnit unit;
    final Scheduler scheduler;

    public OnSubscribeTimerPeriodically(long initialDelay, long period, TimeUnit unit, Scheduler scheduler) {
        this.initialDelay = initialDelay;
        this.period = period;
        this.unit = unit;
        this.scheduler = scheduler;
    }

    @Override // rx.functions.Action1
    public void call(final Subscriber<? super Long> child) {
        final Scheduler.Worker worker = this.scheduler.createWorker();
        child.add(worker);
        worker.schedulePeriodically(new Action0() { // from class: rx.internal.operators.OnSubscribeTimerPeriodically.1
            long counter;

            @Override // rx.functions.Action0
            public void call() {
                try {
                    Subscriber subscriber = child;
                    long j = this.counter;
                    this.counter = j + 1;
                    subscriber.onNext(Long.valueOf(j));
                } catch (Throwable e) {
                    try {
                        child.onError(e);
                        worker.unsubscribe();
                    } catch (Throwable th) {
                        worker.unsubscribe();
                        throw th;
                    }
                }
            }
        }, this.initialDelay, this.period, this.unit);
    }
}
