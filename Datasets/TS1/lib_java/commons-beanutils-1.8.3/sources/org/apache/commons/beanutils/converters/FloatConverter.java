package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/FloatConverter.class */
public final class FloatConverter extends NumberConverter {
    static Class class$java$lang$Float;

    public FloatConverter() {
        super(true);
    }

    public FloatConverter(Object defaultValue) {
        super(true, defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$lang$Float != null) {
            return class$java$lang$Float;
        }
        Class class$ = class$("java.lang.Float");
        class$java$lang$Float = class$;
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
