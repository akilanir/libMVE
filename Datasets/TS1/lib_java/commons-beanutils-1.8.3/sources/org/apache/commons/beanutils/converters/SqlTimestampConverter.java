package org.apache.commons.beanutils.converters;

import java.text.DateFormat;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/SqlTimestampConverter.class */
public final class SqlTimestampConverter extends DateTimeConverter {
    static Class class$java$sql$Timestamp;

    public SqlTimestampConverter() {
    }

    public SqlTimestampConverter(Object defaultValue) {
        super(defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$sql$Timestamp != null) {
            return class$java$sql$Timestamp;
        }
        Class class$ = class$("java.sql.Timestamp");
        class$java$sql$Timestamp = class$;
        return class$;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // org.apache.commons.beanutils.converters.DateTimeConverter
    protected DateFormat getFormat(Locale locale, TimeZone timeZone) {
        DateFormat format;
        if (locale == null) {
            format = DateFormat.getDateTimeInstance(3, 3);
        } else {
            format = DateFormat.getDateTimeInstance(3, 3, locale);
        }
        if (timeZone != null) {
            format.setTimeZone(timeZone);
        }
        return format;
    }
}
