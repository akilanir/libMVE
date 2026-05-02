package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import rx.Observable;
import rx.Scheduler;
import rx.Subscriber;
import rx.functions.Action0;
import rx.observers.SerializedSubscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSampleWithTime.class */
public final class OperatorSampleWithTime<T> implements Observable.Operator<T, T> {
    final long time;
    final TimeUnit unit;
    final Scheduler scheduler;

    public OperatorSampleWithTime(long time, TimeUnit unit, Scheduler scheduler) {
        this.time = time;
        this.unit = unit;
        this.scheduler = scheduler;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> child) {
        SerializedSubscriber<T> s = new SerializedSubscriber<>(child);
        Scheduler.Worker worker = this.scheduler.createWorker();
        child.add(worker);
        SamplerSubscriber<T> sampler = new SamplerSubscriber<>(s);
        child.add(sampler);
        worker.schedulePeriodically(sampler, this.time, this.time, this.unit);
        return sampler;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSampleWithTime$SamplerSubscriber.class */
    static final class SamplerSubscriber<T> extends Subscriber<T> implements Action0 {
        private final Subscriber<? super T> subscriber;
        volatile Object value = EMPTY_TOKEN;
        private static final Object EMPTY_TOKEN = new Object();
        static final AtomicReferenceFieldUpdater<SamplerSubscriber, Object> VALUE_UPDATER = AtomicReferenceFieldUpdater.newUpdater(SamplerSubscriber.class, Object.class, "value");

        public SamplerSubscriber(Subscriber<? super T> subscriber) {
            this.subscriber = subscriber;
        }

        @Override // rx.Subscriber
        public void onStart() {
            request(Long.MAX_VALUE);
        }

        @Override // rx.Observer
        public void onNext(T t) {
            this.value = t;
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.subscriber.onError(e);
            unsubscribe();
        }

        @Override // rx.Observer
        public void onCompleted() {
            this.subscriber.onCompleted();
            unsubscribe();
        }

        @Override // rx.functions.Action0
        public void call() {
            Object localValue = VALUE_UPDATER.getAndSet(this, EMPTY_TOKEN);
            if (localValue != EMPTY_TOKEN) {
                try {
                    this.subscriber.onNext(localValue);
                } catch (Throwable e) {
                    onError(e);
                }
            }
        }
    }
}
