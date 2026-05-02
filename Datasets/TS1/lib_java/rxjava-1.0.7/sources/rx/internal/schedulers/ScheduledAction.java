package rx.internal.schedulers;

import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import rx.Subscription;
import rx.exceptions.OnErrorNotImplementedException;
import rx.functions.Action0;
import rx.plugins.RxJavaPlugins;
import rx.subscriptions.CompositeSubscription;

/* loaded from: rxjava-1.0.7.jar:rx/internal/schedulers/ScheduledAction.class */
public final class ScheduledAction extends AtomicReference<Thread> implements Runnable, Subscription {
    private static final long serialVersionUID = -3962399486978279857L;
    final CompositeSubscription cancel = new CompositeSubscription();
    final Action0 action;

    public ScheduledAction(Action0 action) {
        this.action = action;
    }

    @Override // java.lang.Runnable
    public void run() {
        IllegalStateException ie;
        try {
            try {
                lazySet(Thread.currentThread());
                this.action.call();
                unsubscribe();
            } catch (Throwable e) {
                if (e instanceof OnErrorNotImplementedException) {
                    ie = new IllegalStateException("Exception thrown on Scheduler.Worker thread. Add `onError` handling.", e);
                } else {
                    ie = new IllegalStateException("Fatal Exception thrown on Scheduler.Worker thread.", e);
                }
                RxJavaPlugins.getInstance().getErrorHandler().handleError(ie);
                Thread thread = Thread.currentThread();
                thread.getUncaughtExceptionHandler().uncaughtException(thread, ie);
                unsubscribe();
            }
        } catch (Throwable th) {
            unsubscribe();
            throw th;
        }
    }

    @Override // rx.Subscription
    public boolean isUnsubscribed() {
        return this.cancel.isUnsubscribed();
    }

    @Override // rx.Subscription
    public void unsubscribe() {
        if (!this.cancel.isUnsubscribed()) {
            this.cancel.unsubscribe();
        }
    }

    public void add(Subscription s) {
        this.cancel.add(s);
    }

    public void add(Future<?> f) {
        this.cancel.add(new FutureCompleter(f));
    }

    public void addParent(CompositeSubscription parent) {
        this.cancel.add(new Remover(this, parent));
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/schedulers/ScheduledAction$FutureCompleter.class */
    private final class FutureCompleter implements Subscription {
        private final Future<?> f;

        private FutureCompleter(Future<?> f) {
            this.f = f;
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            if (ScheduledAction.this.get() != Thread.currentThread()) {
                this.f.cancel(true);
            } else {
                this.f.cancel(false);
            }
        }

        @Override // rx.Subscription
        public boolean isUnsubscribed() {
            return this.f.isCancelled();
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/schedulers/ScheduledAction$Remover.class */
    private static final class Remover extends AtomicBoolean implements Subscription {
        private static final long serialVersionUID = 247232374289553518L;
        final Subscription s;
        final CompositeSubscription parent;

        public Remover(Subscription s, CompositeSubscription parent) {
            this.s = s;
            this.parent = parent;
        }

        @Override // rx.Subscription
        public boolean isUnsubscribed() {
            return this.s.isUnsubscribed();
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            if (compareAndSet(false, true)) {
                this.parent.remove(this.s);
            }
        }
    }
}
