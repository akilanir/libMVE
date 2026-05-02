package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.ContainerSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import java.io.IOException;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/ArraySerializerBase.class */
public abstract class ArraySerializerBase<T> extends ContainerSerializer<T> implements ContextualSerializer {
    protected final BeanProperty _property;
    protected final Boolean _unwrapSingle;

    public abstract JsonSerializer<?> _withResolved(BeanProperty beanProperty, Boolean bool);

    protected abstract void serializeContents(T t, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException;

    protected ArraySerializerBase(Class<T> cls) {
        super(cls);
        this._property = null;
        this._unwrapSingle = null;
    }

    @Deprecated
    protected ArraySerializerBase(Class<T> cls, BeanProperty property) {
        super(cls);
        this._property = property;
        this._unwrapSingle = null;
    }

    protected ArraySerializerBase(ArraySerializerBase<?> src) {
        super(src._handledType, false);
        this._property = src._property;
        this._unwrapSingle = src._unwrapSingle;
    }

    protected ArraySerializerBase(ArraySerializerBase<?> src, BeanProperty property, Boolean unwrapSingle) {
        super(src._handledType, false);
        this._property = property;
        this._unwrapSingle = unwrapSingle;
    }

    @Deprecated
    protected ArraySerializerBase(ArraySerializerBase<?> src, BeanProperty property) {
        super(src._handledType, false);
        this._property = property;
        this._unwrapSingle = src._unwrapSingle;
    }

    public JsonSerializer<?> createContextual(SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        Boolean unwrapSingle;
        if (property != null) {
            AnnotationIntrospector intr = provider.getAnnotationIntrospector();
            JsonFormat.Value format = property.findFormatOverrides(intr);
            if (format != null && (unwrapSingle = format.getFeature(JsonFormat.Feature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) != this._unwrapSingle) {
                return _withResolved(property, unwrapSingle);
            }
        }
        return this;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(T value, JsonGenerator gen, SerializerProvider provider) throws IOException {
        if (((this._unwrapSingle == null && provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) || this._unwrapSingle == Boolean.TRUE) && hasSingleElement(value)) {
            serializeContents(value, gen, provider);
            return;
        }
        gen.writeStartArray();
        gen.setCurrentValue(value);
        serializeContents(value, gen, provider);
        gen.writeEndArray();
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public final void serializeWithType(T value, JsonGenerator gen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        typeSer.writeTypePrefixForArray(value, gen);
        gen.setCurrentValue(value);
        serializeContents(value, gen, provider);
        typeSer.writeTypeSuffixForArray(value, gen);
    }
}
