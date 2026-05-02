package rx.android.schedulers;

import android.os.Handler;
import java.util.concurrent.TimeUnit;
import rx.Scheduler;
import rx.Subscription;
import rx.functions.Action0;
import rx.internal.schedulers.ScheduledAction;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.Subscriptions;

/* loaded from: rxandroid-0.23.0.jar:rx/android/schedulers/HandlerThreadScheduler.class */
public class HandlerThreadScheduler extends Scheduler {
    private final Handler handler;

    public HandlerThreadScheduler(Handler handler) {
        this.handler = handler;
    }

    public Scheduler.Worker createWorker() {
        return new InnerHandlerThreadScheduler(this.handler);
    }

    /* loaded from: rxandroid-0.23.0.jar:rx/android/schedulers/HandlerThreadScheduler$InnerHandlerThreadScheduler.class */
    private static class InnerHandlerThreadScheduler extends Scheduler.Worker {
        private final Handler handler;
        private final CompositeSubscription compositeSubscription = new CompositeSubscription();

        public InnerHandlerThreadScheduler(Handler handler) {
            this.handler = handler;
        }

        public void unsubscribe() {
            this.compositeSubscription.unsubscribe();
        }

        public boolean isUnsubscribed() {
            return this.compositeSubscription.isUnsubscribed();
        }

        public Subscription schedule(Action0 action, long delayTime, TimeUnit unit) {
            final Runnable scheduledAction = new ScheduledAction(action);
            scheduledAction.add(Subscriptions.create(new Action0() { // from class: rx.android.schedulers.HandlerThreadScheduler.InnerHandlerThreadScheduler.1
                public void call() {
                    InnerHandlerThreadScheduler.this.handler.removeCallbacks(scheduledAction);
                }
            }));
            scheduledAction.addParent(this.compositeSubscription);
            this.compositeSubscription.add(scheduledAction);
            this.handler.postDelayed(scheduledAction, unit.toMillis(delayTime));
            return scheduledAction;
        }

        public Subscription schedule(Action0 action) {
            return schedule(action, 0L, TimeUnit.MILLISECONDS);
        }
    }
}
