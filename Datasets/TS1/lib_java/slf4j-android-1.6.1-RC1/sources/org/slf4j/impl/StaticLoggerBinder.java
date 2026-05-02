package org.slf4j.impl;

import org.slf4j.ILoggerFactory;
import org.slf4j.spi.LoggerFactoryBinder;

/* loaded from: slf4j-android-1.6.1-RC1.jar:org/slf4j/impl/StaticLoggerBinder.class */
public class StaticLoggerBinder implements LoggerFactoryBinder {
    private static final StaticLoggerBinder SINGLETON = new StaticLoggerBinder();
    public static String REQUESTED_API_VERSION = "1.6";
    private static final String loggerFactoryClassStr = AndroidLoggerFactory.class.getName();
    private final ILoggerFactory loggerFactory = new AndroidLoggerFactory();

    public static final StaticLoggerBinder getSingleton() {
        return SINGLETON;
    }

    private StaticLoggerBinder() {
    }

    @Override // org.slf4j.spi.LoggerFactoryBinder
    public ILoggerFactory getLoggerFactory() {
        return this.loggerFactory;
    }

    @Override // org.slf4j.spi.LoggerFactoryBinder
    public String getLoggerFactoryClassStr() {
        return loggerFactoryClassStr;
    }
}
