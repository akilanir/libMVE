package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashSet;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers.class */
public class NumberDeserializers {
    private static final HashSet<String> _classNames = new HashSet<>();

    static {
        Class<?>[] numberTypes = {Boolean.class, Byte.class, Short.class, Character.class, Integer.class, Long.class, Float.class, Double.class, Number.class, BigDecimal.class, BigInteger.class};
        for (Class<?> cls : numberTypes) {
            _classNames.add(cls.getName());
        }
    }

    public static JsonDeserializer<?> find(Class<?> rawType, String clsName) {
        if (rawType.isPrimitive()) {
            if (rawType == Integer.TYPE) {
                return IntegerDeserializer.primitiveInstance;
            }
            if (rawType == Boolean.TYPE) {
                return BooleanDeserializer.primitiveInstance;
            }
            if (rawType == Long.TYPE) {
                return LongDeserializer.primitiveInstance;
            }
            if (rawType == Double.TYPE) {
                return DoubleDeserializer.primitiveInstance;
            }
            if (rawType == Character.TYPE) {
                return CharacterDeserializer.primitiveInstance;
            }
            if (rawType == Byte.TYPE) {
                return ByteDeserializer.primitiveInstance;
            }
            if (rawType == Short.TYPE) {
                return ShortDeserializer.primitiveInstance;
            }
            if (rawType == Float.TYPE) {
                return FloatDeserializer.primitiveInstance;
            }
        } else if (_classNames.contains(clsName)) {
            if (rawType == Integer.class) {
                return IntegerDeserializer.wrapperInstance;
            }
            if (rawType == Boolean.class) {
                return BooleanDeserializer.wrapperInstance;
            }
            if (rawType == Long.class) {
                return LongDeserializer.wrapperInstance;
            }
            if (rawType == Double.class) {
                return DoubleDeserializer.wrapperInstance;
            }
            if (rawType == Character.class) {
                return CharacterDeserializer.wrapperInstance;
            }
            if (rawType == Byte.class) {
                return ByteDeserializer.wrapperInstance;
            }
            if (rawType == Short.class) {
                return ShortDeserializer.wrapperInstance;
            }
            if (rawType == Float.class) {
                return FloatDeserializer.wrapperInstance;
            }
            if (rawType == Number.class) {
                return NumberDeserializer.instance;
            }
            if (rawType == BigDecimal.class) {
                return BigDecimalDeserializer.instance;
            }
            if (rawType == BigInteger.class) {
                return BigIntegerDeserializer.instance;
            }
        } else {
            return null;
        }
        throw new IllegalArgumentException("Internal error: can't find deserializer for " + rawType.getName());
    }

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$PrimitiveOrWrapperDeserializer.class */
    protected static abstract class PrimitiveOrWrapperDeserializer<T> extends StdScalarDeserializer<T> {
        private static final long serialVersionUID = 1;
        protected final T _nullValue;
        protected final boolean _primitive;

        protected PrimitiveOrWrapperDeserializer(Class<T> vc, T nvl) {
            super((Class<?>) vc);
            this._nullValue = nvl;
            this._primitive = vc.isPrimitive();
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public final T getNullValue(DeserializationContext ctxt) throws JsonMappingException {
            if (this._primitive && ctxt.isEnabled(DeserializationFeature.FAIL_ON_NULL_FOR_PRIMITIVES)) {
                throw ctxt.mappingException("Can not map JSON null into type %s (set DeserializationConfig.DeserializationFeature.FAIL_ON_NULL_FOR_PRIMITIVES to 'false' to allow)", handledType().toString());
            }
            return this._nullValue;
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        @Deprecated
        public final T getNullValue() {
            return this._nullValue;
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$BooleanDeserializer.class */
    public static final class BooleanDeserializer extends PrimitiveOrWrapperDeserializer<Boolean> {
        private static final long serialVersionUID = 1;
        static final BooleanDeserializer primitiveInstance = new BooleanDeserializer(Boolean.TYPE, Boolean.FALSE);
        static final BooleanDeserializer wrapperInstance = new BooleanDeserializer(Boolean.class, null);

        public BooleanDeserializer(Class<Boolean> cls, Boolean nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Boolean deserialize(JsonParser j, DeserializationContext ctxt) throws IOException {
            return _parseBoolean(j, ctxt);
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
        public Boolean deserializeWithType(JsonParser p, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
            return _parseBoolean(p, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$ByteDeserializer.class */
    public static class ByteDeserializer extends PrimitiveOrWrapperDeserializer<Byte> {
        private static final long serialVersionUID = 1;
        static final ByteDeserializer primitiveInstance = new ByteDeserializer(Byte.TYPE, (byte) 0);
        static final ByteDeserializer wrapperInstance = new ByteDeserializer(Byte.class, null);

        public ByteDeserializer(Class<Byte> cls, Byte nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Byte deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
            return _parseByte(p, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$ShortDeserializer.class */
    public static class ShortDeserializer extends PrimitiveOrWrapperDeserializer<Short> {
        private static final long serialVersionUID = 1;
        static final ShortDeserializer primitiveInstance = new ShortDeserializer(Short.TYPE, 0);
        static final ShortDeserializer wrapperInstance = new ShortDeserializer(Short.class, null);

        public ShortDeserializer(Class<Short> cls, Short nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Short deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            return _parseShort(jp, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$CharacterDeserializer.class */
    public static class CharacterDeserializer extends PrimitiveOrWrapperDeserializer<Character> {
        private static final long serialVersionUID = 1;
        static final CharacterDeserializer primitiveInstance = new CharacterDeserializer(Character.TYPE, 0);
        static final CharacterDeserializer wrapperInstance = new CharacterDeserializer(Character.class, null);

        public CharacterDeserializer(Class<Character> cls, Character nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Character deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            switch (p.getCurrentTokenId()) {
                case 3:
                    if (ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                        p.nextToken();
                        Character C = deserialize(p, ctxt);
                        if (p.nextToken() != JsonToken.END_ARRAY) {
                            throw ctxt.wrongTokenException(p, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single '" + this._valueClass.getName() + "' value but there was more than a single value in the array");
                        }
                        return C;
                    }
                    break;
                case 6:
                    String text = p.getText();
                    if (text.length() == 1) {
                        return Character.valueOf(text.charAt(0));
                    }
                    if (text.length() == 0) {
                        return getEmptyValue(ctxt);
                    }
                    break;
                case 7:
                    int value = p.getIntValue();
                    if (value >= 0 && value <= 65535) {
                        return Character.valueOf((char) value);
                    }
                    break;
            }
            throw ctxt.mappingException(this._valueClass, p.getCurrentToken());
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$IntegerDeserializer.class */
    public static final class IntegerDeserializer extends PrimitiveOrWrapperDeserializer<Integer> {
        private static final long serialVersionUID = 1;
        static final IntegerDeserializer primitiveInstance = new IntegerDeserializer(Integer.TYPE, 0);
        static final IntegerDeserializer wrapperInstance = new IntegerDeserializer(Integer.class, null);

        public IntegerDeserializer(Class<Integer> cls, Integer nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public boolean isCachable() {
            return true;
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Integer deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
            if (p.hasToken(JsonToken.VALUE_NUMBER_INT)) {
                return Integer.valueOf(p.getIntValue());
            }
            return _parseInteger(p, ctxt);
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
        public Integer deserializeWithType(JsonParser p, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
            if (p.hasToken(JsonToken.VALUE_NUMBER_INT)) {
                return Integer.valueOf(p.getIntValue());
            }
            return _parseInteger(p, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$LongDeserializer.class */
    public static final class LongDeserializer extends PrimitiveOrWrapperDeserializer<Long> {
        private static final long serialVersionUID = 1;
        static final LongDeserializer primitiveInstance = new LongDeserializer(Long.TYPE, 0L);
        static final LongDeserializer wrapperInstance = new LongDeserializer(Long.class, null);

        public LongDeserializer(Class<Long> cls, Long nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public boolean isCachable() {
            return true;
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Long deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
            if (p.hasToken(JsonToken.VALUE_NUMBER_INT)) {
                return Long.valueOf(p.getLongValue());
            }
            return _parseLong(p, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$FloatDeserializer.class */
    public static class FloatDeserializer extends PrimitiveOrWrapperDeserializer<Float> {
        private static final long serialVersionUID = 1;
        static final FloatDeserializer primitiveInstance = new FloatDeserializer(Float.TYPE, Float.valueOf(0.0f));
        static final FloatDeserializer wrapperInstance = new FloatDeserializer(Float.class, null);

        public FloatDeserializer(Class<Float> cls, Float nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Float deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
            return _parseFloat(p, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$DoubleDeserializer.class */
    public static class DoubleDeserializer extends PrimitiveOrWrapperDeserializer<Double> {
        private static final long serialVersionUID = 1;
        static final DoubleDeserializer primitiveInstance = new DoubleDeserializer(Double.TYPE, Double.valueOf(0.0d));
        static final DoubleDeserializer wrapperInstance = new DoubleDeserializer(Double.class, null);

        public DoubleDeserializer(Class<Double> cls, Double nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Double deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
            return _parseDouble(jp, ctxt);
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
        public Double deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
            return _parseDouble(jp, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$NumberDeserializer.class */
    public static class NumberDeserializer extends StdScalarDeserializer<Object> {
        public static final NumberDeserializer instance = new NumberDeserializer();

        public NumberDeserializer() {
            super((Class<?>) Number.class);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Object deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
            switch (p.getCurrentTokenId()) {
                case 3:
                    if (ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                        p.nextToken();
                        Object value = deserialize(p, ctxt);
                        if (p.nextToken() != JsonToken.END_ARRAY) {
                            throw ctxt.wrongTokenException(p, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single '" + this._valueClass.getName() + "' value but there was more than a single value in the array");
                        }
                        return value;
                    }
                    break;
                case 6:
                    String text = p.getText().trim();
                    if (text.length() == 0) {
                        return getEmptyValue(ctxt);
                    }
                    if (_hasTextualNull(text)) {
                        return getNullValue(ctxt);
                    }
                    if (_isPosInf(text)) {
                        return Double.valueOf(Double.POSITIVE_INFINITY);
                    }
                    if (_isNegInf(text)) {
                        return Double.valueOf(Double.NEGATIVE_INFINITY);
                    }
                    if (_isNaN(text)) {
                        return Double.valueOf(Double.NaN);
                    }
                    try {
                        if (!_isIntNumber(text)) {
                            if (ctxt.isEnabled(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS)) {
                                return new BigDecimal(text);
                            }
                            return new Double(text);
                        }
                        if (ctxt.isEnabled(DeserializationFeature.USE_BIG_INTEGER_FOR_INTS)) {
                            return new BigInteger(text);
                        }
                        long value2 = Long.parseLong(text);
                        if (!ctxt.isEnabled(DeserializationFeature.USE_LONG_FOR_INTS) && value2 <= 2147483647L && value2 >= -2147483648L) {
                            return Integer.valueOf((int) value2);
                        }
                        return Long.valueOf(value2);
                    } catch (IllegalArgumentException e) {
                        throw ctxt.weirdStringException(text, this._valueClass, "not a valid number");
                    }
                case 7:
                    if (ctxt.hasSomeOfFeatures(F_MASK_INT_COERCIONS)) {
                        return _coerceIntegral(p, ctxt);
                    }
                    return p.getNumberValue();
                case 8:
                    if (ctxt.isEnabled(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS)) {
                        return p.getDecimalValue();
                    }
                    return Double.valueOf(p.getDoubleValue());
            }
            throw ctxt.mappingException(this._valueClass, p.getCurrentToken());
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
        public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
            switch (jp.getCurrentTokenId()) {
                case 6:
                case 7:
                case 8:
                    return deserialize(jp, ctxt);
                default:
                    return typeDeserializer.deserializeTypedFromScalar(jp, ctxt);
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$BigIntegerDeserializer.class */
    public static class BigIntegerDeserializer extends StdScalarDeserializer<BigInteger> {
        public static final BigIntegerDeserializer instance = new BigIntegerDeserializer();

        public BigIntegerDeserializer() {
            super((Class<?>) BigInteger.class);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public BigInteger deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
            switch (p.getCurrentTokenId()) {
                case 3:
                    if (ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                        p.nextToken();
                        BigInteger value = deserialize(p, ctxt);
                        if (p.nextToken() != JsonToken.END_ARRAY) {
                            throw ctxt.wrongTokenException(p, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'BigInteger' value but there was more than a single value in the array");
                        }
                        return value;
                    }
                    break;
                case 6:
                    String text = p.getText().trim();
                    if (text.length() == 0) {
                        return null;
                    }
                    try {
                        return new BigInteger(text);
                    } catch (IllegalArgumentException e) {
                        throw ctxt.weirdStringException(text, this._valueClass, "not a valid representation");
                    }
                case 7:
                    switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[p.getNumberType().ordinal()]) {
                        case 1:
                        case 2:
                        case 3:
                            return p.getBigIntegerValue();
                    }
                case 8:
                    if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_FLOAT_AS_INT)) {
                        _failDoubleToIntCoercion(p, ctxt, "java.math.BigInteger");
                    }
                    return p.getDecimalValue().toBigInteger();
            }
            throw ctxt.mappingException(this._valueClass, p.getCurrentToken());
        }
    }

    /* renamed from: com.fasterxml.jackson.databind.deser.std.NumberDeserializers$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType = new int[JsonParser.NumberType.values().length];

        static {
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[JsonParser.NumberType.INT.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[JsonParser.NumberType.LONG.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[JsonParser.NumberType.BIG_INTEGER.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$BigDecimalDeserializer.class */
    public static class BigDecimalDeserializer extends StdScalarDeserializer<BigDecimal> {
        public static final BigDecimalDeserializer instance = new BigDecimalDeserializer();

        public BigDecimalDeserializer() {
            super((Class<?>) BigDecimal.class);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public BigDecimal deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
            switch (p.getCurrentTokenId()) {
                case 3:
                    if (ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                        p.nextToken();
                        BigDecimal value = deserialize(p, ctxt);
                        if (p.nextToken() != JsonToken.END_ARRAY) {
                            throw ctxt.wrongTokenException(p, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'BigDecimal' value but there was more than a single value in the array");
                        }
                        return value;
                    }
                    break;
                case 6:
                    String text = p.getText().trim();
                    if (text.length() == 0) {
                        return null;
                    }
                    try {
                        return new BigDecimal(text);
                    } catch (IllegalArgumentException e) {
                        throw ctxt.weirdStringException(text, this._valueClass, "not a valid representation");
                    }
                case 7:
                case 8:
                    return p.getDecimalValue();
            }
            throw ctxt.mappingException(this._valueClass, p.getCurrentToken());
        }
    }
}
