package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.functions.Func1;
import rx.observers.SerializedSubscriber;
import rx.subjects.PublishSubject;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorDelayWithSelector.class */
public final class OperatorDelayWithSelector<T, V> implements Observable.Operator<T, T> {
    final Observable<? extends T> source;
    final Func1<? super T, ? extends Observable<V>> itemDelay;

    public OperatorDelayWithSelector(Observable<? extends T> source, Func1<? super T, ? extends Observable<V>> itemDelay) {
        this.source = source;
        this.itemDelay = itemDelay;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super T> subscriber) {
        final SerializedSubscriber serializedSubscriber = new SerializedSubscriber(subscriber);
        final PublishSubject create = PublishSubject.create();
        subscriber.add(Observable.merge(create).unsafeSubscribe(new Subscriber<T>() { // from class: rx.internal.operators.OperatorDelayWithSelector.1
            @Override // rx.Observer
            public void onCompleted() {
                serializedSubscriber.onCompleted();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                serializedSubscriber.onError(e);
            }

            @Override // rx.Observer
            public void onNext(T t) {
                serializedSubscriber.onNext(t);
            }
        }));
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorDelayWithSelector.2
            @Override // rx.Observer
            public void onCompleted() {
                create.onCompleted();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                serializedSubscriber.onError(e);
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // rx.Observer
            public void onNext(final T t) {
                try {
                    create.onNext(OperatorDelayWithSelector.this.itemDelay.call(t).take(1).defaultIfEmpty(null).map(new Func1<V, T>() { // from class: rx.internal.operators.OperatorDelayWithSelector.2.1
                        @Override // rx.functions.Func1
                        public T call(V v) {
                            return (T) t;
                        }
                    }));
                } catch (Throwable th) {
                    onError(th);
                }
            }
        };
    }
}
