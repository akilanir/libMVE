package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/ContainerDeserializerBase.class */
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
}
