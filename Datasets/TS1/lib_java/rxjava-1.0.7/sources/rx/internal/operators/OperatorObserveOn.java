package rx.internal.operators;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Producer;
import rx.Scheduler;
import rx.Subscriber;
import rx.Subscription;
import rx.exceptions.MissingBackpressureException;
import rx.functions.Action0;
import rx.internal.util.RxRingBuffer;
import rx.schedulers.ImmediateScheduler;
import rx.schedulers.TrampolineScheduler;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorObserveOn.class */
public final class OperatorObserveOn<T> implements Observable.Operator<T, T> {
    private final Scheduler scheduler;

    public OperatorObserveOn(Scheduler scheduler) {
        this.scheduler = scheduler;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> child) {
        if (this.scheduler instanceof ImmediateScheduler) {
            return child;
        }
        if (this.scheduler instanceof TrampolineScheduler) {
            return child;
        }
        return new ObserveOnSubscriber(this.scheduler, child);
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorObserveOn$ObserveOnSubscriber.class */
    private static final class ObserveOnSubscriber<T> extends Subscriber<T> {
        final Subscriber<? super T> child;
        private final Scheduler.Worker recursiveScheduler;
        private final ScheduledUnsubscribe scheduledUnsubscribe;
        final NotificationLite<T> on = NotificationLite.instance();
        private final RxRingBuffer queue = RxRingBuffer.getSpscInstance();
        private boolean completed = false;
        private boolean failure = false;
        private volatile long requested = 0;
        volatile long counter;
        static final AtomicLongFieldUpdater<ObserveOnSubscriber> REQUESTED = AtomicLongFieldUpdater.newUpdater(ObserveOnSubscriber.class, "requested");
        static final AtomicLongFieldUpdater<ObserveOnSubscriber> COUNTER_UPDATER = AtomicLongFieldUpdater.newUpdater(ObserveOnSubscriber.class, "counter");

        public ObserveOnSubscriber(Scheduler scheduler, Subscriber<? super T> child) {
            this.child = child;
            this.recursiveScheduler = scheduler.createWorker();
            this.scheduledUnsubscribe = new ScheduledUnsubscribe(this.recursiveScheduler, this.queue);
            child.add(this.scheduledUnsubscribe);
            child.setProducer(new Producer() { // from class: rx.internal.operators.OperatorObserveOn.ObserveOnSubscriber.1
                @Override // rx.Producer
                public void request(long n) {
                    ObserveOnSubscriber.REQUESTED.getAndAdd(ObserveOnSubscriber.this, n);
                    ObserveOnSubscriber.this.schedule();
                }
            });
            child.add(this.recursiveScheduler);
            child.add(this);
        }

        @Override // rx.Subscriber
        public void onStart() {
            request(RxRingBuffer.SIZE);
        }

        @Override // rx.Observer
        public void onNext(T t) {
            if (isUnsubscribed() || this.completed) {
                return;
            }
            try {
                this.queue.onNext(t);
                schedule();
            } catch (MissingBackpressureException e) {
                onError(e);
            }
        }

        @Override // rx.Observer
        public void onCompleted() {
            if (isUnsubscribed() || this.completed) {
                return;
            }
            this.completed = true;
            this.queue.onCompleted();
            schedule();
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            if (isUnsubscribed() || this.completed) {
                return;
            }
            unsubscribe();
            this.completed = true;
            this.failure = true;
            this.queue.onError(e);
            schedule();
        }

        protected void schedule() {
            if (COUNTER_UPDATER.getAndIncrement(this) == 0) {
                this.recursiveScheduler.schedule(new Action0() { // from class: rx.internal.operators.OperatorObserveOn.ObserveOnSubscriber.2
                    @Override // rx.functions.Action0
                    public void call() {
                        ObserveOnSubscriber.this.pollQueue();
                    }
                });
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void pollQueue() {
            int emitted = 0;
            do {
                COUNTER_UPDATER.set(this, 1L);
                while (true) {
                    if (!this.scheduledUnsubscribe.isUnsubscribed()) {
                        if (!this.failure) {
                            if (REQUESTED.getAndDecrement(this) != 0) {
                                Object o = this.queue.poll();
                                if (o == null) {
                                    REQUESTED.incrementAndGet(this);
                                    break;
                                } else if (!this.on.accept(this.child, o)) {
                                    emitted++;
                                }
                            } else {
                                REQUESTED.incrementAndGet(this);
                                break;
                            }
                        } else {
                            Object o2 = this.queue.poll();
                            if (this.on.isError(o2)) {
                                this.on.accept(this.child, o2);
                                return;
                            }
                        }
                    } else {
                        break;
                    }
                }
            } while (COUNTER_UPDATER.decrementAndGet(this) > 0);
            if (emitted > 0) {
                request(emitted);
            }
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorObserveOn$ScheduledUnsubscribe.class */
    static final class ScheduledUnsubscribe implements Subscription {
        final Scheduler.Worker worker;
        volatile int once;
        static final AtomicIntegerFieldUpdater<ScheduledUnsubscribe> ONCE_UPDATER = AtomicIntegerFieldUpdater.newUpdater(ScheduledUnsubscribe.class, "once");
        final RxRingBuffer queue;
        volatile boolean unsubscribed = false;

        public ScheduledUnsubscribe(Scheduler.Worker worker, RxRingBuffer queue) {
            this.worker = worker;
            this.queue = queue;
        }

        @Override // rx.Subscription
        public boolean isUnsubscribed() {
            return this.unsubscribed;
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            if (ONCE_UPDATER.getAndSet(this, 1) == 0) {
                this.worker.schedule(new Action0() { // from class: rx.internal.operators.OperatorObserveOn.ScheduledUnsubscribe.1
                    @Override // rx.functions.Action0
                    public void call() {
                        ScheduledUnsubscribe.this.worker.unsubscribe();
                        ScheduledUnsubscribe.this.unsubscribed = true;
                    }
                });
            }
        }
    }
}
