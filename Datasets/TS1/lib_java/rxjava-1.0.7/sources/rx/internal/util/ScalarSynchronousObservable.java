package rx.internal.util;

import rx.Observable;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/ScalarSynchronousObservable.class */
public final class ScalarSynchronousObservable<T> extends Observable<T> {
    private final T t;

    public static final <T> ScalarSynchronousObservable<T> create(T t) {
        return new ScalarSynchronousObservable<>(t);
    }

    protected ScalarSynchronousObservable(final T t) {
        super(new Observable.OnSubscribe<T>() { // from class: rx.internal.util.ScalarSynchronousObservable.1
            @Override // rx.functions.Action1
            public void call(Subscriber<? super T> subscriber) {
                subscriber.onNext((Object) t);
                subscriber.onCompleted();
            }
        });
        this.t = t;
    }

    public T get() {
        return this.t;
    }
}
