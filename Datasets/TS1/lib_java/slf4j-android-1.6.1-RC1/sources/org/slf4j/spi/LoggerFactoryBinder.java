package org.slf4j.spi;

import org.slf4j.ILoggerFactory;

/* loaded from: slf4j-android-1.6.1-RC1.jar:org/slf4j/spi/LoggerFactoryBinder.class */
public interface LoggerFactoryBinder {
    ILoggerFactory getLoggerFactory();

    String getLoggerFactoryClassStr();
}
