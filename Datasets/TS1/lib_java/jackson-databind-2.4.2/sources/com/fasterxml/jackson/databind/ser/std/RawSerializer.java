package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import java.io.IOException;
import java.lang.reflect.Type;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/RawSerializer.class */
public class RawSerializer<T> extends StdSerializer<T> {
    public RawSerializer(Class<?> cls) {
        super(cls, false);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(T value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        jgen.writeRawValue(value.toString());
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(T value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonProcessingException {
        typeSer.writeTypePrefixForScalar(value, jgen);
        serialize(value, jgen, provider);
        typeSer.writeTypeSuffixForScalar(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
        return createSchemaNode("string", true);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        visitor.expectStringFormat(typeHint);
    }
}
