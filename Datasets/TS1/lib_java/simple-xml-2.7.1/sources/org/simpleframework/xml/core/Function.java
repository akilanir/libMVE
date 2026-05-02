package org.simpleframework.xml.core;

import java.lang.reflect.Method;
import java.util.Map;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Function.class */
class Function {
    private final Method method;
    private final boolean contextual;

    public Function(Method method) {
        this(method, false);
    }

    public Function(Method method, boolean contextual) {
        this.contextual = contextual;
        this.method = method;
    }

    public Object call(Context context, Object source) throws Exception {
        if (source != null) {
            Session session = context.getSession();
            Map table = session.getMap();
            return this.contextual ? this.method.invoke(source, table) : this.method.invoke(source, new Object[0]);
        }
        return null;
    }
}
