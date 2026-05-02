package org.slf4j.impl;

import org.slf4j.ILoggerFactory;
import org.slf4j.spi.LoggerFactoryBinder;

/* loaded from: slf4j-simple-1.6.1.jar:org/slf4j/impl/StaticLoggerBinder.class */
public class StaticLoggerBinder implements LoggerFactoryBinder {
    private static final StaticLoggerBinder SINGLETON = new StaticLoggerBinder();
    public static String REQUESTED_API_VERSION = "1.6";
    private static final String loggerFactoryClassStr;
    private final ILoggerFactory loggerFactory = new SimpleLoggerFactory();
    static Class class$org$slf4j$impl$SimpleLoggerFactory;

    static {
        Class cls;
        if (class$org$slf4j$impl$SimpleLoggerFactory == null) {
            cls = class$("org.slf4j.impl.SimpleLoggerFactory");
            class$org$slf4j$impl$SimpleLoggerFactory = cls;
        } else {
            cls = class$org$slf4j$impl$SimpleLoggerFactory;
        }
        loggerFactoryClassStr = cls.getName();
    }

    public static final StaticLoggerBinder getSingleton() {
        return SINGLETON;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
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
