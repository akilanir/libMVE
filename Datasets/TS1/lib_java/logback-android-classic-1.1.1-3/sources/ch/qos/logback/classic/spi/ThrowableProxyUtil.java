package ch.qos.logback.classic.spi;

import ch.qos.logback.core.CoreConstants;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/ThrowableProxyUtil.class */
public class ThrowableProxyUtil {
    public static final int REGULAR_EXCEPTION_INDENT = 1;
    public static final int SUPPRESSED_EXCEPTION_INDENT = 1;
    private static final int BUILDER_CAPACITY = 2048;

    public static void build(ThrowableProxy throwableProxy, Throwable th, ThrowableProxy throwableProxy2) {
        StackTraceElement[] stackTrace = th.getStackTrace();
        int i = -1;
        if (throwableProxy2 != null) {
            i = findNumberOfCommonFrames(stackTrace, throwableProxy2.getStackTraceElementProxyArray());
        }
        throwableProxy.commonFrames = i;
        throwableProxy.stackTraceElementProxyArray = steArrayToStepArray(stackTrace);
    }

    static StackTraceElementProxy[] steArrayToStepArray(StackTraceElement[] stackTraceElementArr) {
        if (stackTraceElementArr == null) {
            return new StackTraceElementProxy[0];
        }
        StackTraceElementProxy[] stackTraceElementProxyArr = new StackTraceElementProxy[stackTraceElementArr.length];
        for (int i = 0; i < stackTraceElementProxyArr.length; i++) {
            stackTraceElementProxyArr[i] = new StackTraceElementProxy(stackTraceElementArr[i]);
        }
        return stackTraceElementProxyArr;
    }

    static int findNumberOfCommonFrames(StackTraceElement[] stackTraceElementArr, StackTraceElementProxy[] stackTraceElementProxyArr) {
        if (stackTraceElementProxyArr == null || stackTraceElementArr == null) {
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

    public static String asString(IThrowableProxy iThrowableProxy) {
        StringBuilder sb = new StringBuilder(BUILDER_CAPACITY);
        recursiveAppend(sb, null, 1, iThrowableProxy);
        return sb.toString();
    }

    private static void recursiveAppend(StringBuilder sb, String str, int i, IThrowableProxy iThrowableProxy) {
        if (iThrowableProxy == null) {
            return;
        }
        subjoinFirstLine(sb, str, i, iThrowableProxy);
        sb.append(CoreConstants.LINE_SEPARATOR);
        subjoinSTEPArray(sb, i, iThrowableProxy);
        IThrowableProxy[] suppressed = iThrowableProxy.getSuppressed();
        if (suppressed != null) {
            for (IThrowableProxy iThrowableProxy2 : suppressed) {
                recursiveAppend(sb, "Suppressed: ", i + 1, iThrowableProxy2);
            }
        }
        recursiveAppend(sb, "Caused by: ", i, iThrowableProxy.getCause());
    }

    public static void indent(StringBuilder sb, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            sb.append('\t');
        }
    }

    private static void subjoinFirstLine(StringBuilder sb, String str, int i, IThrowableProxy iThrowableProxy) {
        indent(sb, i - 1);
        if (str != null) {
            sb.append(str);
        }
        subjoinExceptionMessage(sb, iThrowableProxy);
    }

    public static void subjoinPackagingData(StringBuilder sb, StackTraceElementProxy stackTraceElementProxy) {
        ClassPackagingData classPackagingData;
        if (stackTraceElementProxy == null || (classPackagingData = stackTraceElementProxy.getClassPackagingData()) == null) {
            return;
        }
        if (classPackagingData.isExact()) {
            sb.append(" [");
        } else {
            sb.append(" ~[");
        }
        sb.append(classPackagingData.getCodeLocation()).append(':').append(classPackagingData.getVersion()).append(']');
    }

    public static void subjoinSTEP(StringBuilder sb, StackTraceElementProxy stackTraceElementProxy) {
        sb.append(stackTraceElementProxy.toString());
        subjoinPackagingData(sb, stackTraceElementProxy);
    }

    public static void subjoinSTEPArray(StringBuilder sb, IThrowableProxy iThrowableProxy) {
        subjoinSTEPArray(sb, 1, iThrowableProxy);
    }

    public static void subjoinSTEPArray(StringBuilder sb, int i, IThrowableProxy iThrowableProxy) {
        StackTraceElementProxy[] stackTraceElementProxyArray = iThrowableProxy.getStackTraceElementProxyArray();
        int commonFrames = iThrowableProxy.getCommonFrames();
        for (int i2 = 0; i2 < stackTraceElementProxyArray.length - commonFrames; i2++) {
            StackTraceElementProxy stackTraceElementProxy = stackTraceElementProxyArray[i2];
            indent(sb, i);
            subjoinSTEP(sb, stackTraceElementProxy);
            sb.append(CoreConstants.LINE_SEPARATOR);
        }
        if (commonFrames > 0) {
            indent(sb, i);
            sb.append("... ").append(commonFrames).append(" common frames omitted").append(CoreConstants.LINE_SEPARATOR);
        }
    }

    public static void subjoinFirstLine(StringBuilder sb, IThrowableProxy iThrowableProxy) {
        if (iThrowableProxy.getCommonFrames() > 0) {
            sb.append("Caused by: ");
        }
        subjoinExceptionMessage(sb, iThrowableProxy);
    }

    public static void subjoinFirstLineRootCauseFirst(StringBuilder sb, IThrowableProxy iThrowableProxy) {
        if (iThrowableProxy.getCause() != null) {
            sb.append("Wrapped by: ");
        }
        subjoinExceptionMessage(sb, iThrowableProxy);
    }

    private static void subjoinExceptionMessage(StringBuilder sb, IThrowableProxy iThrowableProxy) {
        sb.append(iThrowableProxy.getClassName()).append(": ").append(iThrowableProxy.getMessage());
    }
}
