package rx.schedulers;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Scheduler;
import rx.Subscription;
import rx.functions.Action0;
import rx.plugins.RxJavaPlugins;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.MultipleAssignmentSubscription;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/schedulers/ExecutorScheduler.class */
final class ExecutorScheduler extends Scheduler {
    final Executor executor;

    public ExecutorScheduler(Executor executor) {
        this.executor = executor;
    }

    @Override // rx.Scheduler
    public Scheduler.Worker createWorker() {
        return new ExecutorSchedulerWorker(this.executor);
    }

    /* loaded from: rxjava-1.0.7.jar:rx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker.class */
    static final class ExecutorSchedulerWorker extends Scheduler.Worker implements Runnable {
        final Executor executor;
        final ConcurrentLinkedQueue<ExecutorAction> queue = new ConcurrentLinkedQueue<>();
        final AtomicInteger wip = new AtomicInteger();
        final CompositeSubscription tasks = new CompositeSubscription();

        public ExecutorSchedulerWorker(Executor executor) {
            this.executor = executor;
        }

        @Override // rx.Scheduler.Worker
        public Subscription schedule(Action0 action) {
            if (isUnsubscribed()) {
                return Subscriptions.unsubscribed();
            }
            ExecutorAction ea = new ExecutorAction(action, this.tasks);
            this.tasks.add(ea);
            this.queue.offer(ea);
            if (this.wip.getAndIncrement() == 0) {
                try {
                    this.executor.execute(this);
                } catch (RejectedExecutionException t) {
                    this.tasks.remove(ea);
                    this.wip.decrementAndGet();
                    RxJavaPlugins.getInstance().getErrorHandler().handleError(t);
                    throw t;
                }
            }
            return ea;
        }

        @Override // java.lang.Runnable
        public void run() {
            do {
                this.queue.poll().run();
            } while (this.wip.decrementAndGet() > 0);
        }

        @Override // rx.Scheduler.Worker
        public Subscription schedule(final Action0 action, long delayTime, TimeUnit unit) {
            ScheduledExecutorService service;
            if (delayTime <= 0) {
                return schedule(action);
            }
            if (isUnsubscribed()) {
                return Subscriptions.unsubscribed();
            }
            if (this.executor instanceof ScheduledExecutorService) {
                service = (ScheduledExecutorService) this.executor;
            } else {
                service = GenericScheduledExecutorService.getInstance();
            }
            final MultipleAssignmentSubscription mas = new MultipleAssignmentSubscription();
            try {
                Future<?> f = service.schedule(new Runnable() { // from class: rx.schedulers.ExecutorScheduler.ExecutorSchedulerWorker.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (mas.isUnsubscribed()) {
                            return;
                        }
                        mas.set(ExecutorSchedulerWorker.this.schedule(action));
                    }
                }, delayTime, unit);
                mas.set(Subscriptions.from(f));
                return mas;
            } catch (RejectedExecutionException t) {
                RxJavaPlugins.getInstance().getErrorHandler().handleError(t);
                throw t;
            }
        }

        @Override // rx.Subscription
        public boolean isUnsubscribed() {
            return this.tasks.isUnsubscribed();
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            this.tasks.unsubscribe();
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/schedulers/ExecutorScheduler$ExecutorAction.class */
    static final class ExecutorAction implements Runnable, Subscription {
        final Action0 actual;
        final CompositeSubscription parent;
        volatile int unsubscribed;
        static final AtomicIntegerFieldUpdater<ExecutorAction> UNSUBSCRIBED_UPDATER = AtomicIntegerFieldUpdater.newUpdater(ExecutorAction.class, "unsubscribed");

        public ExecutorAction(Action0 actual, CompositeSubscription parent) {
            this.actual = actual;
            this.parent = parent;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                if (isUnsubscribed()) {
                    return;
                }
                try {
                    this.actual.call();
                    unsubscribe();
                } catch (Throwable t) {
                    RxJavaPlugins.getInstance().getErrorHandler().handleError(t);
                    Thread thread = Thread.currentThread();
                    thread.getUncaughtExceptionHandler().uncaughtException(thread, t);
                    unsubscribe();
                }
            } catch (Throwable th) {
                unsubscribe();
                throw th;
            }
        }

        @Override // rx.Subscription
        public boolean isUnsubscribed() {
            return this.unsubscribed != 0;
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            if (UNSUBSCRIBED_UPDATER.compareAndSet(this, 0, 1)) {
                this.parent.remove(this);
            }
        }
    }
}
