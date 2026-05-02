package ch.qos.logback.classic.spi;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/STEUtil.class */
public class STEUtil {
    static int findNumberOfCommonFrames(StackTraceElement[] stackTraceElementArr, StackTraceElementProxy[] stackTraceElementProxyArr) {
        if (stackTraceElementProxyArr == null) {
            return 0;
        }
        int length = stackTraceElementArr.length - 1;
        int i = 0;
        for (int length2 = stackTraceElementProxyArr.length - 1; length >= 0 && length2 >= 0 && stackTraceElementArr[length].equals(stackTraceElementProxyArr[length2].ste); length2--) {
            i++;
            length--;
        }
        return i;
    }
}
