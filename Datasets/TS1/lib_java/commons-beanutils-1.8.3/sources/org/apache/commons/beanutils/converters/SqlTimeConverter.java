package org.apache.commons.beanutils.converters;

import java.text.DateFormat;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/SqlTimeConverter.class */
public final class SqlTimeConverter extends DateTimeConverter {
    static Class class$java$sql$Time;

    public SqlTimeConverter() {
    }

    public SqlTimeConverter(Object defaultValue) {
        super(defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$sql$Time != null) {
            return class$java$sql$Time;
        }
        Class class$ = class$("java.sql.Time");
        class$java$sql$Time = class$;
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
            format = DateFormat.getTimeInstance(3);
        } else {
            format = DateFormat.getTimeInstance(3, locale);
        }
        if (timeZone != null) {
            format.setTimeZone(timeZone);
        }
        return format;
    }
}
