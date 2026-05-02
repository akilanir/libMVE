package ch.qos.logback.core.read;

import ch.qos.logback.core.AppenderBase;
import ch.qos.logback.core.helpers.CyclicBuffer;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/read/CyclicBufferAppender.class */
public class CyclicBufferAppender<E> extends AppenderBase<E> {
    CyclicBuffer<E> cb;
    int maxSize = 512;

    @Override // ch.qos.logback.core.AppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        this.cb = new CyclicBuffer<>(this.maxSize);
        super.start();
    }

    @Override // ch.qos.logback.core.AppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        this.cb = null;
        super.stop();
    }

    @Override // ch.qos.logback.core.AppenderBase
    protected void append(E e) {
        if (isStarted()) {
            this.cb.add(e);
        }
    }

    public int getLength() {
        if (isStarted()) {
            return this.cb.length();
        }
        return 0;
    }

    public E get(int i) {
        if (isStarted()) {
            return this.cb.get(i);
        }
        return null;
    }

    public void reset() {
        this.cb.clear();
    }

    public int getMaxSize() {
        return this.maxSize;
    }

    public void setMaxSize(int i) {
        this.maxSize = i;
    }
}
