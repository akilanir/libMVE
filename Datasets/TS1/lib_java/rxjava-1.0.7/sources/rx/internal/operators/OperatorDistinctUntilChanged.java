package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.functions.Func1;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorDistinctUntilChanged.class */
public final class OperatorDistinctUntilChanged<T, U> implements Observable.Operator<T, T> {
    final Func1<? super T, ? extends U> keySelector;

    public OperatorDistinctUntilChanged(Func1<? super T, ? extends U> keySelector) {
        this.keySelector = keySelector;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super T> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorDistinctUntilChanged.1
            U previousKey;
            boolean hasPrevious;

            @Override // rx.Observer
            public void onNext(T t) {
                U currentKey = this.previousKey;
                U key = OperatorDistinctUntilChanged.this.keySelector.call(t);
                this.previousKey = key;
                if (this.hasPrevious) {
                    if (currentKey != key && (key == null || !key.equals(currentKey))) {
                        subscriber.onNext(t);
                        return;
                    } else {
                        request(1L);
                        return;
                    }
                }
                this.hasPrevious = true;
                subscriber.onNext(t);
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                subscriber.onError(e);
            }

            @Override // rx.Observer
            public void onCompleted() {
                subscriber.onCompleted();
            }
        };
    }
}
