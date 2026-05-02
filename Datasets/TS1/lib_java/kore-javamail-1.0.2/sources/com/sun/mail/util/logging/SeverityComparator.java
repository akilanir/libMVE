package com.sun.mail.util.logging;

import java.io.Serializable;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.LogRecord;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/logging/SeverityComparator.class */
public class SeverityComparator implements Comparator<LogRecord>, Serializable {
    private static final long serialVersionUID = -2620442245251791965L;
    private static final SeverityComparator INSTANCE = new SeverityComparator();

    static SeverityComparator getInstance() {
        return INSTANCE;
    }

    public Throwable apply(Throwable chain) {
        int limit = 0;
        Throwable root = chain;
        Throwable high = null;
        Throwable normal = null;
        Throwable th = chain;
        while (true) {
            Throwable cause = th;
            if (cause == null) {
                break;
            }
            root = cause;
            if (isNormal(cause)) {
                normal = cause;
            }
            if (normal == null && (cause instanceof Error)) {
                high = cause;
            }
            limit++;
            if (limit == 65536) {
                break;
            }
            th = cause.getCause();
        }
        return high != null ? high : normal != null ? normal : root;
    }

    public final int applyThenCompare(Throwable tc1, Throwable tc2) {
        if (tc1 == tc2) {
            return 0;
        }
        return compareThrowable(apply(tc1), apply(tc2));
    }

    public int compareThrowable(Throwable t1, Throwable t2) {
        if (t1 == t2) {
            return 0;
        }
        if (t1 == null) {
            return isNormal(t2) ? 1 : -1;
        }
        if (t2 == null) {
            return isNormal(t1) ? -1 : 1;
        }
        if (t1.getClass() == t2.getClass()) {
            return 0;
        }
        if (isNormal(t1)) {
            return isNormal(t2) ? 0 : -1;
        }
        if (isNormal(t2)) {
            return 1;
        }
        if (t1 instanceof Error) {
            return t2 instanceof Error ? 0 : 1;
        }
        if (!(t1 instanceof RuntimeException)) {
            return ((t2 instanceof Error) || (t2 instanceof RuntimeException)) ? -1 : 0;
        }
        if (t2 instanceof Error) {
            return -1;
        }
        return t2 instanceof RuntimeException ? 0 : 1;
    }

    @Override // java.util.Comparator
    public int compare(LogRecord o1, LogRecord o2) {
        if (o1 == null || o2 == null) {
            throw new NullPointerException(toString(o1, o2));
        }
        if (o1 == o2) {
            return 0;
        }
        int cmp = compare(o1.getLevel(), o2.getLevel());
        if (cmp == 0) {
            cmp = applyThenCompare(o1.getThrown(), o2.getThrown());
            if (cmp == 0) {
                cmp = compare(o1.getSequenceNumber(), o2.getSequenceNumber());
                if (cmp == 0) {
                    cmp = compare(o1.getMillis(), o2.getMillis());
                }
            }
        }
        return cmp;
    }

    @Override // java.util.Comparator
    public boolean equals(Object o) {
        return o != null && o.getClass() == getClass();
    }

    public int hashCode() {
        return 31 * getClass().hashCode();
    }

    public boolean isNormal(Throwable t) {
        if (t == null) {
            return false;
        }
        Class<?> cls = t.getClass();
        while (true) {
            Class<?> c = cls;
            if (c != Throwable.class) {
                if (Error.class.isAssignableFrom(c)) {
                    if (c.getName().equals("java.lang.ThreadDeath")) {
                        return true;
                    }
                } else if (c.getName().contains("Interrupt")) {
                    return true;
                }
                cls = c.getSuperclass();
            } else {
                return false;
            }
        }
    }

    private int compare(Level a, Level b) {
        if (a == b) {
            return 0;
        }
        return compare(a.intValue(), b.intValue());
    }

    private static String toString(Object o1, Object o2) {
        return o1 + ", " + o2;
    }

    private int compare(long x, long y) {
        if (x < y) {
            return -1;
        }
        return x > y ? 1 : 0;
    }
}
