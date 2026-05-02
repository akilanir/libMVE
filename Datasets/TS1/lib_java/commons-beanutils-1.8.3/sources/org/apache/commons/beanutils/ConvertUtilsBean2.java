package org.apache.commons.beanutils;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/ConvertUtilsBean2.class */
public class ConvertUtilsBean2 extends ConvertUtilsBean {
    static Class class$java$lang$String;

    @Override // org.apache.commons.beanutils.ConvertUtilsBean
    public String convert(Object value) {
        Class cls;
        if (class$java$lang$String == null) {
            cls = class$("java.lang.String");
            class$java$lang$String = cls;
        } else {
            cls = class$java$lang$String;
        }
        return (String) convert(value, cls);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // org.apache.commons.beanutils.ConvertUtilsBean
    public Object convert(String value, Class clazz) {
        return convert((Object) value, clazz);
    }

    @Override // org.apache.commons.beanutils.ConvertUtilsBean
    public Object convert(String[] value, Class clazz) {
        return convert((Object) value, clazz);
    }
}
