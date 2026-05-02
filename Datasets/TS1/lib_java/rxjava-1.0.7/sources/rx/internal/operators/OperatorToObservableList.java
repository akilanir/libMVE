package rx.internal.operators;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import rx.Observable;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorToObservableList.class */
public final class OperatorToObservableList<T> implements Observable.Operator<List<T>, T> {

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorToObservableList$Holder.class */
    private static final class Holder {
        static final OperatorToObservableList<Object> INSTANCE = new OperatorToObservableList<>();

        private Holder() {
        }
    }

    public static <T> OperatorToObservableList<T> instance() {
        return (OperatorToObservableList<T>) Holder.INSTANCE;
    }

    private OperatorToObservableList() {
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super List<T>> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorToObservableList.1
            private boolean completed = false;
            final List<T> list = new LinkedList();

            @Override // rx.Subscriber
            public void onStart() {
                request(Long.MAX_VALUE);
            }

            @Override // rx.Observer
            public void onCompleted() {
                try {
                    this.completed = true;
                    subscriber.onNext(new ArrayList(this.list));
                    subscriber.onCompleted();
                } catch (Throwable e) {
                    onError(e);
                }
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                subscriber.onError(e);
            }

            @Override // rx.Observer
            public void onNext(T value) {
                if (!this.completed) {
                    this.list.add(value);
                }
            }
        };
    }
}
