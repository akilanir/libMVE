package ch.qos.logback.classic.selector;

import ch.qos.logback.classic.LoggerContext;
import java.util.Arrays;
import java.util.List;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/selector/DefaultContextSelector.class */
public class DefaultContextSelector implements ContextSelector {
    private LoggerContext defaultLoggerContext;

    public DefaultContextSelector(LoggerContext loggerContext) {
        this.defaultLoggerContext = loggerContext;
    }

    @Override // ch.qos.logback.classic.selector.ContextSelector
    public LoggerContext getLoggerContext() {
        return getDefaultLoggerContext();
    }

    @Override // ch.qos.logback.classic.selector.ContextSelector
    public LoggerContext getDefaultLoggerContext() {
        return this.defaultLoggerContext;
    }

    @Override // ch.qos.logback.classic.selector.ContextSelector
    public LoggerContext detachLoggerContext(String str) {
        return this.defaultLoggerContext;
    }

    @Override // ch.qos.logback.classic.selector.ContextSelector
    public List<String> getContextNames() {
        return Arrays.asList(this.defaultLoggerContext.getName());
    }

    @Override // ch.qos.logback.classic.selector.ContextSelector
    public LoggerContext getLoggerContext(String str) {
        if (this.defaultLoggerContext.getName().equals(str)) {
            return this.defaultLoggerContext;
        }
        return null;
    }
}
