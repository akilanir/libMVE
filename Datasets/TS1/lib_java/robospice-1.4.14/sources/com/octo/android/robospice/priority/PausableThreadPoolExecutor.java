package com.octo.android.robospice.priority;

import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/priority/PausableThreadPoolExecutor.class */
public class PausableThreadPoolExecutor extends ThreadPoolExecutor {
    public PausableThreadPoolExecutor(int corePoolSize, int maxPoolSize, int threadPriority) {
        super(corePoolSize, maxPoolSize, 0L, TimeUnit.NANOSECONDS, new PausablePriorityBlockingQueue(), new CustomizablePriorityThreadFactory(threadPriority));
    }

    public PausableThreadPoolExecutor(int poolSize, int threadPriority) {
        super(poolSize, poolSize, 0L, TimeUnit.NANOSECONDS, new PausablePriorityBlockingQueue(), new CustomizablePriorityThreadFactory(threadPriority));
    }

    public PausableThreadPoolExecutor(int poolSize) {
        super(poolSize, poolSize, 0L, TimeUnit.NANOSECONDS, new PausablePriorityBlockingQueue(), new CustomizablePriorityThreadFactory());
    }

    public void pause() {
        ((PausablePriorityBlockingQueue) getQueue()).pause();
    }

    public void resume() {
        ((PausablePriorityBlockingQueue) getQueue()).resume();
    }
}
