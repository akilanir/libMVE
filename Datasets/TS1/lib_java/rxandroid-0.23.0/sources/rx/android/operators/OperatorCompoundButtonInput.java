package rx.android.operators;

import android.view.View;
import android.widget.CompoundButton;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.android.events.OnCheckedChangeEvent;
import rx.android.observables.Assertions;
import rx.android.subscriptions.AndroidSubscriptions;
import rx.functions.Action0;

/* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorCompoundButtonInput.class */
public class OperatorCompoundButtonInput implements Observable.OnSubscribe<OnCheckedChangeEvent> {
    private final boolean emitInitialValue;
    private final CompoundButton button;

    public OperatorCompoundButtonInput(CompoundButton button, boolean emitInitialValue) {
        this.emitInitialValue = emitInitialValue;
        this.button = button;
    }

    public void call(final Subscriber<? super OnCheckedChangeEvent> observer) {
        Assertions.assertUiThread();
        final CompositeOnCheckedChangeListener composite = CachedListeners.getFromViewOrCreate(this.button);
        final CompoundButton.OnCheckedChangeListener listener = new CompoundButton.OnCheckedChangeListener() { // from class: rx.android.operators.OperatorCompoundButtonInput.1
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton view, boolean checked) {
                observer.onNext(new OnCheckedChangeEvent(OperatorCompoundButtonInput.this.button, checked));
            }
        };
        Subscription subscription = AndroidSubscriptions.unsubscribeInUiThread(new Action0() { // from class: rx.android.operators.OperatorCompoundButtonInput.2
            public void call() {
                composite.removeOnCheckedChangeListener(listener);
            }
        });
        if (this.emitInitialValue) {
            observer.onNext(new OnCheckedChangeEvent(this.button));
        }
        composite.addOnCheckedChangeListener(listener);
        observer.add(subscription);
    }

    /* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorCompoundButtonInput$CompositeOnCheckedChangeListener.class */
    private static class CompositeOnCheckedChangeListener implements CompoundButton.OnCheckedChangeListener {
        private final List<CompoundButton.OnCheckedChangeListener> listeners;

        private CompositeOnCheckedChangeListener() {
            this.listeners = new ArrayList();
        }

        public boolean addOnCheckedChangeListener(CompoundButton.OnCheckedChangeListener listener) {
            return this.listeners.add(listener);
        }

        public boolean removeOnCheckedChangeListener(CompoundButton.OnCheckedChangeListener listener) {
            return this.listeners.remove(listener);
        }

        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton button, boolean checked) {
            for (CompoundButton.OnCheckedChangeListener listener : this.listeners) {
                listener.onCheckedChanged(button, checked);
            }
        }
    }

    /* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorCompoundButtonInput$CachedListeners.class */
    private static class CachedListeners {
        private static final Map<View, CompositeOnCheckedChangeListener> sCachedListeners = new WeakHashMap();

        private CachedListeners() {
        }

        public static CompositeOnCheckedChangeListener getFromViewOrCreate(CompoundButton button) {
            CompositeOnCheckedChangeListener cached = sCachedListeners.get(button);
            if (cached != null) {
                return cached;
            }
            CompositeOnCheckedChangeListener listener = new CompositeOnCheckedChangeListener();
            sCachedListeners.put(button, listener);
            button.setOnCheckedChangeListener(listener);
            return listener;
        }
    }
}
