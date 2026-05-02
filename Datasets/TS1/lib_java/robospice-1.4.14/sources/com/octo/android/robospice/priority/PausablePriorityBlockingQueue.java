package com.octo.android.robospice.priority;

import java.io.ObjectInputStream;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/priority/PausablePriorityBlockingQueue.class */
public class PausablePriorityBlockingQueue<T> extends PriorityBlockingQueue<T> {
    private static final long serialVersionUID = 3726077277740650698L;
    private boolean isPaused;
    private transient ReentrantLock pauseLock = new ReentrantLock();
    private transient Condition unpaused = this.pauseLock.newCondition();

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.Queue
    public T poll() {
        this.pauseLock.lock();
        while (this.isPaused) {
            try {
                try {
                    this.unpaused.await();
                } catch (InterruptedException e) {
                    throw new RuntimeException("Interrupted while paused.");
                }
            } finally {
                this.pauseLock.unlock();
            }
        }
        return (T) super.poll();
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.concurrent.BlockingQueue
    public T poll(long j, TimeUnit timeUnit) throws InterruptedException {
        this.pauseLock.lock();
        while (this.isPaused) {
            try {
                try {
                    this.unpaused.await();
                } catch (InterruptedException e) {
                    throw new RuntimeException("Interrupted while paused.");
                }
            } finally {
                this.pauseLock.unlock();
            }
        }
        return (T) super.poll(j, timeUnit);
    }

    @Override // java.util.concurrent.PriorityBlockingQueue, java.util.concurrent.BlockingQueue
    public T take() throws InterruptedException {
        this.pauseLock.lock();
        while (this.isPaused) {
            try {
                try {
                    this.unpaused.await();
                } catch (InterruptedException e) {
                    throw new RuntimeException("Interrupted while paused.");
                }
            } finally {
                this.pauseLock.unlock();
            }
        }
        return (T) super.take();
    }

    public void pause() {
        this.pauseLock.lock();
        try {
            this.isPaused = true;
            this.pauseLock.unlock();
        } catch (Throwable th) {
            this.pauseLock.unlock();
            throw th;
        }
    }

    public void resume() {
        this.pauseLock.lock();
        try {
            this.isPaused = false;
            this.unpaused.signalAll();
            this.pauseLock.unlock();
        } catch (Throwable th) {
            this.pauseLock.unlock();
            throw th;
        }
    }

    private void readObject(ObjectInputStream ois) {
        try {
            ois.defaultReadObject();
            this.pauseLock = new ReentrantLock();
            this.pauseLock.newCondition();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
