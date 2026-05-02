package android.support.v4.content;

import android.os.AsyncTask;
import java.util.concurrent.Executor;

/* loaded from: internal_impl-23.2.1.jar:android/support/v4/content/ExecutorCompatHoneycomb.class */
class ExecutorCompatHoneycomb {
    ExecutorCompatHoneycomb() {
    }

    public static Executor getParallelExecutor() {
        return AsyncTask.THREAD_POOL_EXECUTOR;
    }
}
