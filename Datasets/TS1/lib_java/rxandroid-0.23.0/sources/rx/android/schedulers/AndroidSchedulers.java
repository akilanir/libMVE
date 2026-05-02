package rx.android.schedulers;

import android.os.Handler;
import android.os.Looper;
import rx.Scheduler;

/* loaded from: rxandroid-0.23.0.jar:rx/android/schedulers/AndroidSchedulers.class */
public class AndroidSchedulers {
    private static final Scheduler MAIN_THREAD_SCHEDULER = new HandlerThreadScheduler(new Handler(Looper.getMainLooper()));

    private AndroidSchedulers() {
    }

    public static Scheduler handlerThread(Handler handler) {
        return new HandlerThreadScheduler(handler);
    }

    public static Scheduler mainThread() {
        return MAIN_THREAD_SCHEDULER;
    }
}
