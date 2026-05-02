package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsonschema.SchemaAware;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.fasterxml.jackson.databind.ser.PropertyFilter;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.Converter;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdSerializer.class */
public abstract class StdSerializer<T> extends JsonSerializer<T> implements JsonFormatVisitable, SchemaAware, Serializable {
    private static final long serialVersionUID = 1;
    protected final Class<T> _handledType;

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public abstract void serialize(T t, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException, JsonGenerationException;

    protected StdSerializer(Class<T> t) {
        this._handledType = t;
    }

    protected StdSerializer(JavaType javaType) {
        this._handledType = (Class<T>) javaType.getRawClass();
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected StdSerializer(Class<?> cls, boolean dummy) {
        this._handledType = cls;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public Class<T> handledType() {
        return this._handledType;
    }

    public JsonNode getSchema(SerializerProvider provider, Type typeHint) throws JsonMappingException {
        return createSchemaNode("string");
    }

    public JsonNode getSchema(SerializerProvider provider, Type typeHint, boolean isOptional) throws JsonMappingException {
        ObjectNode schema = (ObjectNode) getSchema(provider, typeHint);
        if (!isOptional) {
            schema.put("required", !isOptional);
        }
        return schema;
    }

    protected ObjectNode createObjectNode() {
        return JsonNodeFactory.instance.objectNode();
    }

    protected ObjectNode createSchemaNode(String type) {
        ObjectNode schema = createObjectNode();
        schema.put("type", type);
        return schema;
    }

    protected ObjectNode createSchemaNode(String type, boolean isOptional) {
        ObjectNode schema = createSchemaNode(type);
        if (!isOptional) {
            schema.put("required", !isOptional);
        }
        return schema;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        visitor.expectAnyFormat(typeHint);
    }

    public void wrapAndThrow(SerializerProvider provider, Throwable t, Object bean, String fieldName) throws IOException {
        while ((t instanceof InvocationTargetException) && t.getCause() != null) {
            t = t.getCause();
        }
        if (t instanceof Error) {
            throw ((Error) t);
        }
        boolean wrap = provider == null || provider.isEnabled(SerializationFeature.WRAP_EXCEPTIONS);
        if (t instanceof IOException) {
            if (!wrap || !(t instanceof JsonMappingException)) {
                throw ((IOException) t);
            }
        } else if (!wrap && (t instanceof RuntimeException)) {
            throw ((RuntimeException) t);
        }
        throw JsonMappingException.wrapWithPath(t, bean, fieldName);
    }

    public void wrapAndThrow(SerializerProvider provider, Throwable t, Object bean, int index) throws IOException {
        while ((t instanceof InvocationTargetException) && t.getCause() != null) {
            t = t.getCause();
        }
        if (t instanceof Error) {
            throw ((Error) t);
        }
        boolean wrap = provider == null || provider.isEnabled(SerializationFeature.WRAP_EXCEPTIONS);
        if (t instanceof IOException) {
            if (!wrap || !(t instanceof JsonMappingException)) {
                throw ((IOException) t);
            }
        } else if (!wrap && (t instanceof RuntimeException)) {
            throw ((RuntimeException) t);
        }
        throw JsonMappingException.wrapWithPath(t, bean, index);
    }

    protected boolean isDefaultSerializer(JsonSerializer<?> serializer) {
        return ClassUtil.isJacksonStdImpl(serializer);
    }

    protected JsonSerializer<?> findConvertingContentSerializer(SerializerProvider provider, BeanProperty prop, JsonSerializer<?> existingSerializer) throws JsonMappingException {
        AnnotatedMember m;
        Object convDef;
        AnnotationIntrospector intr = provider.getAnnotationIntrospector();
        if (intr != null && prop != null && (m = prop.getMember()) != null && (convDef = intr.findSerializationContentConverter(m)) != null) {
            Converter<Object, Object> conv = provider.converterInstance(prop.getMember(), convDef);
            JavaType delegateType = conv.getOutputType(provider.getTypeFactory());
            if (existingSerializer == null) {
                existingSerializer = provider.findValueSerializer(delegateType);
            }
            return new StdDelegatingSerializer(conv, delegateType, existingSerializer);
        }
        return existingSerializer;
    }

    protected PropertyFilter findPropertyFilter(SerializerProvider provider, Object filterId, Object valueToFilter) throws JsonMappingException {
        FilterProvider filters = provider.getFilterProvider();
        if (filters == null) {
            throw new JsonMappingException("Can not resolve PropertyFilter with id '" + filterId + "'; no FilterProvider configured");
        }
        PropertyFilter filter = filters.findPropertyFilter(filterId, valueToFilter);
        return filter;
    }
}
