package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/ByteConverter.class */
public final class ByteConverter extends NumberConverter {
    static Class class$java$lang$Byte;

    public ByteConverter() {
        super(false);
    }

    public ByteConverter(Object defaultValue) {
        super(false, defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$lang$Byte != null) {
            return class$java$lang$Byte;
        }
        Class class$ = class$("java.lang.Byte");
        class$java$lang$Byte = class$;
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
