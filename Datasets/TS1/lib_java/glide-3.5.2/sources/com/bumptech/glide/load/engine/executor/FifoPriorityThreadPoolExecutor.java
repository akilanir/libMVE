package com.bumptech.glide.load.engine.executor;

import android.os.Process;
import java.util.concurrent.FutureTask;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/executor/FifoPriorityThreadPoolExecutor.class */
public class FifoPriorityThreadPoolExecutor extends ThreadPoolExecutor {
    AtomicInteger ordering;

    public FifoPriorityThreadPoolExecutor(int poolSize) {
        this(poolSize, poolSize, 0L, TimeUnit.MILLISECONDS, new DefaultThreadFactory());
    }

    public FifoPriorityThreadPoolExecutor(int corePoolSize, int maximumPoolSize, long keepAlive, TimeUnit timeUnit, ThreadFactory threadFactory) {
        super(corePoolSize, maximumPoolSize, keepAlive, timeUnit, new PriorityBlockingQueue(), threadFactory);
        this.ordering = new AtomicInteger();
    }

    @Override // java.util.concurrent.AbstractExecutorService
    protected <T> RunnableFuture<T> newTaskFor(Runnable runnable, T value) {
        return new LoadTask(runnable, value, this.ordering.getAndIncrement());
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/executor/FifoPriorityThreadPoolExecutor$DefaultThreadFactory.class */
    public static class DefaultThreadFactory implements ThreadFactory {
        int threadNum = 0;

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable runnable) {
            Thread result = new Thread(runnable, "fifo-pool-thread-" + this.threadNum) { // from class: com.bumptech.glide.load.engine.executor.FifoPriorityThreadPoolExecutor.DefaultThreadFactory.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    Process.setThreadPriority(10);
                    super.run();
                }
            };
            this.threadNum++;
            return result;
        }
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/executor/FifoPriorityThreadPoolExecutor$LoadTask.class */
    static class LoadTask<T> extends FutureTask<T> implements Comparable<LoadTask<?>> {
        private final int priority;
        private final int order;

        public LoadTask(Runnable runnable, T result, int order) {
            super(runnable, result);
            if (!(runnable instanceof Prioritized)) {
                throw new IllegalArgumentException("FifoPriorityThreadPoolExecutor must be given Runnables that implement Prioritized");
            }
            this.priority = ((Prioritized) runnable).getPriority();
            this.order = order;
        }

        public boolean equals(Object o) {
            if (o instanceof LoadTask) {
                LoadTask<Object> other = (LoadTask) o;
                return this.order == other.order && this.priority == other.priority;
            }
            return false;
        }

        public int hashCode() {
            int result = this.priority;
            return (31 * result) + this.order;
        }

        @Override // java.lang.Comparable
        public int compareTo(LoadTask<?> loadTask) {
            int result = this.priority - loadTask.priority;
            if (result == 0) {
                result = this.order - loadTask.order;
            }
            return result;
        }
    }
}
