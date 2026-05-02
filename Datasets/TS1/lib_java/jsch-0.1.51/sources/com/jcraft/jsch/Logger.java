package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Logger.class */
public interface Logger {
    public static final int DEBUG = 0;
    public static final int INFO = 1;
    public static final int WARN = 2;
    public static final int ERROR = 3;
    public static final int FATAL = 4;

    boolean isEnabled(int i);

    void log(int i, String str);
}
