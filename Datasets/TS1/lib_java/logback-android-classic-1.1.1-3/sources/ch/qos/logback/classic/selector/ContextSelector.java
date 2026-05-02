package ch.qos.logback.classic.selector;

import ch.qos.logback.classic.LoggerContext;
import java.util.List;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/selector/ContextSelector.class */
public interface ContextSelector {
    LoggerContext getLoggerContext();

    LoggerContext getLoggerContext(String str);

    LoggerContext getDefaultLoggerContext();

    LoggerContext detachLoggerContext(String str);

    List<String> getContextNames();
}
