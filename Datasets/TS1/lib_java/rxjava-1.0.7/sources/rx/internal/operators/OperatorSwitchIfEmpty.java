package rx.internal.operators;

import java.util.concurrent.atomic.AtomicLong;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;
import rx.subscriptions.SerialSubscription;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSwitchIfEmpty.class */
public final class OperatorSwitchIfEmpty<T> implements Observable.Operator<T, T> {
    private final Observable<? extends T> alternate;

    public OperatorSwitchIfEmpty(Observable<? extends T> alternate) {
        this.alternate = alternate;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> child) {
        SerialSubscription ssub = new SerialSubscription();
        OperatorSwitchIfEmpty<T>.SwitchIfEmptySubscriber parent = new SwitchIfEmptySubscriber(child, ssub);
        ssub.set(parent);
        child.add(ssub);
        return parent;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSwitchIfEmpty$SwitchIfEmptySubscriber.class */
    private class SwitchIfEmptySubscriber extends Subscriber<T> {
        boolean empty = true;
        final AtomicLong consumerCapacity = new AtomicLong(0);
        private final Subscriber<? super T> child;
        final SerialSubscription ssub;

        public SwitchIfEmptySubscriber(Subscriber<? super T> child, SerialSubscription ssub) {
            this.child = child;
            this.ssub = ssub;
        }

        @Override // rx.Subscriber
        public void setProducer(final Producer producer) {
            super.setProducer(new Producer() { // from class: rx.internal.operators.OperatorSwitchIfEmpty.SwitchIfEmptySubscriber.1
                @Override // rx.Producer
                public void request(long n) {
                    if (SwitchIfEmptySubscriber.this.empty) {
                        SwitchIfEmptySubscriber.this.consumerCapacity.set(n);
                    }
                    producer.request(n);
                }
            });
        }

        @Override // rx.Observer
        public void onCompleted() {
            if (!this.empty) {
                this.child.onCompleted();
            } else if (!this.child.isUnsubscribed()) {
                subscribeToAlternate();
            }
        }

        private void subscribeToAlternate() {
            this.ssub.set(OperatorSwitchIfEmpty.this.alternate.unsafeSubscribe(new Subscriber<T>() { // from class: rx.internal.operators.OperatorSwitchIfEmpty.SwitchIfEmptySubscriber.2
                @Override // rx.Subscriber
                public void setProducer(final Producer producer) {
                    SwitchIfEmptySubscriber.this.child.setProducer(new Producer() { // from class: rx.internal.operators.OperatorSwitchIfEmpty.SwitchIfEmptySubscriber.2.1
                        @Override // rx.Producer
                        public void request(long n) {
                            producer.request(n);
                        }
                    });
                }

                @Override // rx.Subscriber
                public void onStart() {
                    long capacity = SwitchIfEmptySubscriber.this.consumerCapacity.get();
                    if (capacity > 0) {
                        request(capacity);
                    }
                }

                @Override // rx.Observer
                public void onCompleted() {
                    SwitchIfEmptySubscriber.this.child.onCompleted();
                }

                @Override // rx.Observer
                public void onError(Throwable e) {
                    SwitchIfEmptySubscriber.this.child.onError(e);
                }

                @Override // rx.Observer
                public void onNext(T t) {
                    SwitchIfEmptySubscriber.this.child.onNext(t);
                }
            }));
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.child.onError(e);
        }

        @Override // rx.Observer
        public void onNext(T t) {
            this.empty = false;
            this.child.onNext(t);
        }
    }
}
