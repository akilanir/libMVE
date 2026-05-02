package rx.android.operators;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.v4.content.LocalBroadcastManager;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

/* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorLocalBroadcastRegister.class */
public class OperatorLocalBroadcastRegister implements Observable.OnSubscribe<Intent> {
    private final Context context;
    private final IntentFilter intentFilter;

    public OperatorLocalBroadcastRegister(Context context, IntentFilter intentFilter) {
        this.context = context;
        this.intentFilter = intentFilter;
    }

    public void call(final Subscriber<? super Intent> subscriber) {
        final LocalBroadcastManager localBroadcastManager = LocalBroadcastManager.getInstance(this.context);
        final BroadcastReceiver broadcastReceiver = new BroadcastReceiver() { // from class: rx.android.operators.OperatorLocalBroadcastRegister.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                subscriber.onNext(intent);
            }
        };
        Subscription subscription = Subscriptions.create(new Action0() { // from class: rx.android.operators.OperatorLocalBroadcastRegister.2
            public void call() {
                localBroadcastManager.unregisterReceiver(broadcastReceiver);
            }
        });
        subscriber.add(subscription);
        localBroadcastManager.registerReceiver(broadcastReceiver, this.intentFilter);
    }
}
