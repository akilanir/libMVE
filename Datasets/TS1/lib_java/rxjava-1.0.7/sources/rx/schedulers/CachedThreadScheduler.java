package rx.schedulers;

import java.util.Iterator;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Scheduler;
import rx.Subscription;
import rx.functions.Action0;
import rx.internal.schedulers.NewThreadWorker;
import rx.internal.schedulers.ScheduledAction;
import rx.internal.util.RxThreadFactory;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/schedulers/CachedThreadScheduler.class */
final class CachedThreadScheduler extends Scheduler {
    private static final String WORKER_THREAD_NAME_PREFIX = "RxCachedThreadScheduler-";
    private static final RxThreadFactory WORKER_THREAD_FACTORY = new RxThreadFactory(WORKER_THREAD_NAME_PREFIX);
    private static final String EVICTOR_THREAD_NAME_PREFIX = "RxCachedWorkerPoolEvictor-";
    private static final RxThreadFactory EVICTOR_THREAD_FACTORY = new RxThreadFactory(EVICTOR_THREAD_NAME_PREFIX);

    CachedThreadScheduler() {
    }

    /* loaded from: rxjava-1.0.7.jar:rx/schedulers/CachedThreadScheduler$CachedWorkerPool.class */
    private static final class CachedWorkerPool {
        private final long keepAliveTime;
        private final ConcurrentLinkedQueue<ThreadWorker> expiringWorkerQueue = new ConcurrentLinkedQueue<>();
        private final ScheduledExecutorService evictExpiredWorkerExecutor = Executors.newScheduledThreadPool(1, CachedThreadScheduler.EVICTOR_THREAD_FACTORY);
        private static CachedWorkerPool INSTANCE = new CachedWorkerPool(60, TimeUnit.SECONDS);

        CachedWorkerPool(long keepAliveTime, TimeUnit unit) {
            this.keepAliveTime = unit.toNanos(keepAliveTime);
            this.evictExpiredWorkerExecutor.scheduleWithFixedDelay(new Runnable() { // from class: rx.schedulers.CachedThreadScheduler.CachedWorkerPool.1
                @Override // java.lang.Runnable
                public void run() {
                    CachedWorkerPool.this.evictExpiredWorkers();
                }
            }, this.keepAliveTime, this.keepAliveTime, TimeUnit.NANOSECONDS);
        }

        ThreadWorker get() {
            while (!this.expiringWorkerQueue.isEmpty()) {
                ThreadWorker threadWorker = this.expiringWorkerQueue.poll();
                if (threadWorker != null) {
                    return threadWorker;
                }
            }
            return new ThreadWorker(CachedThreadScheduler.WORKER_THREAD_FACTORY);
        }

        void release(ThreadWorker threadWorker) {
            threadWorker.setExpirationTime(now() + this.keepAliveTime);
            this.expiringWorkerQueue.offer(threadWorker);
        }

        void evictExpiredWorkers() {
            if (!this.expiringWorkerQueue.isEmpty()) {
                long currentTimestamp = now();
                Iterator i$ = this.expiringWorkerQueue.iterator();
                while (i$.hasNext()) {
                    ThreadWorker threadWorker = i$.next();
                    if (threadWorker.getExpirationTime() <= currentTimestamp) {
                        if (this.expiringWorkerQueue.remove(threadWorker)) {
                            threadWorker.unsubscribe();
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        long now() {
            return System.nanoTime();
        }
    }

    @Override // rx.Scheduler
    public Scheduler.Worker createWorker() {
        return new EventLoopWorker(CachedWorkerPool.INSTANCE.get());
    }

    /* loaded from: rxjava-1.0.7.jar:rx/schedulers/CachedThreadScheduler$EventLoopWorker.class */
    private static final class EventLoopWorker extends Scheduler.Worker {
        private final CompositeSubscription innerSubscription = new CompositeSubscription();
        private final ThreadWorker threadWorker;
        volatile int once;
        static final AtomicIntegerFieldUpdater<EventLoopWorker> ONCE_UPDATER = AtomicIntegerFieldUpdater.newUpdater(EventLoopWorker.class, "once");

        EventLoopWorker(ThreadWorker threadWorker) {
            this.threadWorker = threadWorker;
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            if (ONCE_UPDATER.compareAndSet(this, 0, 1)) {
                CachedWorkerPool.INSTANCE.release(this.threadWorker);
            }
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
            ScheduledAction s = this.threadWorker.scheduleActual(action, delayTime, unit);
            this.innerSubscription.add(s);
            s.addParent(this.innerSubscription);
            return s;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/schedulers/CachedThreadScheduler$ThreadWorker.class */
    private static final class ThreadWorker extends NewThreadWorker {
        private long expirationTime;

        ThreadWorker(ThreadFactory threadFactory) {
            super(threadFactory);
            this.expirationTime = 0L;
        }

        public long getExpirationTime() {
            return this.expirationTime;
        }

        public void setExpirationTime(long expirationTime) {
            this.expirationTime = expirationTime;
        }
    }
}
