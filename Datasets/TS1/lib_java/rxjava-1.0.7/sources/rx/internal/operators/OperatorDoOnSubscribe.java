package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.functions.Action0;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorDoOnSubscribe.class */
public class OperatorDoOnSubscribe<T> implements Observable.Operator<T, T> {
    private final Action0 subscribe;

    public OperatorDoOnSubscribe(Action0 subscribe) {
        this.subscribe = subscribe;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> child) {
        this.subscribe.call();
        return child;
    }
}
