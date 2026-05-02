package ch.qos.logback.core.status;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/status/WarnStatus.class */
public class WarnStatus extends StatusBase {
    public WarnStatus(String str, Object obj) {
        super(1, str, obj);
    }

    public WarnStatus(String str, Object obj, Throwable th) {
        super(1, str, obj, th);
    }
}
