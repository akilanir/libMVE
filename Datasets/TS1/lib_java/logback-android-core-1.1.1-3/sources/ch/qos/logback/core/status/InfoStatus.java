package ch.qos.logback.core.status;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/status/InfoStatus.class */
public class InfoStatus extends StatusBase {
    public InfoStatus(String str, Object obj) {
        super(0, str, obj);
    }

    public InfoStatus(String str, Object obj, Throwable th) {
        super(0, str, obj, th);
    }
}
