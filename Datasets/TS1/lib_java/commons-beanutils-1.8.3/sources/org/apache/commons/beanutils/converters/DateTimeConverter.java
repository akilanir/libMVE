package org.apache.commons.beanutils.converters;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import org.apache.commons.beanutils.ConversionException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/DateTimeConverter.class */
public abstract class DateTimeConverter extends AbstractConverter {
    private String[] patterns;
    private String displayPatterns;
    private Locale locale;
    private TimeZone timeZone;
    private boolean useLocaleFormat;
    static Class class$java$util$Calendar;
    static Class class$java$util$Date;
    static Class class$java$sql$Date;
    static Class class$java$sql$Time;
    static Class class$java$sql$Timestamp;

    public DateTimeConverter() {
    }

    public DateTimeConverter(Object defaultValue) {
        super(defaultValue);
    }

    public void setUseLocaleFormat(boolean useLocaleFormat) {
        this.useLocaleFormat = useLocaleFormat;
    }

    public TimeZone getTimeZone() {
        return this.timeZone;
    }

    public void setTimeZone(TimeZone timeZone) {
        this.timeZone = timeZone;
    }

    public Locale getLocale() {
        return this.locale;
    }

    public void setLocale(Locale locale) {
        this.locale = locale;
        setUseLocaleFormat(true);
    }

    public void setPattern(String pattern) {
        setPatterns(new String[]{pattern});
    }

    public String[] getPatterns() {
        return this.patterns;
    }

    public void setPatterns(String[] patterns) {
        this.patterns = patterns;
        if (patterns != null && patterns.length > 1) {
            StringBuffer buffer = new StringBuffer();
            for (int i = 0; i < patterns.length; i++) {
                if (i > 0) {
                    buffer.append(", ");
                }
                buffer.append(patterns[i]);
            }
            this.displayPatterns = buffer.toString();
        }
        setUseLocaleFormat(true);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected String convertToString(Object value) throws Throwable {
        String result;
        DateFormat format;
        Date date = null;
        if (value instanceof Date) {
            date = (Date) value;
        } else if (value instanceof Calendar) {
            date = ((Calendar) value).getTime();
        } else if (value instanceof Long) {
            date = new Date(((Long) value).longValue());
        }
        if (this.useLocaleFormat && date != null) {
            if (this.patterns != null && this.patterns.length > 0) {
                format = getFormat(this.patterns[0]);
            } else {
                format = getFormat(this.locale, this.timeZone);
            }
            logFormat("Formatting", format);
            result = format.format(date);
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append("    Converted  to String using format '").append(result).append("'").toString());
            }
        } else {
            result = value.toString();
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append("    Converted  to String using toString() '").append(result).append("'").toString());
            }
        }
        return result;
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Object convertToType(Class targetType, Object value) throws Exception {
        Calendar calendar;
        Class cls;
        Class sourceType = value.getClass();
        if (value instanceof Timestamp) {
            Timestamp timestamp = (Timestamp) value;
            long timeInMillis = (timestamp.getTime() / 1000) * 1000;
            return toDate(targetType, timeInMillis + (timestamp.getNanos() / 1000000));
        }
        if (value instanceof Date) {
            Date date = (Date) value;
            return toDate(targetType, date.getTime());
        }
        if (value instanceof Calendar) {
            Calendar calendar2 = (Calendar) value;
            return toDate(targetType, calendar2.getTime().getTime());
        }
        if (value instanceof Long) {
            Long longObj = (Long) value;
            return toDate(targetType, longObj.longValue());
        }
        String stringValue = value.toString().trim();
        if (stringValue.length() == 0) {
            return handleMissing(targetType);
        }
        if (this.useLocaleFormat) {
            if (this.patterns != null && this.patterns.length > 0) {
                calendar = parse(sourceType, targetType, stringValue);
            } else {
                DateFormat format = getFormat(this.locale, this.timeZone);
                calendar = parse(sourceType, targetType, stringValue, format);
            }
            if (class$java$util$Calendar == null) {
                cls = class$("java.util.Calendar");
                class$java$util$Calendar = cls;
            } else {
                cls = class$java$util$Calendar;
            }
            if (cls.isAssignableFrom(targetType)) {
                return calendar;
            }
            return toDate(targetType, calendar.getTime().getTime());
        }
        return toDate(targetType, stringValue);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private Object toDate(Class type, long value) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Calendar calendar;
        if (class$java$util$Date == null) {
            cls = class$("java.util.Date");
            class$java$util$Date = cls;
        } else {
            cls = class$java$util$Date;
        }
        if (type.equals(cls)) {
            return new Date(value);
        }
        if (class$java$sql$Date == null) {
            cls2 = class$("java.sql.Date");
            class$java$sql$Date = cls2;
        } else {
            cls2 = class$java$sql$Date;
        }
        if (type.equals(cls2)) {
            return new java.sql.Date(value);
        }
        if (class$java$sql$Time == null) {
            cls3 = class$("java.sql.Time");
            class$java$sql$Time = cls3;
        } else {
            cls3 = class$java$sql$Time;
        }
        if (type.equals(cls3)) {
            return new Time(value);
        }
        if (class$java$sql$Timestamp == null) {
            cls4 = class$("java.sql.Timestamp");
            class$java$sql$Timestamp = cls4;
        } else {
            cls4 = class$java$sql$Timestamp;
        }
        if (type.equals(cls4)) {
            return new Timestamp(value);
        }
        if (class$java$util$Calendar == null) {
            cls5 = class$("java.util.Calendar");
            class$java$util$Calendar = cls5;
        } else {
            cls5 = class$java$util$Calendar;
        }
        if (type.equals(cls5)) {
            if (this.locale == null && this.timeZone == null) {
                calendar = Calendar.getInstance();
            } else if (this.locale == null) {
                calendar = Calendar.getInstance(this.timeZone);
            } else if (this.timeZone == null) {
                calendar = Calendar.getInstance(this.locale);
            } else {
                calendar = Calendar.getInstance(this.timeZone, this.locale);
            }
            calendar.setTime(new Date(value));
            calendar.setLenient(false);
            return calendar;
        }
        String msg = new StringBuffer().append(toString(getClass())).append(" cannot handle conversion to '").append(toString(type)).append("'").toString();
        if (log().isWarnEnabled()) {
            log().warn(new StringBuffer().append("    ").append(msg).toString());
        }
        throw new ConversionException(msg);
    }

    private Object toDate(Class type, String value) {
        Class cls;
        Class cls2;
        Class cls3;
        if (class$java$sql$Date == null) {
            cls = class$("java.sql.Date");
            class$java$sql$Date = cls;
        } else {
            cls = class$java$sql$Date;
        }
        if (type.equals(cls)) {
            try {
                return java.sql.Date.valueOf(value);
            } catch (IllegalArgumentException e) {
                throw new ConversionException("String must be in JDBC format [yyyy-MM-dd] to create a java.sql.Date");
            }
        }
        if (class$java$sql$Time == null) {
            cls2 = class$("java.sql.Time");
            class$java$sql$Time = cls2;
        } else {
            cls2 = class$java$sql$Time;
        }
        if (type.equals(cls2)) {
            try {
                return Time.valueOf(value);
            } catch (IllegalArgumentException e2) {
                throw new ConversionException("String must be in JDBC format [HH:mm:ss] to create a java.sql.Time");
            }
        }
        if (class$java$sql$Timestamp == null) {
            cls3 = class$("java.sql.Timestamp");
            class$java$sql$Timestamp = cls3;
        } else {
            cls3 = class$java$sql$Timestamp;
        }
        if (type.equals(cls3)) {
            try {
                return Timestamp.valueOf(value);
            } catch (IllegalArgumentException e3) {
                throw new ConversionException("String must be in JDBC format [yyyy-MM-dd HH:mm:ss.fffffffff] to create a java.sql.Timestamp");
            }
        }
        String msg = new StringBuffer().append(toString(getClass())).append(" does not support default String to '").append(toString(type)).append("' conversion.").toString();
        if (log().isWarnEnabled()) {
            log().warn(new StringBuffer().append("    ").append(msg).toString());
            log().warn("    (N.B. Re-configure Converter or use alternative implementation)");
        }
        throw new ConversionException(msg);
    }

    protected DateFormat getFormat(Locale locale, TimeZone timeZone) {
        DateFormat format;
        if (locale == null) {
            format = DateFormat.getDateInstance(3);
        } else {
            format = DateFormat.getDateInstance(3, locale);
        }
        if (timeZone != null) {
            format.setTimeZone(timeZone);
        }
        return format;
    }

    private DateFormat getFormat(String pattern) {
        DateFormat format = new SimpleDateFormat(pattern);
        if (this.timeZone != null) {
            format.setTimeZone(this.timeZone);
        }
        return format;
    }

    private Calendar parse(Class sourceType, Class targetType, String value) throws Exception {
        Exception firstEx = null;
        for (int i = 0; i < this.patterns.length; i++) {
            try {
                DateFormat format = getFormat(this.patterns[i]);
                Calendar calendar = parse(sourceType, targetType, value, format);
                return calendar;
            } catch (Exception ex) {
                if (firstEx == null) {
                    firstEx = ex;
                }
            }
        }
        if (this.patterns.length > 1) {
            throw new ConversionException(new StringBuffer().append("Error converting '").append(toString(sourceType)).append("' to '").append(toString(targetType)).append("' using  patterns '").append(this.displayPatterns).append("'").toString());
        }
        throw firstEx;
    }

    private Calendar parse(Class sourceType, Class targetType, String value, DateFormat format) {
        logFormat("Parsing", format);
        format.setLenient(false);
        ParsePosition pos = new ParsePosition(0);
        Date parsedDate = format.parse(value, pos);
        if (pos.getErrorIndex() >= 0 || pos.getIndex() != value.length() || parsedDate == null) {
            String msg = new StringBuffer().append("Error converting '").append(toString(sourceType)).append("' to '").append(toString(targetType)).append("'").toString();
            if (format instanceof SimpleDateFormat) {
                msg = new StringBuffer().append(msg).append(" using pattern '").append(((SimpleDateFormat) format).toPattern()).append("'").toString();
            }
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append("    ").append(msg).toString());
            }
            throw new ConversionException(msg);
        }
        Calendar calendar = format.getCalendar();
        return calendar;
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append(toString(getClass()));
        buffer.append("[UseDefault=");
        buffer.append(isUseDefault());
        buffer.append(", UseLocaleFormat=");
        buffer.append(this.useLocaleFormat);
        if (this.displayPatterns != null) {
            buffer.append(", Patterns={");
            buffer.append(this.displayPatterns);
            buffer.append('}');
        }
        if (this.locale != null) {
            buffer.append(", Locale=");
            buffer.append(this.locale);
        }
        if (this.timeZone != null) {
            buffer.append(", TimeZone=");
            buffer.append(this.timeZone);
        }
        buffer.append(']');
        return buffer.toString();
    }

    private void logFormat(String action, DateFormat format) {
        if (log().isDebugEnabled()) {
            StringBuffer buffer = new StringBuffer(45);
            buffer.append("    ");
            buffer.append(action);
            buffer.append(" with Format");
            if (format instanceof SimpleDateFormat) {
                buffer.append("[");
                buffer.append(((SimpleDateFormat) format).toPattern());
                buffer.append("]");
            }
            buffer.append(" for ");
            if (this.locale == null) {
                buffer.append("default locale");
            } else {
                buffer.append("locale[");
                buffer.append(this.locale);
                buffer.append("]");
            }
            if (this.timeZone != null) {
                buffer.append(", TimeZone[");
                buffer.append(this.timeZone);
                buffer.append("]");
            }
            log().debug(buffer.toString());
        }
    }
}
