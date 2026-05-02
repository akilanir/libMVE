package org.apache.commons.beanutils.converters;

import java.io.File;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/FileConverter.class */
public final class FileConverter extends AbstractConverter {
    static Class class$java$io$File;

    public FileConverter() {
    }

    public FileConverter(Object defaultValue) {
        super(defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$io$File != null) {
            return class$java$io$File;
        }
        Class class$ = class$("java.io.File");
        class$java$io$File = class$;
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
        return new File(value.toString());
    }
}
