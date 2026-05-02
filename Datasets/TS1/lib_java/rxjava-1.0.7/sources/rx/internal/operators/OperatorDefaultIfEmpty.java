package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorDefaultIfEmpty.class */
public class OperatorDefaultIfEmpty<T> implements Observable.Operator<T, T> {
    final T defaultValue;

    public OperatorDefaultIfEmpty(T defaultValue) {
        this.defaultValue = defaultValue;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super T> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorDefaultIfEmpty.1
            boolean hasValue;

            @Override // rx.Observer
            public void onNext(T t) {
                this.hasValue = true;
                subscriber.onNext(t);
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                subscriber.onError(e);
            }

            @Override // rx.Observer
            public void onCompleted() {
                if (!this.hasValue) {
                    try {
                        subscriber.onNext(OperatorDefaultIfEmpty.this.defaultValue);
                    } catch (Throwable e) {
                        subscriber.onError(e);
                        return;
                    }
                }
                subscriber.onCompleted();
            }
        };
    }
}
