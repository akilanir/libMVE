package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.observers.SerializedSubscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorTakeUntil.class */
public final class OperatorTakeUntil<T, E> implements Observable.Operator<T, T> {
    private final Observable<? extends E> other;

    public OperatorTakeUntil(Observable<? extends E> other) {
        this.other = other;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> subscriber) {
        final SerializedSubscriber serializedSubscriber = new SerializedSubscriber(subscriber);
        this.other.unsafeSubscribe(new Subscriber<E>(subscriber) { // from class: rx.internal.operators.OperatorTakeUntil.1
            @Override // rx.Observer
            public void onCompleted() {
                serializedSubscriber.onCompleted();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                serializedSubscriber.onError(e);
            }

            @Override // rx.Observer
            public void onNext(E t) {
                serializedSubscriber.onCompleted();
            }
        });
        return serializedSubscriber;
    }
}
