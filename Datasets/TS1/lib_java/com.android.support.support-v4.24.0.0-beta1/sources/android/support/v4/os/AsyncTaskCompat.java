package android.support.v4.os;

import android.os.AsyncTask;
import android.os.Build;

/* loaded from: com.android.support.support-v4.24.0.0-beta1.jar:android/support/v4/os/AsyncTaskCompat.class */
public final class AsyncTaskCompat {
    public static <Params, Progress, Result> AsyncTask<Params, Progress, Result> executeParallel(AsyncTask<Params, Progress, Result> task, Params... params) {
        if (task == null) {
            throw new IllegalArgumentException("task can not be null");
        }
        if (Build.VERSION.SDK_INT >= 11) {
            AsyncTaskCompatHoneycomb.executeParallel(task, params);
        } else {
            task.execute(params);
        }
        return task;
    }

    private AsyncTaskCompat() {
    }
}
