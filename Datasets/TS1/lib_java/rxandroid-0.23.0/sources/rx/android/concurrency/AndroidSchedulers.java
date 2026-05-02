package rx.android.concurrency;

import android.os.Handler;
import rx.Scheduler;

@Deprecated
/* loaded from: rxandroid-0.23.0.jar:rx/android/concurrency/AndroidSchedulers.class */
public class AndroidSchedulers {
    @Deprecated
    public static Scheduler handlerThread(Handler handler) {
        return rx.android.schedulers.AndroidSchedulers.handlerThread(handler);
    }

    @Deprecated
    public static Scheduler mainThread() {
        return rx.android.schedulers.AndroidSchedulers.mainThread();
    }
}
