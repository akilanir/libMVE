package rx.subscriptions;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Subscription;
import rx.functions.Action0;

/* loaded from: rxjava-1.0.7.jar:rx/subscriptions/BooleanSubscription.class */
public final class BooleanSubscription implements Subscription {
    private final Action0 action;
    volatile int unsubscribed;
    static final AtomicIntegerFieldUpdater<BooleanSubscription> UNSUBSCRIBED_UPDATER = AtomicIntegerFieldUpdater.newUpdater(BooleanSubscription.class, "unsubscribed");

    public BooleanSubscription() {
        this.action = null;
    }

    private BooleanSubscription(Action0 action) {
        this.action = action;
    }

    public static BooleanSubscription create() {
        return new BooleanSubscription();
    }

    public static BooleanSubscription create(Action0 onUnsubscribe) {
        return new BooleanSubscription(onUnsubscribe);
    }

    @Override // rx.Subscription
    public boolean isUnsubscribed() {
        return this.unsubscribed != 0;
    }

    @Override // rx.Subscription
    public final void unsubscribe() {
        if (UNSUBSCRIBED_UPDATER.compareAndSet(this, 0, 1) && this.action != null) {
            this.action.call();
        }
    }
}
