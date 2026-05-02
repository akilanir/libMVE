package rx.internal.operators;

import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Scheduler;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Func3;
import rx.functions.Func4;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.SerialSubscription;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorTimeoutBase.class */
class OperatorTimeoutBase<T> implements Observable.Operator<T, T> {
    private final FirstTimeoutStub<T> firstTimeoutStub;
    private final TimeoutStub<T> timeoutStub;
    private final Observable<? extends T> other;
    private final Scheduler scheduler;

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorTimeoutBase$FirstTimeoutStub.class */
    interface FirstTimeoutStub<T> extends Func3<TimeoutSubscriber<T>, Long, Scheduler.Worker, Subscription> {
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorTimeoutBase$TimeoutStub.class */
    interface TimeoutStub<T> extends Func4<TimeoutSubscriber<T>, Long, T, Scheduler.Worker, Subscription> {
    }

    OperatorTimeoutBase(FirstTimeoutStub<T> firstTimeoutStub, TimeoutStub<T> timeoutStub, Observable<? extends T> other, Scheduler scheduler) {
        this.firstTimeoutStub = firstTimeoutStub;
        this.timeoutStub = timeoutStub;
        this.other = other;
        this.scheduler = scheduler;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> subscriber) {
        Scheduler.Worker inner = this.scheduler.createWorker();
        subscriber.add(inner);
        SerialSubscription serial = new SerialSubscription();
        subscriber.add(serial);
        SerializedSubscriber<T> synchronizedSubscriber = new SerializedSubscriber<>(subscriber);
        TimeoutSubscriber<T> timeoutSubscriber = new TimeoutSubscriber<>(synchronizedSubscriber, this.timeoutStub, serial, this.other, inner);
        serial.set(this.firstTimeoutStub.call(timeoutSubscriber, 0L, inner));
        return timeoutSubscriber;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorTimeoutBase$TimeoutSubscriber.class */
    static final class TimeoutSubscriber<T> extends Subscriber<T> {
        private final SerialSubscription serial;
        private final Object gate;
        private final SerializedSubscriber<T> serializedSubscriber;
        private final TimeoutStub<T> timeoutStub;
        private final Observable<? extends T> other;
        private final Scheduler.Worker inner;
        volatile int terminated;
        volatile long actual;
        static final AtomicIntegerFieldUpdater<TimeoutSubscriber> TERMINATED_UPDATER = AtomicIntegerFieldUpdater.newUpdater(TimeoutSubscriber.class, "terminated");
        static final AtomicLongFieldUpdater<TimeoutSubscriber> ACTUAL_UPDATER = AtomicLongFieldUpdater.newUpdater(TimeoutSubscriber.class, "actual");

        private TimeoutSubscriber(SerializedSubscriber<T> serializedSubscriber, TimeoutStub<T> timeoutStub, SerialSubscription serial, Observable<? extends T> other, Scheduler.Worker inner) {
            super(serializedSubscriber);
            this.gate = new Object();
            this.serializedSubscriber = serializedSubscriber;
            this.timeoutStub = timeoutStub;
            this.serial = serial;
            this.other = other;
            this.inner = inner;
        }

        @Override // rx.Observer
        public void onNext(T value) {
            boolean onNextWins = false;
            synchronized (this.gate) {
                if (this.terminated == 0) {
                    ACTUAL_UPDATER.incrementAndGet(this);
                    onNextWins = true;
                }
            }
            if (onNextWins) {
                this.serializedSubscriber.onNext(value);
                this.serial.set(this.timeoutStub.call(this, Long.valueOf(this.actual), value, this.inner));
            }
        }

        @Override // rx.Observer
        public void onError(Throwable error) {
            boolean onErrorWins = false;
            synchronized (this.gate) {
                if (TERMINATED_UPDATER.getAndSet(this, 1) == 0) {
                    onErrorWins = true;
                }
            }
            if (onErrorWins) {
                this.serial.unsubscribe();
                this.serializedSubscriber.onError(error);
            }
        }

        @Override // rx.Observer
        public void onCompleted() {
            boolean onCompletedWins = false;
            synchronized (this.gate) {
                if (TERMINATED_UPDATER.getAndSet(this, 1) == 0) {
                    onCompletedWins = true;
                }
            }
            if (onCompletedWins) {
                this.serial.unsubscribe();
                this.serializedSubscriber.onCompleted();
            }
        }

        public void onTimeout(long seqId) {
            boolean timeoutWins = false;
            synchronized (this.gate) {
                if (seqId == this.actual && TERMINATED_UPDATER.getAndSet(this, 1) == 0) {
                    timeoutWins = true;
                }
            }
            if (timeoutWins) {
                if (this.other == null) {
                    this.serializedSubscriber.onError(new TimeoutException());
                } else {
                    this.other.unsafeSubscribe(this.serializedSubscriber);
                    this.serial.set(this.serializedSubscriber);
                }
            }
        }
    }
}
