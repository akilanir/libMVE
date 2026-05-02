package rx.internal.operators;

import rx.Observable;
import rx.Producer;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorTake.class */
public final class OperatorTake<T> implements Observable.Operator<T, T> {
    final int limit;

    public OperatorTake(int limit) {
        this.limit = limit;
    }

    /* renamed from: rx.internal.operators.OperatorTake$1, reason: invalid class name */
    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorTake$1.class */
    class AnonymousClass1 extends Subscriber<T> {
        int count = 0;
        boolean completed = false;
        final /* synthetic */ Subscriber val$child;

        AnonymousClass1(Subscriber subscriber) {
            this.val$child = subscriber;
        }

        @Override // rx.Observer
        public void onCompleted() {
            if (!this.completed) {
                this.val$child.onCompleted();
            }
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            if (!this.completed) {
                this.val$child.onError(e);
            }
        }

        @Override // rx.Observer
        public void onNext(T i) {
            if (!isUnsubscribed()) {
                int i2 = this.count + 1;
                this.count = i2;
                if (i2 >= OperatorTake.this.limit) {
                    this.completed = true;
                }
                this.val$child.onNext(i);
                if (this.completed) {
                    this.val$child.onCompleted();
                    unsubscribe();
                }
            }
        }

        @Override // rx.Subscriber
        public void setProducer(final Producer producer) {
            this.val$child.setProducer(new Producer() { // from class: rx.internal.operators.OperatorTake.1.1
                @Override // rx.Producer
                public void request(long n) {
                    if (!AnonymousClass1.this.completed) {
                        long c = OperatorTake.this.limit - AnonymousClass1.this.count;
                        if (n < c) {
                            producer.request(n);
                        } else {
                            producer.request(c);
                        }
                    }
                }
            });
        }
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> child) {
        AnonymousClass1 anonymousClass1 = new AnonymousClass1(child);
        if (this.limit == 0) {
            child.onCompleted();
            anonymousClass1.unsubscribe();
        }
        child.add(anonymousClass1);
        return anonymousClass1;
    }
}
