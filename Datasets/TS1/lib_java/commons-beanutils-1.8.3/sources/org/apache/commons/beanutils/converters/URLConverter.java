package org.apache.commons.beanutils.converters;

import java.net.URL;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/URLConverter.class */
public final class URLConverter extends AbstractConverter {
    static Class class$java$net$URL;

    public URLConverter() {
    }

    public URLConverter(Object defaultValue) {
        super(defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$net$URL != null) {
            return class$java$net$URL;
        }
        Class class$ = class$("java.net.URL");
        class$java$net$URL = class$;
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
        return new URL(value.toString());
    }
}
