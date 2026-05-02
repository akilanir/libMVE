package rx.android.observables;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import rx.Observable;
import rx.android.operators.OperatorBroadcastRegister;
import rx.android.operators.OperatorConditionalBinding;
import rx.android.operators.OperatorLocalBroadcastRegister;
import rx.android.operators.OperatorSharedPreferenceChange;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Func1;

/* loaded from: rxandroid-0.23.0.jar:rx/android/observables/AndroidObservable.class */
public final class AndroidObservable {
    private static final boolean USES_SUPPORT_FRAGMENTS;
    private static final Func1<Activity, Boolean> ACTIVITY_VALIDATOR;
    private static final Func1<Fragment, Boolean> FRAGMENT_VALIDATOR;
    private static final Func1<android.support.v4.app.Fragment, Boolean> FRAGMENTV4_VALIDATOR;

    static {
        boolean supportFragmentsAvailable = false;
        try {
            Class.forName("android.support.v4.app.Fragment");
            supportFragmentsAvailable = true;
        } catch (ClassNotFoundException e) {
        }
        USES_SUPPORT_FRAGMENTS = supportFragmentsAvailable;
        ACTIVITY_VALIDATOR = new Func1<Activity, Boolean>() { // from class: rx.android.observables.AndroidObservable.1
            public Boolean call(Activity activity) {
                return Boolean.valueOf(!activity.isFinishing());
            }
        };
        FRAGMENT_VALIDATOR = new Func1<Fragment, Boolean>() { // from class: rx.android.observables.AndroidObservable.2
            public Boolean call(Fragment fragment) {
                return Boolean.valueOf(fragment.isAdded() && !fragment.getActivity().isFinishing());
            }
        };
        FRAGMENTV4_VALIDATOR = new Func1<android.support.v4.app.Fragment, Boolean>() { // from class: rx.android.observables.AndroidObservable.3
            public Boolean call(android.support.v4.app.Fragment fragment) {
                return Boolean.valueOf(fragment.isAdded() && !fragment.getActivity().isFinishing());
            }
        };
    }

    private AndroidObservable() {
    }

    public static <T> Observable<T> bindActivity(Activity activity, Observable<T> source) {
        Assertions.assertUiThread();
        return source.observeOn(AndroidSchedulers.mainThread()).lift(new OperatorConditionalBinding(activity, ACTIVITY_VALIDATOR));
    }

    public static <T> Observable<T> bindFragment(Object fragment, Observable<T> source) {
        Assertions.assertUiThread();
        Observable<T> o = source.observeOn(AndroidSchedulers.mainThread());
        if (USES_SUPPORT_FRAGMENTS && (fragment instanceof android.support.v4.app.Fragment)) {
            android.support.v4.app.Fragment f = (android.support.v4.app.Fragment) fragment;
            return o.lift(new OperatorConditionalBinding(f, FRAGMENTV4_VALIDATOR));
        }
        if (Build.VERSION.SDK_INT >= 11 && (fragment instanceof Fragment)) {
            Fragment f2 = (Fragment) fragment;
            return o.lift(new OperatorConditionalBinding(f2, FRAGMENT_VALIDATOR));
        }
        throw new IllegalArgumentException("Target fragment is neither a native nor support library Fragment");
    }

    public static Observable<Intent> fromBroadcast(Context context, IntentFilter filter) {
        return Observable.create(new OperatorBroadcastRegister(context, filter, null, null));
    }

    public static Observable<Intent> fromBroadcast(Context context, IntentFilter filter, String broadcastPermission, Handler schedulerHandler) {
        return Observable.create(new OperatorBroadcastRegister(context, filter, broadcastPermission, schedulerHandler));
    }

    public static Observable<Intent> fromLocalBroadcast(Context context, IntentFilter filter) {
        return Observable.create(new OperatorLocalBroadcastRegister(context, filter));
    }

    public static Observable<String> fromSharedPreferencesChanges(SharedPreferences sharedPreferences) {
        return Observable.create(new OperatorSharedPreferenceChange(sharedPreferences));
    }
}
