package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.Base64Variants;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.util.ArrayBuilders;
import java.io.IOException;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/PrimitiveArrayDeserializers.class */
public abstract class PrimitiveArrayDeserializers<T> extends StdDeserializer<T> {
    protected PrimitiveArrayDeserializers(Class<T> cls) {
        super((Class<?>) cls);
    }

    public static JsonDeserializer<?> forType(Class<?> rawType) {
        if (rawType == Integer.TYPE) {
            return IntDeser.instance;
        }
        if (rawType == Long.TYPE) {
            return LongDeser.instance;
        }
        if (rawType == Byte.TYPE) {
            return new ByteDeser();
        }
        if (rawType == Short.TYPE) {
            return new ShortDeser();
        }
        if (rawType == Float.TYPE) {
            return new FloatDeser();
        }
        if (rawType == Double.TYPE) {
            return new DoubleDeser();
        }
        if (rawType == Boolean.TYPE) {
            return new BooleanDeser();
        }
        if (rawType == Character.TYPE) {
            return new CharDeser();
        }
        throw new IllegalStateException();
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
        return typeDeserializer.deserializeTypedFromArray(jp, ctxt);
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/PrimitiveArrayDeserializers$CharDeser.class */
    static final class CharDeser extends PrimitiveArrayDeserializers<char[]> {
        private static final long serialVersionUID = 1;

        public CharDeser() {
            super(char[].class);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public char[] deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            JsonToken t = jp.getCurrentToken();
            if (t == JsonToken.VALUE_STRING) {
                char[] buffer = jp.getTextCharacters();
                int offset = jp.getTextOffset();
                int len = jp.getTextLength();
                char[] result = new char[len];
                System.arraycopy(buffer, offset, result, 0, len);
                return result;
            }
            if (jp.isExpectedStartArrayToken()) {
                StringBuilder sb = new StringBuilder(64);
                while (true) {
                    JsonToken t2 = jp.nextToken();
                    if (t2 != JsonToken.END_ARRAY) {
                        if (t2 != JsonToken.VALUE_STRING) {
                            throw ctxt.mappingException(Character.TYPE);
                        }
                        String str = jp.getText();
                        if (str.length() != 1) {
                            throw JsonMappingException.from(jp, "Can not convert a JSON String of length " + str.length() + " into a char element of char array");
                        }
                        sb.append(str.charAt(0));
                    } else {
                        return sb.toString().toCharArray();
                    }
                }
            } else {
                if (t == JsonToken.VALUE_EMBEDDED_OBJECT) {
                    Object ob = jp.getEmbeddedObject();
                    if (ob == null) {
                        return null;
                    }
                    if (ob instanceof char[]) {
                        return (char[]) ob;
                    }
                    if (ob instanceof String) {
                        return ((String) ob).toCharArray();
                    }
                    if (ob instanceof byte[]) {
                        return Base64Variants.getDefaultVariant().encode((byte[]) ob, false).toCharArray();
                    }
                }
                throw ctxt.mappingException(this._valueClass);
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/PrimitiveArrayDeserializers$BooleanDeser.class */
    static final class BooleanDeser extends PrimitiveArrayDeserializers<boolean[]> {
        private static final long serialVersionUID = 1;

        public BooleanDeser() {
            super(boolean[].class);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v19 */
        /* JADX WARN: Type inference failed for: r0v22, types: [boolean[]] */
        /* JADX WARN: Type inference failed for: r0v7, types: [boolean[]] */
        /* JADX WARN: Type inference failed for: r1v4 */
        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public boolean[] deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (!jp.isExpectedStartArrayToken()) {
                return handleNonArray(jp, ctxt);
            }
            ArrayBuilders.BooleanBuilder builder = ctxt.getArrayBuilders().getBooleanBuilder();
            T resetAndStart = builder.resetAndStart();
            int ix = 0;
            while (jp.nextToken() != JsonToken.END_ARRAY) {
                try {
                    boolean value = _parseBooleanPrimitive(jp, ctxt);
                    if (ix >= resetAndStart.length) {
                        resetAndStart = builder.appendCompletedChunk(resetAndStart, ix);
                        ix = 0;
                    }
                    int i = ix;
                    ix++;
                    resetAndStart[i] = value;
                } catch (Exception e) {
                    throw JsonMappingException.wrapWithPath(e, resetAndStart, ix);
                }
            }
            return builder.completeAndClearBuffer(resetAndStart, ix);
        }

        private final boolean[] handleNonArray(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (jp.getCurrentToken() == JsonToken.VALUE_STRING && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT) && jp.getText().length() == 0) {
                return null;
            }
            if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY)) {
                throw ctxt.mappingException(this._valueClass);
            }
            return new boolean[]{_parseBooleanPrimitive(jp, ctxt)};
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/PrimitiveArrayDeserializers$ByteDeser.class */
    static final class ByteDeser extends PrimitiveArrayDeserializers<byte[]> {
        private static final long serialVersionUID = 1;

        public ByteDeser() {
            super(byte[].class);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v11, types: [byte[]] */
        /* JADX WARN: Type inference failed for: r0v24 */
        /* JADX WARN: Type inference failed for: r0v27, types: [byte[]] */
        /* JADX WARN: Type inference failed for: r1v7 */
        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public byte[] deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            byte value;
            JsonToken t = jp.getCurrentToken();
            if (t == JsonToken.VALUE_STRING) {
                return jp.getBinaryValue(ctxt.getBase64Variant());
            }
            if (t == JsonToken.VALUE_EMBEDDED_OBJECT) {
                Object ob = jp.getEmbeddedObject();
                if (ob == null) {
                    return null;
                }
                if (ob instanceof byte[]) {
                    return (byte[]) ob;
                }
            }
            if (!jp.isExpectedStartArrayToken()) {
                return handleNonArray(jp, ctxt);
            }
            ArrayBuilders.ByteBuilder builder = ctxt.getArrayBuilders().getByteBuilder();
            T resetAndStart = builder.resetAndStart();
            int ix = 0;
            while (true) {
                try {
                    JsonToken t2 = jp.nextToken();
                    if (t2 != JsonToken.END_ARRAY) {
                        if (t2 == JsonToken.VALUE_NUMBER_INT || t2 == JsonToken.VALUE_NUMBER_FLOAT) {
                            value = jp.getByteValue();
                        } else {
                            if (t2 != JsonToken.VALUE_NULL) {
                                throw ctxt.mappingException(this._valueClass.getComponentType());
                            }
                            value = 0;
                        }
                        if (ix >= resetAndStart.length) {
                            resetAndStart = builder.appendCompletedChunk(resetAndStart, ix);
                            ix = 0;
                        }
                        int i = ix;
                        ix++;
                        resetAndStart[i] = value;
                    } else {
                        return builder.completeAndClearBuffer(resetAndStart, ix);
                    }
                } catch (Exception e) {
                    throw JsonMappingException.wrapWithPath(e, resetAndStart, ix);
                }
            }
        }

        private final byte[] handleNonArray(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            byte value;
            if (jp.getCurrentToken() == JsonToken.VALUE_STRING && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT) && jp.getText().length() == 0) {
                return null;
            }
            if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY)) {
                throw ctxt.mappingException(this._valueClass);
            }
            JsonToken t = jp.getCurrentToken();
            if (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) {
                value = jp.getByteValue();
            } else {
                if (t != JsonToken.VALUE_NULL) {
                    throw ctxt.mappingException(this._valueClass.getComponentType());
                }
                value = 0;
            }
            return new byte[]{value};
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/PrimitiveArrayDeserializers$ShortDeser.class */
    static final class ShortDeser extends PrimitiveArrayDeserializers<short[]> {
        private static final long serialVersionUID = 1;

        public ShortDeser() {
            super(short[].class);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v22, types: [short[]] */
        /* JADX WARN: Type inference failed for: r0v7, types: [short[]] */
        /* JADX WARN: Type inference failed for: r1v4 */
        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public short[] deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (!jp.isExpectedStartArrayToken()) {
                return handleNonArray(jp, ctxt);
            }
            ArrayBuilders.ShortBuilder builder = ctxt.getArrayBuilders().getShortBuilder();
            T resetAndStart = builder.resetAndStart();
            int ix = 0;
            while (jp.nextToken() != JsonToken.END_ARRAY) {
                try {
                    short value = _parseShortPrimitive(jp, ctxt);
                    if (ix >= resetAndStart.length) {
                        resetAndStart = builder.appendCompletedChunk(resetAndStart, ix);
                        ix = 0;
                    }
                    int i = ix;
                    ix++;
                    resetAndStart[i] = value;
                } catch (Exception e) {
                    throw JsonMappingException.wrapWithPath(e, resetAndStart, ix);
                }
            }
            return builder.completeAndClearBuffer(resetAndStart, ix);
        }

        private final short[] handleNonArray(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (jp.getCurrentToken() == JsonToken.VALUE_STRING && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT) && jp.getText().length() == 0) {
                return null;
            }
            if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY)) {
                throw ctxt.mappingException(this._valueClass);
            }
            return new short[]{_parseShortPrimitive(jp, ctxt)};
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/PrimitiveArrayDeserializers$IntDeser.class */
    static final class IntDeser extends PrimitiveArrayDeserializers<int[]> {
        private static final long serialVersionUID = 1;
        public static final IntDeser instance = new IntDeser();

        public IntDeser() {
            super(int[].class);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v19 */
        /* JADX WARN: Type inference failed for: r0v22, types: [int[]] */
        /* JADX WARN: Type inference failed for: r0v7, types: [int[]] */
        /* JADX WARN: Type inference failed for: r1v4 */
        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public int[] deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (!jp.isExpectedStartArrayToken()) {
                return handleNonArray(jp, ctxt);
            }
            ArrayBuilders.IntBuilder builder = ctxt.getArrayBuilders().getIntBuilder();
            T resetAndStart = builder.resetAndStart();
            int ix = 0;
            while (jp.nextToken() != JsonToken.END_ARRAY) {
                try {
                    int value = _parseIntPrimitive(jp, ctxt);
                    if (ix >= resetAndStart.length) {
                        resetAndStart = builder.appendCompletedChunk(resetAndStart, ix);
                        ix = 0;
                    }
                    int i = ix;
                    ix++;
                    resetAndStart[i] = value;
                } catch (Exception e) {
                    throw JsonMappingException.wrapWithPath(e, resetAndStart, ix);
                }
            }
            return builder.completeAndClearBuffer(resetAndStart, ix);
        }

        private final int[] handleNonArray(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (jp.getCurrentToken() == JsonToken.VALUE_STRING && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT) && jp.getText().length() == 0) {
                return null;
            }
            if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY)) {
                throw ctxt.mappingException(this._valueClass);
            }
            return new int[]{_parseIntPrimitive(jp, ctxt)};
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/PrimitiveArrayDeserializers$LongDeser.class */
    static final class LongDeser extends PrimitiveArrayDeserializers<long[]> {
        private static final long serialVersionUID = 1;
        public static final LongDeser instance = new LongDeser();

        public LongDeser() {
            super(long[].class);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v19 */
        /* JADX WARN: Type inference failed for: r0v22, types: [long[]] */
        /* JADX WARN: Type inference failed for: r0v7, types: [long[]] */
        /* JADX WARN: Type inference failed for: r1v4 */
        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public long[] deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (!jp.isExpectedStartArrayToken()) {
                return handleNonArray(jp, ctxt);
            }
            ArrayBuilders.LongBuilder builder = ctxt.getArrayBuilders().getLongBuilder();
            T resetAndStart = builder.resetAndStart();
            int ix = 0;
            while (jp.nextToken() != JsonToken.END_ARRAY) {
                try {
                    long value = _parseLongPrimitive(jp, ctxt);
                    if (ix >= resetAndStart.length) {
                        resetAndStart = builder.appendCompletedChunk(resetAndStart, ix);
                        ix = 0;
                    }
                    int i = ix;
                    ix++;
                    resetAndStart[i] = value;
                } catch (Exception e) {
                    throw JsonMappingException.wrapWithPath(e, resetAndStart, ix);
                }
            }
            return builder.completeAndClearBuffer(resetAndStart, ix);
        }

        private final long[] handleNonArray(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (jp.getCurrentToken() == JsonToken.VALUE_STRING && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT) && jp.getText().length() == 0) {
                return null;
            }
            if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY)) {
                throw ctxt.mappingException(this._valueClass);
            }
            return new long[]{_parseLongPrimitive(jp, ctxt)};
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/PrimitiveArrayDeserializers$FloatDeser.class */
    static final class FloatDeser extends PrimitiveArrayDeserializers<float[]> {
        private static final long serialVersionUID = 1;

        public FloatDeser() {
            super(float[].class);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v19 */
        /* JADX WARN: Type inference failed for: r0v22, types: [float[]] */
        /* JADX WARN: Type inference failed for: r0v7, types: [float[]] */
        /* JADX WARN: Type inference failed for: r1v4 */
        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public float[] deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (!jp.isExpectedStartArrayToken()) {
                return handleNonArray(jp, ctxt);
            }
            ArrayBuilders.FloatBuilder builder = ctxt.getArrayBuilders().getFloatBuilder();
            T resetAndStart = builder.resetAndStart();
            int ix = 0;
            while (jp.nextToken() != JsonToken.END_ARRAY) {
                try {
                    float value = _parseFloatPrimitive(jp, ctxt);
                    if (ix >= resetAndStart.length) {
                        resetAndStart = builder.appendCompletedChunk(resetAndStart, ix);
                        ix = 0;
                    }
                    int i = ix;
                    ix++;
                    resetAndStart[i] = value;
                } catch (Exception e) {
                    throw JsonMappingException.wrapWithPath(e, resetAndStart, ix);
                }
            }
            return builder.completeAndClearBuffer(resetAndStart, ix);
        }

        private final float[] handleNonArray(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (jp.getCurrentToken() == JsonToken.VALUE_STRING && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT) && jp.getText().length() == 0) {
                return null;
            }
            if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY)) {
                throw ctxt.mappingException(this._valueClass);
            }
            return new float[]{_parseFloatPrimitive(jp, ctxt)};
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/PrimitiveArrayDeserializers$DoubleDeser.class */
    static final class DoubleDeser extends PrimitiveArrayDeserializers<double[]> {
        private static final long serialVersionUID = 1;

        public DoubleDeser() {
            super(double[].class);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v19 */
        /* JADX WARN: Type inference failed for: r0v22, types: [double[]] */
        /* JADX WARN: Type inference failed for: r0v7, types: [double[]] */
        /* JADX WARN: Type inference failed for: r1v4 */
        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public double[] deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (!jp.isExpectedStartArrayToken()) {
                return handleNonArray(jp, ctxt);
            }
            ArrayBuilders.DoubleBuilder builder = ctxt.getArrayBuilders().getDoubleBuilder();
            T resetAndStart = builder.resetAndStart();
            int ix = 0;
            while (jp.nextToken() != JsonToken.END_ARRAY) {
                try {
                    double value = _parseDoublePrimitive(jp, ctxt);
                    if (ix >= resetAndStart.length) {
                        resetAndStart = builder.appendCompletedChunk(resetAndStart, ix);
                        ix = 0;
                    }
                    int i = ix;
                    ix++;
                    resetAndStart[i] = value;
                } catch (Exception e) {
                    throw JsonMappingException.wrapWithPath(e, resetAndStart, ix);
                }
            }
            return builder.completeAndClearBuffer(resetAndStart, ix);
        }

        private final double[] handleNonArray(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (jp.getCurrentToken() == JsonToken.VALUE_STRING && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT) && jp.getText().length() == 0) {
                return null;
            }
            if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY)) {
                throw ctxt.mappingException(this._valueClass);
            }
            return new double[]{_parseDoublePrimitive(jp, ctxt)};
        }
    }
}
