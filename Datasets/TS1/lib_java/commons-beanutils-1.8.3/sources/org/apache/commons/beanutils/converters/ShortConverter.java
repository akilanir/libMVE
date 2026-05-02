package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/ShortConverter.class */
public final class ShortConverter extends NumberConverter {
    static Class class$java$lang$Short;

    public ShortConverter() {
        super(false);
    }

    public ShortConverter(Object defaultValue) {
        super(false, defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$lang$Short != null) {
            return class$java$lang$Short;
        }
        Class class$ = class$("java.lang.Short");
        class$java$lang$Short = class$;
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
