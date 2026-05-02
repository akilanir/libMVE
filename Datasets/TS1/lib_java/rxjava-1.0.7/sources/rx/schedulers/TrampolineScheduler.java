package rx.schedulers;

import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Scheduler;
import rx.Subscription;
import rx.functions.Action0;
import rx.subscriptions.BooleanSubscription;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/schedulers/TrampolineScheduler.class */
public final class TrampolineScheduler extends Scheduler {
    private static final TrampolineScheduler INSTANCE = new TrampolineScheduler();

    static TrampolineScheduler instance() {
        return INSTANCE;
    }

    @Override // rx.Scheduler
    public Scheduler.Worker createWorker() {
        return new InnerCurrentThreadScheduler();
    }

    TrampolineScheduler() {
    }

    /* loaded from: rxjava-1.0.7.jar:rx/schedulers/TrampolineScheduler$InnerCurrentThreadScheduler.class */
    private static class InnerCurrentThreadScheduler extends Scheduler.Worker implements Subscription {
        private static final AtomicIntegerFieldUpdater<InnerCurrentThreadScheduler> COUNTER_UPDATER = AtomicIntegerFieldUpdater.newUpdater(InnerCurrentThreadScheduler.class, "counter");
        volatile int counter;
        private final PriorityBlockingQueue<TimedAction> queue;
        private final BooleanSubscription innerSubscription;
        private final AtomicInteger wip;

        private InnerCurrentThreadScheduler() {
            this.queue = new PriorityBlockingQueue<>();
            this.innerSubscription = new BooleanSubscription();
            this.wip = new AtomicInteger();
        }

        @Override // rx.Scheduler.Worker
        public Subscription schedule(Action0 action) {
            return enqueue(action, now());
        }

        @Override // rx.Scheduler.Worker
        public Subscription schedule(Action0 action, long delayTime, TimeUnit unit) {
            long execTime = now() + unit.toMillis(delayTime);
            return enqueue(new SleepingAction(action, this, execTime), execTime);
        }

        private Subscription enqueue(Action0 action, long execTime) {
            if (this.innerSubscription.isUnsubscribed()) {
                return Subscriptions.unsubscribed();
            }
            final TimedAction timedAction = new TimedAction(action, Long.valueOf(execTime), COUNTER_UPDATER.incrementAndGet(this));
            this.queue.add(timedAction);
            if (this.wip.getAndIncrement() == 0) {
                do {
                    TimedAction polled = this.queue.poll();
                    if (polled != null) {
                        polled.action.call();
                    }
                } while (this.wip.decrementAndGet() > 0);
                return Subscriptions.unsubscribed();
            }
            return Subscriptions.create(new Action0() { // from class: rx.schedulers.TrampolineScheduler.InnerCurrentThreadScheduler.1
                @Override // rx.functions.Action0
                public void call() {
                    InnerCurrentThreadScheduler.this.queue.remove(timedAction);
                }
            });
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            this.innerSubscription.unsubscribe();
        }

        @Override // rx.Subscription
        public boolean isUnsubscribed() {
            return this.innerSubscription.isUnsubscribed();
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/schedulers/TrampolineScheduler$TimedAction.class */
    private static final class TimedAction implements Comparable<TimedAction> {
        final Action0 action;
        final Long execTime;
        final int count;

        private TimedAction(Action0 action, Long execTime, int count) {
            this.action = action;
            this.execTime = execTime;
            this.count = count;
        }

        @Override // java.lang.Comparable
        public int compareTo(TimedAction that) {
            int result = this.execTime.compareTo(that.execTime);
            if (result == 0) {
                return TrampolineScheduler.compare(this.count, that.count);
            }
            return result;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int compare(int x, int y) {
        if (x < y) {
            return -1;
        }
        return x == y ? 0 : 1;
    }
}
