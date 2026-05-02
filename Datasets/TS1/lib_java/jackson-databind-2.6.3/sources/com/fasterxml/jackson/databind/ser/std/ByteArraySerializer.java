package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.node.ObjectNode;
import java.io.IOException;
import java.lang.reflect.Type;

@JacksonStdImpl
/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/ByteArraySerializer.class */
public class ByteArraySerializer extends StdSerializer<byte[]> {
    private static final long serialVersionUID = 1;

    public ByteArraySerializer() {
        super(byte[].class);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(SerializerProvider prov, byte[] value) {
        return value == null || value.length == 0;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(byte[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        jgen.writeBinary(provider.getConfig().getBase64Variant(), value, 0, value.length);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(byte[] value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        typeSer.writeTypePrefixForScalar(value, jgen);
        jgen.writeBinary(provider.getConfig().getBase64Variant(), value, 0, value.length);
        typeSer.writeTypeSuffixForScalar(value, jgen);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
        ObjectNode o = createSchemaNode("array", true);
        ObjectNode itemSchema = createSchemaNode("string");
        return o.set("items", itemSchema);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        JsonArrayFormatVisitor v2;
        if (visitor != null && (v2 = visitor.expectArrayFormat(typeHint)) != null) {
            v2.itemsFormat(JsonFormatTypes.STRING);
        }
    }
}
