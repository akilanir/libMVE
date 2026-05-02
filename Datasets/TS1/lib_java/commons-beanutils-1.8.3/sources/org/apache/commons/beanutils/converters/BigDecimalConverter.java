package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/BigDecimalConverter.class */
public final class BigDecimalConverter extends NumberConverter {
    static Class class$java$math$BigDecimal;

    public BigDecimalConverter() {
        super(true);
    }

    public BigDecimalConverter(Object defaultValue) {
        super(true, defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$math$BigDecimal != null) {
            return class$java$math$BigDecimal;
        }
        Class class$ = class$("java.math.BigDecimal");
        class$java$math$BigDecimal = class$;
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
