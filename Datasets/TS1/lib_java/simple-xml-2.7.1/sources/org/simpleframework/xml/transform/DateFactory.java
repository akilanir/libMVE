package org.simpleframework.xml.transform;

import java.lang.reflect.Constructor;
import java.util.Date;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/DateFactory.class */
class DateFactory<T extends Date> {
    private final Constructor<T> factory;

    public DateFactory(Class<T> type) throws Exception {
        this(type, Long.TYPE);
    }

    public DateFactory(Class<T> type, Class... list) throws Exception {
        this.factory = type.getDeclaredConstructor(list);
    }

    public T getInstance(Object... list) throws Exception {
        return this.factory.newInstance(list);
    }
}
