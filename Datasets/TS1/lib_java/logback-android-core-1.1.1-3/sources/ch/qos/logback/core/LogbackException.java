package ch.qos.logback.core;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/LogbackException.class */
public class LogbackException extends RuntimeException {
    private static final long serialVersionUID = -799956346239073266L;

    public LogbackException(String str) {
        super(str);
    }

    public LogbackException(String str, Throwable th) {
        super(str, th);
    }
}
