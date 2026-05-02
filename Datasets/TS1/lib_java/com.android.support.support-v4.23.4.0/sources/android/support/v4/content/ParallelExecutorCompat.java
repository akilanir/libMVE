package android.support.v4.content;

import android.os.Build;
import java.util.concurrent.Executor;

/* loaded from: com.android.support.support-v4.23.4.0.jar:android/support/v4/content/ParallelExecutorCompat.class */
public final class ParallelExecutorCompat {
    public static Executor getParallelExecutor() {
        if (Build.VERSION.SDK_INT >= 11) {
            return ExecutorCompatHoneycomb.getParallelExecutor();
        }
        return ModernAsyncTask.THREAD_POOL_EXECUTOR;
    }

    private ParallelExecutorCompat() {
    }
}
