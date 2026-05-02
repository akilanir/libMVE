package rx.android.operators;

import android.view.View;
import android.widget.AdapterView;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.android.events.OnItemClickEvent;
import rx.android.observables.Assertions;
import rx.android.subscriptions.AndroidSubscriptions;
import rx.functions.Action0;

/* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorAdapterViewOnItemClick.class */
public class OperatorAdapterViewOnItemClick implements Observable.OnSubscribe<OnItemClickEvent> {
    private final AdapterView<?> adapterView;

    public OperatorAdapterViewOnItemClick(AdapterView<?> adapterView) {
        this.adapterView = adapterView;
    }

    public void call(final Subscriber<? super OnItemClickEvent> observer) {
        Assertions.assertUiThread();
        final CompositeOnClickListener composite = CachedListeners.getFromViewOrCreate(this.adapterView);
        final AdapterView.OnItemClickListener listener = new AdapterView.OnItemClickListener() { // from class: rx.android.operators.OperatorAdapterViewOnItemClick.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                observer.onNext(new OnItemClickEvent(parent, view, position, id));
            }
        };
        Subscription subscription = AndroidSubscriptions.unsubscribeInUiThread(new Action0() { // from class: rx.android.operators.OperatorAdapterViewOnItemClick.2
            public void call() {
                composite.removeOnClickListener(listener);
            }
        });
        composite.addOnClickListener(listener);
        observer.add(subscription);
    }

    /* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener.class */
    private static class CompositeOnClickListener implements AdapterView.OnItemClickListener {
        private final List<AdapterView.OnItemClickListener> listeners;

        private CompositeOnClickListener() {
            this.listeners = new ArrayList();
        }

        public boolean addOnClickListener(AdapterView.OnItemClickListener listener) {
            return this.listeners.add(listener);
        }

        public boolean removeOnClickListener(AdapterView.OnItemClickListener listener) {
            return this.listeners.remove(listener);
        }

        @Override // android.widget.AdapterView.OnItemClickListener
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            for (AdapterView.OnItemClickListener listener : this.listeners) {
                listener.onItemClick(parent, view, position, id);
            }
        }
    }

    /* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorAdapterViewOnItemClick$CachedListeners.class */
    private static class CachedListeners {
        private static final Map<AdapterView<?>, CompositeOnClickListener> sCachedListeners = new WeakHashMap();

        private CachedListeners() {
        }

        public static CompositeOnClickListener getFromViewOrCreate(AdapterView<?> view) {
            CompositeOnClickListener cached = sCachedListeners.get(view);
            if (cached != null) {
                return cached;
            }
            CompositeOnClickListener listener = new CompositeOnClickListener();
            sCachedListeners.put(view, listener);
            view.setOnItemClickListener(listener);
            return listener;
        }
    }
}
