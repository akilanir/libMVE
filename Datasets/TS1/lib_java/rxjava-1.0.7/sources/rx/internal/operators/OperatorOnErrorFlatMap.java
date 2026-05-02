package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func1;
import rx.plugins.RxJavaPlugins;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorOnErrorFlatMap.class */
public final class OperatorOnErrorFlatMap<T> implements Observable.Operator<T, T> {
    private final Func1<OnErrorThrowable, ? extends Observable<? extends T>> resumeFunction;

    public OperatorOnErrorFlatMap(Func1<OnErrorThrowable, ? extends Observable<? extends T>> f) {
        this.resumeFunction = f;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super T> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorOnErrorFlatMap.1
            @Override // rx.Observer
            public void onCompleted() {
                subscriber.onCompleted();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                try {
                    RxJavaPlugins.getInstance().getErrorHandler().handleError(e);
                    Observable<? extends T> resume = (Observable) OperatorOnErrorFlatMap.this.resumeFunction.call(OnErrorThrowable.from(e));
                    resume.unsafeSubscribe(new Subscriber<T>() { // from class: rx.internal.operators.OperatorOnErrorFlatMap.1.1
                        @Override // rx.Observer
                        public void onCompleted() {
                        }

                        @Override // rx.Observer
                        public void onError(Throwable e2) {
                            subscriber.onError(e2);
                        }

                        @Override // rx.Observer
                        public void onNext(T t) {
                            subscriber.onNext(t);
                        }
                    });
                } catch (Throwable e2) {
                    subscriber.onError(e2);
                }
            }

            @Override // rx.Observer
            public void onNext(T t) {
                subscriber.onNext(t);
            }
        };
    }
}
