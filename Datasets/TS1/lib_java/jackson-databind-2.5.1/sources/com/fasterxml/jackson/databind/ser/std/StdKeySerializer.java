package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Date;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializer.class */
public class StdKeySerializer extends StdSerializer<Object> {
    public StdKeySerializer() {
        super(Object.class);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Object value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        String str;
        Class<?> cls = value.getClass();
        if (cls == String.class) {
            str = (String) value;
        } else if (Date.class.isAssignableFrom(cls)) {
            provider.defaultSerializeDateKey((Date) value, jgen);
            return;
        } else if (cls == Class.class) {
            str = ((Class) value).getName();
        } else {
            str = value.toString();
        }
        jgen.writeFieldName(str);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) throws JsonMappingException {
        return createSchemaNode("string");
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        visitor.expectStringFormat(typeHint);
    }
}
