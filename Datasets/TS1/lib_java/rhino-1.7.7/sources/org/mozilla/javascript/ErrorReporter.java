package org.mozilla.javascript;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ErrorReporter.class */
public interface ErrorReporter {
    void warning(String str, String str2, int i, String str3, int i2);

    void error(String str, String str2, int i, String str3, int i2);

    EvaluatorException runtimeError(String str, String str2, int i, String str3, int i2);
}
