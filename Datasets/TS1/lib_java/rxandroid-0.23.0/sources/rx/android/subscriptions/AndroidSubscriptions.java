package rx.android.subscriptions;

import android.os.Looper;
import rx.Scheduler;
import rx.Subscription;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

/* loaded from: rxandroid-0.23.0.jar:rx/android/subscriptions/AndroidSubscriptions.class */
public final class AndroidSubscriptions {
    private AndroidSubscriptions() {
    }

    public static Subscription unsubscribeInUiThread(final Action0 unsubscribe) {
        return Subscriptions.create(new Action0() { // from class: rx.android.subscriptions.AndroidSubscriptions.1
            public void call() {
                if (Looper.getMainLooper() == Looper.myLooper()) {
                    unsubscribe.call();
                } else {
                    final Scheduler.Worker inner = AndroidSchedulers.mainThread().createWorker();
                    inner.schedule(new Action0() { // from class: rx.android.subscriptions.AndroidSubscriptions.1.1
                        public void call() {
                            unsubscribe.call();
                            inner.unsubscribe();
                        }
                    });
                }
            }
        });
    }
}
