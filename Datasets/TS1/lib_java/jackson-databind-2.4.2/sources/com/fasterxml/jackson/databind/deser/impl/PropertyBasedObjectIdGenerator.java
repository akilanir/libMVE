package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/impl/PropertyBasedObjectIdGenerator.class */
public class PropertyBasedObjectIdGenerator extends ObjectIdGenerators.PropertyGenerator {
    private static final long serialVersionUID = 1;

    public PropertyBasedObjectIdGenerator(Class<?> scope) {
        super(scope);
    }

    public Object generateId(Object forPojo) {
        throw new UnsupportedOperationException();
    }

    public ObjectIdGenerator<Object> forScope(Class<?> scope) {
        return scope == this._scope ? this : new PropertyBasedObjectIdGenerator(scope);
    }

    public ObjectIdGenerator<Object> newForSerialization(Object context) {
        return this;
    }

    public ObjectIdGenerator.IdKey key(Object key) {
        return new ObjectIdGenerator.IdKey(getClass(), this._scope, key);
    }
}
