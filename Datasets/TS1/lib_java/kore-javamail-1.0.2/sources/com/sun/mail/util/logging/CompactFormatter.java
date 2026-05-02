package com.sun.mail.util.logging;

import java.util.Collections;
import java.util.Date;
import java.util.Formattable;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.logging.Formatter;
import java.util.logging.LogManager;
import java.util.logging.LogRecord;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/logging/CompactFormatter.class */
public class CompactFormatter extends Formatter {
    private final String fmt;

    public CompactFormatter() {
        String p = getClass().getName();
        this.fmt = initFormat(p);
    }

    public CompactFormatter(String format) {
        String p = getClass().getName();
        this.fmt = format == null ? initFormat(p) : format;
    }

    @Override // java.util.logging.Formatter
    public String format(LogRecord record) {
        ResourceBundle rb = record.getResourceBundle();
        Locale l = rb == null ? null : rb.getLocale();
        String msg = formatMessage(record);
        String thrown = formatThrown(record);
        Object[] params = {new Date(record.getMillis()), formatSource(record), formatLoggerName(record), formatLevel(record), msg, thrown, new Alternate(msg, thrown), new Alternate(thrown, msg)};
        return String.format(l, this.fmt, params);
    }

    @Override // java.util.logging.Formatter
    public String formatMessage(LogRecord record) {
        String msg = super.formatMessage(record);
        return replaceClassName(replaceClassName(msg, record.getThrown()), record.getParameters());
    }

    public String formatMessage(Throwable t) {
        return t != null ? replaceClassName(apply(t).getMessage(), t) : "";
    }

    public String formatLevel(LogRecord record) {
        return record.getLevel().getLocalizedName();
    }

    public String formatSource(LogRecord record) {
        String source;
        String source2 = record.getSourceClassName();
        if (source2 != null) {
            if (record.getSourceMethodName() != null) {
                source = simpleClassName(source2) + " " + record.getSourceMethodName();
            } else {
                source = simpleClassName(source2);
            }
        } else {
            source = simpleClassName(record.getLoggerName());
        }
        return source;
    }

    public String formatLoggerName(LogRecord record) {
        return simpleClassName(record.getLoggerName());
    }

    public String formatThrown(LogRecord record) {
        String msg;
        Throwable root;
        Throwable t = record.getThrown();
        if (t != null && (root = apply(t)) != null) {
            String msg2 = formatMessage(t);
            String site = formatBackTrace(record);
            msg = root.getClass().getSimpleName() + ": " + msg2 + (isNullOrSpaces(site) ? "" : ' ' + site);
        } else {
            msg = "";
        }
        return msg;
    }

    public String formatBackTrace(LogRecord record) {
        Throwable root;
        String site = "";
        Throwable t = record.getThrown();
        if (t != null && (root = apply(t)) != null) {
            site = findAndFormat(root.getStackTrace());
            if (isNullOrSpaces(site)) {
                int limit = 0;
                Throwable th = t;
                while (true) {
                    Throwable c = th;
                    if (c == null) {
                        break;
                    }
                    site = findAndFormat(c.getStackTrace());
                    if (!isNullOrSpaces(site)) {
                        break;
                    }
                    limit++;
                    if (limit == 65536) {
                        break;
                    }
                    th = c.getCause();
                }
            }
        }
        return site;
    }

    private String findAndFormat(StackTraceElement[] trace) {
        String site = "";
        int length = trace.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            StackTraceElement s = trace[i];
            if (ignore(s)) {
                i++;
            } else {
                site = formatStackTraceElement(s);
                break;
            }
        }
        if (isNullOrSpaces(site)) {
            int length2 = trace.length;
            int i2 = 0;
            while (true) {
                if (i2 >= length2) {
                    break;
                }
                StackTraceElement s2 = trace[i2];
                if (defaultIgnore(s2)) {
                    i2++;
                } else {
                    site = formatStackTraceElement(s2);
                    break;
                }
            }
        }
        return site;
    }

    private String formatStackTraceElement(StackTraceElement s) {
        String result;
        String v = simpleClassName(s.getClassName());
        if (v != null) {
            result = s.toString().replace(s.getClassName(), v);
        } else {
            result = s.toString();
        }
        String v2 = simpleFileName(s.getFileName());
        if (v2 != null && result.startsWith(v2)) {
            result = result.replace(s.getFileName(), "");
        }
        return result;
    }

    protected Throwable apply(Throwable t) {
        return SeverityComparator.getInstance().apply(t);
    }

    protected boolean ignore(StackTraceElement s) {
        return isUnknown(s) || defaultIgnore(s);
    }

    protected String toAlternate(String s) {
        if (s != null) {
            return s.replaceAll("[\\x00-\\x1F\\x7F]+", "");
        }
        return null;
    }

    private boolean defaultIgnore(StackTraceElement s) {
        return isSynthetic(s) || isStaticUtility(s) || isReflection(s);
    }

    private boolean isStaticUtility(StackTraceElement s) {
        try {
            return LogManagerProperties.isStaticUtilityClass(s.getClassName());
        } catch (LinkageError | RuntimeException | Exception e) {
            return (!s.getClassName().endsWith("es") && s.getClassName().endsWith("s")) || s.getClassName().contains("Util");
        }
    }

    private boolean isSynthetic(StackTraceElement s) {
        return s.getMethodName().indexOf(36) > -1;
    }

    private boolean isUnknown(StackTraceElement s) {
        return s.getLineNumber() < 0;
    }

    private boolean isReflection(StackTraceElement s) {
        try {
            return LogManagerProperties.isReflectionClass(s.getClassName());
        } catch (LinkageError | RuntimeException | Exception e) {
            return s.getClassName().startsWith("java.lang.reflect.") || s.getClassName().startsWith("sun.reflect.");
        }
    }

    private String initFormat(String p) {
        LogManager m = LogManagerProperties.getLogManager();
        String v = m.getProperty(p.concat(".format"));
        if (isNullOrSpaces(v)) {
            v = "%7$#.160s%n";
        }
        return v;
    }

    private static String replaceClassName(String msg, Throwable t) {
        if (!isNullOrSpaces(msg)) {
            int limit = 0;
            Throwable th = t;
            while (true) {
                Throwable c = th;
                if (c == null) {
                    break;
                }
                Class<?> k = c.getClass();
                msg = msg.replace(k.getName(), k.getSimpleName());
                limit++;
                if (limit == 65536) {
                    break;
                }
                th = c.getCause();
            }
        }
        return msg;
    }

    private static String replaceClassName(String msg, Object[] p) {
        if (!isNullOrSpaces(msg) && p != null) {
            for (Object o : p) {
                if (o != null) {
                    Class<?> k = o.getClass();
                    msg = msg.replace(k.getName(), k.getSimpleName());
                }
            }
        }
        return msg;
    }

    private static String simpleClassName(String name) {
        if (name != null) {
            int index = name.lastIndexOf(46);
            name = index > -1 ? name.substring(index + 1) : name;
        }
        return name;
    }

    private static String simpleFileName(String name) {
        if (name != null) {
            int index = name.lastIndexOf(46);
            name = index > -1 ? name.substring(0, index) : name;
        }
        return name;
    }

    private static boolean isNullOrSpaces(String s) {
        return s == null || s.trim().length() == 0;
    }

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/logging/CompactFormatter$Alternate.class */
    private class Alternate implements Formattable {
        private final String left;
        private final String right;

        Alternate(String left, String right) {
            this.left = String.valueOf(left);
            this.right = String.valueOf(right);
        }

        @Override // java.util.Formattable
        public void formatTo(java.util.Formatter formatter, int flags, int width, int precision) {
            String l = this.left;
            String r = this.right;
            if ((flags & 2) == 2) {
                l = l.toUpperCase(formatter.locale());
                r = r.toUpperCase(formatter.locale());
            }
            if ((flags & 4) == 4) {
                l = CompactFormatter.this.toAlternate(l);
                r = CompactFormatter.this.toAlternate(r);
            }
            if (precision <= 0) {
                precision = Integer.MAX_VALUE;
            }
            int fence = Math.min(l.length(), precision);
            if (fence > (precision >> 1)) {
                fence = Math.max(fence - r.length(), fence >> 1);
            }
            if (fence > 0) {
                if (fence > l.length() && Character.isHighSurrogate(l.charAt(fence - 1))) {
                    fence--;
                }
                l = l.substring(0, fence);
            }
            String r2 = r.substring(0, Math.min(precision - fence, r.length()));
            if (width > 0) {
                int half = width >> 1;
                if (l.length() < half) {
                    l = pad(flags, l, half);
                }
                if (r2.length() < half) {
                    r2 = pad(flags, r2, half);
                }
            }
            Object[] empty = Collections.emptySet().toArray();
            formatter.format(l, empty);
            if (l.length() != 0 && r2.length() != 0) {
                formatter.format("|", empty);
            }
            formatter.format(r2, empty);
        }

        private String pad(int flags, String s, int length) {
            int padding = length - s.length();
            StringBuilder b = new StringBuilder(length);
            if ((flags & 1) == 1) {
                for (int i = 0; i < padding; i++) {
                    b.append(' ');
                }
                b.append(s);
            } else {
                b.append(s);
                for (int i2 = 0; i2 < padding; i2++) {
                    b.append(' ');
                }
            }
            return b.toString();
        }
    }
}
