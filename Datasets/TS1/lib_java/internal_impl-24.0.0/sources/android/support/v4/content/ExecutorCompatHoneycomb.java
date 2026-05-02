package android.support.v4.content;

import android.os.AsyncTask;
import java.util.concurrent.Executor;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/content/ExecutorCompatHoneycomb.class */
class ExecutorCompatHoneycomb {
    ExecutorCompatHoneycomb() {
    }

    public static Executor getParallelExecutor() {
        return AsyncTask.THREAD_POOL_EXECUTOR;
    }
}
