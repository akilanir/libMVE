package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorElementAt.class */
public final class OperatorElementAt<T> implements Observable.Operator<T, T> {
    private final int index;
    private final boolean hasDefault;
    private final T defaultValue;

    public OperatorElementAt(int index) {
        this(index, null, false);
    }

    public OperatorElementAt(int index, T defaultValue) {
        this(index, defaultValue, true);
    }

    private OperatorElementAt(int index, T defaultValue, boolean hasDefault) {
        if (index < 0) {
            throw new IndexOutOfBoundsException(index + " is out of bounds");
        }
        this.index = index;
        this.defaultValue = defaultValue;
        this.hasDefault = hasDefault;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super T> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorElementAt.1
            private int currentIndex = 0;

            @Override // rx.Observer
            public void onNext(T value) {
                if (this.currentIndex == OperatorElementAt.this.index) {
                    subscriber.onNext(value);
                    subscriber.onCompleted();
                } else {
                    request(1L);
                }
                this.currentIndex++;
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                subscriber.onError(e);
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // rx.Observer
            public void onCompleted() {
                if (this.currentIndex <= OperatorElementAt.this.index) {
                    if (OperatorElementAt.this.hasDefault) {
                        subscriber.onNext(OperatorElementAt.this.defaultValue);
                        subscriber.onCompleted();
                    } else {
                        subscriber.onError(new IndexOutOfBoundsException(OperatorElementAt.this.index + " is out of bounds"));
                    }
                }
            }
        };
    }
}
