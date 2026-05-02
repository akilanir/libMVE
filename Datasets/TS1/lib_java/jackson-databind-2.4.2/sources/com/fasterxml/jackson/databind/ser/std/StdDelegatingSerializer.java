package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsonschema.SchemaAware;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.fasterxml.jackson.databind.ser.ResolvableSerializer;
import com.fasterxml.jackson.databind.util.Converter;
import java.io.IOException;
import java.lang.reflect.Type;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/StdDelegatingSerializer.class */
public class StdDelegatingSerializer extends StdSerializer<Object> implements ContextualSerializer, ResolvableSerializer, JsonFormatVisitable, SchemaAware {
    protected final Converter<Object, ?> _converter;
    protected final JavaType _delegateType;
    protected final JsonSerializer<Object> _delegateSerializer;

    public StdDelegatingSerializer(Converter<?, ?> converter) {
        super(Object.class);
        this._converter = converter;
        this._delegateType = null;
        this._delegateSerializer = null;
    }

    public <T> StdDelegatingSerializer(Class<T> cls, Converter<T, ?> converter) {
        super(cls, false);
        this._converter = converter;
        this._delegateType = null;
        this._delegateSerializer = null;
    }

    public StdDelegatingSerializer(Converter<Object, ?> converter, JavaType delegateType, JsonSerializer<?> delegateSerializer) {
        super(delegateType);
        this._converter = converter;
        this._delegateType = delegateType;
        this._delegateSerializer = delegateSerializer;
    }

    protected StdDelegatingSerializer withDelegate(Converter<Object, ?> converter, JavaType delegateType, JsonSerializer<?> delegateSerializer) {
        if (getClass() != StdDelegatingSerializer.class) {
            throw new IllegalStateException("Sub-class " + getClass().getName() + " must override 'withDelegate'");
        }
        return new StdDelegatingSerializer(converter, delegateType, delegateSerializer);
    }

    @Override // com.fasterxml.jackson.databind.ser.ResolvableSerializer
    public void resolve(SerializerProvider provider) throws JsonMappingException {
        if (this._delegateSerializer != null && (this._delegateSerializer instanceof ResolvableSerializer)) {
            ((ResolvableSerializer) this._delegateSerializer).resolve(provider);
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.ContextualSerializer
    public JsonSerializer<?> createContextual(SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        if (this._delegateSerializer != null) {
            if (this._delegateSerializer instanceof ContextualSerializer) {
                JsonSerializer<?> ser = provider.handleSecondaryContextualization(this._delegateSerializer, property);
                if (ser == this._delegateSerializer) {
                    return this;
                }
                return withDelegate(this._converter, this._delegateType, ser);
            }
            return this;
        }
        JavaType delegateType = this._delegateType;
        if (delegateType == null) {
            delegateType = this._converter.getOutputType(provider.getTypeFactory());
        }
        return withDelegate(this._converter, delegateType, provider.findValueSerializer(delegateType, property));
    }

    protected Converter<Object, ?> getConverter() {
        return this._converter;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public JsonSerializer<?> getDelegatee() {
        return this._delegateSerializer;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Object value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonProcessingException {
        Object delegateValue = convertValue(value);
        if (delegateValue == null) {
            provider.defaultSerializeNull(jgen);
        } else {
            this._delegateSerializer.serialize(delegateValue, jgen, provider);
        }
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(Object value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonProcessingException {
        Object delegateValue = convertValue(value);
        this._delegateSerializer.serializeWithType(delegateValue, jgen, provider, typeSer);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(Object value) {
        Object delegateValue = convertValue(value);
        return this._delegateSerializer.isEmpty(delegateValue);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) throws JsonMappingException {
        if (this._delegateSerializer instanceof SchemaAware) {
            return ((SchemaAware) this._delegateSerializer).getSchema(provider, typeHint);
        }
        return super.getSchema(provider, typeHint);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint, boolean isOptional) throws JsonMappingException {
        if (this._delegateSerializer instanceof SchemaAware) {
            return ((SchemaAware) this._delegateSerializer).getSchema(provider, typeHint, isOptional);
        }
        return super.getSchema(provider, typeHint);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        this._delegateSerializer.acceptJsonFormatVisitor(visitor, typeHint);
    }

    protected Object convertValue(Object value) {
        return this._converter.convert(value);
    }
}
