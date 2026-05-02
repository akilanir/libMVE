package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable;
import rx.Scheduler;
import rx.Subscriber;
import rx.functions.Action0;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeDelaySubscription.class */
public final class OnSubscribeDelaySubscription<T> implements Observable.OnSubscribe<T> {
    final Observable<? extends T> source;
    final long time;
    final TimeUnit unit;
    final Scheduler scheduler;

    public OnSubscribeDelaySubscription(Observable<? extends T> source, long time, TimeUnit unit, Scheduler scheduler) {
        this.source = source;
        this.time = time;
        this.unit = unit;
        this.scheduler = scheduler;
    }

    @Override // rx.functions.Action1
    public void call(final Subscriber<? super T> s) {
        Scheduler.Worker worker = this.scheduler.createWorker();
        s.add(worker);
        worker.schedule(new Action0() { // from class: rx.internal.operators.OnSubscribeDelaySubscription.1
            @Override // rx.functions.Action0
            public void call() {
                if (!s.isUnsubscribed()) {
                    OnSubscribeDelaySubscription.this.source.unsafeSubscribe(s);
                }
            }
        }, this.time, this.unit);
    }
}
