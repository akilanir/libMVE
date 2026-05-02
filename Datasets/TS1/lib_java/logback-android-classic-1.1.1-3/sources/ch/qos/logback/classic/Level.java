package ch.qos.logback.classic;

import java.io.Serializable;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/Level.class */
public final class Level implements Serializable {
    private static final long serialVersionUID = -814092767334282137L;
    public final int levelInt;
    public final String levelStr;
    public static final int OFF_INT = Integer.MAX_VALUE;
    public static final Integer OFF_INTEGER = Integer.valueOf(OFF_INT);
    public static final int ERROR_INT = 40000;
    public static final Integer ERROR_INTEGER = Integer.valueOf(ERROR_INT);
    public static final int WARN_INT = 30000;
    public static final Integer WARN_INTEGER = Integer.valueOf(WARN_INT);
    public static final int INFO_INT = 20000;
    public static final Integer INFO_INTEGER = Integer.valueOf(INFO_INT);
    public static final int DEBUG_INT = 10000;
    public static final Integer DEBUG_INTEGER = Integer.valueOf(DEBUG_INT);
    public static final int TRACE_INT = 5000;
    public static final Integer TRACE_INTEGER = Integer.valueOf(TRACE_INT);
    public static final int ALL_INT = Integer.MIN_VALUE;
    public static final Integer ALL_INTEGER = Integer.valueOf(ALL_INT);
    public static final Level OFF = new Level(OFF_INT, "OFF");
    public static final Level ERROR = new Level(ERROR_INT, "ERROR");
    public static final Level WARN = new Level(WARN_INT, "WARN");
    public static final Level INFO = new Level(INFO_INT, "INFO");
    public static final Level DEBUG = new Level(DEBUG_INT, "DEBUG");
    public static final Level TRACE = new Level(TRACE_INT, "TRACE");
    public static final Level ALL = new Level(ALL_INT, "ALL");

    private Level(int i, String str) {
        this.levelInt = i;
        this.levelStr = str;
    }

    public String toString() {
        return this.levelStr;
    }

    public int toInt() {
        return this.levelInt;
    }

    public Integer toInteger() {
        switch (this.levelInt) {
            case ALL_INT /* -2147483648 */:
                return ALL_INTEGER;
            case TRACE_INT /* 5000 */:
                return TRACE_INTEGER;
            case DEBUG_INT /* 10000 */:
                return DEBUG_INTEGER;
            case INFO_INT /* 20000 */:
                return INFO_INTEGER;
            case WARN_INT /* 30000 */:
                return WARN_INTEGER;
            case ERROR_INT /* 40000 */:
                return ERROR_INTEGER;
            case OFF_INT /* 2147483647 */:
                return OFF_INTEGER;
            default:
                throw new IllegalStateException("Level " + this.levelStr + ", " + this.levelInt + " is unknown.");
        }
    }

    public boolean isGreaterOrEqual(Level level) {
        return this.levelInt >= level.levelInt;
    }

    public static Level toLevel(String str) {
        return toLevel(str, DEBUG);
    }

    public static Level valueOf(String str) {
        return toLevel(str, DEBUG);
    }

    public static Level toLevel(int i) {
        return toLevel(i, DEBUG);
    }

    public static Level toLevel(int i, Level level) {
        switch (i) {
            case ALL_INT /* -2147483648 */:
                return ALL;
            case TRACE_INT /* 5000 */:
                return TRACE;
            case DEBUG_INT /* 10000 */:
                return DEBUG;
            case INFO_INT /* 20000 */:
                return INFO;
            case WARN_INT /* 30000 */:
                return WARN;
            case ERROR_INT /* 40000 */:
                return ERROR;
            case OFF_INT /* 2147483647 */:
                return OFF;
            default:
                return level;
        }
    }

    public static Level toLevel(String str, Level level) {
        return str == null ? level : str.equalsIgnoreCase("ALL") ? ALL : str.equalsIgnoreCase("TRACE") ? TRACE : str.equalsIgnoreCase("DEBUG") ? DEBUG : str.equalsIgnoreCase("INFO") ? INFO : str.equalsIgnoreCase("WARN") ? WARN : str.equalsIgnoreCase("ERROR") ? ERROR : str.equalsIgnoreCase("OFF") ? OFF : level;
    }

    private Object readResolve() {
        return toLevel(this.levelInt);
    }

    public static Level fromLocationAwareLoggerInteger(int i) {
        Level level;
        switch (i) {
            case 0:
                level = TRACE;
                break;
            case 10:
                level = DEBUG;
                break;
            case 20:
                level = INFO;
                break;
            case 30:
                level = WARN;
                break;
            case 40:
                level = ERROR;
                break;
            default:
                throw new IllegalArgumentException(i + " not a valid level value");
        }
        return level;
    }

    public static int toLocationAwareLoggerInteger(Level level) {
        if (level == null) {
            throw new IllegalArgumentException("null level parameter is not admitted");
        }
        switch (level.toInt()) {
            case TRACE_INT /* 5000 */:
                return 0;
            case DEBUG_INT /* 10000 */:
                return 10;
            case INFO_INT /* 20000 */:
                return 20;
            case WARN_INT /* 30000 */:
                return 30;
            case ERROR_INT /* 40000 */:
                return 40;
            default:
                throw new IllegalArgumentException(level + " not a valid level value");
        }
    }
}
