package rx.internal.util;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Subscription;
import rx.functions.Func1;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/SubscriptionIndexedRingBuffer.class */
public final class SubscriptionIndexedRingBuffer<T extends Subscription> implements Subscription {
    private volatile IndexedRingBuffer<T> subscriptions = IndexedRingBuffer.getInstance();
    private volatile int unsubscribed = 0;
    private static final AtomicIntegerFieldUpdater<SubscriptionIndexedRingBuffer> UNSUBSCRIBED = AtomicIntegerFieldUpdater.newUpdater(SubscriptionIndexedRingBuffer.class, "unsubscribed");
    private static final Func1<Subscription, Boolean> UNSUBSCRIBE = new Func1<Subscription, Boolean>() { // from class: rx.internal.util.SubscriptionIndexedRingBuffer.1
        @Override // rx.functions.Func1
        public Boolean call(Subscription s) {
            s.unsubscribe();
            return Boolean.TRUE;
        }
    };

    public SubscriptionIndexedRingBuffer() {
    }

    public SubscriptionIndexedRingBuffer(T... subscriptions) {
        for (T t : subscriptions) {
            this.subscriptions.add(t);
        }
    }

    @Override // rx.Subscription
    public boolean isUnsubscribed() {
        return this.unsubscribed == 1;
    }

    public synchronized int add(T s) {
        if (this.unsubscribed == 1 || this.subscriptions == null) {
            s.unsubscribe();
            return -1;
        }
        int n = this.subscriptions.add(s);
        if (this.unsubscribed == 1) {
            s.unsubscribe();
        }
        return n;
    }

    public void remove(int n) {
        Subscription t;
        if (this.unsubscribed != 1 && this.subscriptions != null && n >= 0 && (t = this.subscriptions.remove(n)) != null && t != null) {
            t.unsubscribe();
        }
    }

    public void removeSilently(int n) {
        if (this.unsubscribed == 1 || this.subscriptions == null || n < 0) {
            return;
        }
        this.subscriptions.remove(n);
    }

    @Override // rx.Subscription
    public void unsubscribe() {
        if (UNSUBSCRIBED.compareAndSet(this, 0, 1) && this.subscriptions != null) {
            unsubscribeFromAll(this.subscriptions);
            IndexedRingBuffer<T> s = this.subscriptions;
            this.subscriptions = null;
            s.unsubscribe();
        }
    }

    public int forEach(Func1<T, Boolean> action) {
        return forEach(action, 0);
    }

    public synchronized int forEach(Func1<T, Boolean> action, int startIndex) {
        if (this.unsubscribed == 1 || this.subscriptions == null) {
            return 0;
        }
        return this.subscriptions.forEach(action, startIndex);
    }

    private static void unsubscribeFromAll(IndexedRingBuffer<? extends Subscription> subscriptions) {
        if (subscriptions == null) {
            return;
        }
        subscriptions.forEach(UNSUBSCRIBE);
    }
}
