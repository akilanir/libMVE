package com.koushikdutta.async;

import java.util.LinkedList;
import java.util.WeakHashMap;
import java.util.concurrent.Semaphore;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/ThreadQueue.class */
public class ThreadQueue extends LinkedList<Runnable> {
    private static final WeakHashMap<Thread, ThreadQueue> mThreadQueues = new WeakHashMap<>();
    AsyncSemaphore waiter;
    Semaphore queueSemaphore = new Semaphore(0);

    static ThreadQueue getOrCreateThreadQueue(Thread thread) {
        ThreadQueue queue;
        synchronized (mThreadQueues) {
            queue = mThreadQueues.get(thread);
            if (queue == null) {
                queue = new ThreadQueue();
                mThreadQueues.put(thread, queue);
            }
        }
        return queue;
    }

    static void release(AsyncSemaphore semaphore) {
        synchronized (mThreadQueues) {
            for (ThreadQueue threadQueue : mThreadQueues.values()) {
                if (threadQueue.waiter == semaphore) {
                    threadQueue.queueSemaphore.release();
                }
            }
        }
    }

    @Override // java.util.LinkedList, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List, java.util.Deque, java.util.Queue
    public boolean add(Runnable object) {
        boolean add;
        synchronized (this) {
            add = super.add((ThreadQueue) object);
        }
        return add;
    }

    @Override // java.util.LinkedList, java.util.AbstractCollection, java.util.Collection, java.util.List, java.util.Deque
    public boolean remove(Object object) {
        boolean remove;
        synchronized (this) {
            remove = super.remove(object);
        }
        return remove;
    }

    @Override // java.util.LinkedList, java.util.Deque, java.util.Queue
    public Runnable remove() {
        synchronized (this) {
            if (isEmpty()) {
                return null;
            }
            return (Runnable) super.remove();
        }
    }
}
