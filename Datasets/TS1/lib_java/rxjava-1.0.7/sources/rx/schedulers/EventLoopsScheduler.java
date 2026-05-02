package rx.schedulers;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import rx.Scheduler;
import rx.Subscription;
import rx.functions.Action0;
import rx.internal.schedulers.NewThreadWorker;
import rx.internal.schedulers.ScheduledAction;
import rx.internal.util.RxThreadFactory;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/schedulers/EventLoopsScheduler.class */
class EventLoopsScheduler extends Scheduler {
    private static final String THREAD_NAME_PREFIX = "RxComputationThreadPool-";
    private static final RxThreadFactory THREAD_FACTORY = new RxThreadFactory(THREAD_NAME_PREFIX);
    static final String KEY_MAX_THREADS = "rx.scheduler.max-computation-threads";
    static final int MAX_THREADS;
    final FixedSchedulerPool pool = new FixedSchedulerPool();

    static {
        int max;
        int maxThreads = Integer.getInteger(KEY_MAX_THREADS, 0).intValue();
        int ncpu = Runtime.getRuntime().availableProcessors();
        if (maxThreads <= 0 || maxThreads > ncpu) {
            max = ncpu;
        } else {
            max = maxThreads;
        }
        MAX_THREADS = max;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/schedulers/EventLoopsScheduler$FixedSchedulerPool.class */
    static final class FixedSchedulerPool {
        final int cores = EventLoopsScheduler.MAX_THREADS;
        final PoolWorker[] eventLoops = new PoolWorker[this.cores];
        long n;

        FixedSchedulerPool() {
            for (int i = 0; i < this.cores; i++) {
                this.eventLoops[i] = new PoolWorker(EventLoopsScheduler.THREAD_FACTORY);
            }
        }

        public PoolWorker getEventLoop() {
            PoolWorker[] poolWorkerArr = this.eventLoops;
            long j = this.n;
            this.n = j + 1;
            return poolWorkerArr[(int) (j % this.cores)];
        }
    }

    EventLoopsScheduler() {
    }

    @Override // rx.Scheduler
    public Scheduler.Worker createWorker() {
        return new EventLoopWorker(this.pool.getEventLoop());
    }

    /* loaded from: rxjava-1.0.7.jar:rx/schedulers/EventLoopsScheduler$EventLoopWorker.class */
    private static class EventLoopWorker extends Scheduler.Worker {
        private final CompositeSubscription innerSubscription = new CompositeSubscription();
        private final PoolWorker poolWorker;

        EventLoopWorker(PoolWorker poolWorker) {
            this.poolWorker = poolWorker;
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            this.innerSubscription.unsubscribe();
        }

        @Override // rx.Subscription
        public boolean isUnsubscribed() {
            return this.innerSubscription.isUnsubscribed();
        }

        @Override // rx.Scheduler.Worker
        public Subscription schedule(Action0 action) {
            return schedule(action, 0L, null);
        }

        @Override // rx.Scheduler.Worker
        public Subscription schedule(Action0 action, long delayTime, TimeUnit unit) {
            if (this.innerSubscription.isUnsubscribed()) {
                return Subscriptions.unsubscribed();
            }
            ScheduledAction s = this.poolWorker.scheduleActual(action, delayTime, unit);
            this.innerSubscription.add(s);
            s.addParent(this.innerSubscription);
            return s;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/schedulers/EventLoopsScheduler$PoolWorker.class */
    private static final class PoolWorker extends NewThreadWorker {
        PoolWorker(ThreadFactory threadFactory) {
            super(threadFactory);
        }
    }
}
