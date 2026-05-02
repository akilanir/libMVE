package ch.qos.logback.core;

import ch.qos.logback.core.spi.ContextAware;
import ch.qos.logback.core.spi.FilterAttachable;
import ch.qos.logback.core.spi.LifeCycle;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/Appender.class */
public interface Appender<E> extends LifeCycle, ContextAware, FilterAttachable<E> {
    String getName();

    void doAppend(E e) throws LogbackException;

    void setName(String str);
}
