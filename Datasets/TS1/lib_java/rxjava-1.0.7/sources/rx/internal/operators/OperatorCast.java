package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.exceptions.OnErrorThrowable;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorCast.class */
public class OperatorCast<T, R> implements Observable.Operator<R, T> {
    private final Class<R> castClass;

    public OperatorCast(Class<R> castClass) {
        this.castClass = castClass;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super R> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorCast.1
            @Override // rx.Observer
            public void onCompleted() {
                subscriber.onCompleted();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                subscriber.onError(e);
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // rx.Observer
            public void onNext(T t) {
                try {
                    subscriber.onNext(OperatorCast.this.castClass.cast(t));
                } catch (Throwable e) {
                    onError(OnErrorThrowable.addValueAsLastCause(e, t));
                }
            }
        };
    }
}
