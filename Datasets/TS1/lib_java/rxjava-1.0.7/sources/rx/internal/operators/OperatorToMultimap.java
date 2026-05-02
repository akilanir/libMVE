package rx.internal.operators;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import rx.Observable;
import rx.Subscriber;
import rx.functions.Func0;
import rx.functions.Func1;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorToMultimap.class */
public final class OperatorToMultimap<T, K, V> implements Observable.Operator<Map<K, Collection<V>>, T> {
    private final Func1<? super T, ? extends K> keySelector;
    private final Func1<? super T, ? extends V> valueSelector;
    private final Func0<? extends Map<K, Collection<V>>> mapFactory;
    private final Func1<? super K, ? extends Collection<V>> collectionFactory;

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorToMultimap$DefaultToMultimapFactory.class */
    public static final class DefaultToMultimapFactory<K, V> implements Func0<Map<K, Collection<V>>> {
        @Override // rx.functions.Func0, java.util.concurrent.Callable
        public Map<K, Collection<V>> call() {
            return new HashMap();
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorToMultimap$DefaultMultimapCollectionFactory.class */
    public static final class DefaultMultimapCollectionFactory<K, V> implements Func1<K, Collection<V>> {
        /* JADX WARN: Multi-variable type inference failed */
        @Override // rx.functions.Func1
        public /* bridge */ /* synthetic */ Object call(Object obj) {
            return call((DefaultMultimapCollectionFactory<K, V>) obj);
        }

        @Override // rx.functions.Func1
        public Collection<V> call(K t1) {
            return new ArrayList();
        }
    }

    public OperatorToMultimap(Func1<? super T, ? extends K> keySelector, Func1<? super T, ? extends V> valueSelector) {
        this(keySelector, valueSelector, new DefaultToMultimapFactory(), new DefaultMultimapCollectionFactory());
    }

    public OperatorToMultimap(Func1<? super T, ? extends K> keySelector, Func1<? super T, ? extends V> valueSelector, Func0<? extends Map<K, Collection<V>>> mapFactory) {
        this(keySelector, valueSelector, mapFactory, new DefaultMultimapCollectionFactory());
    }

    public OperatorToMultimap(Func1<? super T, ? extends K> keySelector, Func1<? super T, ? extends V> valueSelector, Func0<? extends Map<K, Collection<V>>> mapFactory, Func1<? super K, ? extends Collection<V>> collectionFactory) {
        this.keySelector = keySelector;
        this.valueSelector = valueSelector;
        this.mapFactory = mapFactory;
        this.collectionFactory = collectionFactory;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(final Subscriber<? super Map<K, Collection<V>>> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.internal.operators.OperatorToMultimap.1
            private Map<K, Collection<V>> map;

            {
                this.map = (Map) OperatorToMultimap.this.mapFactory.call();
            }

            @Override // rx.Subscriber
            public void onStart() {
                request(Long.MAX_VALUE);
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // rx.Observer
            public void onNext(T t) {
                Object call = OperatorToMultimap.this.keySelector.call(t);
                Object call2 = OperatorToMultimap.this.valueSelector.call(t);
                Collection<V> collection = this.map.get(call);
                if (collection == null) {
                    collection = (Collection) OperatorToMultimap.this.collectionFactory.call(call);
                    this.map.put(call, collection);
                }
                collection.add(call2);
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                this.map = null;
                subscriber.onError(e);
            }

            @Override // rx.Observer
            public void onCompleted() {
                Map<K, Collection<V>> map0 = this.map;
                this.map = null;
                subscriber.onNext(map0);
                subscriber.onCompleted();
            }
        };
    }
}
