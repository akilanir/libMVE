package com.octo.android.robospice.priority;

import java.util.concurrent.Future;
import java.util.concurrent.RunnableFuture;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/priority/PriorityThreadPoolExecutor.class */
public final class PriorityThreadPoolExecutor extends PausableThreadPoolExecutor {
    public PriorityThreadPoolExecutor(int corePoolSize, int maxPoolSize, int threadPriority) {
        super(corePoolSize, maxPoolSize, threadPriority);
    }

    public PriorityThreadPoolExecutor(int poolSize, int threadPriority) {
        super(poolSize, threadPriority);
    }

    public PriorityThreadPoolExecutor(int poolSize) {
        super(poolSize);
    }

    public static PriorityThreadPoolExecutor getPriorityExecutor(int nCoreThreads, int maxPoolSize, int threadPriority) {
        return new PriorityThreadPoolExecutor(nCoreThreads, maxPoolSize, threadPriority);
    }

    public static PriorityThreadPoolExecutor getPriorityExecutor(int nThreads, int threadPriority) {
        return new PriorityThreadPoolExecutor(nThreads, threadPriority);
    }

    public static PriorityThreadPoolExecutor getPriorityExecutor(int nThreads) {
        return new PriorityThreadPoolExecutor(nThreads);
    }

    @Override // java.util.concurrent.AbstractExecutorService
    protected <T> RunnableFuture<T> newTaskFor(Runnable runnable, T value) {
        if (runnable == null) {
            return null;
        }
        return new PriorityFuture(runnable, ((PriorityRunnable) runnable).getPriority(), value);
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    public Future<?> submit(Runnable task) {
        if (task == null) {
            throw new NullPointerException();
        }
        RunnableFuture<Object> ftask = newTaskFor(task, null);
        execute(ftask);
        return ftask;
    }
}
