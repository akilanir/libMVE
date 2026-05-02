package ch.qos.logback.core.joran.spi;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/spi/NoAutoStartUtil.class */
public class NoAutoStartUtil {
    public static boolean notMarkedWithNoAutoStart(Object obj) {
        return obj != null && ((NoAutoStart) obj.getClass().getAnnotation(NoAutoStart.class)) == null;
    }
}
