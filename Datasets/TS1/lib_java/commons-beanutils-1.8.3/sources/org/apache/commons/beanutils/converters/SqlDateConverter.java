package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/SqlDateConverter.class */
public final class SqlDateConverter extends DateTimeConverter {
    static Class class$java$sql$Date;

    public SqlDateConverter() {
    }

    public SqlDateConverter(Object defaultValue) {
        super(defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$sql$Date != null) {
            return class$java$sql$Date;
        }
        Class class$ = class$("java.sql.Date");
        class$java$sql$Date = class$;
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
