package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.fasterxml.jackson.databind.ser.std.StaticListSerializerBase;
import java.io.IOException;
import java.util.List;

@JacksonStdImpl
/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/IndexedStringListSerializer.class */
public final class IndexedStringListSerializer extends StaticListSerializerBase<List<String>> implements ContextualSerializer {
    public static final IndexedStringListSerializer instance = new IndexedStringListSerializer();
    protected final JsonSerializer<String> _serializer;

    protected IndexedStringListSerializer() {
        this(null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public IndexedStringListSerializer(JsonSerializer<?> jsonSerializer) {
        super(List.class);
        this._serializer = jsonSerializer;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StaticListSerializerBase
    protected JsonNode contentSchema() {
        return createSchemaNode("string", true);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StaticListSerializerBase
    protected void acceptContentVisitor(JsonArrayFormatVisitor visitor) throws JsonMappingException {
        visitor.itemsFormat(JsonFormatTypes.STRING);
    }

    @Override // com.fasterxml.jackson.databind.ser.ContextualSerializer
    public JsonSerializer<?> createContextual(SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        JsonSerializer<?> ser;
        AnnotatedMember m;
        Object serDef;
        JsonSerializer<?> ser2 = null;
        if (property != null && (m = property.getMember()) != null && (serDef = provider.getAnnotationIntrospector().findContentSerializer(m)) != null) {
            ser2 = provider.serializerInstance(m, serDef);
        }
        if (ser2 == null) {
            ser2 = this._serializer;
        }
        JsonSerializer<?> ser3 = findConvertingContentSerializer(provider, property, ser2);
        if (ser3 == null) {
            ser = provider.findValueSerializer(String.class, property);
        } else {
            ser = provider.handleSecondaryContextualization(ser3, property);
        }
        if (isDefaultSerializer(ser)) {
            ser = null;
        }
        if (ser == this._serializer) {
            return this;
        }
        return new IndexedStringListSerializer(ser);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(List<String> value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        int len = value.size();
        if (len == 1 && provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) {
            _serializeUnwrapped(value, jgen, provider);
            return;
        }
        jgen.writeStartArray();
        if (this._serializer == null) {
            serializeContents(value, jgen, provider, len);
        } else {
            serializeUsingCustom(value, jgen, provider, len);
        }
        jgen.writeEndArray();
    }

    private final void _serializeUnwrapped(List<String> value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        if (this._serializer == null) {
            serializeContents(value, jgen, provider, 1);
        } else {
            serializeUsingCustom(value, jgen, provider, 1);
        }
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(List<String> value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        int len = value.size();
        typeSer.writeTypePrefixForArray(value, jgen);
        if (this._serializer == null) {
            serializeContents(value, jgen, provider, len);
        } else {
            serializeUsingCustom(value, jgen, provider, len);
        }
        typeSer.writeTypeSuffixForArray(value, jgen);
    }

    private final void serializeContents(List<String> value, JsonGenerator jgen, SerializerProvider provider, int len) throws IOException {
        for (int i = 0; i < len; i++) {
            try {
                String str = value.get(i);
                if (str == null) {
                    provider.defaultSerializeNull(jgen);
                } else {
                    jgen.writeString(str);
                }
            } catch (Exception e) {
                wrapAndThrow(provider, e, value, i);
                return;
            }
        }
    }

    private final void serializeUsingCustom(List<String> value, JsonGenerator jgen, SerializerProvider provider, int len) throws IOException {
        int i = 0;
        try {
            JsonSerializer<String> ser = this._serializer;
            i = 0;
            while (i < len) {
                String str = value.get(i);
                if (str == null) {
                    provider.defaultSerializeNull(jgen);
                } else {
                    ser.serialize(str, jgen, provider);
                }
                i++;
            }
        } catch (Exception e) {
            wrapAndThrow(provider, e, value, i);
        }
    }
}
