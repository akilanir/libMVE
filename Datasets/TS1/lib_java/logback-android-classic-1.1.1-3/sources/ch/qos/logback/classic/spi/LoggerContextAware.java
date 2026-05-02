package ch.qos.logback.classic.spi;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.spi.ContextAware;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/LoggerContextAware.class */
public interface LoggerContextAware extends ContextAware {
    void setLoggerContext(LoggerContext loggerContext);
}
