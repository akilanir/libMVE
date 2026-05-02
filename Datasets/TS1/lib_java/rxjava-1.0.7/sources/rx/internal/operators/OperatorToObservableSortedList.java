package rx.internal.operators;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import rx.Observable;
import rx.Subscriber;
import rx.functions.Func2;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorToObservableSortedList.class */
public final class OperatorToObservableSortedList<T> implements Observable.Operator<List<T>, T> {
    private final Func2<? super T, ? super T, Integer> sortFunction;
    private static Func2 defaultSortFunction = new DefaultComparableFunction();

    public OperatorToObservableSortedList() {
        this.sortFunction = defaultSortFunction;
    }

    public OperatorToObservableSortedList(Func2<? super T, ? super T, Integer> sortFunction) {
        this.sortFunction = sortFunction;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super List<T>> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorToObservableSortedList.1
            final List<T> list = new ArrayList();

            @Override // rx.Subscriber
            public void onStart() {
                request(Long.MAX_VALUE);
            }

            @Override // rx.Observer
            public void onCompleted() {
                try {
                    Collections.sort(this.list, new Comparator<T>() { // from class: rx.internal.operators.OperatorToObservableSortedList.1.1
                        @Override // java.util.Comparator
                        public int compare(T o1, T o2) {
                            return ((Integer) OperatorToObservableSortedList.this.sortFunction.call(o1, o2)).intValue();
                        }
                    });
                    subscriber.onNext(Collections.unmodifiableList(this.list));
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
                this.list.add(value);
            }
        };
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorToObservableSortedList$DefaultComparableFunction.class */
    private static class DefaultComparableFunction implements Func2<Object, Object, Integer> {
        private DefaultComparableFunction() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // rx.functions.Func2
        public Integer call(Object t1, Object t2) {
            Comparable<Object> c1 = (Comparable) t1;
            Comparable<Object> c2 = (Comparable) t2;
            return Integer.valueOf(c1.compareTo(c2));
        }
    }
}
