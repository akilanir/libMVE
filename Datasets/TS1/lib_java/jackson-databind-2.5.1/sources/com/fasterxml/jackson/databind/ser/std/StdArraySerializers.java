package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.ser.ContainerSerializer;
import com.fasterxml.jackson.databind.type.TypeFactory;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.HashMap;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdArraySerializers.class */
public class StdArraySerializers {
    protected static final HashMap<String, JsonSerializer<?>> _arraySerializers = new HashMap<>();

    static {
        _arraySerializers.put(boolean[].class.getName(), new BooleanArraySerializer());
        _arraySerializers.put(byte[].class.getName(), new ByteArraySerializer());
        _arraySerializers.put(char[].class.getName(), new CharArraySerializer());
        _arraySerializers.put(short[].class.getName(), new ShortArraySerializer());
        _arraySerializers.put(int[].class.getName(), new IntArraySerializer());
        _arraySerializers.put(long[].class.getName(), new LongArraySerializer());
        _arraySerializers.put(float[].class.getName(), new FloatArraySerializer());
        _arraySerializers.put(double[].class.getName(), new DoubleArraySerializer());
    }

    protected StdArraySerializers() {
    }

    public static JsonSerializer<?> findStandardImpl(Class<?> cls) {
        return _arraySerializers.get(cls.getName());
    }

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdArraySerializers$TypedPrimitiveArraySerializer.class */
    protected static abstract class TypedPrimitiveArraySerializer<T> extends ArraySerializerBase<T> {
        protected final TypeSerializer _valueTypeSerializer;

        protected TypedPrimitiveArraySerializer(Class<T> cls) {
            super(cls);
            this._valueTypeSerializer = null;
        }

        protected TypedPrimitiveArraySerializer(TypedPrimitiveArraySerializer<T> src, BeanProperty prop, TypeSerializer vts) {
            super(src, prop);
            this._valueTypeSerializer = vts;
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdArraySerializers$BooleanArraySerializer.class */
    public static class BooleanArraySerializer extends ArraySerializerBase<boolean[]> {
        private static final JavaType VALUE_TYPE = TypeFactory.defaultInstance().uncheckedSimpleType(Boolean.class);

        public BooleanArraySerializer() {
            super(boolean[].class, (BeanProperty) null);
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public ContainerSerializer<?> _withValueTypeSerializer(TypeSerializer vts) {
            return this;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JavaType getContentType() {
            return VALUE_TYPE;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JsonSerializer<?> getContentSerializer() {
            return null;
        }

        @Override // com.fasterxml.jackson.databind.JsonSerializer
        public boolean isEmpty(SerializerProvider prov, boolean[] value) {
            return value == null || value.length == 0;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public boolean hasSingleElement(boolean[] value) {
            return value.length == 1;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public final void serialize(boolean[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            int len = value.length;
            if (len == 1 && provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) {
                serializeContents(value, jgen, provider);
                return;
            }
            jgen.writeStartArray(len);
            serializeContents(value, jgen, provider);
            jgen.writeEndArray();
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase
        public void serializeContents(boolean[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            for (boolean z : value) {
                jgen.writeBoolean(z);
            }
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
            ObjectNode o = createSchemaNode("array", true);
            o.set("items", createSchemaNode("boolean"));
            return o;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
            JsonArrayFormatVisitor v2;
            if (visitor != null && (v2 = visitor.expectArrayFormat(typeHint)) != null) {
                v2.itemsFormat(JsonFormatTypes.BOOLEAN);
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdArraySerializers$ByteArraySerializer.class */
    public static class ByteArraySerializer extends StdSerializer<byte[]> {
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

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdArraySerializers$ShortArraySerializer.class */
    public static class ShortArraySerializer extends TypedPrimitiveArraySerializer<short[]> {
        private static final JavaType VALUE_TYPE = TypeFactory.defaultInstance().uncheckedSimpleType(Short.TYPE);

        public ShortArraySerializer() {
            super(short[].class);
        }

        public ShortArraySerializer(ShortArraySerializer src, BeanProperty prop, TypeSerializer vts) {
            super(src, prop, vts);
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public ContainerSerializer<?> _withValueTypeSerializer(TypeSerializer vts) {
            return new ShortArraySerializer(this, this._property, vts);
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JavaType getContentType() {
            return VALUE_TYPE;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JsonSerializer<?> getContentSerializer() {
            return null;
        }

        @Override // com.fasterxml.jackson.databind.JsonSerializer
        public boolean isEmpty(SerializerProvider prov, short[] value) {
            return value == null || value.length == 0;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public boolean hasSingleElement(short[] value) {
            return value.length == 1;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public final void serialize(short[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            int len = value.length;
            if (len == 1 && provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) {
                serializeContents(value, jgen, provider);
                return;
            }
            jgen.writeStartArray(len);
            serializeContents(value, jgen, provider);
            jgen.writeEndArray();
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase
        public void serializeContents(short[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            if (this._valueTypeSerializer != null) {
                for (short s : value) {
                    this._valueTypeSerializer.writeTypePrefixForScalar(null, jgen, Short.TYPE);
                    jgen.writeNumber(s);
                    this._valueTypeSerializer.writeTypeSuffixForScalar(null, jgen);
                }
                return;
            }
            for (short s2 : value) {
                jgen.writeNumber(s2);
            }
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
            ObjectNode o = createSchemaNode("array", true);
            return o.set("items", createSchemaNode("integer"));
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
            JsonArrayFormatVisitor v2;
            if (visitor != null && (v2 = visitor.expectArrayFormat(typeHint)) != null) {
                v2.itemsFormat(JsonFormatTypes.INTEGER);
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdArraySerializers$CharArraySerializer.class */
    public static class CharArraySerializer extends StdSerializer<char[]> {
        public CharArraySerializer() {
            super(char[].class);
        }

        @Override // com.fasterxml.jackson.databind.JsonSerializer
        public boolean isEmpty(SerializerProvider prov, char[] value) {
            return value == null || value.length == 0;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(char[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            if (provider.isEnabled(SerializationFeature.WRITE_CHAR_ARRAYS_AS_JSON_ARRAYS)) {
                jgen.writeStartArray(value.length);
                _writeArrayContents(jgen, value);
                jgen.writeEndArray();
                return;
            }
            jgen.writeString(value, 0, value.length);
        }

        @Override // com.fasterxml.jackson.databind.JsonSerializer
        public void serializeWithType(char[] value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonGenerationException {
            if (provider.isEnabled(SerializationFeature.WRITE_CHAR_ARRAYS_AS_JSON_ARRAYS)) {
                typeSer.writeTypePrefixForArray(value, jgen);
                _writeArrayContents(jgen, value);
                typeSer.writeTypeSuffixForArray(value, jgen);
            } else {
                typeSer.writeTypePrefixForScalar(value, jgen);
                jgen.writeString(value, 0, value.length);
                typeSer.writeTypeSuffixForScalar(value, jgen);
            }
        }

        private final void _writeArrayContents(JsonGenerator jgen, char[] value) throws IOException, JsonGenerationException {
            int len = value.length;
            for (int i = 0; i < len; i++) {
                jgen.writeString(value, i, 1);
            }
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
            ObjectNode o = createSchemaNode("array", true);
            ObjectNode itemSchema = createSchemaNode("string");
            itemSchema.put("type", "string");
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

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdArraySerializers$IntArraySerializer.class */
    public static class IntArraySerializer extends ArraySerializerBase<int[]> {
        private static final JavaType VALUE_TYPE = TypeFactory.defaultInstance().uncheckedSimpleType(Integer.TYPE);

        public IntArraySerializer() {
            super(int[].class, (BeanProperty) null);
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public ContainerSerializer<?> _withValueTypeSerializer(TypeSerializer vts) {
            return this;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JavaType getContentType() {
            return VALUE_TYPE;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JsonSerializer<?> getContentSerializer() {
            return null;
        }

        @Override // com.fasterxml.jackson.databind.JsonSerializer
        public boolean isEmpty(SerializerProvider prov, int[] value) {
            return value == null || value.length == 0;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public boolean hasSingleElement(int[] value) {
            return value.length == 1;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public final void serialize(int[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            int len = value.length;
            if (len == 1 && provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) {
                serializeContents(value, jgen, provider);
                return;
            }
            jgen.writeStartArray(len);
            serializeContents(value, jgen, provider);
            jgen.writeEndArray();
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase
        public void serializeContents(int[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            for (int i : value) {
                jgen.writeNumber(i);
            }
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
            return createSchemaNode("array", true).set("items", createSchemaNode("integer"));
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
            JsonArrayFormatVisitor v2;
            if (visitor != null && (v2 = visitor.expectArrayFormat(typeHint)) != null) {
                v2.itemsFormat(JsonFormatTypes.INTEGER);
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdArraySerializers$LongArraySerializer.class */
    public static class LongArraySerializer extends TypedPrimitiveArraySerializer<long[]> {
        private static final JavaType VALUE_TYPE = TypeFactory.defaultInstance().uncheckedSimpleType(Long.TYPE);

        public LongArraySerializer() {
            super(long[].class);
        }

        public LongArraySerializer(LongArraySerializer src, BeanProperty prop, TypeSerializer vts) {
            super(src, prop, vts);
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public ContainerSerializer<?> _withValueTypeSerializer(TypeSerializer vts) {
            return new LongArraySerializer(this, this._property, vts);
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JavaType getContentType() {
            return VALUE_TYPE;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JsonSerializer<?> getContentSerializer() {
            return null;
        }

        @Override // com.fasterxml.jackson.databind.JsonSerializer
        public boolean isEmpty(SerializerProvider prov, long[] value) {
            return value == null || value.length == 0;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public boolean hasSingleElement(long[] value) {
            return value.length == 1;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public final void serialize(long[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            int len = value.length;
            if (len == 1 && provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) {
                serializeContents(value, jgen, provider);
                return;
            }
            jgen.writeStartArray(len);
            serializeContents(value, jgen, provider);
            jgen.writeEndArray();
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase
        public void serializeContents(long[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            if (this._valueTypeSerializer != null) {
                for (long j : value) {
                    this._valueTypeSerializer.writeTypePrefixForScalar(null, jgen, Long.TYPE);
                    jgen.writeNumber(j);
                    this._valueTypeSerializer.writeTypeSuffixForScalar(null, jgen);
                }
                return;
            }
            for (long j2 : value) {
                jgen.writeNumber(j2);
            }
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
            return createSchemaNode("array", true).set("items", createSchemaNode("number", true));
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
            JsonArrayFormatVisitor v2;
            if (visitor != null && (v2 = visitor.expectArrayFormat(typeHint)) != null) {
                v2.itemsFormat(JsonFormatTypes.NUMBER);
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdArraySerializers$FloatArraySerializer.class */
    public static class FloatArraySerializer extends TypedPrimitiveArraySerializer<float[]> {
        private static final JavaType VALUE_TYPE = TypeFactory.defaultInstance().uncheckedSimpleType(Float.TYPE);

        public FloatArraySerializer() {
            super(float[].class);
        }

        public FloatArraySerializer(FloatArraySerializer src, BeanProperty prop, TypeSerializer vts) {
            super(src, prop, vts);
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public ContainerSerializer<?> _withValueTypeSerializer(TypeSerializer vts) {
            return new FloatArraySerializer(this, this._property, vts);
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JavaType getContentType() {
            return VALUE_TYPE;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JsonSerializer<?> getContentSerializer() {
            return null;
        }

        @Override // com.fasterxml.jackson.databind.JsonSerializer
        public boolean isEmpty(SerializerProvider prov, float[] value) {
            return value == null || value.length == 0;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public boolean hasSingleElement(float[] value) {
            return value.length == 1;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public final void serialize(float[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            int len = value.length;
            if (len == 1 && provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) {
                serializeContents(value, jgen, provider);
                return;
            }
            jgen.writeStartArray(len);
            serializeContents(value, jgen, provider);
            jgen.writeEndArray();
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase
        public void serializeContents(float[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            if (this._valueTypeSerializer != null) {
                for (float f : value) {
                    this._valueTypeSerializer.writeTypePrefixForScalar(null, jgen, Float.TYPE);
                    jgen.writeNumber(f);
                    this._valueTypeSerializer.writeTypeSuffixForScalar(null, jgen);
                }
                return;
            }
            for (float f2 : value) {
                jgen.writeNumber(f2);
            }
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
            return createSchemaNode("array", true).set("items", createSchemaNode("number"));
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
            JsonArrayFormatVisitor v2;
            if (visitor != null && (v2 = visitor.expectArrayFormat(typeHint)) != null) {
                v2.itemsFormat(JsonFormatTypes.NUMBER);
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdArraySerializers$DoubleArraySerializer.class */
    public static class DoubleArraySerializer extends ArraySerializerBase<double[]> {
        private static final JavaType VALUE_TYPE = TypeFactory.defaultInstance().uncheckedSimpleType(Double.TYPE);

        public DoubleArraySerializer() {
            super(double[].class, (BeanProperty) null);
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public ContainerSerializer<?> _withValueTypeSerializer(TypeSerializer vts) {
            return this;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JavaType getContentType() {
            return VALUE_TYPE;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public JsonSerializer<?> getContentSerializer() {
            return null;
        }

        @Override // com.fasterxml.jackson.databind.JsonSerializer
        public boolean isEmpty(SerializerProvider prov, double[] value) {
            return value == null || value.length == 0;
        }

        @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
        public boolean hasSingleElement(double[] value) {
            return value.length == 1;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public final void serialize(double[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            int len = value.length;
            if (len == 1 && provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED)) {
                serializeContents(value, jgen, provider);
                return;
            }
            jgen.writeStartArray(len);
            serializeContents(value, jgen, provider);
            jgen.writeEndArray();
        }

        @Override // com.fasterxml.jackson.databind.ser.std.ArraySerializerBase
        public void serializeContents(double[] value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            for (double d : value) {
                jgen.writeNumber(d);
            }
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
            return createSchemaNode("array", true).set("items", createSchemaNode("number"));
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
            JsonArrayFormatVisitor v2;
            if (visitor != null && (v2 = visitor.expectArrayFormat(typeHint)) != null) {
                v2.itemsFormat(JsonFormatTypes.NUMBER);
            }
        }
    }
}
