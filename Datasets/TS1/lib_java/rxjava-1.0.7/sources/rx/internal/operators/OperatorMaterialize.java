package rx.internal.operators;

import rx.Notification;
import rx.Observable;
import rx.Subscriber;
import rx.plugins.RxJavaPlugins;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMaterialize.class */
public final class OperatorMaterialize<T> implements Observable.Operator<Notification<T>, T> {

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMaterialize$Holder.class */
    private static final class Holder {
        static final OperatorMaterialize<Object> INSTANCE = new OperatorMaterialize<>();

        private Holder() {
        }
    }

    public static <T> OperatorMaterialize<T> instance() {
        return (OperatorMaterialize<T>) Holder.INSTANCE;
    }

    private OperatorMaterialize() {
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super Notification<T>> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorMaterialize.1
            @Override // rx.Observer
            public void onCompleted() {
                subscriber.onNext(Notification.createOnCompleted());
                subscriber.onCompleted();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                RxJavaPlugins.getInstance().getErrorHandler().handleError(e);
                subscriber.onNext(Notification.createOnError(e));
                subscriber.onCompleted();
            }

            @Override // rx.Observer
            public void onNext(T t) {
                subscriber.onNext(Notification.createOnNext(t));
            }
        };
    }
}
