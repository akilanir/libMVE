package com.fasterxml.jackson.databind.jsontype.impl;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.jsontype.TypeIdResolver;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/jsontype/impl/TypeSerializerBase.class */
public abstract class TypeSerializerBase extends TypeSerializer {
    protected final TypeIdResolver _idResolver;
    protected final BeanProperty _property;

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public abstract JsonTypeInfo.As getTypeInclusion();

    protected TypeSerializerBase(TypeIdResolver idRes, BeanProperty property) {
        this._idResolver = idRes;
        this._property = property;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public String getPropertyName() {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public TypeIdResolver getTypeIdResolver() {
        return this._idResolver;
    }

    protected String idFromValue(Object value) {
        String id = this._idResolver.idFromValue(value);
        if (id == null) {
            handleMissingId(value);
        }
        return id;
    }

    protected String idFromValueAndType(Object value, Class<?> type) {
        String id = this._idResolver.idFromValueAndType(value, type);
        if (id == null) {
            handleMissingId(value);
        }
        return id;
    }

    protected void handleMissingId(Object value) {
    }
}
