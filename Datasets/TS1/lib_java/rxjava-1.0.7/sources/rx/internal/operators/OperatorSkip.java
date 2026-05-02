package rx.internal.operators;

import rx.Observable;
import rx.Producer;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSkip.class */
public final class OperatorSkip<T> implements Observable.Operator<T, T> {
    final int toSkip;

    public OperatorSkip(int n) {
        this.toSkip = n;
    }

    /* renamed from: rx.internal.operators.OperatorSkip$1, reason: invalid class name */
    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSkip$1.class */
    class AnonymousClass1 extends Subscriber<T> {
        int skipped;
        final /* synthetic */ Subscriber val$child;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass1(Subscriber subscriber, Subscriber subscriber2) {
            super(subscriber);
            this.val$child = subscriber2;
            this.skipped = 0;
        }

        @Override // rx.Observer
        public void onCompleted() {
            this.val$child.onCompleted();
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.val$child.onError(e);
        }

        @Override // rx.Observer
        public void onNext(T t) {
            if (this.skipped >= OperatorSkip.this.toSkip) {
                this.val$child.onNext(t);
            } else {
                this.skipped++;
            }
        }

        @Override // rx.Subscriber
        public void setProducer(final Producer producer) {
            this.val$child.setProducer(new Producer() { // from class: rx.internal.operators.OperatorSkip.1.1
                @Override // rx.Producer
                public void request(long n) {
                    if (n == Long.MAX_VALUE) {
                        producer.request(n);
                    } else if (n > 0) {
                        producer.request(n + (OperatorSkip.this.toSkip - AnonymousClass1.this.skipped));
                    }
                }
            });
        }
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> child) {
        return new AnonymousClass1(child, child);
    }
}
