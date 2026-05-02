package org.slf4j.impl;

import org.slf4j.helpers.FormattingTuple;
import org.slf4j.helpers.MarkerIgnoringBase;
import org.slf4j.helpers.MessageFormatter;

/* loaded from: slf4j-simple-1.6.1.jar:org/slf4j/impl/SimpleLogger.class */
public class SimpleLogger extends MarkerIgnoringBase {
    private static final long serialVersionUID = -6560244151660620173L;
    private static long startTime = System.currentTimeMillis();
    public static final String LINE_SEPARATOR = System.getProperty("line.separator");
    private static String INFO_STR = "INFO";
    private static String WARN_STR = "WARN";
    private static String ERROR_STR = "ERROR";

    SimpleLogger(String name) {
        this.name = name;
    }

    public boolean isTraceEnabled() {
        return false;
    }

    public void trace(String msg) {
    }

    public void trace(String format, Object param1) {
    }

    public void trace(String format, Object param1, Object param2) {
    }

    public void trace(String format, Object[] argArray) {
    }

    public void trace(String msg, Throwable t) {
    }

    public boolean isDebugEnabled() {
        return false;
    }

    public void debug(String msg) {
    }

    public void debug(String format, Object param1) {
    }

    public void debug(String format, Object param1, Object param2) {
    }

    public void debug(String format, Object[] argArray) {
    }

    public void debug(String msg, Throwable t) {
    }

    private void log(String level, String message, Throwable t) {
        StringBuffer buf = new StringBuffer();
        long millis = System.currentTimeMillis();
        buf.append(millis - startTime);
        buf.append(" [");
        buf.append(Thread.currentThread().getName());
        buf.append("] ");
        buf.append(level);
        buf.append(" ");
        buf.append(this.name);
        buf.append(" - ");
        buf.append(message);
        buf.append(LINE_SEPARATOR);
        System.err.print(buf.toString());
        if (t != null) {
            t.printStackTrace(System.err);
        }
        System.err.flush();
    }

    private void formatAndLog(String level, String format, Object arg1, Object arg2) {
        FormattingTuple tp = MessageFormatter.format(format, arg1, arg2);
        log(level, tp.getMessage(), tp.getThrowable());
    }

    private void formatAndLog(String level, String format, Object[] argArray) {
        FormattingTuple tp = MessageFormatter.arrayFormat(format, argArray);
        log(level, tp.getMessage(), tp.getThrowable());
    }

    public boolean isInfoEnabled() {
        return true;
    }

    public void info(String msg) {
        log(INFO_STR, msg, null);
    }

    public void info(String format, Object arg) {
        formatAndLog(INFO_STR, format, arg, null);
    }

    public void info(String format, Object arg1, Object arg2) {
        formatAndLog(INFO_STR, format, arg1, arg2);
    }

    public void info(String format, Object[] argArray) {
        formatAndLog(INFO_STR, format, argArray);
    }

    public void info(String msg, Throwable t) {
        log(INFO_STR, msg, t);
    }

    public boolean isWarnEnabled() {
        return true;
    }

    public void warn(String msg) {
        log(WARN_STR, msg, null);
    }

    public void warn(String format, Object arg) {
        formatAndLog(WARN_STR, format, arg, null);
    }

    public void warn(String format, Object arg1, Object arg2) {
        formatAndLog(WARN_STR, format, arg1, arg2);
    }

    public void warn(String format, Object[] argArray) {
        formatAndLog(WARN_STR, format, argArray);
    }

    public void warn(String msg, Throwable t) {
        log(WARN_STR, msg, t);
    }

    public boolean isErrorEnabled() {
        return true;
    }

    public void error(String msg) {
        log(ERROR_STR, msg, null);
    }

    public void error(String format, Object arg) {
        formatAndLog(ERROR_STR, format, arg, null);
    }

    public void error(String format, Object arg1, Object arg2) {
        formatAndLog(ERROR_STR, format, arg1, arg2);
    }

    public void error(String format, Object[] argArray) {
        formatAndLog(ERROR_STR, format, argArray);
    }

    public void error(String msg, Throwable t) {
        log(ERROR_STR, msg, t);
    }
}
