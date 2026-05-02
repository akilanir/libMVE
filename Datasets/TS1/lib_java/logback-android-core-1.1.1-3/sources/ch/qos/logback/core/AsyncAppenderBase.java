package ch.qos.logback.core;

import ch.qos.logback.core.spi.AppenderAttachable;
import ch.qos.logback.core.spi.AppenderAttachableImpl;
import java.util.Iterator;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/AsyncAppenderBase.class */
public class AsyncAppenderBase<E> extends UnsynchronizedAppenderBase<E> implements AppenderAttachable<E> {
    BlockingQueue<E> blockingQueue;
    public static final int DEFAULT_QUEUE_SIZE = 256;
    static final int UNDEFINED = -1;
    AppenderAttachableImpl<E> aai = new AppenderAttachableImpl<>();
    int queueSize = DEFAULT_QUEUE_SIZE;
    int appenderCount = 0;
    int discardingThreshold = UNDEFINED;
    AsyncAppenderBase<E>.Worker worker = new Worker();

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/AsyncAppenderBase$Worker.class */
    class Worker extends Thread {
        Worker() {
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            AsyncAppenderBase asyncAppenderBase = AsyncAppenderBase.this;
            AppenderAttachableImpl<E> appenderAttachableImpl = asyncAppenderBase.aai;
            while (asyncAppenderBase.isStarted()) {
                try {
                    appenderAttachableImpl.appendLoopOnAppenders(asyncAppenderBase.blockingQueue.take());
                } catch (InterruptedException e) {
                }
            }
            AsyncAppenderBase.this.addInfo("Worker thread will flush remaining events before exiting.");
            Iterator it = asyncAppenderBase.blockingQueue.iterator();
            while (it.hasNext()) {
                appenderAttachableImpl.appendLoopOnAppenders(it.next());
            }
            appenderAttachableImpl.detachAndStopAllAppenders();
        }
    }

    protected boolean isDiscardable(E e) {
        return false;
    }

    protected void preprocess(E e) {
    }

    @Override // ch.qos.logback.core.UnsynchronizedAppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        if (this.appenderCount == 0) {
            addError("No attached appenders found.");
            return;
        }
        if (this.queueSize < 1) {
            addError("Invalid queue size [" + this.queueSize + "]");
            return;
        }
        this.blockingQueue = new ArrayBlockingQueue(this.queueSize);
        if (this.discardingThreshold == UNDEFINED) {
            this.discardingThreshold = this.queueSize / 5;
        }
        addInfo("Setting discardingThreshold to " + this.discardingThreshold);
        this.worker.setDaemon(true);
        this.worker.setName("AsyncAppender-Worker-" + this.worker.getName());
        super.start();
        this.worker.start();
    }

    @Override // ch.qos.logback.core.UnsynchronizedAppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        if (isStarted()) {
            super.stop();
            this.worker.interrupt();
            try {
                this.worker.join(1000L);
            } catch (InterruptedException e) {
                addError("Failed to join worker thread", e);
            }
        }
    }

    @Override // ch.qos.logback.core.UnsynchronizedAppenderBase
    protected void append(E e) {
        if (isQueueBelowDiscardingThreshold() && isDiscardable(e)) {
            return;
        }
        preprocess(e);
        put(e);
    }

    private boolean isQueueBelowDiscardingThreshold() {
        return this.blockingQueue.remainingCapacity() < this.discardingThreshold;
    }

    private void put(E e) {
        try {
            this.blockingQueue.put(e);
        } catch (InterruptedException e2) {
        }
    }

    public int getQueueSize() {
        return this.queueSize;
    }

    public void setQueueSize(int i) {
        this.queueSize = i;
    }

    public int getDiscardingThreshold() {
        return this.discardingThreshold;
    }

    public void setDiscardingThreshold(int i) {
        this.discardingThreshold = i;
    }

    public int getNumberOfElementsInQueue() {
        return this.blockingQueue.size();
    }

    public int getRemainingCapacity() {
        return this.blockingQueue.remainingCapacity();
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public void addAppender(Appender<E> appender) {
        if (this.appenderCount != 0) {
            addWarn("One and only one appender may be attached to AsyncAppender.");
            addWarn("Ignoring additional appender named [" + appender.getName() + "]");
        } else {
            this.appenderCount++;
            addInfo("Attaching appender named [" + appender.getName() + "] to AsyncAppender.");
            this.aai.addAppender(appender);
        }
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public Iterator<Appender<E>> iteratorForAppenders() {
        return this.aai.iteratorForAppenders();
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public Appender<E> getAppender(String str) {
        return this.aai.getAppender(str);
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public boolean isAttached(Appender<E> appender) {
        return this.aai.isAttached(appender);
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public void detachAndStopAllAppenders() {
        this.aai.detachAndStopAllAppenders();
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public boolean detachAppender(Appender<E> appender) {
        return this.aai.detachAppender(appender);
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public boolean detachAppender(String str) {
        return this.aai.detachAppender(str);
    }
}
