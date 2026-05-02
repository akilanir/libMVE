package org.slf4j.impl;

import android.util.Log;
import org.slf4j.helpers.MarkerIgnoringBase;
import org.slf4j.helpers.MessageFormatter;

/* loaded from: slf4j-android-1.6.1-RC1.jar:org/slf4j/impl/AndroidLogger.class */
public class AndroidLogger extends MarkerIgnoringBase {
    private static final long serialVersionUID = -1227274521521287937L;

    AndroidLogger(String name) {
        this.name = name;
    }

    @Override // org.slf4j.Logger
    public boolean isTraceEnabled() {
        return Log.isLoggable(this.name, 2);
    }

    @Override // org.slf4j.Logger
    public void trace(String msg) {
        Log.v(this.name, msg);
    }

    @Override // org.slf4j.Logger
    public void trace(String format, Object param1) {
        Log.v(this.name, format(format, param1, null));
    }

    @Override // org.slf4j.Logger
    public void trace(String format, Object param1, Object param2) {
        Log.v(this.name, format(format, param1, param2));
    }

    @Override // org.slf4j.Logger
    public void trace(String format, Object[] argArray) {
        Log.v(this.name, format(format, argArray));
    }

    @Override // org.slf4j.Logger
    public void trace(String msg, Throwable t) {
        Log.v(this.name, msg, t);
    }

    @Override // org.slf4j.Logger
    public boolean isDebugEnabled() {
        return Log.isLoggable(this.name, 3);
    }

    @Override // org.slf4j.Logger
    public void debug(String msg) {
        Log.d(this.name, msg);
    }

    @Override // org.slf4j.Logger
    public void debug(String format, Object arg1) {
        Log.d(this.name, format(format, arg1, null));
    }

    @Override // org.slf4j.Logger
    public void debug(String format, Object param1, Object param2) {
        Log.d(this.name, format(format, param1, param2));
    }

    @Override // org.slf4j.Logger
    public void debug(String format, Object[] argArray) {
        Log.d(this.name, format(format, argArray));
    }

    @Override // org.slf4j.Logger
    public void debug(String msg, Throwable t) {
        Log.d(this.name, msg, t);
    }

    @Override // org.slf4j.Logger
    public boolean isInfoEnabled() {
        return Log.isLoggable(this.name, 4);
    }

    @Override // org.slf4j.Logger
    public void info(String msg) {
        Log.i(this.name, msg);
    }

    @Override // org.slf4j.Logger
    public void info(String format, Object arg) {
        Log.i(this.name, format(format, arg, null));
    }

    @Override // org.slf4j.Logger
    public void info(String format, Object arg1, Object arg2) {
        Log.i(this.name, format(format, arg1, arg2));
    }

    @Override // org.slf4j.Logger
    public void info(String format, Object[] argArray) {
        Log.i(this.name, format(format, argArray));
    }

    @Override // org.slf4j.Logger
    public void info(String msg, Throwable t) {
        Log.i(this.name, msg, t);
    }

    @Override // org.slf4j.Logger
    public boolean isWarnEnabled() {
        return Log.isLoggable(this.name, 5);
    }

    @Override // org.slf4j.Logger
    public void warn(String msg) {
        Log.w(this.name, msg);
    }

    @Override // org.slf4j.Logger
    public void warn(String format, Object arg) {
        Log.w(this.name, format(format, arg, null));
    }

    @Override // org.slf4j.Logger
    public void warn(String format, Object arg1, Object arg2) {
        Log.w(this.name, format(format, arg1, arg2));
    }

    @Override // org.slf4j.Logger
    public void warn(String format, Object[] argArray) {
        Log.w(this.name, format(format, argArray));
    }

    @Override // org.slf4j.Logger
    public void warn(String msg, Throwable t) {
        Log.w(this.name, msg, t);
    }

    @Override // org.slf4j.Logger
    public boolean isErrorEnabled() {
        return Log.isLoggable(this.name, 6);
    }

    @Override // org.slf4j.Logger
    public void error(String msg) {
        Log.e(this.name, msg);
    }

    @Override // org.slf4j.Logger
    public void error(String format, Object arg) {
        Log.e(this.name, format(format, arg, null));
    }

    @Override // org.slf4j.Logger
    public void error(String format, Object arg1, Object arg2) {
        Log.e(this.name, format(format, arg1, arg2));
    }

    @Override // org.slf4j.Logger
    public void error(String format, Object[] argArray) {
        Log.e(this.name, format(format, argArray));
    }

    @Override // org.slf4j.Logger
    public void error(String msg, Throwable t) {
        Log.e(this.name, msg, t);
    }

    private String format(String format, Object arg1, Object arg2) {
        return MessageFormatter.format(format, arg1, arg2).getMessage();
    }

    private String format(String format, Object[] args) {
        return MessageFormatter.arrayFormat(format, args).getMessage();
    }
}
