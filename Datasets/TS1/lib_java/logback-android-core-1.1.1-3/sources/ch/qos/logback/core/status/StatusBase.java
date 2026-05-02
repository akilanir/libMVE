package ch.qos.logback.core.status;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/status/StatusBase.class */
public abstract class StatusBase implements Status {
    private static final List<Status> EMPTY_LIST = new ArrayList(0);
    int level;
    final String message;
    final Object origin;
    List<Status> childrenList;
    Throwable throwable;
    long date;

    StatusBase(int i, String str, Object obj) {
        this(i, str, obj, null);
    }

    StatusBase(int i, String str, Object obj, Throwable th) {
        this.level = i;
        this.message = str;
        this.origin = obj;
        this.throwable = th;
        this.date = System.currentTimeMillis();
    }

    @Override // ch.qos.logback.core.status.Status
    public synchronized void add(Status status) {
        if (status == null) {
            throw new NullPointerException("Null values are not valid Status.");
        }
        if (this.childrenList == null) {
            this.childrenList = new ArrayList();
        }
        this.childrenList.add(status);
    }

    @Override // ch.qos.logback.core.status.Status
    public synchronized boolean hasChildren() {
        return this.childrenList != null && this.childrenList.size() > 0;
    }

    @Override // ch.qos.logback.core.status.Status
    public synchronized Iterator<Status> iterator() {
        return this.childrenList != null ? this.childrenList.iterator() : EMPTY_LIST.iterator();
    }

    @Override // ch.qos.logback.core.status.Status
    public synchronized boolean remove(Status status) {
        if (this.childrenList == null) {
            return false;
        }
        return this.childrenList.remove(status);
    }

    @Override // ch.qos.logback.core.status.Status
    public int getLevel() {
        return this.level;
    }

    @Override // ch.qos.logback.core.status.Status
    public synchronized int getEffectiveLevel() {
        int i = this.level;
        Iterator<Status> it = iterator();
        while (it.hasNext()) {
            int effectiveLevel = it.next().getEffectiveLevel();
            if (effectiveLevel > i) {
                i = effectiveLevel;
            }
        }
        return i;
    }

    @Override // ch.qos.logback.core.status.Status
    public String getMessage() {
        return this.message;
    }

    @Override // ch.qos.logback.core.status.Status
    public Object getOrigin() {
        return this.origin;
    }

    @Override // ch.qos.logback.core.status.Status
    public Throwable getThrowable() {
        return this.throwable;
    }

    @Override // ch.qos.logback.core.status.Status
    public Long getDate() {
        return Long.valueOf(this.date);
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        switch (getEffectiveLevel()) {
            case 0:
                stringBuffer.append("INFO");
                break;
            case 1:
                stringBuffer.append("WARN");
                break;
            case 2:
                stringBuffer.append("ERROR");
                break;
        }
        if (this.origin != null) {
            stringBuffer.append(" in ");
            stringBuffer.append(this.origin);
            stringBuffer.append(" -");
        }
        stringBuffer.append(" ");
        stringBuffer.append(this.message);
        if (this.throwable != null) {
            stringBuffer.append(" ");
            stringBuffer.append(this.throwable);
        }
        return stringBuffer.toString();
    }

    public int hashCode() {
        return (31 * ((31 * 1) + this.level)) + (this.message == null ? 0 : this.message.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        StatusBase statusBase = (StatusBase) obj;
        if (this.level != statusBase.level) {
            return false;
        }
        return this.message == null ? statusBase.message == null : this.message.equals(statusBase.message);
    }
}
