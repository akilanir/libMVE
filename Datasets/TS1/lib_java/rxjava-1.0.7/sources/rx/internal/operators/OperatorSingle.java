package rx.internal.operators;

import java.util.NoSuchElementException;
import rx.Observable;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSingle.class */
public final class OperatorSingle<T> implements Observable.Operator<T, T> {
    private final boolean hasDefaultValue;
    private final T defaultValue;

    public OperatorSingle() {
        this(false, null);
    }

    public OperatorSingle(T defaultValue) {
        this(true, defaultValue);
    }

    private OperatorSingle(boolean hasDefaultValue, T defaultValue) {
        this.hasDefaultValue = hasDefaultValue;
        this.defaultValue = defaultValue;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super T> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorSingle.1
            private T value;
            private boolean isNonEmpty = false;
            private boolean hasTooManyElements = false;

            @Override // rx.Observer
            public void onNext(T value) {
                if (this.isNonEmpty) {
                    this.hasTooManyElements = true;
                    subscriber.onError(new IllegalArgumentException("Sequence contains too many elements"));
                    unsubscribe();
                } else {
                    this.value = value;
                    this.isNonEmpty = true;
                    request(1L);
                }
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // rx.Observer
            public void onCompleted() {
                if (!this.hasTooManyElements) {
                    if (!this.isNonEmpty) {
                        if (OperatorSingle.this.hasDefaultValue) {
                            subscriber.onNext(OperatorSingle.this.defaultValue);
                            subscriber.onCompleted();
                            return;
                        } else {
                            subscriber.onError(new NoSuchElementException("Sequence contains no elements"));
                            return;
                        }
                    }
                    subscriber.onNext(this.value);
                    subscriber.onCompleted();
                }
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                subscriber.onError(e);
            }
        };
    }
}
