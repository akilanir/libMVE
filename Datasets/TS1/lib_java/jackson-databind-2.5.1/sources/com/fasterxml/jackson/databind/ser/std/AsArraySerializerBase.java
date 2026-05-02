package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsonschema.JsonSchema;
import com.fasterxml.jackson.databind.jsonschema.SchemaAware;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.ser.ContainerSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap;
import java.io.IOException;
import java.lang.reflect.Type;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/AsArraySerializerBase.class */
public abstract class AsArraySerializerBase<T> extends ContainerSerializer<T> implements ContextualSerializer {
    protected final boolean _staticTyping;
    protected final JavaType _elementType;
    protected final TypeSerializer _valueTypeSerializer;
    protected final JsonSerializer<Object> _elementSerializer;
    protected final BeanProperty _property;
    protected PropertySerializerMap _dynamicSerializers;

    public abstract AsArraySerializerBase<T> withResolved(BeanProperty beanProperty, TypeSerializer typeSerializer, JsonSerializer<?> jsonSerializer);

    protected abstract void serializeContents(T t, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException;

    protected AsArraySerializerBase(Class<?> cls, JavaType et, boolean staticTyping, TypeSerializer vts, BeanProperty property, JsonSerializer<Object> elementSerializer) {
        super(cls, false);
        this._elementType = et;
        this._staticTyping = staticTyping || (et != null && et.isFinal());
        this._valueTypeSerializer = vts;
        this._property = property;
        this._elementSerializer = elementSerializer;
        this._dynamicSerializers = PropertySerializerMap.emptyForProperties();
    }

    protected AsArraySerializerBase(AsArraySerializerBase<?> src, BeanProperty property, TypeSerializer vts, JsonSerializer<?> elementSerializer) {
        super(src);
        this._elementType = src._elementType;
        this._staticTyping = src._staticTyping;
        this._valueTypeSerializer = vts;
        this._property = property;
        this._elementSerializer = elementSerializer;
        this._dynamicSerializers = src._dynamicSerializers;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContextualSerializer
    public JsonSerializer<?> createContextual(SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        AnnotatedMember m;
        Object serDef;
        TypeSerializer typeSer = this._valueTypeSerializer;
        if (typeSer != null) {
            typeSer = typeSer.forProperty(property);
        }
        JsonSerializer<?> ser = null;
        if (property != null && (m = property.getMember()) != null && (serDef = provider.getAnnotationIntrospector().findContentSerializer(m)) != null) {
            ser = provider.serializerInstance(m, serDef);
        }
        if (ser == null) {
            ser = this._elementSerializer;
        }
        JsonSerializer<?> ser2 = findConvertingContentSerializer(provider, property, ser);
        if (ser2 == null) {
            if (this._elementType != null && ((this._staticTyping && this._elementType.getRawClass() != Object.class) || hasContentTypeAnnotation(provider, property))) {
                ser2 = provider.findValueSerializer(this._elementType, property);
            }
        } else {
            ser2 = provider.handleSecondaryContextualization(ser2, property);
        }
        if (ser2 != this._elementSerializer || property != this._property || this._valueTypeSerializer != typeSer) {
            return withResolved(property, typeSer, ser2);
        }
        return this;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public JavaType getContentType() {
        return this._elementType;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public JsonSerializer<?> getContentSerializer() {
        return this._elementSerializer;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(T value, JsonGenerator gen, SerializerProvider provider) throws IOException {
        if (provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED) && hasSingleElement(value)) {
            serializeContents(value, gen, provider);
            return;
        }
        gen.writeStartArray();
        gen.setCurrentValue(value);
        serializeContents(value, gen, provider);
        gen.writeEndArray();
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(T value, JsonGenerator gen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        typeSer.writeTypePrefixForArray(value, gen);
        gen.setCurrentValue(value);
        serializeContents(value, gen, provider);
        typeSer.writeTypeSuffixForArray(value, gen);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) throws JsonMappingException {
        ObjectNode o = createSchemaNode("array", true);
        JavaType contentType = this._elementType;
        if (contentType != null) {
            JsonNode schemaNode = null;
            if (contentType.getRawClass() != Object.class) {
                JsonFormatVisitable findValueSerializer = provider.findValueSerializer(contentType, this._property);
                if (findValueSerializer instanceof SchemaAware) {
                    schemaNode = ((SchemaAware) findValueSerializer).getSchema(provider, null);
                }
            }
            if (schemaNode == null) {
                schemaNode = JsonSchema.getDefaultSchemaNode();
            }
            o.put("items", schemaNode);
        }
        return o;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        JsonArrayFormatVisitor arrayVisitor = visitor == null ? null : visitor.expectArrayFormat(typeHint);
        if (arrayVisitor != null) {
            JsonSerializer<?> valueSer = this._elementSerializer;
            if (valueSer == null) {
                valueSer = visitor.getProvider().findValueSerializer(this._elementType, this._property);
            }
            arrayVisitor.itemsFormat(valueSer, this._elementType);
        }
    }

    protected final JsonSerializer<Object> _findAndAddDynamic(PropertySerializerMap map, Class<?> type, SerializerProvider provider) throws JsonMappingException {
        PropertySerializerMap.SerializerAndMapResult result = map.findAndAddSecondarySerializer(type, provider, this._property);
        if (map != result.map) {
            this._dynamicSerializers = result.map;
        }
        return result.serializer;
    }

    protected final JsonSerializer<Object> _findAndAddDynamic(PropertySerializerMap map, JavaType type, SerializerProvider provider) throws JsonMappingException {
        PropertySerializerMap.SerializerAndMapResult result = map.findAndAddSecondarySerializer(type, provider, this._property);
        if (map != result.map) {
            this._dynamicSerializers = result.map;
        }
        return result.serializer;
    }
}
