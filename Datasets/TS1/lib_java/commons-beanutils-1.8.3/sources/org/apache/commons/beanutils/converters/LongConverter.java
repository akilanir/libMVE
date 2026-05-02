package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/LongConverter.class */
public final class LongConverter extends NumberConverter {
    static Class class$java$lang$Long;

    public LongConverter() {
        super(false);
    }

    public LongConverter(Object defaultValue) {
        super(false, defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$lang$Long != null) {
            return class$java$lang$Long;
        }
        Class class$ = class$("java.lang.Long");
        class$java$lang$Long = class$;
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
