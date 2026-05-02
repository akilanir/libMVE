package rx.android.operators;

import android.view.View;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.android.events.OnClickEvent;
import rx.android.observables.Assertions;
import rx.android.subscriptions.AndroidSubscriptions;
import rx.functions.Action0;

/* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorViewClick.class */
public final class OperatorViewClick implements Observable.OnSubscribe<OnClickEvent> {
    private final boolean emitInitialValue;
    private final View view;

    public OperatorViewClick(View view, boolean emitInitialValue) {
        this.emitInitialValue = emitInitialValue;
        this.view = view;
    }

    public void call(final Subscriber<? super OnClickEvent> observer) {
        Assertions.assertUiThread();
        final CompositeOnClickListener composite = CachedListeners.getFromViewOrCreate(this.view);
        final View.OnClickListener listener = new View.OnClickListener() { // from class: rx.android.operators.OperatorViewClick.1
            @Override // android.view.View.OnClickListener
            public void onClick(View clicked) {
                observer.onNext(new OnClickEvent(OperatorViewClick.this.view));
            }
        };
        Subscription subscription = AndroidSubscriptions.unsubscribeInUiThread(new Action0() { // from class: rx.android.operators.OperatorViewClick.2
            public void call() {
                composite.removeOnClickListener(listener);
            }
        });
        if (this.emitInitialValue) {
            observer.onNext(new OnClickEvent(this.view));
        }
        composite.addOnClickListener(listener);
        observer.add(subscription);
    }

    /* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorViewClick$CompositeOnClickListener.class */
    private static class CompositeOnClickListener implements View.OnClickListener {
        private final List<View.OnClickListener> listeners;

        private CompositeOnClickListener() {
            this.listeners = new ArrayList();
        }

        public boolean addOnClickListener(View.OnClickListener listener) {
            return this.listeners.add(listener);
        }

        public boolean removeOnClickListener(View.OnClickListener listener) {
            return this.listeners.remove(listener);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            for (View.OnClickListener listener : this.listeners) {
                listener.onClick(view);
            }
        }
    }

    /* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorViewClick$CachedListeners.class */
    private static class CachedListeners {
        private static final Map<View, CompositeOnClickListener> sCachedListeners = new WeakHashMap();

        private CachedListeners() {
        }

        public static CompositeOnClickListener getFromViewOrCreate(View view) {
            CompositeOnClickListener cached = sCachedListeners.get(view);
            if (cached != null) {
                return cached;
            }
            CompositeOnClickListener listener = new CompositeOnClickListener();
            sCachedListeners.put(view, listener);
            view.setOnClickListener(listener);
            return listener;
        }
    }
}
