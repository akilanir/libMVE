package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/DoubleConverter.class */
public final class DoubleConverter extends NumberConverter {
    static Class class$java$lang$Double;

    public DoubleConverter() {
        super(true);
    }

    public DoubleConverter(Object defaultValue) {
        super(true, defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$lang$Double != null) {
            return class$java$lang$Double;
        }
        Class class$ = class$("java.lang.Double");
        class$java$lang$Double = class$;
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
