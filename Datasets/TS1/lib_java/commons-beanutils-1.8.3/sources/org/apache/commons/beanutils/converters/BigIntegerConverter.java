package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/BigIntegerConverter.class */
public final class BigIntegerConverter extends NumberConverter {
    static Class class$java$math$BigInteger;

    public BigIntegerConverter() {
        super(false);
    }

    public BigIntegerConverter(Object defaultValue) {
        super(false, defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$math$BigInteger != null) {
            return class$java$math$BigInteger;
        }
        Class class$ = class$("java.math.BigInteger");
        class$java$math$BigInteger = class$;
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
