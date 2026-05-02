package org.acra.log;

/* loaded from: acra-4.5.0.jar:org/acra/log/ACRALog.class */
public interface ACRALog {
    int v(String str, String str2);

    int v(String str, String str2, Throwable th);

    int d(String str, String str2);

    int d(String str, String str2, Throwable th);

    int i(String str, String str2);

    int i(String str, String str2, Throwable th);

    int w(String str, String str2);

    int w(String str, String str2, Throwable th);

    int w(String str, Throwable th);

    int e(String str, String str2);

    int e(String str, String str2, Throwable th);

    String getStackTraceString(Throwable th);
}
