package android.support.v4.os;

import android.os.AsyncTask;

/* loaded from: internal_impl-23.3.0.jar:android/support/v4/os/AsyncTaskCompatHoneycomb.class */
class AsyncTaskCompatHoneycomb {
    AsyncTaskCompatHoneycomb() {
    }

    static <Params, Progress, Result> void executeParallel(AsyncTask<Params, Progress, Result> task, Params... params) {
        task.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, params);
    }
}
