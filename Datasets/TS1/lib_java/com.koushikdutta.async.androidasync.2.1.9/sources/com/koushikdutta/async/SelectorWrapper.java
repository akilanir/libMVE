package com.koushikdutta.async;

import java.io.IOException;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.util.Set;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/SelectorWrapper.class */
public class SelectorWrapper {
    private Selector selector;
    boolean isWaking;
    Semaphore semaphore = new Semaphore(0);

    public Selector getSelector() {
        return this.selector;
    }

    public SelectorWrapper(Selector selector) {
        this.selector = selector;
    }

    public int selectNow() throws IOException {
        return this.selector.selectNow();
    }

    public void select() throws IOException {
        select(0L);
    }

    public void select(long timeout) throws IOException {
        try {
            this.semaphore.drainPermits();
            this.selector.select(timeout);
        } finally {
            this.semaphore.release(Integer.MAX_VALUE);
        }
    }

    public Set<SelectionKey> keys() {
        return this.selector.keys();
    }

    public Set<SelectionKey> selectedKeys() {
        return this.selector.selectedKeys();
    }

    public void close() throws IOException {
        this.selector.close();
    }

    public boolean isOpen() {
        return this.selector.isOpen();
    }

    public void wakeupOnce() {
        boolean selecting = !this.semaphore.tryAcquire();
        this.selector.wakeup();
        if (selecting) {
            return;
        }
        synchronized (this) {
            if (this.isWaking) {
                return;
            }
            this.isWaking = true;
            for (int i = 0; i < 100; i++) {
                try {
                    try {
                    } catch (Throwable th) {
                        synchronized (this) {
                            this.isWaking = false;
                            throw th;
                        }
                    }
                } catch (InterruptedException e) {
                }
                if (!this.semaphore.tryAcquire(10L, TimeUnit.MILLISECONDS)) {
                    this.selector.wakeup();
                } else {
                    synchronized (this) {
                        this.isWaking = false;
                    }
                    return;
                }
            }
            synchronized (this) {
                this.isWaking = false;
            }
        }
    }
}
