package ch.qos.logback.core.status;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/status/ErrorStatus.class */
public class ErrorStatus extends StatusBase {
    public ErrorStatus(String str, Object obj) {
        super(2, str, obj);
    }

    public ErrorStatus(String str, Object obj, Throwable th) {
        super(2, str, obj, th);
    }
}
