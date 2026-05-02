package com.danikula.videocache;

import android.util.Log;
import java.lang.Thread;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/ProxyCache.class */
class ProxyCache {
    private static final int MAX_READ_SOURCE_ATTEMPTS = 1;
    private final Source source;
    private final Cache cache;
    private volatile Thread sourceReaderThread;
    private volatile boolean stopped;
    private final Object wc = new Object();
    private final Object stopLock = new Object();
    private volatile int percentsAvailable = -1;
    private final AtomicInteger readSourceErrorsCount = new AtomicInteger();

    public ProxyCache(Source source, Cache cache) {
        this.source = (Source) Preconditions.checkNotNull(source);
        this.cache = (Cache) Preconditions.checkNotNull(cache);
    }

    public int read(byte[] buffer, long offset, int length) throws ProxyCacheException {
        ProxyCacheUtils.assertBuffer(buffer, offset, length);
        while (!this.cache.isCompleted() && this.cache.available() < offset + length && !this.stopped) {
            readSourceAsync();
            waitForSourceData();
            checkReadSourceErrorsCount();
        }
        int read = this.cache.read(buffer, offset, length);
        if (this.cache.isCompleted() && this.percentsAvailable != 100) {
            this.percentsAvailable = 100;
            onCachePercentsAvailableChanged(100);
        }
        return read;
    }

    private void checkReadSourceErrorsCount() throws ProxyCacheException {
        int errorsCount = this.readSourceErrorsCount.get();
        if (errorsCount >= MAX_READ_SOURCE_ATTEMPTS) {
            this.readSourceErrorsCount.set(0);
            throw new ProxyCacheException("Error reading source " + errorsCount + " times");
        }
    }

    public void shutdown() {
        synchronized (this.stopLock) {
            Log.d("ProxyCache", "Shutdown proxy for " + this.source);
            try {
                this.stopped = true;
                if (this.sourceReaderThread != null) {
                    this.sourceReaderThread.interrupt();
                }
                this.cache.close();
            } catch (ProxyCacheException e) {
                onError(e);
            }
        }
    }

    private synchronized void readSourceAsync() throws ProxyCacheException {
        boolean readingInProgress = (this.sourceReaderThread == null || this.sourceReaderThread.getState() == Thread.State.TERMINATED) ? false : true;
        if (!this.stopped && !this.cache.isCompleted() && !readingInProgress) {
            this.sourceReaderThread = new Thread(new SourceReaderRunnable(), "Source reader for " + this.source);
            this.sourceReaderThread.start();
        }
    }

    private void waitForSourceData() throws ProxyCacheException {
        synchronized (this.wc) {
            try {
                this.wc.wait(1000L);
            } catch (InterruptedException e) {
                throw new ProxyCacheException("Waiting source data is interrupted!", e);
            }
        }
    }

    private void notifyNewCacheDataAvailable(long cacheAvailable, long sourceAvailable) {
        onCacheAvailable(cacheAvailable, sourceAvailable);
        synchronized (this.wc) {
            this.wc.notifyAll();
        }
    }

    protected void onCacheAvailable(long cacheAvailable, long sourceAvailable) {
        int percents = (int) ((cacheAvailable * 100) / sourceAvailable);
        boolean percentsChanged = percents != this.percentsAvailable;
        boolean sourceLengthKnown = sourceAvailable >= 0;
        if (sourceLengthKnown && percentsChanged) {
            onCachePercentsAvailableChanged(percents);
        }
        this.percentsAvailable = percents;
    }

    protected void onCachePercentsAvailableChanged(int percentsAvailable) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void readSource() {
        try {
            try {
                int offset = this.cache.available();
                this.source.open(offset);
                int sourceAvailable = this.source.length();
                byte[] buffer = new byte[8192];
                while (true) {
                    int readBytes = this.source.read(buffer);
                    if (readBytes == -1) {
                        tryComplete();
                        closeSource();
                        notifyNewCacheDataAvailable(offset, sourceAvailable);
                        return;
                    }
                    synchronized (this.stopLock) {
                        if (isStopped()) {
                            closeSource();
                            notifyNewCacheDataAvailable(offset, sourceAvailable);
                            return;
                        }
                        this.cache.append(buffer, readBytes);
                    }
                    offset += readBytes;
                    notifyNewCacheDataAvailable(offset, sourceAvailable);
                }
            } catch (Throwable e) {
                this.readSourceErrorsCount.incrementAndGet();
                onError(e);
                closeSource();
                notifyNewCacheDataAvailable(0, -1);
            }
        } catch (Throwable th) {
            closeSource();
            notifyNewCacheDataAvailable(0, -1);
            throw th;
        }
    }

    private void tryComplete() throws ProxyCacheException {
        synchronized (this.stopLock) {
            if (!isStopped() && this.cache.available() == this.source.length()) {
                this.cache.complete();
            }
        }
    }

    private boolean isStopped() {
        return Thread.currentThread().isInterrupted() || this.stopped;
    }

    private void closeSource() {
        try {
            this.source.close();
        } catch (ProxyCacheException e) {
            onError(new ProxyCacheException("Error closing source " + this.source, e));
        }
    }

    protected final void onError(Throwable e) {
        boolean interruption = e instanceof InterruptedProxyCacheException;
        if (interruption) {
            Log.d("ProxyCache", "ProxyCache is interrupted");
        } else {
            Log.e("ProxyCache", "ProxyCache error", e);
        }
    }

    /* loaded from: videocache-2.3.3.jar:com/danikula/videocache/ProxyCache$SourceReaderRunnable.class */
    private class SourceReaderRunnable implements Runnable {
        private SourceReaderRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            ProxyCache.this.readSource();
        }
    }
}
