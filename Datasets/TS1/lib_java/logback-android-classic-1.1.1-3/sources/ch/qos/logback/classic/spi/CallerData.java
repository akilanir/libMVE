package ch.qos.logback.classic.spi;

import ch.qos.logback.core.CoreConstants;
import java.util.Iterator;
import java.util.List;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/CallerData.class */
public class CallerData {
    public static final String NA = "?";
    private static final String LOG4J_CATEGORY = "org.apache.log4j.Category";
    private static final String SLF4J_BOUNDARY = "org.slf4j.Logger";
    public static final int LINE_NA = -1;
    public static final String CALLER_DATA_NA = "?#?:?" + CoreConstants.LINE_SEPARATOR;
    public static final StackTraceElement[] EMPTY_CALLER_DATA_ARRAY = new StackTraceElement[0];

    public static StackTraceElement[] extract(Throwable th, String str, int i, List<String> list) {
        if (th == null) {
            return null;
        }
        StackTraceElement[] stackTrace = th.getStackTrace();
        int i2 = -1;
        for (int i3 = 0; i3 < stackTrace.length; i3++) {
            if (!isInFrameworkSpace(stackTrace[i3].getClassName(), str, list)) {
                if (i2 != -1) {
                    break;
                }
            } else {
                i2 = i3 + 1;
            }
        }
        if (i2 == -1) {
            return EMPTY_CALLER_DATA_ARRAY;
        }
        int length = stackTrace.length - i2;
        int i4 = i < length ? i : length;
        StackTraceElement[] stackTraceElementArr = new StackTraceElement[i4];
        for (int i5 = 0; i5 < i4; i5++) {
            stackTraceElementArr[i5] = stackTrace[i2 + i5];
        }
        return stackTraceElementArr;
    }

    static boolean isInFrameworkSpace(String str, String str2, List<String> list) {
        return str.equals(str2) || str.equals(LOG4J_CATEGORY) || str.startsWith(SLF4J_BOUNDARY) || isInFrameworkSpaceList(str, list);
    }

    private static boolean isInFrameworkSpaceList(String str, List<String> list) {
        if (list == null) {
            return false;
        }
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            if (str.startsWith(it.next())) {
                return true;
            }
        }
        return false;
    }

    public static StackTraceElement naInstance() {
        return new StackTraceElement(NA, NA, NA, -1);
    }
}
