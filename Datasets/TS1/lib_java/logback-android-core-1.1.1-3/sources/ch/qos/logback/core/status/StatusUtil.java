package ch.qos.logback.core.status;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.CoreConstants;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/status/StatusUtil.class */
public class StatusUtil {
    StatusManager sm;

    public StatusUtil(StatusManager statusManager) {
        this.sm = statusManager;
    }

    public StatusUtil(Context context) {
        this.sm = context.getStatusManager();
    }

    public static boolean contextHasStatusListener(Context context) {
        List<StatusListener> copyOfStatusListenerList;
        StatusManager statusManager = context.getStatusManager();
        return (statusManager == null || (copyOfStatusListenerList = statusManager.getCopyOfStatusListenerList()) == null || copyOfStatusListenerList.size() == 0) ? false : true;
    }

    public static List<Status> filterStatusListByTimeThreshold(List<Status> list, long j) {
        ArrayList arrayList = new ArrayList();
        for (Status status : list) {
            if (status.getDate().longValue() >= j) {
                arrayList.add(status);
            }
        }
        return arrayList;
    }

    public void addStatus(Status status) {
        if (this.sm != null) {
            this.sm.add(status);
        }
    }

    public void addInfo(Object obj, String str) {
        addStatus(new InfoStatus(str, obj));
    }

    public void addWarn(Object obj, String str) {
        addStatus(new WarnStatus(str, obj));
    }

    public void addError(Object obj, String str, Throwable th) {
        addStatus(new ErrorStatus(str, obj, th));
    }

    public boolean hasXMLParsingErrors(long j) {
        return containsMatch(j, 2, CoreConstants.XML_PARSING);
    }

    public boolean noXMLParsingErrorsOccurred(long j) {
        return !hasXMLParsingErrors(j);
    }

    public int getHighestLevel(long j) {
        int i = 0;
        for (Status status : filterStatusListByTimeThreshold(this.sm.getCopyOfStatusList(), j)) {
            if (status.getLevel() > i) {
                i = status.getLevel();
            }
        }
        return i;
    }

    public boolean isErrorFree(long j) {
        return 2 > getHighestLevel(j);
    }

    public boolean containsMatch(long j, int i, String str) {
        List<Status> filterStatusListByTimeThreshold = filterStatusListByTimeThreshold(this.sm.getCopyOfStatusList(), j);
        Pattern compile = Pattern.compile(str);
        for (Status status : filterStatusListByTimeThreshold) {
            if (i == status.getLevel() && compile.matcher(status.getMessage()).lookingAt()) {
                return true;
            }
        }
        return false;
    }

    public boolean containsMatch(int i, String str) {
        return containsMatch(0L, i, str);
    }

    public boolean containsMatch(String str) {
        Pattern compile = Pattern.compile(str);
        Iterator<Status> it = this.sm.getCopyOfStatusList().iterator();
        while (it.hasNext()) {
            if (compile.matcher(it.next().getMessage()).lookingAt()) {
                return true;
            }
        }
        return false;
    }

    public int matchCount(String str) {
        int i = 0;
        Pattern compile = Pattern.compile(str);
        Iterator<Status> it = this.sm.getCopyOfStatusList().iterator();
        while (it.hasNext()) {
            if (compile.matcher(it.next().getMessage()).lookingAt()) {
                i++;
            }
        }
        return i;
    }

    public boolean containsException(Class<?> cls) {
        Iterator<Status> it = this.sm.getCopyOfStatusList().iterator();
        while (it.hasNext()) {
            Throwable throwable = it.next().getThrowable();
            if (throwable != null && throwable.getClass().getName().equals(cls.getName())) {
                return true;
            }
        }
        return false;
    }

    public long timeOfLastReset() {
        List<Status> copyOfStatusList = this.sm.getCopyOfStatusList();
        if (copyOfStatusList == null) {
            return -1L;
        }
        for (int size = copyOfStatusList.size() - 1; size >= 0; size--) {
            Status status = copyOfStatusList.get(size);
            if (CoreConstants.RESET_MSG_PREFIX.equals(status.getMessage())) {
                return status.getDate().longValue();
            }
        }
        return -1L;
    }
}
