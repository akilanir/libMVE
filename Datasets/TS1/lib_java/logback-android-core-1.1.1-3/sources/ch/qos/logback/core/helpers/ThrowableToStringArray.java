package ch.qos.logback.core.helpers;

import ch.qos.logback.core.CoreConstants;
import java.util.LinkedList;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/helpers/ThrowableToStringArray.class */
public class ThrowableToStringArray {
    public static String[] convert(Throwable th) {
        LinkedList linkedList = new LinkedList();
        extract(linkedList, th, null);
        return (String[]) linkedList.toArray(new String[0]);
    }

    private static void extract(List<String> list, Throwable th, StackTraceElement[] stackTraceElementArr) {
        StackTraceElement[] stackTrace = th.getStackTrace();
        int findNumberOfCommonFrames = findNumberOfCommonFrames(stackTrace, stackTraceElementArr);
        list.add(formatFirstLine(th, stackTraceElementArr));
        for (int i = 0; i < stackTrace.length - findNumberOfCommonFrames; i++) {
            list.add("\tat " + stackTrace[i].toString());
        }
        if (findNumberOfCommonFrames != 0) {
            list.add("\t... " + findNumberOfCommonFrames + " common frames omitted");
        }
        Throwable cause = th.getCause();
        if (cause != null) {
            extract(list, cause, stackTrace);
        }
    }

    private static String formatFirstLine(Throwable th, StackTraceElement[] stackTraceElementArr) {
        String str = CoreConstants.EMPTY_STRING;
        if (stackTraceElementArr != null) {
            str = CoreConstants.CAUSED_BY;
        }
        String str2 = str + th.getClass().getName();
        if (th.getMessage() != null) {
            str2 = str2 + ": " + th.getMessage();
        }
        return str2;
    }

    private static int findNumberOfCommonFrames(StackTraceElement[] stackTraceElementArr, StackTraceElement[] stackTraceElementArr2) {
        if (stackTraceElementArr2 == null) {
            return 0;
        }
        int length = stackTraceElementArr.length - 1;
        int i = 0;
        for (int length2 = stackTraceElementArr2.length - 1; length >= 0 && length2 >= 0 && stackTraceElementArr[length].equals(stackTraceElementArr2[length2]); length2--) {
            i++;
            length--;
        }
        return i;
    }
}
