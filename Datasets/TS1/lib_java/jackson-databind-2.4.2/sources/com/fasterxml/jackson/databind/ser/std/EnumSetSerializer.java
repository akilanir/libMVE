package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import java.io.IOException;
import java.util.EnumSet;
import java.util.Iterator;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/EnumSetSerializer.class */
public class EnumSetSerializer extends AsArraySerializerBase<EnumSet<? extends Enum<?>>> {
    @Override // com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase
    /* renamed from: withResolved, reason: avoid collision after fix types in other method */
    public /* bridge */ /* synthetic */ AsArraySerializerBase<EnumSet<? extends Enum<?>>> withResolved2(BeanProperty x0, TypeSerializer x1, JsonSerializer x2) {
        return withResolved(x0, x1, (JsonSerializer<?>) x2);
    }

    public EnumSetSerializer(JavaType elemType, BeanProperty property) {
        super(EnumSet.class, elemType, true, null, property, null);
    }

    public EnumSetSerializer(EnumSetSerializer src, BeanProperty property, TypeSerializer vts, JsonSerializer<?> valueSerializer) {
        super(src, property, vts, valueSerializer);
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public EnumSetSerializer _withValueTypeSerializer(TypeSerializer vts) {
        return this;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase
    public AsArraySerializerBase<EnumSet<? extends Enum<?>>> withResolved(BeanProperty property, TypeSerializer vts, JsonSerializer<?> elementSerializer) {
        return new EnumSetSerializer(this, property, vts, elementSerializer);
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(EnumSet<? extends Enum<?>> value) {
        return value == null || value.isEmpty();
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public boolean hasSingleElement(EnumSet<? extends Enum<?>> value) {
        return value.size() == 1;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.AsArraySerializerBase
    public void serializeContents(EnumSet<? extends Enum<?>> value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        JsonSerializer<Object> enumSer = this._elementSerializer;
        Iterator i$ = value.iterator();
        while (i$.hasNext()) {
            Enum<?> en = (Enum) i$.next();
            if (enumSer == null) {
                enumSer = provider.findValueSerializer(en.getDeclaringClass(), this._property);
            }
            enumSer.serialize(en, jgen, provider);
        }
    }
}
