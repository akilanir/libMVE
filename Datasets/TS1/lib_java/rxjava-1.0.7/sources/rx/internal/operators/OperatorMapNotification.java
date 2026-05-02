package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func0;
import rx.functions.Func1;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMapNotification.class */
public final class OperatorMapNotification<T, R> implements Observable.Operator<R, T> {
    private final Func1<? super T, ? extends R> onNext;
    private final Func1<? super Throwable, ? extends R> onError;
    private final Func0<? extends R> onCompleted;

    public OperatorMapNotification(Func1<? super T, ? extends R> onNext, Func1<? super Throwable, ? extends R> onError, Func0<? extends R> onCompleted) {
        this.onNext = onNext;
        this.onError = onError;
        this.onCompleted = onCompleted;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super R> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorMapNotification.1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // rx.Observer
            public void onCompleted() {
                try {
                    subscriber.onNext(OperatorMapNotification.this.onCompleted.call());
                    subscriber.onCompleted();
                } catch (Throwable e) {
                    subscriber.onError(e);
                }
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // rx.Observer
            public void onError(Throwable e) {
                try {
                    subscriber.onNext(OperatorMapNotification.this.onError.call(e));
                    subscriber.onCompleted();
                } catch (Throwable th) {
                    subscriber.onError(e);
                }
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // rx.Observer
            public void onNext(T t) {
                try {
                    subscriber.onNext(OperatorMapNotification.this.onNext.call(t));
                } catch (Throwable e) {
                    subscriber.onError(OnErrorThrowable.addValueAsLastCause(e, t));
                }
            }
        };
    }
}
