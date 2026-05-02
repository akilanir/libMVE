package rx.subscriptions;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import rx.Subscription;

/* loaded from: rxjava-1.0.7.jar:rx/subscriptions/MultipleAssignmentSubscription.class */
public final class MultipleAssignmentSubscription implements Subscription {
    volatile State state = new State(false, Subscriptions.empty());
    static final AtomicReferenceFieldUpdater<MultipleAssignmentSubscription, State> STATE_UPDATER = AtomicReferenceFieldUpdater.newUpdater(MultipleAssignmentSubscription.class, State.class, "state");

    /* loaded from: rxjava-1.0.7.jar:rx/subscriptions/MultipleAssignmentSubscription$State.class */
    private static final class State {
        final boolean isUnsubscribed;
        final Subscription subscription;

        State(boolean u, Subscription s) {
            this.isUnsubscribed = u;
            this.subscription = s;
        }

        State unsubscribe() {
            return new State(true, this.subscription);
        }

        State set(Subscription s) {
            return new State(this.isUnsubscribed, s);
        }
    }

    @Override // rx.Subscription
    public boolean isUnsubscribed() {
        return this.state.isUnsubscribed;
    }

    @Override // rx.Subscription
    public void unsubscribe() {
        State oldState;
        State newState;
        do {
            oldState = this.state;
            if (oldState.isUnsubscribed) {
                return;
            } else {
                newState = oldState.unsubscribe();
            }
        } while (!STATE_UPDATER.compareAndSet(this, oldState, newState));
        oldState.subscription.unsubscribe();
    }

    public void set(Subscription s) {
        State oldState;
        State newState;
        if (s == null) {
            throw new IllegalArgumentException("Subscription can not be null");
        }
        do {
            oldState = this.state;
            if (oldState.isUnsubscribed) {
                s.unsubscribe();
                return;
            }
            newState = oldState.set(s);
        } while (!STATE_UPDATER.compareAndSet(this, oldState, newState));
    }

    public Subscription get() {
        return this.state.subscription;
    }
}
