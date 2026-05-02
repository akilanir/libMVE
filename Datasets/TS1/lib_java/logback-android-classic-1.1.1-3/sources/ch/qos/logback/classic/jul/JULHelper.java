package ch.qos.logback.classic.jul;

import java.util.logging.Level;
import java.util.logging.Logger;

@Deprecated
/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/jul/JULHelper.class */
public class JULHelper {
    public static final boolean isRegularNonRootLogger(Logger logger) {
        return (logger == null || logger.getName().equals("")) ? false : true;
    }

    public static final boolean isRoot(Logger logger) {
        if (logger == null) {
            return false;
        }
        return logger.getName().equals("");
    }

    public static Level asJULLevel(ch.qos.logback.classic.Level level) {
        if (level == null) {
            throw new IllegalArgumentException("Unexpected level [null]");
        }
        switch (level.levelInt) {
            case ch.qos.logback.classic.Level.ALL_INT /* -2147483648 */:
                return Level.ALL;
            case ch.qos.logback.classic.Level.TRACE_INT /* 5000 */:
                return Level.FINEST;
            case ch.qos.logback.classic.Level.DEBUG_INT /* 10000 */:
                return Level.FINE;
            case ch.qos.logback.classic.Level.INFO_INT /* 20000 */:
                return Level.INFO;
            case ch.qos.logback.classic.Level.WARN_INT /* 30000 */:
                return Level.WARNING;
            case ch.qos.logback.classic.Level.ERROR_INT /* 40000 */:
                return Level.SEVERE;
            case ch.qos.logback.classic.Level.OFF_INT /* 2147483647 */:
                return Level.OFF;
            default:
                throw new IllegalArgumentException("Unexpected level [" + level + "]");
        }
    }

    public static String asJULLoggerName(String str) {
        return "ROOT".equals(str) ? "" : str;
    }

    public static Logger asJULLogger(String str) {
        return Logger.getLogger(asJULLoggerName(str));
    }

    public static Logger asJULLogger(ch.qos.logback.classic.Logger logger) {
        return asJULLogger(logger.getName());
    }
}
