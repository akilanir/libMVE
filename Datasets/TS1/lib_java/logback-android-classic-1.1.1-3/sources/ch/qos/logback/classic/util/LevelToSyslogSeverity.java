package ch.qos.logback.classic.util;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.spi.ILoggingEvent;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/util/LevelToSyslogSeverity.class */
public class LevelToSyslogSeverity {
    public static int convert(ILoggingEvent iLoggingEvent) {
        Level level = iLoggingEvent.getLevel();
        switch (level.levelInt) {
            case Level.TRACE_INT /* 5000 */:
            case Level.DEBUG_INT /* 10000 */:
                return 7;
            case Level.INFO_INT /* 20000 */:
                return 6;
            case Level.WARN_INT /* 30000 */:
                return 4;
            case Level.ERROR_INT /* 40000 */:
                return 3;
            default:
                throw new IllegalArgumentException("Level " + level + " is not a valid level for a printing method");
        }
    }
}
