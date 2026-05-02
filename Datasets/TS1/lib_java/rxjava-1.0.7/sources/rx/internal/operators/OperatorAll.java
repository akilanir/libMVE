package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.functions.Func1;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorAll.class */
public final class OperatorAll<T> implements Observable.Operator<Boolean, T> {
    private final Func1<? super T, Boolean> predicate;

    public OperatorAll(Func1<? super T, Boolean> predicate) {
        this.predicate = predicate;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super Boolean> subscriber) {
        Subscriber<T> subscriber2 = new Subscriber<T>() { // from class: rx.internal.operators.OperatorAll.1
            boolean done;

            @Override // rx.Observer
            public void onNext(T t) {
                boolean result = ((Boolean) OperatorAll.this.predicate.call(t)).booleanValue();
                if (!result && !this.done) {
                    this.done = true;
                    subscriber.onNext(false);
                    subscriber.onCompleted();
                    unsubscribe();
                    return;
                }
                request(1L);
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                subscriber.onError(e);
            }

            @Override // rx.Observer
            public void onCompleted() {
                if (!this.done) {
                    this.done = true;
                    subscriber.onNext(true);
                    subscriber.onCompleted();
                }
            }
        };
        subscriber.add(subscriber2);
        return subscriber2;
    }
}
