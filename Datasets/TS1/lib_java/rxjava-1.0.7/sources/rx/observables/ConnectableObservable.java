package rx.observables;

import rx.Observable;
import rx.Subscription;
import rx.functions.Action1;
import rx.internal.operators.OnSubscribeRefCount;

/* loaded from: rxjava-1.0.7.jar:rx/observables/ConnectableObservable.class */
public abstract class ConnectableObservable<T> extends Observable<T> {
    public abstract void connect(Action1<? super Subscription> action1);

    protected ConnectableObservable(Observable.OnSubscribe<T> onSubscribe) {
        super(onSubscribe);
    }

    public final Subscription connect() {
        final Subscription[] out = new Subscription[1];
        connect(new Action1<Subscription>() { // from class: rx.observables.ConnectableObservable.1
            @Override // rx.functions.Action1
            public void call(Subscription t1) {
                out[0] = t1;
            }
        });
        return out[0];
    }

    public Observable<T> refCount() {
        return create(new OnSubscribeRefCount(this));
    }
}
