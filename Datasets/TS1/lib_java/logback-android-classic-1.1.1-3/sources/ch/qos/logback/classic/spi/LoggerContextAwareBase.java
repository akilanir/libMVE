package ch.qos.logback.classic.spi;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.Context;
import ch.qos.logback.core.spi.ContextAwareBase;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/LoggerContextAwareBase.class */
public class LoggerContextAwareBase extends ContextAwareBase implements LoggerContextAware {
    @Override // ch.qos.logback.classic.spi.LoggerContextAware
    public void setLoggerContext(LoggerContext loggerContext) {
        super.setContext(loggerContext);
    }

    public void setContext(Context context) {
        if (!(context instanceof LoggerContext) && context != null) {
            throw new IllegalArgumentException("LoggerContextAwareBase only accepts contexts of type c.l.classic.LoggerContext");
        }
        super.setContext(context);
    }

    public LoggerContext getLoggerContext() {
        return this.context;
    }
}
