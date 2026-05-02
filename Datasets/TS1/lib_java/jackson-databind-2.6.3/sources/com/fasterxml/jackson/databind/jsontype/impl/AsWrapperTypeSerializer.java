package com.fasterxml.jackson.databind.jsontype.impl;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.jsontype.TypeIdResolver;
import java.io.IOException;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/jsontype/impl/AsWrapperTypeSerializer.class */
public class AsWrapperTypeSerializer extends TypeSerializerBase {
    public AsWrapperTypeSerializer(TypeIdResolver idRes, BeanProperty property) {
        super(idRes, property);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public AsWrapperTypeSerializer forProperty(BeanProperty prop) {
        return this._property == prop ? this : new AsWrapperTypeSerializer(this._idResolver, prop);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.TypeSerializerBase, com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public JsonTypeInfo.As getTypeInclusion() {
        return JsonTypeInfo.As.WRAPPER_OBJECT;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForObject(Object value, JsonGenerator jgen) throws IOException {
        String typeId = idFromValue(value);
        if (jgen.canWriteTypeId()) {
            if (typeId != null) {
                jgen.writeTypeId(typeId);
            }
            jgen.writeStartObject();
        } else {
            jgen.writeStartObject();
            jgen.writeObjectFieldStart(_validTypeId(typeId));
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForObject(Object value, JsonGenerator jgen, Class<?> type) throws IOException {
        String typeId = idFromValueAndType(value, type);
        if (jgen.canWriteTypeId()) {
            if (typeId != null) {
                jgen.writeTypeId(typeId);
            }
            jgen.writeStartObject();
        } else {
            jgen.writeStartObject();
            jgen.writeObjectFieldStart(_validTypeId(typeId));
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForArray(Object value, JsonGenerator jgen) throws IOException {
        String typeId = idFromValue(value);
        if (jgen.canWriteTypeId()) {
            if (typeId != null) {
                jgen.writeTypeId(typeId);
            }
            jgen.writeStartArray();
        } else {
            jgen.writeStartObject();
            jgen.writeArrayFieldStart(_validTypeId(typeId));
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForArray(Object value, JsonGenerator jgen, Class<?> type) throws IOException {
        String typeId = idFromValueAndType(value, type);
        if (jgen.canWriteTypeId()) {
            if (typeId != null) {
                jgen.writeTypeId(typeId);
            }
            jgen.writeStartArray();
        } else {
            jgen.writeStartObject();
            jgen.writeArrayFieldStart(_validTypeId(typeId));
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForScalar(Object value, JsonGenerator jgen) throws IOException {
        String typeId = idFromValue(value);
        if (jgen.canWriteTypeId()) {
            if (typeId != null) {
                jgen.writeTypeId(typeId);
            }
        } else {
            jgen.writeStartObject();
            jgen.writeFieldName(_validTypeId(typeId));
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypePrefixForScalar(Object value, JsonGenerator jgen, Class<?> type) throws IOException {
        String typeId = idFromValueAndType(value, type);
        if (jgen.canWriteTypeId()) {
            if (typeId != null) {
                jgen.writeTypeId(typeId);
            }
        } else {
            jgen.writeStartObject();
            jgen.writeFieldName(_validTypeId(typeId));
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypeSuffixForObject(Object value, JsonGenerator jgen) throws IOException {
        jgen.writeEndObject();
        if (!jgen.canWriteTypeId()) {
            jgen.writeEndObject();
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypeSuffixForArray(Object value, JsonGenerator jgen) throws IOException {
        jgen.writeEndArray();
        if (!jgen.canWriteTypeId()) {
            jgen.writeEndObject();
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeTypeSuffixForScalar(Object value, JsonGenerator jgen) throws IOException {
        if (!jgen.canWriteTypeId()) {
            jgen.writeEndObject();
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypePrefixForObject(Object value, JsonGenerator jgen, String typeId) throws IOException {
        if (jgen.canWriteTypeId()) {
            if (typeId != null) {
                jgen.writeTypeId(typeId);
            }
            jgen.writeStartObject();
        } else {
            jgen.writeStartObject();
            jgen.writeObjectFieldStart(_validTypeId(typeId));
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypePrefixForArray(Object value, JsonGenerator jgen, String typeId) throws IOException {
        if (jgen.canWriteTypeId()) {
            if (typeId != null) {
                jgen.writeTypeId(typeId);
            }
            jgen.writeStartArray();
        } else {
            jgen.writeStartObject();
            jgen.writeArrayFieldStart(_validTypeId(typeId));
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypePrefixForScalar(Object value, JsonGenerator jgen, String typeId) throws IOException {
        if (jgen.canWriteTypeId()) {
            if (typeId != null) {
                jgen.writeTypeId(typeId);
            }
        } else {
            jgen.writeStartObject();
            jgen.writeFieldName(_validTypeId(typeId));
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypeSuffixForObject(Object value, JsonGenerator jgen, String typeId) throws IOException {
        if (!jgen.canWriteTypeId()) {
            writeTypeSuffixForObject(value, jgen);
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypeSuffixForArray(Object value, JsonGenerator jgen, String typeId) throws IOException {
        if (!jgen.canWriteTypeId()) {
            writeTypeSuffixForArray(value, jgen);
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeSerializer
    public void writeCustomTypeSuffixForScalar(Object value, JsonGenerator jgen, String typeId) throws IOException {
        if (!jgen.canWriteTypeId()) {
            writeTypeSuffixForScalar(value, jgen);
        }
    }

    protected String _validTypeId(String typeId) {
        return typeId == null ? "" : typeId;
    }
}
