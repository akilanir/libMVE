package org.slf4j.impl;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.util.ContextInitializer;
import ch.qos.logback.classic.util.ContextSelectorStaticBinder;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.status.StatusUtil;
import ch.qos.logback.core.util.StatusPrinter;
import org.slf4j.ILoggerFactory;
import org.slf4j.helpers.Util;
import org.slf4j.spi.LoggerFactoryBinder;

/* loaded from: logback-android-classic-1.1.1-3.jar:org/slf4j/impl/StaticLoggerBinder.class */
public class StaticLoggerBinder implements LoggerFactoryBinder {
    static final String NULL_CS_URL = "http://logback.qos.ch/codes.html#null_CS";
    private boolean initialized = false;
    private LoggerContext defaultLoggerContext = new LoggerContext();
    private final ContextSelectorStaticBinder contextSelectorBinder = ContextSelectorStaticBinder.getSingleton();
    public static String REQUESTED_API_VERSION = "1.6";
    private static StaticLoggerBinder SINGLETON = new StaticLoggerBinder();
    private static Object KEY = new Object();

    private StaticLoggerBinder() {
        this.defaultLoggerContext.setName("default");
    }

    public static StaticLoggerBinder getSingleton() {
        return SINGLETON;
    }

    static void reset() {
        SINGLETON = new StaticLoggerBinder();
        SINGLETON.init();
    }

    void init() {
        try {
            try {
                new ContextInitializer(this.defaultLoggerContext).autoConfig();
            } catch (JoranException e) {
                Util.report("Failed to auto configure default logger context", e);
            }
            if (!StatusUtil.contextHasStatusListener(this.defaultLoggerContext)) {
                StatusPrinter.printInCaseOfErrorsOrWarnings(this.defaultLoggerContext);
            }
            this.contextSelectorBinder.init(this.defaultLoggerContext, KEY);
            this.initialized = true;
        } catch (Throwable th) {
            Util.report("Failed to instantiate [" + LoggerContext.class.getName() + "]", th);
        }
    }

    public ILoggerFactory getLoggerFactory() {
        if (!this.initialized) {
            return this.defaultLoggerContext;
        }
        if (this.contextSelectorBinder.getContextSelector() == null) {
            throw new IllegalStateException("contextSelector cannot be null. See also http://logback.qos.ch/codes.html#null_CS");
        }
        return this.contextSelectorBinder.getContextSelector().getLoggerContext();
    }

    public String getLoggerFactoryClassStr() {
        return this.contextSelectorBinder.getClass().getName();
    }

    static {
        SINGLETON.init();
    }
}
