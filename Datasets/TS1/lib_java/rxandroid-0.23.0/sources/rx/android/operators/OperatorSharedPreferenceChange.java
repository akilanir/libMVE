package rx.android.operators;

import android.content.SharedPreferences;
import rx.Observable;
import rx.Subscriber;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

/* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorSharedPreferenceChange.class */
public class OperatorSharedPreferenceChange implements Observable.OnSubscribe<String> {
    private final SharedPreferences sharedPreferences;

    public OperatorSharedPreferenceChange(SharedPreferences sharedPreferences) {
        this.sharedPreferences = sharedPreferences;
    }

    public void call(final Subscriber<? super String> subscriber) {
        final SharedPreferences.OnSharedPreferenceChangeListener listener = new SharedPreferences.OnSharedPreferenceChangeListener() { // from class: rx.android.operators.OperatorSharedPreferenceChange.1
            @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
            public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
                subscriber.onNext(key);
            }
        };
        subscriber.add(Subscriptions.create(new Action0() { // from class: rx.android.operators.OperatorSharedPreferenceChange.2
            public void call() {
                OperatorSharedPreferenceChange.this.sharedPreferences.unregisterOnSharedPreferenceChangeListener(listener);
            }
        }));
        this.sharedPreferences.registerOnSharedPreferenceChangeListener(listener);
    }
}
