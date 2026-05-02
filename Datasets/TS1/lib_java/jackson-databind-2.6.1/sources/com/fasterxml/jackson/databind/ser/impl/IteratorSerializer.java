package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.ContainerSerializer;
import com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase;
import java.io.IOException;
import java.util.Iterator;

@JacksonStdImpl
/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ser/impl/IteratorSerializer.class */
public class IteratorSerializer extends AsArraySerializerBase<Iterator<?>> {
    @Override // com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase
    /* renamed from: withResolved, reason: avoid collision after fix types in other method */
    public /* bridge */ /* synthetic */ AsArraySerializerBase<Iterator<?>> withResolved2(BeanProperty x0, TypeSerializer x1, JsonSerializer x2, Boolean x3) {
        return withResolved(x0, x1, (JsonSerializer<?>) x2, x3);
    }

    public IteratorSerializer(JavaType elemType, boolean staticTyping, TypeSerializer vts) {
        super((Class<?>) Iterator.class, elemType, staticTyping, vts, (JsonSerializer<Object>) null);
    }

    public IteratorSerializer(IteratorSerializer src, BeanProperty property, TypeSerializer vts, JsonSerializer<?> valueSerializer, Boolean unwrapSingle) {
        super(src, property, vts, valueSerializer, unwrapSingle);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(SerializerProvider prov, Iterator<?> value) {
        return value == null || !value.hasNext();
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public boolean hasSingleElement(Iterator<?> value) {
        return false;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public ContainerSerializer<?> _withValueTypeSerializer(TypeSerializer vts) {
        return new IteratorSerializer(this, this._property, vts, this._elementSerializer, this._unwrapSingle);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase
    public AsArraySerializerBase<Iterator<?>> withResolved(BeanProperty property, TypeSerializer vts, JsonSerializer<?> elementSerializer, Boolean unwrapSingle) {
        return new IteratorSerializer(this, property, vts, elementSerializer, unwrapSingle);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public final void serialize(Iterator<?> value, JsonGenerator gen, SerializerProvider provider) throws IOException {
        if (((this._unwrapSingle == null && provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) || this._unwrapSingle == Boolean.TRUE) && hasSingleElement(value)) {
            serializeContents(value, gen, provider);
            return;
        }
        gen.writeStartArray();
        serializeContents(value, gen, provider);
        gen.writeEndArray();
    }

    @Override // com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase
    public void serializeContents(Iterator<?> value, JsonGenerator gen, SerializerProvider provider) throws IOException {
        if (value.hasNext()) {
            TypeSerializer typeSer = this._valueTypeSerializer;
            JsonSerializer<Object> prevSerializer = null;
            Class<?> prevClass = null;
            do {
                Object elem = value.next();
                if (elem == null) {
                    provider.defaultSerializeNull(gen);
                } else {
                    JsonSerializer<Object> currSerializer = this._elementSerializer;
                    if (currSerializer == null) {
                        Class<?> cc = elem.getClass();
                        if (cc == prevClass) {
                            currSerializer = prevSerializer;
                        } else {
                            currSerializer = provider.findValueSerializer(cc, this._property);
                            prevSerializer = currSerializer;
                            prevClass = cc;
                        }
                    }
                    if (typeSer == null) {
                        currSerializer.serialize(elem, gen, provider);
                    } else {
                        currSerializer.serializeWithType(elem, gen, provider, typeSer);
                    }
                }
            } while (value.hasNext());
        }
    }
}
