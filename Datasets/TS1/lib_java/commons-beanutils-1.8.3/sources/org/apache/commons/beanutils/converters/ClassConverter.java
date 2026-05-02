package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/ClassConverter.class */
public final class ClassConverter extends AbstractConverter {
    static Class class$java$lang$Class;
    static Class class$org$apache$commons$beanutils$converters$ClassConverter;

    public ClassConverter() {
    }

    public ClassConverter(Object defaultValue) {
        super(defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$lang$Class != null) {
            return class$java$lang$Class;
        }
        Class class$ = class$("java.lang.Class");
        class$java$lang$Class = class$;
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
    protected String convertToString(Object value) {
        return value instanceof Class ? ((Class) value).getName() : value.toString();
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Object convertToType(Class type, Object value) throws Throwable {
        Class cls;
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        if (classLoader != null) {
            try {
                return classLoader.loadClass(value.toString());
            } catch (ClassNotFoundException e) {
            }
        }
        if (class$org$apache$commons$beanutils$converters$ClassConverter == null) {
            cls = class$("org.apache.commons.beanutils.converters.ClassConverter");
            class$org$apache$commons$beanutils$converters$ClassConverter = cls;
        } else {
            cls = class$org$apache$commons$beanutils$converters$ClassConverter;
        }
        return cls.getClassLoader().loadClass(value.toString());
    }
}
