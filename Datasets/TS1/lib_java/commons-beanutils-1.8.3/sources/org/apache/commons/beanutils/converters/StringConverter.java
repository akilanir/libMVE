package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/StringConverter.class */
public final class StringConverter extends AbstractConverter {
    static Class class$java$lang$String;

    public StringConverter() {
    }

    public StringConverter(Object defaultValue) {
        super(defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$lang$String != null) {
            return class$java$lang$String;
        }
        Class class$ = class$("java.lang.String");
        class$java$lang$String = class$;
        return class$;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Object convertToType(Class type, Object value) throws Throwable {
        return value.toString();
    }
}
