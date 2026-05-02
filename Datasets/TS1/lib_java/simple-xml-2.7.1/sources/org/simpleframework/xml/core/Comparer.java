package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Comparer.class */
class Comparer {
    private static final String NAME = "name";
    private final String[] ignore;

    public Comparer() {
        this(NAME);
    }

    public Comparer(String... ignore) {
        this.ignore = ignore;
    }

    public boolean equals(Annotation left, Annotation right) throws Exception {
        Class type = left.annotationType();
        Class expect = right.annotationType();
        Method[] list = type.getDeclaredMethods();
        if (type.equals(expect)) {
            for (Method method : list) {
                if (!isIgnore(method)) {
                    Object value = method.invoke(left, new Object[0]);
                    Object other = method.invoke(right, new Object[0]);
                    if (!value.equals(other)) {
                        return false;
                    }
                }
            }
            return true;
        }
        return false;
    }

    private boolean isIgnore(Method method) {
        String name = method.getName();
        if (this.ignore != null) {
            String[] arr$ = this.ignore;
            for (String value : arr$) {
                if (name.equals(value)) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }
}
