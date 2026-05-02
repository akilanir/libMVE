package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import java.io.IOException;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/NonTypedScalarSerializerBase.class */
public abstract class NonTypedScalarSerializerBase<T> extends StdScalarSerializer<T> {
    protected NonTypedScalarSerializerBase(Class<T> t) {
        super(t);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public final void serializeWithType(T value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonGenerationException {
        serialize(value, jgen, provider);
    }
}
