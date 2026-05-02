package ch.qos.logback.core.filter;

import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.spi.FilterReply;
import ch.qos.logback.core.spi.LifeCycle;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/filter/Filter.class */
public abstract class Filter<E> extends ContextAwareBase implements LifeCycle {
    private String name;
    boolean start = false;

    public void start() {
        this.start = true;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public boolean isStarted() {
        return this.start;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        this.start = false;
    }

    public abstract FilterReply decide(E e);

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }
}
