package rx.android.operators;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

/* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorBroadcastRegister.class */
public class OperatorBroadcastRegister implements Observable.OnSubscribe<Intent> {
    private final Context context;
    private final IntentFilter intentFilter;
    private final String broadcastPermission;
    private final Handler schedulerHandler;

    public OperatorBroadcastRegister(Context context, IntentFilter intentFilter, String broadcastPermission, Handler schedulerHandler) {
        this.context = context;
        this.intentFilter = intentFilter;
        this.broadcastPermission = broadcastPermission;
        this.schedulerHandler = schedulerHandler;
    }

    public void call(final Subscriber<? super Intent> subscriber) {
        final BroadcastReceiver broadcastReceiver = new BroadcastReceiver() { // from class: rx.android.operators.OperatorBroadcastRegister.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                subscriber.onNext(intent);
            }
        };
        Subscription subscription = Subscriptions.create(new Action0() { // from class: rx.android.operators.OperatorBroadcastRegister.2
            public void call() {
                OperatorBroadcastRegister.this.context.unregisterReceiver(broadcastReceiver);
            }
        });
        subscriber.add(subscription);
        this.context.registerReceiver(broadcastReceiver, this.intentFilter, this.broadcastPermission, this.schedulerHandler);
    }
}
