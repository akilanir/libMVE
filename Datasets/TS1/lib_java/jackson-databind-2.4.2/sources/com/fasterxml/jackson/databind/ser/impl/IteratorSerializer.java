package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.ContainerSerializer;
import com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase;
import java.io.IOException;
import java.util.Iterator;

@JacksonStdImpl
/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/IteratorSerializer.class */
public class IteratorSerializer extends AsArraySerializerBase<Iterator<?>> {
    @Override // com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase
    /* renamed from: withResolved, reason: avoid collision after fix types in other method */
    public /* bridge */ /* synthetic */ AsArraySerializerBase<Iterator<?>> withResolved2(BeanProperty x0, TypeSerializer x1, JsonSerializer x2) {
        return withResolved(x0, x1, (JsonSerializer<?>) x2);
    }

    public IteratorSerializer(JavaType elemType, boolean staticTyping, TypeSerializer vts, BeanProperty property) {
        super(Iterator.class, elemType, staticTyping, vts, property, null);
    }

    public IteratorSerializer(IteratorSerializer src, BeanProperty property, TypeSerializer vts, JsonSerializer<?> valueSerializer) {
        super(src, property, vts, valueSerializer);
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(Iterator<?> value) {
        return value == null || !value.hasNext();
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public boolean hasSingleElement(Iterator<?> value) {
        return false;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public ContainerSerializer<?> _withValueTypeSerializer(TypeSerializer vts) {
        return new IteratorSerializer(this._elementType, this._staticTyping, vts, this._property);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase
    public AsArraySerializerBase<Iterator<?>> withResolved(BeanProperty property, TypeSerializer vts, JsonSerializer<?> elementSerializer) {
        return new IteratorSerializer(this, property, vts, elementSerializer);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase
    public void serializeContents(Iterator<?> value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        if (value.hasNext()) {
            TypeSerializer typeSer = this._valueTypeSerializer;
            JsonSerializer<Object> prevSerializer = null;
            Class<?> prevClass = null;
            do {
                Object elem = value.next();
                if (elem == null) {
                    provider.defaultSerializeNull(jgen);
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
                        currSerializer.serialize(elem, jgen, provider);
                    } else {
                        currSerializer.serializeWithType(elem, jgen, provider, typeSer);
                    }
                }
            } while (value.hasNext());
        }
    }
}
