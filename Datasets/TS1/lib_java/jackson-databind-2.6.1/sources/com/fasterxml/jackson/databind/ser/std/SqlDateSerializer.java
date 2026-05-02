package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Date;
import java.text.DateFormat;

@JacksonStdImpl
/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ser/std/SqlDateSerializer.class */
public class SqlDateSerializer extends DateTimeSerializerBase<Date> {
    public SqlDateSerializer() {
        this(Boolean.FALSE);
    }

    protected SqlDateSerializer(Boolean useTimestamp) {
        super(Date.class, useTimestamp, null);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase
    /* renamed from: withFormat */
    public DateTimeSerializerBase<Date> withFormat2(Boolean timestamp, DateFormat customFormat) {
        return new SqlDateSerializer(timestamp);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase
    public long _timestamp(Date value) {
        if (value == null) {
            return 0L;
        }
        return value.getTime();
    }

    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Date value, JsonGenerator gen, SerializerProvider provider) throws IOException, JsonGenerationException {
        if (_asTimestamp(provider)) {
            gen.writeNumber(_timestamp(value));
        } else {
            gen.writeString(value.toString());
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
        return createSchemaNode("string", true);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        _acceptJsonFormatVisitor(visitor, typeHint, this._useTimestamp.booleanValue());
    }
}
