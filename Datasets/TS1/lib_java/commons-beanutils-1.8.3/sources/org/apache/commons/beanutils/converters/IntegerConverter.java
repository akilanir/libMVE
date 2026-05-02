package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/IntegerConverter.class */
public final class IntegerConverter extends NumberConverter {
    static Class class$java$lang$Integer;

    public IntegerConverter() {
        super(false);
    }

    public IntegerConverter(Object defaultValue) {
        super(false, defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$lang$Integer != null) {
            return class$java$lang$Integer;
        }
        Class class$ = class$("java.lang.Integer");
        class$java$lang$Integer = class$;
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
