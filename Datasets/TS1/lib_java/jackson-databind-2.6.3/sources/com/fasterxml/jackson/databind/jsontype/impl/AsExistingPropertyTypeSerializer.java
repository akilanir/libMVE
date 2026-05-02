package com.fasterxml.jackson.databind.jsontype.impl;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.jsontype.TypeIdResolver;
import java.io.IOException;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/jsontype/impl/AsExistingPropertyTypeSerializer.class */
public class AsExistingPropertyTypeSerializer extends AsPropertyTypeSerializer {
    public AsExistingPropertyTypeSerializer(TypeIdResolver idRes, BeanProperty property, String propName) {
        super(idRes, property, propName);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.AsPropertyTypeSerializer, com.fasterxml.jackson.databind.jsontype.impl.AsArrayTypeSerializer, com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public AsExistingPropertyTypeSerializer forProperty(BeanProperty prop) {
        return this._property == prop ? this : new AsExistingPropertyTypeSerializer(this._idResolver, prop, this._typePropertyName);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.AsPropertyTypeSerializer, com.fasterxml.jackson.databind.jsontype.impl.AsArrayTypeSerializer, com.fasterxml.jackson.databind.jsontype.impl.TypeSerializerBase, com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public JsonTypeInfo.As getTypeInclusion() {
        return JsonTypeInfo.As.EXISTING_PROPERTY;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.AsPropertyTypeSerializer, com.fasterxml.jackson.databind.jsontype.impl.AsArrayTypeSerializer, com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForObject(Object value, JsonGenerator jgen) throws IOException {
        String typeId = idFromValue(value);
        if (typeId != null && jgen.canWriteTypeId()) {
            jgen.writeTypeId(typeId);
        }
        jgen.writeStartObject();
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.AsPropertyTypeSerializer, com.fasterxml.jackson.databind.jsontype.impl.AsArrayTypeSerializer, com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForObject(Object value, JsonGenerator jgen, Class<?> type) throws IOException {
        String typeId = idFromValueAndType(value, type);
        if (typeId != null && jgen.canWriteTypeId()) {
            jgen.writeTypeId(typeId);
        }
        jgen.writeStartObject();
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.AsPropertyTypeSerializer, com.fasterxml.jackson.databind.jsontype.impl.AsArrayTypeSerializer, com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypePrefixForObject(Object value, JsonGenerator jgen, String typeId) throws IOException {
        if (typeId != null && jgen.canWriteTypeId()) {
            jgen.writeTypeId(typeId);
        }
        jgen.writeStartObject();
    }
}
