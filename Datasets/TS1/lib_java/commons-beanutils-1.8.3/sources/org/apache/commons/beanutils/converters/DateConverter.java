package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/DateConverter.class */
public final class DateConverter extends DateTimeConverter {
    static Class class$java$util$Date;

    public DateConverter() {
    }

    public DateConverter(Object defaultValue) {
        super(defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$util$Date != null) {
            return class$java$util$Date;
        }
        Class class$ = class$("java.util.Date");
        class$java$util$Date = class$;
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
