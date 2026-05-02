package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.collect.Queues;
import java.util.Iterator;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;

@ThreadSafe
/* loaded from: guava-15.0.jar:com/google/common/util/concurrent/ExecutionQueue.class */
final class ExecutionQueue {
    private static final Logger logger = Logger.getLogger(ExecutionQueue.class.getName());
    private final ConcurrentLinkedQueue<RunnableExecutorPair> queuedListeners = Queues.newConcurrentLinkedQueue();
    private final ReentrantLock lock = new ReentrantLock();

    ExecutionQueue() {
    }

    void add(Runnable runnable, Executor executor) {
        this.queuedListeners.add(new RunnableExecutorPair(runnable, executor));
    }

    void execute() {
        Iterator<RunnableExecutorPair> iterator = this.queuedListeners.iterator();
        while (iterator.hasNext()) {
            iterator.next().submit();
            iterator.remove();
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair.class */
    private final class RunnableExecutorPair implements Runnable {
        private final Executor executor;
        private final Runnable runnable;

        @GuardedBy("lock")
        private boolean hasBeenExecuted = false;

        RunnableExecutorPair(Runnable runnable, Executor executor) {
            this.runnable = (Runnable) Preconditions.checkNotNull(runnable);
            this.executor = (Executor) Preconditions.checkNotNull(executor);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void submit() {
            ExecutionQueue.this.lock.lock();
            try {
                if (!this.hasBeenExecuted) {
                    try {
                        this.executor.execute(this);
                    } catch (Exception e) {
                        ExecutionQueue.logger.log(Level.SEVERE, "Exception while executing listener " + this.runnable + " with executor " + this.executor, (Throwable) e);
                    }
                }
            } finally {
                if (ExecutionQueue.this.lock.isHeldByCurrentThread()) {
                    this.hasBeenExecuted = true;
                    ExecutionQueue.this.lock.unlock();
                }
            }
        }

        @Override // java.lang.Runnable
        public final void run() {
            if (ExecutionQueue.this.lock.isHeldByCurrentThread()) {
                this.hasBeenExecuted = true;
                ExecutionQueue.this.lock.unlock();
            }
            this.runnable.run();
        }
    }
}
