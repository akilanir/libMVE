package com.fasterxml.jackson.databind.jsontype;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.BeanProperty;
import java.io.IOException;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/jsontype/TypeSerializer.class */
public abstract class TypeSerializer {
    public abstract TypeSerializer forProperty(BeanProperty beanProperty);

    public abstract JsonTypeInfo.As getTypeInclusion();

    public abstract String getPropertyName();

    public abstract TypeIdResolver getTypeIdResolver();

    public abstract void writeTypePrefixForScalar(Object obj, JsonGenerator jsonGenerator) throws IOException;

    public abstract void writeTypePrefixForObject(Object obj, JsonGenerator jsonGenerator) throws IOException;

    public abstract void writeTypePrefixForArray(Object obj, JsonGenerator jsonGenerator) throws IOException;

    public abstract void writeTypeSuffixForScalar(Object obj, JsonGenerator jsonGenerator) throws IOException;

    public abstract void writeTypeSuffixForObject(Object obj, JsonGenerator jsonGenerator) throws IOException;

    public abstract void writeTypeSuffixForArray(Object obj, JsonGenerator jsonGenerator) throws IOException;

    public abstract void writeCustomTypePrefixForScalar(Object obj, JsonGenerator jsonGenerator, String str) throws IOException, JsonProcessingException;

    public abstract void writeCustomTypePrefixForObject(Object obj, JsonGenerator jsonGenerator, String str) throws IOException;

    public abstract void writeCustomTypePrefixForArray(Object obj, JsonGenerator jsonGenerator, String str) throws IOException;

    public abstract void writeCustomTypeSuffixForScalar(Object obj, JsonGenerator jsonGenerator, String str) throws IOException;

    public abstract void writeCustomTypeSuffixForObject(Object obj, JsonGenerator jsonGenerator, String str) throws IOException;

    public abstract void writeCustomTypeSuffixForArray(Object obj, JsonGenerator jsonGenerator, String str) throws IOException;

    public void writeTypePrefixForScalar(Object value, JsonGenerator jgen, Class<?> type) throws IOException {
        writeTypePrefixForScalar(value, jgen);
    }

    public void writeTypePrefixForObject(Object value, JsonGenerator jgen, Class<?> type) throws IOException {
        writeTypePrefixForObject(value, jgen);
    }

    public void writeTypePrefixForArray(Object value, JsonGenerator jgen, Class<?> type) throws IOException {
        writeTypePrefixForArray(value, jgen);
    }
}
