package org.slf4j.impl;

import org.slf4j.ILoggerFactory;
import org.slf4j.spi.LoggerFactoryBinder;

/* loaded from: slf4j-android-1.7.7.jar:org/slf4j/impl/StaticLoggerBinder.class */
public class StaticLoggerBinder implements LoggerFactoryBinder {
    private static final StaticLoggerBinder SINGLETON = new StaticLoggerBinder();
    public static String REQUESTED_API_VERSION = "1.6.99";
    private static final String loggerFactoryClassStr = AndroidLoggerFactory.class.getName();
    private final ILoggerFactory loggerFactory = new AndroidLoggerFactory();

    public static StaticLoggerBinder getSingleton() {
        return SINGLETON;
    }

    private StaticLoggerBinder() {
    }

    public ILoggerFactory getLoggerFactory() {
        return this.loggerFactory;
    }

    public String getLoggerFactoryClassStr() {
        return loggerFactoryClassStr;
    }
}
