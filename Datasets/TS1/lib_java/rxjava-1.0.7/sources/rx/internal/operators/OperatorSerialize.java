package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.observers.SerializedSubscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSerialize.class */
public final class OperatorSerialize<T> implements Observable.Operator<T, T> {

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSerialize$Holder.class */
    private static final class Holder {
        static final OperatorSerialize<Object> INSTANCE = new OperatorSerialize<>();

        private Holder() {
        }
    }

    public static <T> OperatorSerialize<T> instance() {
        return (OperatorSerialize<T>) Holder.INSTANCE;
    }

    private OperatorSerialize() {
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super T> s) {
        return new SerializedSubscriber(new Subscriber<T>(s) { // from class: rx.internal.operators.OperatorSerialize.1
            @Override // rx.Observer
            public void onCompleted() {
                s.onCompleted();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                s.onError(e);
            }

            @Override // rx.Observer
            public void onNext(T t) {
                s.onNext(t);
            }
        });
    }
}
