package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.functions.Action0;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorFinally.class */
public final class OperatorFinally<T> implements Observable.Operator<T, T> {
    final Action0 action;

    public OperatorFinally(Action0 action) {
        this.action = action;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super T> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorFinally.1
            @Override // rx.Observer
            public void onNext(T t) {
                subscriber.onNext(t);
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                try {
                    subscriber.onError(e);
                    OperatorFinally.this.action.call();
                } catch (Throwable th) {
                    OperatorFinally.this.action.call();
                    throw th;
                }
            }

            @Override // rx.Observer
            public void onCompleted() {
                try {
                    subscriber.onCompleted();
                    OperatorFinally.this.action.call();
                } catch (Throwable th) {
                    OperatorFinally.this.action.call();
                    throw th;
                }
            }
        };
    }
}
