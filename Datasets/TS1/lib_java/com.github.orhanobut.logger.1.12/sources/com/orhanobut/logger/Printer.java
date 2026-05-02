package com.orhanobut.logger;

/* loaded from: com.github.orhanobut.logger.1.12.jar:com/orhanobut/logger/Printer.class */
public interface Printer {
    Printer t(String str, int i);

    Settings init(String str);

    Settings getSettings();

    void d(String str, Object... objArr);

    void e(String str, Object... objArr);

    void e(Throwable th, String str, Object... objArr);

    void w(String str, Object... objArr);

    void i(String str, Object... objArr);

    void v(String str, Object... objArr);

    void wtf(String str, Object... objArr);

    void json(String str);

    void xml(String str);

    void clear();
}
