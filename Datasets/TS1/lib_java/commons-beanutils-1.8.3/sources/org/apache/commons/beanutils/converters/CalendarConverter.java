package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/CalendarConverter.class */
public final class CalendarConverter extends DateTimeConverter {
    static Class class$java$util$Calendar;

    public CalendarConverter() {
    }

    public CalendarConverter(Object defaultValue) {
        super(defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$util$Calendar != null) {
            return class$java$util$Calendar;
        }
        Class class$ = class$("java.util.Calendar");
        class$java$util$Calendar = class$;
        return class$;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}
