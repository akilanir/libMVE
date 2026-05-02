package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonIntegerFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonNumberFormatVisitor;
import java.io.IOException;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;

@JacksonStdImpl
/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/NumberSerializer.class */
public class NumberSerializer extends StdScalarSerializer<Number> {
    public static final NumberSerializer instance = new NumberSerializer(Number.class);
    protected final boolean _isInt;

    @Deprecated
    public NumberSerializer() {
        super(Number.class);
        this._isInt = false;
    }

    public NumberSerializer(Class<? extends Number> rawType) {
        super(rawType, false);
        this._isInt = rawType == BigInteger.class;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Number value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        if (value instanceof BigDecimal) {
            jgen.writeNumber((BigDecimal) value);
            return;
        }
        if (value instanceof BigInteger) {
            jgen.writeNumber((BigInteger) value);
            return;
        }
        if (value instanceof Integer) {
            jgen.writeNumber(value.intValue());
            return;
        }
        if (value instanceof Long) {
            jgen.writeNumber(value.longValue());
            return;
        }
        if (value instanceof Double) {
            jgen.writeNumber(value.doubleValue());
            return;
        }
        if (value instanceof Float) {
            jgen.writeNumber(value.floatValue());
        } else if ((value instanceof Byte) || (value instanceof Short)) {
            jgen.writeNumber(value.intValue());
        } else {
            jgen.writeNumber(value.toString());
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
        return createSchemaNode(this._isInt ? "integer" : "number", true);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        if (this._isInt) {
            JsonIntegerFormatVisitor v2 = visitor.expectIntegerFormat(typeHint);
            if (v2 != null) {
                v2.numberType(JsonParser.NumberType.BIG_INTEGER);
                return;
            }
            return;
        }
        JsonNumberFormatVisitor v22 = visitor.expectNumberFormat(typeHint);
        if (v22 != null) {
            Class<?> h = handledType();
            if (h == BigDecimal.class) {
                v22.numberType(JsonParser.NumberType.BIG_DECIMAL);
            }
        }
    }
}
