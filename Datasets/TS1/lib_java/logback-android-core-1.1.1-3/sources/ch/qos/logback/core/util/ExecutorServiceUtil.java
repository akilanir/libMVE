package ch.qos.logback.core.util;

import ch.qos.logback.core.CoreConstants;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/ExecutorServiceUtil.class */
public class ExecutorServiceUtil {
    public static ExecutorService newExecutorService() {
        return new ThreadPoolExecutor(CoreConstants.CORE_POOL_SIZE, 32, 0L, TimeUnit.MILLISECONDS, new SynchronousQueue());
    }

    public static void shutdown(ExecutorService executorService) {
        executorService.shutdownNow();
    }
}
