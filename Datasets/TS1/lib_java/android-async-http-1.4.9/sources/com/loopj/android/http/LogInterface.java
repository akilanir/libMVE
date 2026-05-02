package com.loopj.android.http;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/LogInterface.class */
public interface LogInterface {
    public static final int VERBOSE = 2;
    public static final int DEBUG = 3;
    public static final int INFO = 4;
    public static final int WARN = 5;
    public static final int ERROR = 6;
    public static final int WTF = 8;

    boolean isLoggingEnabled();

    void setLoggingEnabled(boolean z);

    int getLoggingLevel();

    void setLoggingLevel(int i);

    boolean shouldLog(int i);

    void v(String str, String str2);

    void v(String str, String str2, Throwable th);

    void d(String str, String str2);

    void d(String str, String str2, Throwable th);

    void i(String str, String str2);

    void i(String str, String str2, Throwable th);

    void w(String str, String str2);

    void w(String str, String str2, Throwable th);

    void e(String str, String str2);

    void e(String str, String str2, Throwable th);

    void wtf(String str, String str2);

    void wtf(String str, String str2, Throwable th);
}
