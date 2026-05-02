package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import java.io.IOException;
import java.lang.reflect.Type;

@JacksonStdImpl
/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/ToStringSerializer.class */
public class ToStringSerializer extends StdSerializer<Object> {
    public static final ToStringSerializer instance = new ToStringSerializer();

    public ToStringSerializer() {
        super(Object.class);
    }

    public ToStringSerializer(Class<?> handledType) {
        super(handledType, false);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    @Deprecated
    public boolean isEmpty(Object value) {
        return isEmpty(null, value);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(SerializerProvider prov, Object value) {
        if (value == null) {
            return true;
        }
        String str = value.toString();
        return str.isEmpty();
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Object value, JsonGenerator gen, SerializerProvider provider) throws IOException {
        gen.writeString(value.toString());
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(Object value, JsonGenerator gen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        typeSer.writeTypePrefixForScalar(value, gen);
        serialize(value, gen, provider);
        typeSer.writeTypeSuffixForScalar(value, gen);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) throws JsonMappingException {
        return createSchemaNode("string", true);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        if (visitor != null) {
            visitor.expectStringFormat(typeHint);
        }
    }
}
