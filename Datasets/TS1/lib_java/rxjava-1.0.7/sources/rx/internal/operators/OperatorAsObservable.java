package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorAsObservable.class */
public final class OperatorAsObservable<T> implements Observable.Operator<T, T> {

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorAsObservable$Holder.class */
    private static final class Holder {
        static final OperatorAsObservable<Object> INSTANCE = new OperatorAsObservable<>();

        private Holder() {
        }
    }

    public static <T> OperatorAsObservable<T> instance() {
        return (OperatorAsObservable<T>) Holder.INSTANCE;
    }

    private OperatorAsObservable() {
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> s) {
        return s;
    }
}
