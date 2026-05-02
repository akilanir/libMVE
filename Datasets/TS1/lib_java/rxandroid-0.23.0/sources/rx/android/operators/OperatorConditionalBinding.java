package rx.android.operators;

import android.util.Log;
import rx.Observable;
import rx.Subscriber;
import rx.functions.Func1;
import rx.internal.util.UtilityFunctions;

/* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorConditionalBinding.class */
public final class OperatorConditionalBinding<T, R> implements Observable.Operator<T, T> {
    private static final String LOG_TAG = "ConditionalBinding";
    private R boundRef;
    private final Func1<? super R, Boolean> predicate;

    public OperatorConditionalBinding(R bound, Func1<? super R, Boolean> predicate) {
        this.boundRef = bound;
        this.predicate = predicate;
    }

    public OperatorConditionalBinding(R bound) {
        this.boundRef = bound;
        this.predicate = UtilityFunctions.alwaysTrue();
    }

    public Subscriber<? super T> call(final Subscriber<? super T> subscriber) {
        return new Subscriber<T>(subscriber) { // from class: rx.android.operators.OperatorConditionalBinding.1
            public void onCompleted() {
                if (shouldForwardNotification()) {
                    subscriber.onCompleted();
                } else {
                    handleLostBinding("onCompleted");
                }
            }

            public void onError(Throwable e) {
                if (shouldForwardNotification()) {
                    subscriber.onError(e);
                } else {
                    handleLostBinding("onError");
                }
            }

            public void onNext(T t) {
                if (shouldForwardNotification()) {
                    subscriber.onNext(t);
                } else {
                    handleLostBinding("onNext");
                }
            }

            private boolean shouldForwardNotification() {
                return OperatorConditionalBinding.this.boundRef != null && ((Boolean) OperatorConditionalBinding.this.predicate.call(OperatorConditionalBinding.this.boundRef)).booleanValue();
            }

            private void handleLostBinding(String context) {
                log("bound object has become invalid; skipping " + context);
                log("unsubscribing...");
                OperatorConditionalBinding.this.boundRef = null;
                unsubscribe();
            }

            private void log(String message) {
                if (Log.isLoggable(OperatorConditionalBinding.LOG_TAG, 3)) {
                    Log.d(OperatorConditionalBinding.LOG_TAG, message);
                }
            }
        };
    }

    R getBoundRef() {
        return this.boundRef;
    }
}
