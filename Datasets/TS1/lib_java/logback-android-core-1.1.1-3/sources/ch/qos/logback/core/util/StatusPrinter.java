package ch.qos.logback.core.util;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.helpers.ThrowableToStringArray;
import ch.qos.logback.core.status.Status;
import ch.qos.logback.core.status.StatusManager;
import ch.qos.logback.core.status.StatusUtil;
import java.io.PrintStream;
import java.util.Iterator;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/StatusPrinter.class */
public class StatusPrinter {
    private static PrintStream ps = System.out;
    static CachingDateFormatter cachingDateFormat = new CachingDateFormatter("HH:mm:ss,SSS");

    public static void setPrintStream(PrintStream printStream) {
        ps = printStream;
    }

    public static void printInCaseOfErrorsOrWarnings(Context context) {
        printInCaseOfErrorsOrWarnings(context, 0L);
    }

    public static void printInCaseOfErrorsOrWarnings(Context context, long j) {
        if (context == null) {
            throw new IllegalArgumentException("Context argument cannot be null");
        }
        StatusManager statusManager = context.getStatusManager();
        if (statusManager == null) {
            ps.println("WARN: Context named \"" + context.getName() + "\" has no status manager");
        } else if (new StatusUtil(context).getHighestLevel(j) >= 1) {
            print(statusManager, j);
        }
    }

    public static void printIfErrorsOccured(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("Context argument cannot be null");
        }
        StatusManager statusManager = context.getStatusManager();
        if (statusManager == null) {
            ps.println("WARN: Context named \"" + context.getName() + "\" has no status manager");
        } else if (new StatusUtil(context).getHighestLevel(0L) == 2) {
            print(statusManager);
        }
    }

    public static void print(Context context) {
        print(context, 0L);
    }

    public static void print(Context context, long j) {
        if (context == null) {
            throw new IllegalArgumentException("Context argument cannot be null");
        }
        StatusManager statusManager = context.getStatusManager();
        if (statusManager == null) {
            ps.println("WARN: Context named \"" + context.getName() + "\" has no status manager");
        } else {
            print(statusManager, j);
        }
    }

    public static void print(StatusManager statusManager) {
        print(statusManager, 0L);
    }

    public static void print(StatusManager statusManager, long j) {
        StringBuilder sb = new StringBuilder();
        buildStrFromStatusList(sb, StatusUtil.filterStatusListByTimeThreshold(statusManager.getCopyOfStatusList(), j));
        ps.println(sb.toString());
    }

    public static void print(List<Status> list) {
        StringBuilder sb = new StringBuilder();
        buildStrFromStatusList(sb, list);
        ps.println(sb.toString());
    }

    private static void buildStrFromStatusList(StringBuilder sb, List<Status> list) {
        if (list == null) {
            return;
        }
        Iterator<Status> it = list.iterator();
        while (it.hasNext()) {
            buildStr(sb, CoreConstants.EMPTY_STRING, it.next());
        }
    }

    private static void appendThrowable(StringBuilder sb, Throwable th) {
        for (String str : ThrowableToStringArray.convert(th)) {
            if (!str.startsWith(CoreConstants.CAUSED_BY)) {
                if (Character.isDigit(str.charAt(0))) {
                    sb.append("\t... ");
                } else {
                    sb.append("\tat ");
                }
            }
            sb.append(str).append(CoreConstants.LINE_SEPARATOR);
        }
    }

    public static void buildStr(StringBuilder sb, String str, Status status) {
        String str2 = status.hasChildren() ? str + "+ " : str + "|-";
        if (cachingDateFormat != null) {
            sb.append(cachingDateFormat.format(status.getDate().longValue())).append(" ");
        }
        sb.append(str2).append(status).append(CoreConstants.LINE_SEPARATOR);
        if (status.getThrowable() != null) {
            appendThrowable(sb, status.getThrowable());
        }
        if (status.hasChildren()) {
            Iterator<Status> it = status.iterator();
            while (it.hasNext()) {
                buildStr(sb, str + "  ", it.next());
            }
        }
    }
}
