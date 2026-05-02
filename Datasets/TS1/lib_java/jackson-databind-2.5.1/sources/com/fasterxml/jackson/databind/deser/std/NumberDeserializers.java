package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashSet;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers.class */
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

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$PrimitiveOrWrapperDeserializer.class */
    protected static abstract class PrimitiveOrWrapperDeserializer<T> extends StdScalarDeserializer<T> {
        private static final long serialVersionUID = 1;
        protected final T _nullValue;

        protected PrimitiveOrWrapperDeserializer(Class<T> vc, T nvl) {
            super((Class<?>) vc);
            this._nullValue = nvl;
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public final T getNullValue() {
            return this._nullValue;
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$BooleanDeserializer.class */
    public static final class BooleanDeserializer extends PrimitiveOrWrapperDeserializer<Boolean> {
        private static final long serialVersionUID = 1;
        static final BooleanDeserializer primitiveInstance = new BooleanDeserializer(Boolean.class, Boolean.FALSE);
        static final BooleanDeserializer wrapperInstance = new BooleanDeserializer(Boolean.TYPE, null);

        public BooleanDeserializer(Class<Boolean> cls, Boolean nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Boolean deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            return _parseBoolean(jp, ctxt);
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
        public Boolean deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
            return _parseBoolean(jp, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$ByteDeserializer.class */
    public static class ByteDeserializer extends PrimitiveOrWrapperDeserializer<Byte> {
        private static final long serialVersionUID = 1;
        static final ByteDeserializer primitiveInstance = new ByteDeserializer(Byte.TYPE, (byte) 0);
        static final ByteDeserializer wrapperInstance = new ByteDeserializer(Byte.class, null);

        public ByteDeserializer(Class<Byte> cls, Byte nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Byte deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            return _parseByte(jp, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$ShortDeserializer.class */
    public static class ShortDeserializer extends PrimitiveOrWrapperDeserializer<Short> {
        private static final long serialVersionUID = 1;
        static final ShortDeserializer primitiveInstance = new ShortDeserializer(Short.class, 0);
        static final ShortDeserializer wrapperInstance = new ShortDeserializer(Short.TYPE, null);

        public ShortDeserializer(Class<Short> cls, Short nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Short deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            return _parseShort(jp, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$CharacterDeserializer.class */
    public static class CharacterDeserializer extends PrimitiveOrWrapperDeserializer<Character> {
        private static final long serialVersionUID = 1;
        static final CharacterDeserializer primitiveInstance = new CharacterDeserializer(Character.class, 0);
        static final CharacterDeserializer wrapperInstance = new CharacterDeserializer(Character.TYPE, null);

        public CharacterDeserializer(Class<Character> cls, Character nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Character deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            JsonToken t = jp.getCurrentToken();
            if (t == JsonToken.VALUE_NUMBER_INT) {
                int value = jp.getIntValue();
                if (value >= 0 && value <= 65535) {
                    return Character.valueOf((char) value);
                }
            } else if (t == JsonToken.VALUE_STRING) {
                String text = jp.getText();
                if (text.length() == 1) {
                    return Character.valueOf(text.charAt(0));
                }
                if (text.length() == 0) {
                    return getEmptyValue();
                }
            } else if (t == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                jp.nextToken();
                Character value2 = deserialize(jp, ctxt);
                if (jp.nextToken() != JsonToken.END_ARRAY) {
                    throw ctxt.wrongTokenException(jp, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single '" + this._valueClass.getName() + "' value but there was more than a single value in the array");
                }
                return value2;
            }
            throw ctxt.mappingException(this._valueClass, t);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$IntegerDeserializer.class */
    public static final class IntegerDeserializer extends PrimitiveOrWrapperDeserializer<Integer> {
        private static final long serialVersionUID = 1;
        static final IntegerDeserializer primitiveInstance = new IntegerDeserializer(Integer.class, 0);
        static final IntegerDeserializer wrapperInstance = new IntegerDeserializer(Integer.TYPE, null);

        public IntegerDeserializer(Class<Integer> cls, Integer nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Integer deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            return _parseInteger(jp, ctxt);
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
        public Integer deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
            return _parseInteger(jp, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$LongDeserializer.class */
    public static final class LongDeserializer extends PrimitiveOrWrapperDeserializer<Long> {
        private static final long serialVersionUID = 1;
        static final LongDeserializer primitiveInstance = new LongDeserializer(Long.class, 0L);
        static final LongDeserializer wrapperInstance = new LongDeserializer(Long.TYPE, null);

        public LongDeserializer(Class<Long> cls, Long nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Long deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            return _parseLong(jp, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$FloatDeserializer.class */
    public static class FloatDeserializer extends PrimitiveOrWrapperDeserializer<Float> {
        private static final long serialVersionUID = 1;
        static final FloatDeserializer primitiveInstance = new FloatDeserializer(Float.class, Float.valueOf(0.0f));
        static final FloatDeserializer wrapperInstance = new FloatDeserializer(Float.TYPE, null);

        public FloatDeserializer(Class<Float> cls, Float nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Float deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            return _parseFloat(jp, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$DoubleDeserializer.class */
    public static class DoubleDeserializer extends PrimitiveOrWrapperDeserializer<Double> {
        private static final long serialVersionUID = 1;
        static final DoubleDeserializer primitiveInstance = new DoubleDeserializer(Double.class, Double.valueOf(0.0d));
        static final DoubleDeserializer wrapperInstance = new DoubleDeserializer(Double.TYPE, null);

        public DoubleDeserializer(Class<Double> cls, Double nvl) {
            super(cls, nvl);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Double deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            return _parseDouble(jp, ctxt);
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
        public Double deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
            return _parseDouble(jp, ctxt);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$NumberDeserializer.class */
    public static class NumberDeserializer extends StdScalarDeserializer<Number> {
        public static final NumberDeserializer instance = new NumberDeserializer();

        public NumberDeserializer() {
            super((Class<?>) Number.class);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Number deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            JsonToken t = jp.getCurrentToken();
            if (t == JsonToken.VALUE_NUMBER_INT) {
                if (ctxt.isEnabled(DeserializationFeature.USE_BIG_INTEGER_FOR_INTS)) {
                    return jp.getBigIntegerValue();
                }
                return jp.getNumberValue();
            }
            if (t == JsonToken.VALUE_NUMBER_FLOAT) {
                if (ctxt.isEnabled(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS)) {
                    return jp.getDecimalValue();
                }
                return Double.valueOf(jp.getDoubleValue());
            }
            if (t == JsonToken.VALUE_STRING) {
                String text = jp.getText().trim();
                if (text.length() == 0) {
                    return getEmptyValue();
                }
                if (_hasTextualNull(text)) {
                    return getNullValue();
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
                    if (text.indexOf(46) >= 0) {
                        if (ctxt.isEnabled(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS)) {
                            return new BigDecimal(text);
                        }
                        return new Double(text);
                    }
                    if (ctxt.isEnabled(DeserializationFeature.USE_BIG_INTEGER_FOR_INTS)) {
                        return new BigInteger(text);
                    }
                    long value = Long.parseLong(text);
                    if (value <= 2147483647L && value >= -2147483648L) {
                        return Integer.valueOf((int) value);
                    }
                    return Long.valueOf(value);
                } catch (IllegalArgumentException e) {
                    throw ctxt.weirdStringException(text, this._valueClass, "not a valid number");
                }
            }
            if (t == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                jp.nextToken();
                Number value2 = deserialize(jp, ctxt);
                if (jp.nextToken() != JsonToken.END_ARRAY) {
                    throw ctxt.wrongTokenException(jp, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single '" + this._valueClass.getName() + "' value but there was more than a single value in the array");
                }
                return value2;
            }
            throw ctxt.mappingException(this._valueClass, t);
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
        public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
            switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[jp.getCurrentToken().ordinal()]) {
                case 1:
                case 2:
                case 3:
                    return deserialize(jp, ctxt);
                default:
                    return typeDeserializer.deserializeTypedFromScalar(jp, ctxt);
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$BigIntegerDeserializer.class */
    public static class BigIntegerDeserializer extends StdScalarDeserializer<BigInteger> {
        public static final BigIntegerDeserializer instance = new BigIntegerDeserializer();

        public BigIntegerDeserializer() {
            super((Class<?>) BigInteger.class);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public BigInteger deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            JsonToken t = jp.getCurrentToken();
            if (t == JsonToken.VALUE_NUMBER_INT) {
                switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[jp.getNumberType().ordinal()]) {
                    case 1:
                    case 2:
                        return BigInteger.valueOf(jp.getLongValue());
                }
            }
            if (t == JsonToken.VALUE_NUMBER_FLOAT) {
                return jp.getDecimalValue().toBigInteger();
            }
            if (t == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                jp.nextToken();
                BigInteger value = deserialize(jp, ctxt);
                if (jp.nextToken() != JsonToken.END_ARRAY) {
                    throw ctxt.wrongTokenException(jp, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'BigInteger' value but there was more than a single value in the array");
                }
                return value;
            }
            if (t != JsonToken.VALUE_STRING) {
                throw ctxt.mappingException(this._valueClass, t);
            }
            String text = jp.getText().trim();
            if (text.length() == 0) {
                return null;
            }
            try {
                return new BigInteger(text);
            } catch (IllegalArgumentException e) {
                throw ctxt.weirdStringException(text, this._valueClass, "not a valid representation");
            }
        }
    }

    /* renamed from: com.fasterxml.jackson.databind.deser.std.NumberDeserializers$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$fasterxml$jackson$core$JsonToken;
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
            $SwitchMap$com$fasterxml$jackson$core$JsonToken = new int[JsonToken.values().length];
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_NUMBER_INT.ordinal()] = 1;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_NUMBER_FLOAT.ordinal()] = 2;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_STRING.ordinal()] = 3;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/NumberDeserializers$BigDecimalDeserializer.class */
    public static class BigDecimalDeserializer extends StdScalarDeserializer<BigDecimal> {
        public static final BigDecimalDeserializer instance = new BigDecimalDeserializer();

        public BigDecimalDeserializer() {
            super((Class<?>) BigDecimal.class);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public BigDecimal deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            JsonToken t = jp.getCurrentToken();
            if (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) {
                return jp.getDecimalValue();
            }
            if (t == JsonToken.VALUE_STRING) {
                String text = jp.getText().trim();
                if (text.length() == 0) {
                    return null;
                }
                try {
                    return new BigDecimal(text);
                } catch (IllegalArgumentException e) {
                    throw ctxt.weirdStringException(text, this._valueClass, "not a valid representation");
                }
            }
            if (t == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                jp.nextToken();
                BigDecimal value = deserialize(jp, ctxt);
                if (jp.nextToken() != JsonToken.END_ARRAY) {
                    throw ctxt.wrongTokenException(jp, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'BigDecimal' value but there was more than a single value in the array");
                }
                return value;
            }
            throw ctxt.mappingException(this._valueClass, t);
        }
    }
}
