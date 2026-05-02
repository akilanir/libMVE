package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import java.io.IOException;
import java.lang.reflect.Type;

@JacksonStdImpl
/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/BooleanSerializer.class */
public final class BooleanSerializer extends NonTypedScalarSerializerBase<Boolean> {
    private static final long serialVersionUID = 1;
    protected final boolean _forPrimitive;

    public BooleanSerializer(boolean forPrimitive) {
        super(Boolean.class);
        this._forPrimitive = forPrimitive;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Boolean value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        jgen.writeBoolean(value.booleanValue());
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
        return createSchemaNode("boolean", !this._forPrimitive);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        if (visitor != null) {
            visitor.expectBooleanFormat(typeHint);
        }
    }
}
