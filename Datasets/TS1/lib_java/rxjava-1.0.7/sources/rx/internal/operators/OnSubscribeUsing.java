package rx.internal.operators;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.exceptions.CompositeException;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.functions.Func0;
import rx.functions.Func1;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeUsing.class */
public final class OnSubscribeUsing<T, Resource> implements Observable.OnSubscribe<T> {
    private final Func0<Resource> resourceFactory;
    private final Func1<? super Resource, ? extends Observable<? extends T>> observableFactory;
    private final Action1<? super Resource> dispose;
    private final boolean disposeEagerly;

    public OnSubscribeUsing(Func0<Resource> resourceFactory, Func1<? super Resource, ? extends Observable<? extends T>> observableFactory, Action1<? super Resource> dispose, boolean disposeEagerly) {
        this.resourceFactory = resourceFactory;
        this.observableFactory = observableFactory;
        this.dispose = dispose;
        this.disposeEagerly = disposeEagerly;
    }

    @Override // rx.functions.Action1
    public void call(Subscriber<? super T> subscriber) {
        Observable<? extends T> observable;
        try {
            Resource resource = this.resourceFactory.call();
            DisposeAction<Resource> disposeOnceOnly = new DisposeAction<>(this.dispose, resource);
            subscriber.add(disposeOnceOnly);
            Observable<? extends T> source = this.observableFactory.call(resource);
            if (this.disposeEagerly) {
                observable = source.doOnTerminate(disposeOnceOnly);
            } else {
                observable = source;
            }
            try {
                observable.unsafeSubscribe(subscriber);
            } catch (Throwable e) {
                Throwable disposeError = disposeEagerlyIfRequested(disposeOnceOnly);
                if (disposeError != null) {
                    subscriber.onError(new CompositeException(Arrays.asList(e, disposeError)));
                } else {
                    subscriber.onError(e);
                }
            }
        } catch (Throwable e2) {
            subscriber.onError(e2);
        }
    }

    private Throwable disposeEagerlyIfRequested(Action0 disposeOnceOnly) {
        if (this.disposeEagerly) {
            try {
                disposeOnceOnly.call();
                return null;
            } catch (Throwable e) {
                return e;
            }
        }
        return null;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeUsing$DisposeAction.class */
    private static final class DisposeAction<Resource> extends AtomicBoolean implements Action0, Subscription {
        private static final long serialVersionUID = 4262875056400218316L;
        private Action1<? super Resource> dispose;
        private Resource resource;

        private DisposeAction(Action1<? super Resource> dispose, Resource resource) {
            this.dispose = dispose;
            this.resource = resource;
            lazySet(false);
        }

        @Override // rx.functions.Action0
        public void call() {
            if (compareAndSet(false, true)) {
                try {
                    this.dispose.call(this.resource);
                    this.resource = null;
                    this.dispose = null;
                } catch (Throwable th) {
                    this.resource = null;
                    this.dispose = null;
                    throw th;
                }
            }
        }

        @Override // rx.Subscription
        public boolean isUnsubscribed() {
            return get();
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            call();
        }
    }
}
