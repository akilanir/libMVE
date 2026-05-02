package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonIntegerFormatVisitor;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Map;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/NumberSerializers.class */
public class NumberSerializers {
    protected NumberSerializers() {
    }

    public static void addAll(Map<String, JsonSerializer<?>> allDeserializers) {
        JsonSerializer<?> intS = new IntegerSerializer();
        allDeserializers.put(Integer.class.getName(), intS);
        allDeserializers.put(Integer.TYPE.getName(), intS);
        allDeserializers.put(Long.class.getName(), LongSerializer.instance);
        allDeserializers.put(Long.TYPE.getName(), LongSerializer.instance);
        allDeserializers.put(Byte.class.getName(), IntLikeSerializer.instance);
        allDeserializers.put(Byte.TYPE.getName(), IntLikeSerializer.instance);
        allDeserializers.put(Short.class.getName(), ShortSerializer.instance);
        allDeserializers.put(Short.TYPE.getName(), ShortSerializer.instance);
        allDeserializers.put(Float.class.getName(), FloatSerializer.instance);
        allDeserializers.put(Float.TYPE.getName(), FloatSerializer.instance);
        allDeserializers.put(Double.class.getName(), DoubleSerializer.instance);
        allDeserializers.put(Double.TYPE.getName(), DoubleSerializer.instance);
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/NumberSerializers$Base.class */
    protected static abstract class Base<T> extends StdScalarSerializer<T> implements ContextualSerializer {
        protected final JsonParser.NumberType _numberType;
        protected final String _schemaType;

        protected Base(Class<T> cls, JsonParser.NumberType numberType, String schemaType) {
            super(cls);
            this._numberType = numberType;
            this._schemaType = schemaType;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
            return createSchemaNode(this._schemaType, true);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
            JsonIntegerFormatVisitor v2 = visitor.expectIntegerFormat(typeHint);
            if (v2 != null) {
                v2.numberType(this._numberType);
            }
        }

        @Override // com.fasterxml.jackson.databind.ser.ContextualSerializer
        public JsonSerializer<?> createContextual(SerializerProvider prov, BeanProperty property) throws JsonMappingException {
            JsonFormat.Value format;
            if (property != null && (format = prov.getAnnotationIntrospector().findFormat(property.getMember())) != null) {
                switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape[format.getShape().ordinal()]) {
                    case 1:
                        return ToStringSerializer.instance;
                }
            }
            return this;
        }
    }

    /* renamed from: com.fasterxml.jackson.databind.ser.std.NumberSerializers$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/NumberSerializers$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape = new int[JsonFormat.Shape.values().length];

        static {
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape[JsonFormat.Shape.STRING.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/NumberSerializers$ShortSerializer.class */
    public static final class ShortSerializer extends Base<Short> {
        static final ShortSerializer instance = new ShortSerializer();

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.ContextualSerializer
        public /* bridge */ /* synthetic */ JsonSerializer createContextual(SerializerProvider x0, BeanProperty x1) throws JsonMappingException {
            return super.createContextual(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public /* bridge */ /* synthetic */ void acceptJsonFormatVisitor(JsonFormatVisitorWrapper x0, JavaType x1) throws JsonMappingException {
            super.acceptJsonFormatVisitor(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public /* bridge */ /* synthetic */ JsonNode getSchema(SerializerProvider x0, Type x1) {
            return super.getSchema(x0, x1);
        }

        public ShortSerializer() {
            super(Short.class, JsonParser.NumberType.INT, "number");
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Short value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            jgen.writeNumber(value.shortValue());
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/NumberSerializers$IntegerSerializer.class */
    public static final class IntegerSerializer extends Base<Integer> {
        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.ContextualSerializer
        public /* bridge */ /* synthetic */ JsonSerializer createContextual(SerializerProvider x0, BeanProperty x1) throws JsonMappingException {
            return super.createContextual(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public /* bridge */ /* synthetic */ void acceptJsonFormatVisitor(JsonFormatVisitorWrapper x0, JavaType x1) throws JsonMappingException {
            super.acceptJsonFormatVisitor(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public /* bridge */ /* synthetic */ JsonNode getSchema(SerializerProvider x0, Type x1) {
            return super.getSchema(x0, x1);
        }

        public IntegerSerializer() {
            super(Integer.class, JsonParser.NumberType.INT, "integer");
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Integer value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            jgen.writeNumber(value.intValue());
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serializeWithType(Integer value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
            serialize(value, jgen, provider);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/NumberSerializers$IntLikeSerializer.class */
    public static final class IntLikeSerializer extends Base<Number> {
        static final IntLikeSerializer instance = new IntLikeSerializer();

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.ContextualSerializer
        public /* bridge */ /* synthetic */ JsonSerializer createContextual(SerializerProvider x0, BeanProperty x1) throws JsonMappingException {
            return super.createContextual(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public /* bridge */ /* synthetic */ void acceptJsonFormatVisitor(JsonFormatVisitorWrapper x0, JavaType x1) throws JsonMappingException {
            super.acceptJsonFormatVisitor(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public /* bridge */ /* synthetic */ JsonNode getSchema(SerializerProvider x0, Type x1) {
            return super.getSchema(x0, x1);
        }

        public IntLikeSerializer() {
            super(Number.class, JsonParser.NumberType.INT, "integer");
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Number value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            jgen.writeNumber(value.intValue());
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/NumberSerializers$LongSerializer.class */
    public static final class LongSerializer extends Base<Long> {
        static final LongSerializer instance = new LongSerializer();

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.ContextualSerializer
        public /* bridge */ /* synthetic */ JsonSerializer createContextual(SerializerProvider x0, BeanProperty x1) throws JsonMappingException {
            return super.createContextual(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public /* bridge */ /* synthetic */ void acceptJsonFormatVisitor(JsonFormatVisitorWrapper x0, JavaType x1) throws JsonMappingException {
            super.acceptJsonFormatVisitor(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public /* bridge */ /* synthetic */ JsonNode getSchema(SerializerProvider x0, Type x1) {
            return super.getSchema(x0, x1);
        }

        public LongSerializer() {
            super(Long.class, JsonParser.NumberType.LONG, "number");
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Long value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            jgen.writeNumber(value.longValue());
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/NumberSerializers$FloatSerializer.class */
    public static final class FloatSerializer extends Base<Float> {
        static final FloatSerializer instance = new FloatSerializer();

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.ContextualSerializer
        public /* bridge */ /* synthetic */ JsonSerializer createContextual(SerializerProvider x0, BeanProperty x1) throws JsonMappingException {
            return super.createContextual(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public /* bridge */ /* synthetic */ void acceptJsonFormatVisitor(JsonFormatVisitorWrapper x0, JavaType x1) throws JsonMappingException {
            super.acceptJsonFormatVisitor(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public /* bridge */ /* synthetic */ JsonNode getSchema(SerializerProvider x0, Type x1) {
            return super.getSchema(x0, x1);
        }

        public FloatSerializer() {
            super(Float.class, JsonParser.NumberType.FLOAT, "number");
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Float value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            jgen.writeNumber(value.floatValue());
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/NumberSerializers$DoubleSerializer.class */
    public static final class DoubleSerializer extends Base<Double> {
        static final DoubleSerializer instance = new DoubleSerializer();

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.ContextualSerializer
        public /* bridge */ /* synthetic */ JsonSerializer createContextual(SerializerProvider x0, BeanProperty x1) throws JsonMappingException {
            return super.createContextual(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public /* bridge */ /* synthetic */ void acceptJsonFormatVisitor(JsonFormatVisitorWrapper x0, JavaType x1) throws JsonMappingException {
            super.acceptJsonFormatVisitor(x0, x1);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.NumberSerializers.Base, com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public /* bridge */ /* synthetic */ JsonNode getSchema(SerializerProvider x0, Type x1) {
            return super.getSchema(x0, x1);
        }

        public DoubleSerializer() {
            super(Double.class, JsonParser.NumberType.DOUBLE, "number");
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Double value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            jgen.writeNumber(value.doubleValue());
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serializeWithType(Double value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
            serialize(value, jgen, provider);
        }
    }
}
