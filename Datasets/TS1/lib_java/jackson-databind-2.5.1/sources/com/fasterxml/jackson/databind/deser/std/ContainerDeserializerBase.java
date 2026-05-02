package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/ContainerDeserializerBase.class */
public abstract class ContainerDeserializerBase<T> extends StdDeserializer<T> {
    public abstract JavaType getContentType();

    public abstract JsonDeserializer<Object> getContentDeserializer();

    protected ContainerDeserializerBase(JavaType selfType) {
        super(selfType);
    }

    @Deprecated
    protected ContainerDeserializerBase(Class<?> selfType) {
        super(selfType);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public SettableBeanProperty findBackReference(String refName) {
        JsonDeserializer<Object> valueDeser = getContentDeserializer();
        if (valueDeser == null) {
            throw new IllegalArgumentException("Can not handle managed/back reference '" + refName + "': type: container deserializer of type " + getClass().getName() + " returned null for 'getContentDeserializer()'");
        }
        return valueDeser.findBackReference(refName);
    }

    protected void wrapAndThrow(Throwable t, Object ref, String key) throws IOException {
        while ((t instanceof InvocationTargetException) && t.getCause() != null) {
            t = t.getCause();
        }
        if (t instanceof Error) {
            throw ((Error) t);
        }
        if ((t instanceof IOException) && !(t instanceof JsonMappingException)) {
            throw ((IOException) t);
        }
        throw JsonMappingException.wrapWithPath(t, ref, key);
    }
}
