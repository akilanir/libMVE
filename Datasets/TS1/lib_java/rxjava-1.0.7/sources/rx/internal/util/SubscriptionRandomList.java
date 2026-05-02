package rx.internal.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import rx.Subscription;
import rx.exceptions.Exceptions;
import rx.functions.Action1;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/SubscriptionRandomList.class */
public final class SubscriptionRandomList<T extends Subscription> implements Subscription {
    private Set<T> subscriptions;
    private boolean unsubscribed = false;

    public SubscriptionRandomList() {
    }

    public SubscriptionRandomList(T... subscriptions) {
        this.subscriptions = new HashSet(Arrays.asList(subscriptions));
    }

    @Override // rx.Subscription
    public synchronized boolean isUnsubscribed() {
        return this.unsubscribed;
    }

    public void add(T s) {
        Subscription unsubscribe = null;
        synchronized (this) {
            if (this.unsubscribed) {
                unsubscribe = s;
            } else {
                if (this.subscriptions == null) {
                    this.subscriptions = new HashSet(4);
                }
                this.subscriptions.add(s);
            }
        }
        if (unsubscribe != null) {
            unsubscribe.unsubscribe();
        }
    }

    public void remove(Subscription s) {
        synchronized (this) {
            if (this.unsubscribed || this.subscriptions == null) {
                return;
            }
            boolean unsubscribe = this.subscriptions.remove(s);
            if (unsubscribe) {
                s.unsubscribe();
            }
        }
    }

    public void clear() {
        synchronized (this) {
            if (this.unsubscribed || this.subscriptions == null) {
                return;
            }
            Collection<T> unsubscribe = this.subscriptions;
            this.subscriptions = null;
            unsubscribeFromAll(unsubscribe);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void forEach(Action1<T> action1) {
        synchronized (this) {
            if (this.unsubscribed || this.subscriptions == null) {
                return;
            }
            for (Subscription subscription : (Subscription[]) this.subscriptions.toArray((Object[]) null)) {
                action1.call(subscription);
            }
        }
    }

    @Override // rx.Subscription
    public void unsubscribe() {
        synchronized (this) {
            if (this.unsubscribed) {
                return;
            }
            this.unsubscribed = true;
            Collection<T> unsubscribe = this.subscriptions;
            this.subscriptions = null;
            unsubscribeFromAll(unsubscribe);
        }
    }

    private static <T extends Subscription> void unsubscribeFromAll(Collection<T> subscriptions) {
        if (subscriptions == null) {
            return;
        }
        List<Throwable> es = null;
        for (T s : subscriptions) {
            try {
                s.unsubscribe();
            } catch (Throwable e) {
                if (es == null) {
                    es = new ArrayList<>();
                }
                es.add(e);
            }
        }
        Exceptions.throwIfAny(es);
    }
}
