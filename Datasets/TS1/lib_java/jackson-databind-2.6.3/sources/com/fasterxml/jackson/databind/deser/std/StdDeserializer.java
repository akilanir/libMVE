package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.io.NumberInput;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.KeyDeserializer;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.Converter;
import java.io.IOException;
import java.io.Serializable;
import java.util.Date;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/StdDeserializer.class */
public abstract class StdDeserializer<T> extends JsonDeserializer<T> implements Serializable {
    private static final long serialVersionUID = 1;
    protected static final int F_MASK_INT_COERCIONS = DeserializationFeature.USE_BIG_INTEGER_FOR_INTS.getMask() | DeserializationFeature.USE_LONG_FOR_INTS.getMask();
    protected final Class<?> _valueClass;

    protected StdDeserializer(Class<?> vc) {
        this._valueClass = vc;
    }

    protected StdDeserializer(JavaType valueType) {
        this._valueClass = valueType == null ? null : valueType.getRawClass();
    }

    protected StdDeserializer(StdDeserializer<?> src) {
        this._valueClass = src._valueClass;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Class<?> handledType() {
        return this._valueClass;
    }

    @Deprecated
    public final Class<?> getValueClass() {
        return this._valueClass;
    }

    public JavaType getValueType() {
        return null;
    }

    protected boolean isDefaultDeserializer(JsonDeserializer<?> deserializer) {
        return ClassUtil.isJacksonStdImpl(deserializer);
    }

    protected boolean isDefaultKeyDeserializer(KeyDeserializer keyDeser) {
        return ClassUtil.isJacksonStdImpl(keyDeser);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
        return typeDeserializer.deserializeTypedFromAny(jp, ctxt);
    }

    protected final boolean _parseBooleanPrimitive(JsonParser jp, DeserializationContext ctxt) throws IOException {
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.VALUE_TRUE) {
            return true;
        }
        if (t == JsonToken.VALUE_FALSE || t == JsonToken.VALUE_NULL) {
            return false;
        }
        if (t == JsonToken.VALUE_NUMBER_INT) {
            if (jp.getNumberType() == JsonParser.NumberType.INT) {
                return jp.getIntValue() != 0;
            }
            return _parseBooleanFromNumber(jp, ctxt);
        }
        if (t == JsonToken.VALUE_STRING) {
            String text = jp.getText().trim();
            if ("true".equals(text) || "True".equals(text)) {
                return true;
            }
            if ("false".equals(text) || "False".equals(text) || text.length() == 0 || _hasTextualNull(text)) {
                return false;
            }
            throw ctxt.weirdStringException(text, this._valueClass, "only \"true\" or \"false\" recognized");
        }
        if (t == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jp.nextToken();
            boolean parsed = _parseBooleanPrimitive(jp, ctxt);
            if (jp.nextToken() != JsonToken.END_ARRAY) {
                throw ctxt.wrongTokenException(jp, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'boolean' value but there was more than a single value in the array");
            }
            return parsed;
        }
        throw ctxt.mappingException(this._valueClass, t);
    }

    protected final Boolean _parseBoolean(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        JsonToken currentToken = jsonParser.getCurrentToken();
        if (currentToken == JsonToken.VALUE_TRUE) {
            return Boolean.TRUE;
        }
        if (currentToken == JsonToken.VALUE_FALSE) {
            return Boolean.FALSE;
        }
        if (currentToken == JsonToken.VALUE_NUMBER_INT) {
            if (jsonParser.getNumberType() == JsonParser.NumberType.INT) {
                return jsonParser.getIntValue() == 0 ? Boolean.FALSE : Boolean.TRUE;
            }
            return Boolean.valueOf(_parseBooleanFromNumber(jsonParser, deserializationContext));
        }
        if (currentToken == JsonToken.VALUE_NULL) {
            return (Boolean) getNullValue(deserializationContext);
        }
        if (currentToken == JsonToken.VALUE_STRING) {
            String trim = jsonParser.getText().trim();
            if ("true".equals(trim) || "True".equals(trim)) {
                return Boolean.TRUE;
            }
            if ("false".equals(trim) || "False".equals(trim)) {
                return Boolean.FALSE;
            }
            if (trim.length() == 0) {
                return (Boolean) getEmptyValue(deserializationContext);
            }
            if (_hasTextualNull(trim)) {
                return (Boolean) getNullValue(deserializationContext);
            }
            throw deserializationContext.weirdStringException(trim, this._valueClass, "only \"true\" or \"false\" recognized");
        }
        if (currentToken == JsonToken.START_ARRAY && deserializationContext.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jsonParser.nextToken();
            Boolean _parseBoolean = _parseBoolean(jsonParser, deserializationContext);
            if (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                throw deserializationContext.wrongTokenException(jsonParser, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'Boolean' value but there was more than a single value in the array");
            }
            return _parseBoolean;
        }
        throw deserializationContext.mappingException(this._valueClass, currentToken);
    }

    protected final boolean _parseBooleanFromNumber(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (jp.getNumberType() == JsonParser.NumberType.LONG) {
            return (jp.getLongValue() == 0 ? Boolean.FALSE : Boolean.TRUE).booleanValue();
        }
        String str = jp.getText();
        if ("0.0".equals(str) || "0".equals(str)) {
            return Boolean.FALSE.booleanValue();
        }
        return Boolean.TRUE.booleanValue();
    }

    protected Byte _parseByte(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        JsonToken currentToken = jsonParser.getCurrentToken();
        if (currentToken == JsonToken.VALUE_NUMBER_INT) {
            return Byte.valueOf(jsonParser.getByteValue());
        }
        if (currentToken == JsonToken.VALUE_STRING) {
            String trim = jsonParser.getText().trim();
            if (_hasTextualNull(trim)) {
                return (Byte) getNullValue(deserializationContext);
            }
            try {
                if (trim.length() == 0) {
                    return (Byte) getEmptyValue(deserializationContext);
                }
                int parseInt = NumberInput.parseInt(trim);
                if (parseInt < -128 || parseInt > 255) {
                    throw deserializationContext.weirdStringException(trim, this._valueClass, "overflow, value can not be represented as 8-bit value");
                }
                return Byte.valueOf((byte) parseInt);
            } catch (IllegalArgumentException e) {
                throw deserializationContext.weirdStringException(trim, this._valueClass, "not a valid Byte value");
            }
        }
        if (currentToken == JsonToken.VALUE_NUMBER_FLOAT) {
            if (!deserializationContext.isEnabled(DeserializationFeature.ACCEPT_FLOAT_AS_INT)) {
                _failDoubleToIntCoercion(jsonParser, deserializationContext, "Byte");
            }
            return Byte.valueOf(jsonParser.getByteValue());
        }
        if (currentToken == JsonToken.VALUE_NULL) {
            return (Byte) getNullValue(deserializationContext);
        }
        if (currentToken == JsonToken.START_ARRAY && deserializationContext.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jsonParser.nextToken();
            Byte _parseByte = _parseByte(jsonParser, deserializationContext);
            if (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                throw deserializationContext.wrongTokenException(jsonParser, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'Byte' value but there was more than a single value in the array");
            }
            return _parseByte;
        }
        throw deserializationContext.mappingException(this._valueClass, currentToken);
    }

    protected Short _parseShort(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        JsonToken currentToken = jsonParser.getCurrentToken();
        if (currentToken == JsonToken.VALUE_NUMBER_INT) {
            return Short.valueOf(jsonParser.getShortValue());
        }
        if (currentToken == JsonToken.VALUE_STRING) {
            String trim = jsonParser.getText().trim();
            try {
                if (trim.length() == 0) {
                    return (Short) getEmptyValue(deserializationContext);
                }
                if (_hasTextualNull(trim)) {
                    return (Short) getNullValue(deserializationContext);
                }
                int parseInt = NumberInput.parseInt(trim);
                if (parseInt < -32768 || parseInt > 32767) {
                    throw deserializationContext.weirdStringException(trim, this._valueClass, "overflow, value can not be represented as 16-bit value");
                }
                return Short.valueOf((short) parseInt);
            } catch (IllegalArgumentException e) {
                throw deserializationContext.weirdStringException(trim, this._valueClass, "not a valid Short value");
            }
        }
        if (currentToken == JsonToken.VALUE_NUMBER_FLOAT) {
            if (!deserializationContext.isEnabled(DeserializationFeature.ACCEPT_FLOAT_AS_INT)) {
                _failDoubleToIntCoercion(jsonParser, deserializationContext, "Short");
            }
            return Short.valueOf(jsonParser.getShortValue());
        }
        if (currentToken == JsonToken.VALUE_NULL) {
            return (Short) getNullValue(deserializationContext);
        }
        if (currentToken == JsonToken.START_ARRAY && deserializationContext.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jsonParser.nextToken();
            Short _parseShort = _parseShort(jsonParser, deserializationContext);
            if (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                throw deserializationContext.wrongTokenException(jsonParser, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'Short' value but there was more than a single value in the array");
            }
            return _parseShort;
        }
        throw deserializationContext.mappingException(this._valueClass, currentToken);
    }

    protected final short _parseShortPrimitive(JsonParser jp, DeserializationContext ctxt) throws IOException {
        int value = _parseIntPrimitive(jp, ctxt);
        if (value < -32768 || value > 32767) {
            throw ctxt.weirdStringException(String.valueOf(value), this._valueClass, "overflow, value can not be represented as 16-bit value");
        }
        return (short) value;
    }

    protected final int _parseIntPrimitive(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (p.hasToken(JsonToken.VALUE_NUMBER_INT)) {
            return p.getIntValue();
        }
        JsonToken t = p.getCurrentToken();
        if (t == JsonToken.VALUE_STRING) {
            String text = p.getText().trim();
            if (_hasTextualNull(text)) {
                return 0;
            }
            try {
                int len = text.length();
                if (len > 9) {
                    long l = Long.parseLong(text);
                    if (l < -2147483648L || l > 2147483647L) {
                        throw ctxt.weirdStringException(text, this._valueClass, "Overflow: numeric value (" + text + ") out of range of int (-2147483648 - 2147483647)");
                    }
                    return (int) l;
                }
                if (len == 0) {
                    return 0;
                }
                return NumberInput.parseInt(text);
            } catch (IllegalArgumentException e) {
                throw ctxt.weirdStringException(text, this._valueClass, "not a valid int value");
            }
        }
        if (t == JsonToken.VALUE_NUMBER_FLOAT) {
            if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_FLOAT_AS_INT)) {
                _failDoubleToIntCoercion(p, ctxt, "int");
            }
            return p.getValueAsInt();
        }
        if (t == JsonToken.VALUE_NULL) {
            return 0;
        }
        if (t == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            p.nextToken();
            int parsed = _parseIntPrimitive(p, ctxt);
            if (p.nextToken() != JsonToken.END_ARRAY) {
                throw ctxt.wrongTokenException(p, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'int' value but there was more than a single value in the array");
            }
            return parsed;
        }
        throw ctxt.mappingException(this._valueClass, t);
    }

    protected final Integer _parseInteger(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        switch (jsonParser.getCurrentTokenId()) {
            case 3:
                if (deserializationContext.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                    jsonParser.nextToken();
                    Integer _parseInteger = _parseInteger(jsonParser, deserializationContext);
                    if (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                        throw deserializationContext.wrongTokenException(jsonParser, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'Integer' value but there was more than a single value in the array");
                    }
                    return _parseInteger;
                }
                break;
            case 6:
                String trim = jsonParser.getText().trim();
                try {
                    int length = trim.length();
                    if (_hasTextualNull(trim)) {
                        return (Integer) getNullValue(deserializationContext);
                    }
                    if (length > 9) {
                        long parseLong = Long.parseLong(trim);
                        if (parseLong < -2147483648L || parseLong > 2147483647L) {
                            throw deserializationContext.weirdStringException(trim, this._valueClass, "Overflow: numeric value (" + trim + ") out of range of Integer (-2147483648 - 2147483647)");
                        }
                        return Integer.valueOf((int) parseLong);
                    }
                    if (length == 0) {
                        return (Integer) getEmptyValue(deserializationContext);
                    }
                    return Integer.valueOf(NumberInput.parseInt(trim));
                } catch (IllegalArgumentException e) {
                    throw deserializationContext.weirdStringException(trim, this._valueClass, "not a valid Integer value");
                }
            case 7:
                return Integer.valueOf(jsonParser.getIntValue());
            case 8:
                if (!deserializationContext.isEnabled(DeserializationFeature.ACCEPT_FLOAT_AS_INT)) {
                    _failDoubleToIntCoercion(jsonParser, deserializationContext, "Integer");
                }
                return Integer.valueOf(jsonParser.getValueAsInt());
            case 11:
                return (Integer) getNullValue(deserializationContext);
        }
        throw deserializationContext.mappingException(this._valueClass, jsonParser.getCurrentToken());
    }

    protected final Long _parseLong(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        switch (jsonParser.getCurrentTokenId()) {
            case 3:
                if (deserializationContext.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                    jsonParser.nextToken();
                    Long _parseLong = _parseLong(jsonParser, deserializationContext);
                    if (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                        throw deserializationContext.wrongTokenException(jsonParser, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'Long' value but there was more than a single value in the array");
                    }
                    return _parseLong;
                }
                break;
            case 6:
                String trim = jsonParser.getText().trim();
                if (trim.length() == 0) {
                    return (Long) getEmptyValue(deserializationContext);
                }
                if (_hasTextualNull(trim)) {
                    return (Long) getNullValue(deserializationContext);
                }
                try {
                    return Long.valueOf(NumberInput.parseLong(trim));
                } catch (IllegalArgumentException e) {
                    throw deserializationContext.weirdStringException(trim, this._valueClass, "not a valid Long value");
                }
            case 7:
                return Long.valueOf(jsonParser.getLongValue());
            case 8:
                if (!deserializationContext.isEnabled(DeserializationFeature.ACCEPT_FLOAT_AS_INT)) {
                    _failDoubleToIntCoercion(jsonParser, deserializationContext, "Long");
                }
                return Long.valueOf(jsonParser.getValueAsLong());
            case 11:
                return (Long) getNullValue(deserializationContext);
        }
        throw deserializationContext.mappingException(this._valueClass, jsonParser.getCurrentToken());
    }

    protected final long _parseLongPrimitive(JsonParser p, DeserializationContext ctxt) throws IOException {
        switch (p.getCurrentTokenId()) {
            case 3:
                if (ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                    p.nextToken();
                    long parsed = _parseLongPrimitive(p, ctxt);
                    JsonToken t = p.nextToken();
                    if (t != JsonToken.END_ARRAY) {
                        throw ctxt.wrongTokenException(p, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'long' value but there was more than a single value in the array");
                    }
                    return parsed;
                }
                break;
            case 6:
                String text = p.getText().trim();
                if (text.length() == 0 || _hasTextualNull(text)) {
                    return 0L;
                }
                try {
                    return NumberInput.parseLong(text);
                } catch (IllegalArgumentException e) {
                    throw ctxt.weirdStringException(text, this._valueClass, "not a valid long value");
                }
            case 7:
                return p.getLongValue();
            case 8:
                if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_FLOAT_AS_INT)) {
                    _failDoubleToIntCoercion(p, ctxt, "long");
                }
                return p.getValueAsLong();
            case 11:
                return 0L;
        }
        throw ctxt.mappingException(this._valueClass, p.getCurrentToken());
    }

    protected final Float _parseFloat(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        JsonToken currentToken = jsonParser.getCurrentToken();
        if (currentToken == JsonToken.VALUE_NUMBER_INT || currentToken == JsonToken.VALUE_NUMBER_FLOAT) {
            return Float.valueOf(jsonParser.getFloatValue());
        }
        if (currentToken == JsonToken.VALUE_STRING) {
            String trim = jsonParser.getText().trim();
            if (trim.length() == 0) {
                return (Float) getEmptyValue(deserializationContext);
            }
            if (_hasTextualNull(trim)) {
                return (Float) getNullValue(deserializationContext);
            }
            switch (trim.charAt(0)) {
                case '-':
                    if (_isNegInf(trim)) {
                        return Float.valueOf(Float.NEGATIVE_INFINITY);
                    }
                    break;
                case 'I':
                    if (_isPosInf(trim)) {
                        return Float.valueOf(Float.POSITIVE_INFINITY);
                    }
                    break;
                case 'N':
                    if (_isNaN(trim)) {
                        return Float.valueOf(Float.NaN);
                    }
                    break;
            }
            try {
                return Float.valueOf(Float.parseFloat(trim));
            } catch (IllegalArgumentException e) {
                throw deserializationContext.weirdStringException(trim, this._valueClass, "not a valid Float value");
            }
        }
        if (currentToken == JsonToken.VALUE_NULL) {
            return (Float) getNullValue(deserializationContext);
        }
        if (currentToken == JsonToken.START_ARRAY && deserializationContext.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jsonParser.nextToken();
            Float _parseFloat = _parseFloat(jsonParser, deserializationContext);
            if (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                throw deserializationContext.wrongTokenException(jsonParser, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'Byte' value but there was more than a single value in the array");
            }
            return _parseFloat;
        }
        throw deserializationContext.mappingException(this._valueClass, currentToken);
    }

    protected final float _parseFloatPrimitive(JsonParser jp, DeserializationContext ctxt) throws IOException {
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) {
            return jp.getFloatValue();
        }
        if (t == JsonToken.VALUE_STRING) {
            String text = jp.getText().trim();
            if (text.length() == 0 || _hasTextualNull(text)) {
                return 0.0f;
            }
            switch (text.charAt(0)) {
                case '-':
                    if (_isNegInf(text)) {
                        return Float.NEGATIVE_INFINITY;
                    }
                    break;
                case 'I':
                    if (_isPosInf(text)) {
                        return Float.POSITIVE_INFINITY;
                    }
                    break;
                case 'N':
                    if (_isNaN(text)) {
                        return Float.NaN;
                    }
                    break;
            }
            try {
                return Float.parseFloat(text);
            } catch (IllegalArgumentException e) {
                throw ctxt.weirdStringException(text, this._valueClass, "not a valid float value");
            }
        }
        if (t == JsonToken.VALUE_NULL) {
            return 0.0f;
        }
        if (t == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jp.nextToken();
            float parsed = _parseFloatPrimitive(jp, ctxt);
            if (jp.nextToken() != JsonToken.END_ARRAY) {
                throw ctxt.wrongTokenException(jp, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'float' value but there was more than a single value in the array");
            }
            return parsed;
        }
        throw ctxt.mappingException(this._valueClass, t);
    }

    protected final Double _parseDouble(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        JsonToken currentToken = jsonParser.getCurrentToken();
        if (currentToken == JsonToken.VALUE_NUMBER_INT || currentToken == JsonToken.VALUE_NUMBER_FLOAT) {
            return Double.valueOf(jsonParser.getDoubleValue());
        }
        if (currentToken == JsonToken.VALUE_STRING) {
            String trim = jsonParser.getText().trim();
            if (trim.length() == 0) {
                return (Double) getEmptyValue(deserializationContext);
            }
            if (_hasTextualNull(trim)) {
                return (Double) getNullValue(deserializationContext);
            }
            switch (trim.charAt(0)) {
                case '-':
                    if (_isNegInf(trim)) {
                        return Double.valueOf(Double.NEGATIVE_INFINITY);
                    }
                    break;
                case 'I':
                    if (_isPosInf(trim)) {
                        return Double.valueOf(Double.POSITIVE_INFINITY);
                    }
                    break;
                case 'N':
                    if (_isNaN(trim)) {
                        return Double.valueOf(Double.NaN);
                    }
                    break;
            }
            try {
                return Double.valueOf(parseDouble(trim));
            } catch (IllegalArgumentException e) {
                throw deserializationContext.weirdStringException(trim, this._valueClass, "not a valid Double value");
            }
        }
        if (currentToken == JsonToken.VALUE_NULL) {
            return (Double) getNullValue(deserializationContext);
        }
        if (currentToken == JsonToken.START_ARRAY && deserializationContext.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jsonParser.nextToken();
            Double _parseDouble = _parseDouble(jsonParser, deserializationContext);
            if (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                throw deserializationContext.wrongTokenException(jsonParser, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'Double' value but there was more than a single value in the array");
            }
            return _parseDouble;
        }
        throw deserializationContext.mappingException(this._valueClass, currentToken);
    }

    protected final double _parseDoublePrimitive(JsonParser jp, DeserializationContext ctxt) throws IOException {
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.VALUE_NUMBER_INT || t == JsonToken.VALUE_NUMBER_FLOAT) {
            return jp.getDoubleValue();
        }
        if (t == JsonToken.VALUE_STRING) {
            String text = jp.getText().trim();
            if (text.length() == 0 || _hasTextualNull(text)) {
                return 0.0d;
            }
            switch (text.charAt(0)) {
                case '-':
                    if (_isNegInf(text)) {
                        return Double.NEGATIVE_INFINITY;
                    }
                    break;
                case 'I':
                    if (_isPosInf(text)) {
                        return Double.POSITIVE_INFINITY;
                    }
                    break;
                case 'N':
                    if (_isNaN(text)) {
                        return Double.NaN;
                    }
                    break;
            }
            try {
                return parseDouble(text);
            } catch (IllegalArgumentException e) {
                throw ctxt.weirdStringException(text, this._valueClass, "not a valid double value");
            }
        }
        if (t == JsonToken.VALUE_NULL) {
            return 0.0d;
        }
        if (t == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jp.nextToken();
            double parsed = _parseDoublePrimitive(jp, ctxt);
            if (jp.nextToken() != JsonToken.END_ARRAY) {
                throw ctxt.wrongTokenException(jp, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'Byte' value but there was more than a single value in the array");
            }
            return parsed;
        }
        throw ctxt.mappingException(this._valueClass, t);
    }

    protected Date _parseDate(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        JsonToken currentToken = jsonParser.getCurrentToken();
        if (currentToken == JsonToken.VALUE_NUMBER_INT) {
            return new Date(jsonParser.getLongValue());
        }
        if (currentToken == JsonToken.VALUE_NULL) {
            return (Date) getNullValue(deserializationContext);
        }
        if (currentToken == JsonToken.VALUE_STRING) {
            try {
                String trim = jsonParser.getText().trim();
                if (trim.length() == 0) {
                    return (Date) getEmptyValue(deserializationContext);
                }
                if (_hasTextualNull(trim)) {
                    return (Date) getNullValue(deserializationContext);
                }
                return deserializationContext.parseDate(trim);
            } catch (IllegalArgumentException e) {
                throw deserializationContext.weirdStringException(null, this._valueClass, "not a valid representation (error: " + e.getMessage() + ")");
            }
        }
        if (currentToken == JsonToken.START_ARRAY && deserializationContext.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jsonParser.nextToken();
            Date _parseDate = _parseDate(jsonParser, deserializationContext);
            if (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                throw deserializationContext.wrongTokenException(jsonParser, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'java.util.Date' value but there was more than a single value in the array");
            }
            return _parseDate;
        }
        throw deserializationContext.mappingException(this._valueClass, currentToken);
    }

    protected static final double parseDouble(String numStr) throws NumberFormatException {
        if ("2.2250738585072012e-308".equals(numStr)) {
            return Double.MIN_VALUE;
        }
        return Double.parseDouble(numStr);
    }

    protected final String _parseString(JsonParser jp, DeserializationContext ctxt) throws IOException {
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.VALUE_STRING) {
            return jp.getText();
        }
        if (t == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jp.nextToken();
            String parsed = _parseString(jp, ctxt);
            if (jp.nextToken() != JsonToken.END_ARRAY) {
                throw ctxt.wrongTokenException(jp, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'String' value but there was more than a single value in the array");
            }
            return parsed;
        }
        String value = jp.getValueAsString();
        if (value != null) {
            return value;
        }
        throw ctxt.mappingException(String.class, jp.getCurrentToken());
    }

    protected T _deserializeFromEmpty(JsonParser jp, DeserializationContext ctxt) throws IOException {
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.START_ARRAY) {
            if (ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_ARRAY_AS_NULL_OBJECT)) {
                if (jp.nextToken() == JsonToken.END_ARRAY) {
                    return null;
                }
                throw ctxt.mappingException(handledType(), JsonToken.START_ARRAY);
            }
        } else if (t == JsonToken.VALUE_STRING && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) {
            String str = jp.getText().trim();
            if (str.isEmpty()) {
                return null;
            }
        }
        throw ctxt.mappingException(handledType());
    }

    protected boolean _hasTextualNull(String value) {
        return "null".equals(value);
    }

    protected final boolean _isNegInf(String text) {
        return "-Infinity".equals(text) || "-INF".equals(text);
    }

    protected final boolean _isPosInf(String text) {
        return "Infinity".equals(text) || "INF".equals(text);
    }

    protected final boolean _isNaN(String text) {
        return "NaN".equals(text);
    }

    protected Object _coerceIntegral(JsonParser p, DeserializationContext ctxt) throws IOException {
        int feats = ctxt.getDeserializationFeatures();
        if (DeserializationFeature.USE_BIG_INTEGER_FOR_INTS.enabledIn(feats)) {
            return p.getBigIntegerValue();
        }
        if (DeserializationFeature.USE_LONG_FOR_INTS.enabledIn(feats)) {
            return Long.valueOf(p.getLongValue());
        }
        return p.getBigIntegerValue();
    }

    protected JsonDeserializer<Object> findDeserializer(DeserializationContext ctxt, JavaType type, BeanProperty property) throws JsonMappingException {
        return ctxt.findContextualValueDeserializer(type, property);
    }

    protected final boolean _isIntNumber(String text) {
        int len = text.length();
        if (len > 0) {
            char c = text.charAt(0);
            for (int i = (c == '-' || c == '+') ? 1 : 0; i < len; i++) {
                int ch = text.charAt(i);
                if (ch > 57 || ch < 48) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

    protected JsonDeserializer<?> findConvertingContentDeserializer(DeserializationContext ctxt, BeanProperty prop, JsonDeserializer<?> existingDeserializer) throws JsonMappingException {
        AnnotatedMember member;
        Object convDef;
        AnnotationIntrospector intr = ctxt.getAnnotationIntrospector();
        if (intr != null && prop != null && (member = prop.getMember()) != null && (convDef = intr.findDeserializationContentConverter(member)) != null) {
            Converter<Object, Object> conv = ctxt.converterInstance(prop.getMember(), convDef);
            JavaType delegateType = conv.getInputType(ctxt.getTypeFactory());
            if (existingDeserializer == null) {
                existingDeserializer = ctxt.findContextualValueDeserializer(delegateType, prop);
            }
            return new StdDelegatingDeserializer(conv, delegateType, existingDeserializer);
        }
        return existingDeserializer;
    }

    protected void handleUnknownProperty(JsonParser jp, DeserializationContext ctxt, Object instanceOrClass, String propName) throws IOException {
        if (instanceOrClass == null) {
            instanceOrClass = handledType();
        }
        if (ctxt.handleUnknownProperty(jp, this, instanceOrClass, propName)) {
            return;
        }
        ctxt.reportUnknownProperty(instanceOrClass, propName, this);
        jp.skipChildren();
    }

    protected void _failDoubleToIntCoercion(JsonParser jp, DeserializationContext ctxt, String type) throws IOException {
        throw ctxt.mappingException("Can not coerce a floating-point value ('%s') into %s; enable `DeserializationFeature.ACCEPT_FLOAT_AS_INT` to allow", jp.getValueAsString(), type);
    }
}
