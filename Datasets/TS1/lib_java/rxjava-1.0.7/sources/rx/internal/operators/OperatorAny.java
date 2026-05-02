package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.functions.Func1;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorAny.class */
public final class OperatorAny<T> implements Observable.Operator<Boolean, T> {
    private final Func1<? super T, Boolean> predicate;
    private final boolean returnOnEmpty;

    public OperatorAny(Func1<? super T, Boolean> predicate, boolean returnOnEmpty) {
        this.predicate = predicate;
        this.returnOnEmpty = returnOnEmpty;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super Boolean> subscriber) {
        Subscriber<T> subscriber2 = new Subscriber<T>() { // from class: rx.internal.operators.OperatorAny.1
            boolean hasElements;
            boolean done;

            @Override // rx.Observer
            public void onNext(T t) {
                this.hasElements = true;
                boolean result = ((Boolean) OperatorAny.this.predicate.call(t)).booleanValue();
                if (result && !this.done) {
                    this.done = true;
                    subscriber.onNext(Boolean.valueOf(!OperatorAny.this.returnOnEmpty));
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
                    if (!this.hasElements) {
                        subscriber.onNext(Boolean.valueOf(OperatorAny.this.returnOnEmpty));
                    } else {
                        subscriber.onNext(false);
                    }
                    subscriber.onCompleted();
                }
            }
        };
        subscriber.add(subscriber2);
        return subscriber2;
    }
}
