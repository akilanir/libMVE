package com.fasterxml.jackson.databind.jsontype.impl;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.jsontype.TypeIdResolver;
import java.io.IOException;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/jsontype/impl/AsExternalTypeSerializer.class */
public class AsExternalTypeSerializer extends TypeSerializerBase {
    protected final String _typePropertyName;

    public AsExternalTypeSerializer(TypeIdResolver idRes, BeanProperty property, String propName) {
        super(idRes, property);
        this._typePropertyName = propName;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public AsExternalTypeSerializer forProperty(BeanProperty prop) {
        return this._property == prop ? this : new AsExternalTypeSerializer(this._idResolver, prop, this._typePropertyName);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.TypeSerializerBase, com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public String getPropertyName() {
        return this._typePropertyName;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.TypeSerializerBase, com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public JsonTypeInfo.As getTypeInclusion() {
        return JsonTypeInfo.As.EXTERNAL_PROPERTY;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForObject(Object value, JsonGenerator jgen) throws IOException {
        _writeObjectPrefix(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForObject(Object value, JsonGenerator jgen, Class<?> type) throws IOException {
        _writeObjectPrefix(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForArray(Object value, JsonGenerator jgen) throws IOException {
        _writeArrayPrefix(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForArray(Object value, JsonGenerator jgen, Class<?> type) throws IOException {
        _writeArrayPrefix(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForScalar(Object value, JsonGenerator jgen) throws IOException {
        _writeScalarPrefix(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForScalar(Object value, JsonGenerator jgen, Class<?> type) throws IOException {
        _writeScalarPrefix(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypeSuffixForObject(Object value, JsonGenerator jgen) throws IOException {
        _writeObjectSuffix(value, jgen, idFromValue(value));
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypeSuffixForArray(Object value, JsonGenerator jgen) throws IOException {
        _writeArraySuffix(value, jgen, idFromValue(value));
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypeSuffixForScalar(Object value, JsonGenerator jgen) throws IOException {
        _writeScalarSuffix(value, jgen, idFromValue(value));
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypePrefixForScalar(Object value, JsonGenerator jgen, String typeId) throws IOException {
        _writeScalarPrefix(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypePrefixForObject(Object value, JsonGenerator jgen, String typeId) throws IOException {
        _writeObjectPrefix(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypePrefixForArray(Object value, JsonGenerator jgen, String typeId) throws IOException {
        _writeArrayPrefix(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypeSuffixForScalar(Object value, JsonGenerator jgen, String typeId) throws IOException {
        _writeScalarSuffix(value, jgen, typeId);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypeSuffixForObject(Object value, JsonGenerator jgen, String typeId) throws IOException {
        _writeObjectSuffix(value, jgen, typeId);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypeSuffixForArray(Object value, JsonGenerator jgen, String typeId) throws IOException {
        _writeArraySuffix(value, jgen, typeId);
    }

    protected final void _writeScalarPrefix(Object value, JsonGenerator jgen) throws IOException {
    }

    protected final void _writeObjectPrefix(Object value, JsonGenerator jgen) throws IOException {
        jgen.writeStartObject();
    }

    protected final void _writeArrayPrefix(Object value, JsonGenerator jgen) throws IOException {
        jgen.writeStartArray();
    }

    protected final void _writeScalarSuffix(Object value, JsonGenerator jgen, String typeId) throws IOException {
        if (typeId != null) {
            jgen.writeStringField(this._typePropertyName, typeId);
        }
    }

    protected final void _writeObjectSuffix(Object value, JsonGenerator jgen, String typeId) throws IOException {
        jgen.writeEndObject();
        if (typeId != null) {
            jgen.writeStringField(this._typePropertyName, typeId);
        }
    }

    protected final void _writeArraySuffix(Object value, JsonGenerator jgen, String typeId) throws IOException {
        jgen.writeEndArray();
        if (typeId != null) {
            jgen.writeStringField(this._typePropertyName, typeId);
        }
    }
}
