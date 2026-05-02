package rx.internal.operators;

import java.util.concurrent.atomic.AtomicLong;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorOnBackpressureDrop.class */
public class OperatorOnBackpressureDrop<T> implements Observable.Operator<T, T> {

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorOnBackpressureDrop$Holder.class */
    private static final class Holder {
        static final OperatorOnBackpressureDrop<Object> INSTANCE = new OperatorOnBackpressureDrop<>();

        private Holder() {
        }
    }

    public static <T> OperatorOnBackpressureDrop<T> instance() {
        return (OperatorOnBackpressureDrop<T>) Holder.INSTANCE;
    }

    private OperatorOnBackpressureDrop() {
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super T> subscriber) {
        final AtomicLong atomicLong = new AtomicLong();
        subscriber.setProducer(new Producer() { // from class: rx.internal.operators.OperatorOnBackpressureDrop.1
            @Override // rx.Producer
            public void request(long n) {
                atomicLong.getAndAdd(n);
            }
        });
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorOnBackpressureDrop.2
            @Override // rx.Subscriber
            public void onStart() {
                request(Long.MAX_VALUE);
            }

            @Override // rx.Observer
            public void onCompleted() {
                subscriber.onCompleted();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                subscriber.onError(e);
            }

            @Override // rx.Observer
            public void onNext(T t) {
                if (atomicLong.get() > 0) {
                    subscriber.onNext(t);
                    atomicLong.decrementAndGet();
                }
            }
        };
    }
}
