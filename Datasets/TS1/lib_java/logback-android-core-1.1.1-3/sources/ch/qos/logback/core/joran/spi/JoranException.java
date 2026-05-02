package ch.qos.logback.core.joran.spi;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/spi/JoranException.class */
public class JoranException extends Exception {
    private static final long serialVersionUID = 1112493363728774021L;

    public JoranException(String str) {
        super(str);
    }

    public JoranException(String str, Throwable th) {
        super(str, th);
    }
}
