package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.ContainerSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.fasterxml.jackson.databind.ser.std.ArraySerializerBase;
import com.fasterxml.jackson.databind.type.TypeFactory;
import java.io.IOException;
import java.lang.reflect.Type;

@JacksonStdImpl
/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/impl/StringArraySerializer.class */
public class StringArraySerializer extends ArraySerializerBase<String[]> implements ContextualSerializer {
    private static final JavaType VALUE_TYPE = TypeFactory.defaultInstance().uncheckedSimpleType(String.class);
    public static final StringArraySerializer instance = new StringArraySerializer();
    protected final JsonSerializer<Object> _elementSerializer;

    protected StringArraySerializer() {
        super(String[].class, (BeanProperty) null);
        this._elementSerializer = null;
    }

    public StringArraySerializer(StringArraySerializer src, BeanProperty prop, JsonSerializer<?> ser) {
        super(src, prop);
        this._elementSerializer = ser;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public ContainerSerializer<?> _withValueTypeSerializer(TypeSerializer vts) {
        return this;
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
            ser2 = this._elementSerializer;
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
        if (ser == this._elementSerializer) {
            return this;
        }
        return new StringArraySerializer(this, property, ser);
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public JavaType getContentType() {
        return VALUE_TYPE;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public JsonSerializer<?> getContentSerializer() {
        return this._elementSerializer;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(SerializerProvider prov, String[] value) {
        return value == null || value.length == 0;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public boolean hasSingleElement(String[] value) {
        return value.length == 1;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public final void serialize(String[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        int len = value.length;
        if (len == 1 && provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) {
            serializeContents(value, jgen, provider);
            return;
        }
        jgen.writeStartArray(len);
        serializeContents(value, jgen, provider);
        jgen.writeEndArray();
    }

    @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase
    public void serializeContents(String[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        int len = value.length;
        if (len == 0) {
            return;
        }
        if (this._elementSerializer != null) {
            serializeContentsSlow(value, jgen, provider, this._elementSerializer);
            return;
        }
        for (int i = 0; i < len; i++) {
            String str = value[i];
            if (str == null) {
                jgen.writeNull();
            } else {
                jgen.writeString(value[i]);
            }
        }
    }

    private void serializeContentsSlow(String[] value, JsonGenerator jgen, SerializerProvider provider, JsonSerializer<Object> ser) throws IOException, JsonGenerationException {
        int len = value.length;
        for (int i = 0; i < len; i++) {
            String str = value[i];
            if (str == null) {
                provider.defaultSerializeNull(jgen);
            } else {
                ser.serialize(value[i], jgen, provider);
            }
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
        return createSchemaNode("array", true).set("items", createSchemaNode("string"));
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        JsonArrayFormatVisitor v2;
        if (visitor != null && (v2 = visitor.expectArrayFormat(typeHint)) != null) {
            v2.itemsFormat(JsonFormatTypes.STRING);
        }
    }
}
