package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.functions.Func0;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeDefer.class */
public final class OnSubscribeDefer<T> implements Observable.OnSubscribe<T> {
    final Func0<? extends Observable<? extends T>> observableFactory;

    public OnSubscribeDefer(Func0<? extends Observable<? extends T>> observableFactory) {
        this.observableFactory = observableFactory;
    }

    @Override // rx.functions.Action1
    public void call(Subscriber<? super T> s) {
        try {
            Observable<? extends T> o = this.observableFactory.call();
            o.unsafeSubscribe(s);
        } catch (Throwable t) {
            s.onError(t);
        }
    }
}
