package ch.qos.logback.classic.util;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.spi.ContextAware;
import ch.qos.logback.core.spi.LifeCycle;
import ch.qos.logback.core.status.StatusListener;
import ch.qos.logback.core.util.OptionHelper;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/util/StatusListenerConfigHelper.class */
public class StatusListenerConfigHelper {
    static void installIfAsked(LoggerContext loggerContext) {
        String systemProperty = OptionHelper.getSystemProperty(ContextInitializer.STATUS_LISTENER_CLASS);
        if (OptionHelper.isEmpty(systemProperty)) {
            return;
        }
        addStatusListener(loggerContext, systemProperty);
    }

    private static void addStatusListener(LoggerContext loggerContext, String str) {
        initListener(loggerContext, createListenerPerClassName(loggerContext, str));
    }

    private static void initListener(LoggerContext loggerContext, StatusListener statusListener) {
        if (statusListener != null) {
            if (statusListener instanceof ContextAware) {
                ((ContextAware) statusListener).setContext(loggerContext);
            }
            if (statusListener instanceof LifeCycle) {
                ((LifeCycle) statusListener).start();
            }
            loggerContext.getStatusManager().add(statusListener);
        }
    }

    private static StatusListener createListenerPerClassName(LoggerContext loggerContext, String str) {
        try {
            return (StatusListener) OptionHelper.instantiateByClassName(str, StatusListener.class, loggerContext);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
