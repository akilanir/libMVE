package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable;
import rx.Scheduler;
import rx.Subscriber;
import rx.functions.Action0;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeTimerOnce.class */
public final class OnSubscribeTimerOnce implements Observable.OnSubscribe<Long> {
    final long time;
    final TimeUnit unit;
    final Scheduler scheduler;

    public OnSubscribeTimerOnce(long time, TimeUnit unit, Scheduler scheduler) {
        this.time = time;
        this.unit = unit;
        this.scheduler = scheduler;
    }

    @Override // rx.functions.Action1
    public void call(final Subscriber<? super Long> child) {
        Scheduler.Worker worker = this.scheduler.createWorker();
        child.add(worker);
        worker.schedule(new Action0() { // from class: rx.internal.operators.OnSubscribeTimerOnce.1
            @Override // rx.functions.Action0
            public void call() {
                try {
                    child.onNext(0L);
                    child.onCompleted();
                } catch (Throwable t) {
                    child.onError(t);
                }
            }
        }, this.time, this.unit);
    }
}
