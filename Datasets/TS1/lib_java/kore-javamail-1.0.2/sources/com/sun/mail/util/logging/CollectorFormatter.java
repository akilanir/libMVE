package com.sun.mail.util.logging;

import java.lang.reflect.UndeclaredThrowableException;
import java.text.MessageFormat;
import java.util.Comparator;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.logging.Formatter;
import java.util.logging.Handler;
import java.util.logging.LogManager;
import java.util.logging.LogRecord;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/logging/CollectorFormatter.class */
public class CollectorFormatter extends Formatter {
    private static final long INIT_TIME;
    private final String fmt;
    private final Formatter formatter;
    private final Comparator<? super LogRecord> comparator;
    private LogRecord last;
    private long count;
    private long thrown;
    private long minMillis;
    private long maxMillis;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !CollectorFormatter.class.desiredAssertionStatus();
        INIT_TIME = System.currentTimeMillis();
    }

    public CollectorFormatter() {
        String p = getClass().getName();
        this.fmt = initFormat(p);
        this.formatter = initFormatter(p);
        this.comparator = initComparator(p);
        reset();
    }

    public CollectorFormatter(String format) {
        String p = getClass().getName();
        this.fmt = format == null ? initFormat(p) : format;
        this.formatter = initFormatter(p);
        this.comparator = initComparator(p);
        reset();
    }

    public CollectorFormatter(String format, Formatter f, Comparator<? super LogRecord> c) {
        String p = getClass().getName();
        this.fmt = format == null ? initFormat(p) : format;
        this.formatter = f;
        this.comparator = c;
        reset();
    }

    @Override // java.util.logging.Formatter
    public String format(LogRecord record) {
        boolean accepted;
        if (record == null) {
            throw new NullPointerException();
        }
        do {
            LogRecord peek = peek();
            LogRecord update = apply(peek != null ? peek : record, record);
            if (peek != update) {
                update.getSourceMethodName();
                accepted = acceptAndUpdate(peek, update);
            } else {
                accepted = true;
                accept(record);
            }
        } while (!accepted);
        return "";
    }

    @Override // java.util.logging.Formatter
    public String getTail(Handler h) {
        return formatRecord(h, true);
    }

    public String toString() {
        String result;
        try {
            result = formatRecord((Handler) null, false);
        } catch (RuntimeException e) {
            result = super.toString();
        }
        return result;
    }

    protected LogRecord apply(LogRecord t, LogRecord u) {
        if (t == null || u == null) {
            throw new NullPointerException();
        }
        if (this.comparator != null) {
            return this.comparator.compare(t, u) >= 0 ? t : u;
        }
        return u;
    }

    private synchronized void accept(LogRecord record) {
        long millis = record.getMillis();
        this.minMillis = Math.min(this.minMillis, millis);
        this.maxMillis = Math.max(this.maxMillis, millis);
        this.count++;
        if (record.getThrown() != null) {
            this.thrown++;
        }
    }

    private synchronized void reset() {
        this.last = null;
        this.count = 0L;
        this.thrown = 0L;
        this.minMillis = Long.MAX_VALUE;
        this.maxMillis = Long.MIN_VALUE;
    }

    private String formatRecord(Handler h, boolean reset) {
        LogRecord record;
        long c;
        long t;
        long msl;
        long msh;
        String tail;
        String msg;
        String head;
        MessageFormat mf;
        synchronized (this) {
            record = this.last;
            c = this.count;
            t = this.thrown;
            msl = this.minMillis;
            msh = this.maxMillis;
            if (reset) {
                reset();
            }
        }
        if (c == 0) {
            msl = INIT_TIME;
            msh = System.currentTimeMillis();
        }
        Formatter f = this.formatter;
        if (f != null) {
            synchronized (f) {
                head = f.getHead(h);
                msg = record != null ? f.format(record) : "";
                tail = f.getTail(h);
            }
        } else {
            tail = "";
            msg = "";
            head = "";
        }
        Locale l = null;
        if (record != null) {
            ResourceBundle rb = record.getResourceBundle();
            l = rb == null ? null : rb.getLocale();
        }
        if (l == null) {
            mf = new MessageFormat(this.fmt);
        } else {
            mf = new MessageFormat(this.fmt, l);
        }
        return mf.format(new Object[]{finish(head), finish(msg), finish(tail), Long.valueOf(c), Long.valueOf(c - 1), Long.valueOf(t), Long.valueOf(c - t), Long.valueOf(msl), Long.valueOf(msh)});
    }

    protected String finish(String s) {
        return s.trim();
    }

    private synchronized LogRecord peek() {
        return this.last;
    }

    private synchronized boolean acceptAndUpdate(LogRecord e, LogRecord u) {
        if (e == this.last) {
            accept(u);
            this.last = u;
            return true;
        }
        return false;
    }

    private String initFormat(String p) {
        LogManager m = LogManagerProperties.getLogManager();
        String v = m.getProperty(p.concat(".format"));
        if (v == null || v.length() == 0) {
            v = "{0}{1}{2}{4,choice,-1#|0#|0<... {4,number,integer} more}\n";
        }
        return v;
    }

    private Formatter initFormatter(String p) {
        Formatter f;
        LogManager m = LogManagerProperties.getLogManager();
        String v = m.getProperty(p.concat(".formatter"));
        if (v != null && v.length() != 0) {
            if (!"null".equalsIgnoreCase(v)) {
                try {
                    f = LogManagerProperties.newFormatter(v);
                } catch (RuntimeException re) {
                    throw re;
                } catch (Exception e) {
                    throw new UndeclaredThrowableException(e);
                }
            } else {
                f = null;
            }
        } else {
            f = (Formatter) Formatter.class.cast(new CompactFormatter());
        }
        return f;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x006f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.util.Comparator<? super java.util.logging.LogRecord> initComparator(java.lang.String r5) {
        /*
            r4 = this;
            java.util.logging.LogManager r0 = com.sun.mail.util.logging.LogManagerProperties.getLogManager()
            r6 = r0
            r0 = r6
            r1 = r5
            java.lang.String r2 = ".comparator"
            java.lang.String r1 = r1.concat(r2)
            java.lang.String r0 = r0.getProperty(r1)
            r8 = r0
            r0 = r6
            r1 = r5
            java.lang.String r2 = ".comparator.reverse"
            java.lang.String r1 = r1.concat(r2)
            java.lang.String r0 = r0.getProperty(r1)
            r9 = r0
            r0 = r8
            if (r0 == 0) goto L6f
            r0 = r8
            int r0 = r0.length()     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            if (r0 == 0) goto L6f
            java.lang.String r0 = "null"
            r1 = r8
            boolean r0 = r0.equalsIgnoreCase(r1)     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            if (r0 != 0) goto L5b
            r0 = r8
            java.util.Comparator r0 = com.sun.mail.util.logging.LogManagerProperties.newComparator(r0)     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            r7 = r0
            r0 = r9
            boolean r0 = java.lang.Boolean.parseBoolean(r0)     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            if (r0 == 0) goto L8a
            boolean r0 = com.sun.mail.util.logging.CollectorFormatter.$assertionsDisabled     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            if (r0 != 0) goto L53
            r0 = r7
            if (r0 != 0) goto L53
            java.lang.AssertionError r0 = new java.lang.AssertionError     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            r1 = r0
            r1.<init>()     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            throw r0     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
        L53:
            r0 = r7
            java.util.Comparator r0 = com.sun.mail.util.logging.LogManagerProperties.reverseOrder(r0)     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            r7 = r0
            goto L8a
        L5b:
            r0 = r9
            if (r0 == 0) goto L6a
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            r1 = r0
            java.lang.String r2 = "No comparator to reverse."
            r1.<init>(r2)     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            throw r0     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
        L6a:
            r0 = 0
            r7 = r0
            goto L8a
        L6f:
            r0 = r9
            if (r0 == 0) goto L7e
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            r1 = r0
            java.lang.String r2 = "No comparator to reverse."
            r1.<init>(r2)     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            throw r0     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
        L7e:
            java.lang.Class<java.util.Comparator> r0 = java.util.Comparator.class
            com.sun.mail.util.logging.SeverityComparator r1 = com.sun.mail.util.logging.SeverityComparator.getInstance()     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            java.lang.Object r0 = r0.cast(r1)     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            java.util.Comparator r0 = (java.util.Comparator) r0     // Catch: java.lang.RuntimeException -> L8d java.lang.Exception -> L92
            r7 = r0
        L8a:
            goto L9e
        L8d:
            r10 = move-exception
            r0 = r10
            throw r0
        L92:
            r10 = move-exception
            java.lang.reflect.UndeclaredThrowableException r0 = new java.lang.reflect.UndeclaredThrowableException
            r1 = r0
            r2 = r10
            r1.<init>(r2)
            throw r0
        L9e:
            r0 = r7
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.util.logging.CollectorFormatter.initComparator(java.lang.String):java.util.Comparator");
    }
}
