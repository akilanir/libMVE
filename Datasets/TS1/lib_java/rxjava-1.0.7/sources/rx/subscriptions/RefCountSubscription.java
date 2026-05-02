package rx.subscriptions;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import rx.Subscription;

/* loaded from: rxjava-1.0.7.jar:rx/subscriptions/RefCountSubscription.class */
public final class RefCountSubscription implements Subscription {
    private final Subscription actual;
    volatile State state = EMPTY_STATE;
    static final State EMPTY_STATE = new State(false, 0);
    static final AtomicReferenceFieldUpdater<RefCountSubscription, State> STATE_UPDATER = AtomicReferenceFieldUpdater.newUpdater(RefCountSubscription.class, State.class, "state");

    /* loaded from: rxjava-1.0.7.jar:rx/subscriptions/RefCountSubscription$State.class */
    private static final class State {
        final boolean isUnsubscribed;
        final int children;

        State(boolean u, int c) {
            this.isUnsubscribed = u;
            this.children = c;
        }

        State addChild() {
            return new State(this.isUnsubscribed, this.children + 1);
        }

        State removeChild() {
            return new State(this.isUnsubscribed, this.children - 1);
        }

        State unsubscribe() {
            return new State(true, this.children);
        }
    }

    public RefCountSubscription(Subscription s) {
        if (s == null) {
            throw new IllegalArgumentException("s");
        }
        this.actual = s;
    }

    public Subscription get() {
        State oldState;
        State newState;
        do {
            oldState = this.state;
            if (oldState.isUnsubscribed) {
                return Subscriptions.unsubscribed();
            }
            newState = oldState.addChild();
        } while (!STATE_UPDATER.compareAndSet(this, oldState, newState));
        return new InnerSubscription(this);
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
        unsubscribeActualIfApplicable(newState);
    }

    private void unsubscribeActualIfApplicable(State state) {
        if (state.isUnsubscribed && state.children == 0) {
            this.actual.unsubscribe();
        }
    }

    void unsubscribeAChild() {
        State oldState;
        State newState;
        do {
            oldState = this.state;
            newState = oldState.removeChild();
        } while (!STATE_UPDATER.compareAndSet(this, oldState, newState));
        unsubscribeActualIfApplicable(newState);
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subscriptions/RefCountSubscription$InnerSubscription.class */
    private static final class InnerSubscription implements Subscription {
        final RefCountSubscription parent;
        volatile int innerDone;
        static final AtomicIntegerFieldUpdater<InnerSubscription> INNER_DONE_UPDATER = AtomicIntegerFieldUpdater.newUpdater(InnerSubscription.class, "innerDone");

        public InnerSubscription(RefCountSubscription parent) {
            this.parent = parent;
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            if (INNER_DONE_UPDATER.compareAndSet(this, 0, 1)) {
                this.parent.unsubscribeAChild();
            }
        }

        @Override // rx.Subscription
        public boolean isUnsubscribed() {
            return this.innerDone != 0;
        }
    }
}
