package com.fasterxml.jackson.databind.exc;

import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParser;
import java.util.Collection;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/exc/UnrecognizedPropertyException.class */
public class UnrecognizedPropertyException extends PropertyBindingException {
    private static final long serialVersionUID = 1;

    public UnrecognizedPropertyException(String msg, JsonLocation loc, Class<?> referringClass, String propName, Collection<Object> propertyIds) {
        super(msg, loc, referringClass, propName, propertyIds);
    }

    public static UnrecognizedPropertyException from(JsonParser jp, Object fromObjectOrClass, String propertyName, Collection<Object> propertyIds) {
        Class<?> ref;
        if (fromObjectOrClass == null) {
            throw new IllegalArgumentException();
        }
        if (fromObjectOrClass instanceof Class) {
            ref = (Class) fromObjectOrClass;
        } else {
            ref = fromObjectOrClass.getClass();
        }
        String msg = "Unrecognized field \"" + propertyName + "\" (class " + ref.getName() + "), not marked as ignorable";
        UnrecognizedPropertyException e = new UnrecognizedPropertyException(msg, jp.getCurrentLocation(), ref, propertyName, propertyIds);
        e.prependPath(fromObjectOrClass, propertyName);
        return e;
    }

    @Deprecated
    public String getUnrecognizedPropertyName() {
        return getPropertyName();
    }
}
