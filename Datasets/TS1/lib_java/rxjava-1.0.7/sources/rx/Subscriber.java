package rx;

import rx.internal.util.SubscriptionList;

/* loaded from: rxjava-1.0.7.jar:rx/Subscriber.class */
public abstract class Subscriber<T> implements Observer<T>, Subscription {
    private final SubscriptionList cs;
    private final Subscriber<?> op;
    private Producer p;
    private long requested;

    protected Subscriber() {
        this(null, false);
    }

    protected Subscriber(Subscriber<?> op) {
        this(op, true);
    }

    protected Subscriber(Subscriber<?> op, boolean shareSubscriptions) {
        this.requested = Long.MIN_VALUE;
        this.op = op;
        this.cs = (!shareSubscriptions || op == null) ? new SubscriptionList() : op.cs;
    }

    public final void add(Subscription s) {
        this.cs.add(s);
    }

    @Override // rx.Subscription
    public final void unsubscribe() {
        this.cs.unsubscribe();
    }

    @Override // rx.Subscription
    public final boolean isUnsubscribed() {
        return this.cs.isUnsubscribed();
    }

    public void onStart() {
    }

    protected final void request(long n) {
        if (n < 0) {
            throw new IllegalArgumentException("number requested cannot be negative: " + n);
        }
        Producer shouldRequest = null;
        synchronized (this) {
            if (this.p != null) {
                shouldRequest = this.p;
            } else if (this.requested == Long.MIN_VALUE) {
                this.requested = n;
            } else {
                long total = this.requested + n;
                if (total < 0) {
                    this.requested = Long.MAX_VALUE;
                } else {
                    this.requested = total;
                }
            }
        }
        if (shouldRequest != null) {
            shouldRequest.request(n);
        }
    }

    public void setProducer(Producer producer) {
        long toRequest;
        boolean setProducer = false;
        synchronized (this) {
            toRequest = this.requested;
            this.p = producer;
            if (this.op != null && toRequest == Long.MIN_VALUE) {
                setProducer = true;
            }
        }
        if (setProducer) {
            this.op.setProducer(this.p);
        } else if (toRequest == Long.MIN_VALUE) {
            this.p.request(Long.MAX_VALUE);
        } else {
            this.p.request(toRequest);
        }
    }
}
