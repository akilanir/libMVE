package rx.internal.operators;

import rx.Observable;
import rx.Observer;
import rx.Subscriber;
import rx.exceptions.Exceptions;
import rx.exceptions.OnErrorThrowable;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorDoOnEach.class */
public class OperatorDoOnEach<T> implements Observable.Operator<T, T> {
    private final Observer<? super T> doOnEachObserver;

    public OperatorDoOnEach(Observer<? super T> doOnEachObserver) {
        this.doOnEachObserver = doOnEachObserver;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super T> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorDoOnEach.1
            private boolean done = false;

            @Override // rx.Observer
            public void onCompleted() {
                if (!this.done) {
                    try {
                        OperatorDoOnEach.this.doOnEachObserver.onCompleted();
                        this.done = true;
                        subscriber.onCompleted();
                    } catch (Throwable e) {
                        onError(e);
                    }
                }
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                Exceptions.throwIfFatal(e);
                if (this.done) {
                    return;
                }
                this.done = true;
                try {
                    OperatorDoOnEach.this.doOnEachObserver.onError(e);
                    subscriber.onError(e);
                } catch (Throwable e2) {
                    subscriber.onError(e2);
                }
            }

            @Override // rx.Observer
            public void onNext(T value) {
                if (!this.done) {
                    try {
                        OperatorDoOnEach.this.doOnEachObserver.onNext(value);
                        subscriber.onNext(value);
                    } catch (Throwable e) {
                        onError(OnErrorThrowable.addValueAsLastCause(e, value));
                    }
                }
            }
        };
    }
}
