package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.fasterxml.jackson.databind.deser.ResolvableDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.ObjectBuffer;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@JacksonStdImpl
/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer.class */
public class UntypedObjectDeserializer extends StdDeserializer<Object> implements ResolvableDeserializer, ContextualDeserializer {
    private static final long serialVersionUID = 1;
    protected static final Object[] NO_OBJECTS = new Object[0];

    @Deprecated
    public static final UntypedObjectDeserializer instance = new UntypedObjectDeserializer(null, null);
    protected JsonDeserializer<Object> _mapDeserializer;
    protected JsonDeserializer<Object> _listDeserializer;
    protected JsonDeserializer<Object> _stringDeserializer;
    protected JsonDeserializer<Object> _numberDeserializer;
    protected JavaType _listType;
    protected JavaType _mapType;

    @Deprecated
    public UntypedObjectDeserializer() {
        this(null, null);
    }

    public UntypedObjectDeserializer(JavaType listType, JavaType mapType) {
        super((Class<?>) Object.class);
        this._listType = listType;
        this._mapType = mapType;
    }

    public UntypedObjectDeserializer(UntypedObjectDeserializer base, JsonDeserializer<?> mapDeser, JsonDeserializer<?> listDeser, JsonDeserializer<?> stringDeser, JsonDeserializer<?> numberDeser) {
        super((Class<?>) Object.class);
        this._mapDeserializer = mapDeser;
        this._listDeserializer = listDeser;
        this._stringDeserializer = stringDeser;
        this._numberDeserializer = numberDeser;
        this._listType = base._listType;
        this._mapType = base._mapType;
    }

    @Override // com.fasterxml.jackson.databind.deser.ResolvableDeserializer
    public void resolve(DeserializationContext ctxt) throws JsonMappingException {
        JavaType obType = ctxt.constructType(Object.class);
        JavaType stringType = ctxt.constructType(String.class);
        TypeFactory tf = ctxt.getTypeFactory();
        if (this._listType == null) {
            this._listDeserializer = _clearIfStdImpl(_findCustomDeser(ctxt, tf.constructCollectionType(List.class, obType)));
        } else {
            this._listDeserializer = _findCustomDeser(ctxt, this._listType);
        }
        if (this._mapType == null) {
            this._mapDeserializer = _clearIfStdImpl(_findCustomDeser(ctxt, tf.constructMapType(Map.class, stringType, obType)));
        } else {
            this._mapDeserializer = _findCustomDeser(ctxt, this._mapType);
        }
        this._stringDeserializer = _clearIfStdImpl(_findCustomDeser(ctxt, stringType));
        this._numberDeserializer = _clearIfStdImpl(_findCustomDeser(ctxt, tf.constructType(Number.class)));
        JavaType unknown = TypeFactory.unknownType();
        this._mapDeserializer = ctxt.handleSecondaryContextualization(this._mapDeserializer, null, unknown);
        this._listDeserializer = ctxt.handleSecondaryContextualization(this._listDeserializer, null, unknown);
        this._stringDeserializer = ctxt.handleSecondaryContextualization(this._stringDeserializer, null, unknown);
        this._numberDeserializer = ctxt.handleSecondaryContextualization(this._numberDeserializer, null, unknown);
    }

    protected JsonDeserializer<Object> _findCustomDeser(DeserializationContext ctxt, JavaType type) throws JsonMappingException {
        return ctxt.findNonContextualValueDeserializer(type);
    }

    protected JsonDeserializer<Object> _clearIfStdImpl(JsonDeserializer<Object> deser) {
        if (ClassUtil.isJacksonStdImpl(deser)) {
            return null;
        }
        return deser;
    }

    @Override // com.fasterxml.jackson.databind.deser.ContextualDeserializer
    public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
        if (this._stringDeserializer == null && this._numberDeserializer == null && this._mapDeserializer == null && this._listDeserializer == null && getClass() == UntypedObjectDeserializer.class) {
            return Vanilla.std;
        }
        return this;
    }

    protected JsonDeserializer<?> _withResolved(JsonDeserializer<?> mapDeser, JsonDeserializer<?> listDeser, JsonDeserializer<?> stringDeser, JsonDeserializer<?> numberDeser) {
        return new UntypedObjectDeserializer(this, mapDeser, listDeser, stringDeser, numberDeser);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public boolean isCachable() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
        switch (p.getCurrentTokenId()) {
            case 1:
            case 5:
                if (this._mapDeserializer != null) {
                    return this._mapDeserializer.deserialize(p, ctxt);
                }
                return mapObject(p, ctxt);
            case 2:
            case 4:
            default:
                throw ctxt.mappingException(Object.class);
            case 3:
                if (ctxt.isEnabled(DeserializationFeature.USE_JAVA_ARRAY_FOR_JSON_ARRAY)) {
                    return mapArrayToArray(p, ctxt);
                }
                if (this._listDeserializer != null) {
                    return this._listDeserializer.deserialize(p, ctxt);
                }
                return mapArray(p, ctxt);
            case 6:
                if (this._stringDeserializer != null) {
                    return this._stringDeserializer.deserialize(p, ctxt);
                }
                return p.getText();
            case 7:
                if (this._numberDeserializer != null) {
                    return this._numberDeserializer.deserialize(p, ctxt);
                }
                if (ctxt.hasSomeOfFeatures(F_MASK_INT_COERCIONS)) {
                    return _coerceIntegral(p, ctxt);
                }
                return p.getNumberValue();
            case 8:
                if (this._numberDeserializer != null) {
                    return this._numberDeserializer.deserialize(p, ctxt);
                }
                if (ctxt.isEnabled(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS)) {
                    return p.getDecimalValue();
                }
                return Double.valueOf(p.getDoubleValue());
            case 9:
                return Boolean.TRUE;
            case 10:
                return Boolean.FALSE;
            case 11:
                return null;
            case 12:
                return p.getEmbeddedObject();
        }
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser p, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
        switch (p.getCurrentTokenId()) {
            case 1:
            case 3:
            case 5:
                return typeDeserializer.deserializeTypedFromAny(p, ctxt);
            case 2:
            case 4:
            default:
                throw ctxt.mappingException(Object.class);
            case 6:
                if (this._stringDeserializer != null) {
                    return this._stringDeserializer.deserialize(p, ctxt);
                }
                return p.getText();
            case 7:
                if (this._numberDeserializer != null) {
                    return this._numberDeserializer.deserialize(p, ctxt);
                }
                if (ctxt.hasSomeOfFeatures(F_MASK_INT_COERCIONS)) {
                    return _coerceIntegral(p, ctxt);
                }
                return p.getNumberValue();
            case 8:
                if (this._numberDeserializer != null) {
                    return this._numberDeserializer.deserialize(p, ctxt);
                }
                if (ctxt.isEnabled(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS)) {
                    return p.getDecimalValue();
                }
                return Double.valueOf(p.getDoubleValue());
            case 9:
                return Boolean.TRUE;
            case 10:
                return Boolean.FALSE;
            case 11:
                return null;
            case 12:
                return p.getEmbeddedObject();
        }
    }

    protected Object mapArray(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (jp.nextToken() == JsonToken.END_ARRAY) {
            return new ArrayList(2);
        }
        Object value = deserialize(jp, ctxt);
        if (jp.nextToken() == JsonToken.END_ARRAY) {
            ArrayList<Object> l = new ArrayList<>(2);
            l.add(value);
            return l;
        }
        Object value2 = deserialize(jp, ctxt);
        if (jp.nextToken() == JsonToken.END_ARRAY) {
            ArrayList<Object> l2 = new ArrayList<>(2);
            l2.add(value);
            l2.add(value2);
            return l2;
        }
        ObjectBuffer buffer = ctxt.leaseObjectBuffer();
        Object[] values = buffer.resetAndStart();
        int ptr = 0 + 1;
        values[0] = value;
        int ptr2 = ptr + 1;
        values[ptr] = value2;
        int totalSize = ptr2;
        do {
            Object value3 = deserialize(jp, ctxt);
            totalSize++;
            if (ptr2 >= values.length) {
                values = buffer.appendCompletedChunk(values);
                ptr2 = 0;
            }
            int i = ptr2;
            ptr2++;
            values[i] = value3;
        } while (jp.nextToken() != JsonToken.END_ARRAY);
        ArrayList<Object> result = new ArrayList<>(totalSize);
        buffer.completeAndClearBuffer(values, ptr2, result);
        return result;
    }

    protected Object mapObject(JsonParser p, DeserializationContext ctxt) throws IOException {
        String key1;
        String nextFieldName;
        JsonToken t = p.getCurrentToken();
        if (t == JsonToken.START_OBJECT) {
            key1 = p.nextFieldName();
        } else if (t == JsonToken.FIELD_NAME) {
            key1 = p.getCurrentName();
        } else {
            if (t != JsonToken.END_OBJECT) {
                throw ctxt.mappingException(handledType(), p.getCurrentToken());
            }
            key1 = null;
        }
        if (key1 == null) {
            return new LinkedHashMap(2);
        }
        p.nextToken();
        Object value1 = deserialize(p, ctxt);
        String key2 = p.nextFieldName();
        if (key2 == null) {
            LinkedHashMap<String, Object> result = new LinkedHashMap<>(2);
            result.put(key1, value1);
            return result;
        }
        p.nextToken();
        Object value2 = deserialize(p, ctxt);
        String key = p.nextFieldName();
        if (key == null) {
            LinkedHashMap<String, Object> result2 = new LinkedHashMap<>(4);
            result2.put(key1, value1);
            result2.put(key2, value2);
            return result2;
        }
        LinkedHashMap<String, Object> result3 = new LinkedHashMap<>();
        result3.put(key1, value1);
        result3.put(key2, value2);
        do {
            p.nextToken();
            result3.put(key, deserialize(p, ctxt));
            nextFieldName = p.nextFieldName();
            key = nextFieldName;
        } while (nextFieldName != null);
        return result3;
    }

    protected Object[] mapArrayToArray(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (jp.nextToken() == JsonToken.END_ARRAY) {
            return NO_OBJECTS;
        }
        ObjectBuffer buffer = ctxt.leaseObjectBuffer();
        Object[] values = buffer.resetAndStart();
        int ptr = 0;
        do {
            Object value = deserialize(jp, ctxt);
            if (ptr >= values.length) {
                values = buffer.appendCompletedChunk(values);
                ptr = 0;
            }
            int i = ptr;
            ptr++;
            values[i] = value;
        } while (jp.nextToken() != JsonToken.END_ARRAY);
        return buffer.completeAndClearBuffer(values, ptr);
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla.class */
    public static class Vanilla extends StdDeserializer<Object> {
        private static final long serialVersionUID = 1;
        public static final Vanilla std = new Vanilla();

        public Vanilla() {
            super((Class<?>) Object.class);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Object deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
            switch (p.getCurrentTokenId()) {
                case 1:
                    JsonToken t = p.nextToken();
                    if (t == JsonToken.END_OBJECT) {
                        return new LinkedHashMap(2);
                    }
                    break;
                case 2:
                case 4:
                default:
                    throw ctxt.mappingException(Object.class);
                case 3:
                    JsonToken t2 = p.nextToken();
                    if (t2 == JsonToken.END_ARRAY) {
                        if (ctxt.isEnabled(DeserializationFeature.USE_JAVA_ARRAY_FOR_JSON_ARRAY)) {
                            return UntypedObjectDeserializer.NO_OBJECTS;
                        }
                        return new ArrayList(2);
                    }
                    if (ctxt.isEnabled(DeserializationFeature.USE_JAVA_ARRAY_FOR_JSON_ARRAY)) {
                        return mapArrayToArray(p, ctxt);
                    }
                    return mapArray(p, ctxt);
                case 5:
                    break;
                case 6:
                    return p.getText();
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
                case 9:
                    return Boolean.TRUE;
                case 10:
                    return Boolean.FALSE;
                case 11:
                    return null;
                case 12:
                    return p.getEmbeddedObject();
            }
            return mapObject(p, ctxt);
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
        public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
            switch (jp.getCurrentTokenId()) {
                case 1:
                case 3:
                case 5:
                    return typeDeserializer.deserializeTypedFromAny(jp, ctxt);
                case 2:
                case 4:
                default:
                    throw ctxt.mappingException(Object.class);
                case 6:
                    return jp.getText();
                case 7:
                    if (ctxt.isEnabled(DeserializationFeature.USE_BIG_INTEGER_FOR_INTS)) {
                        return jp.getBigIntegerValue();
                    }
                    return jp.getNumberValue();
                case 8:
                    if (ctxt.isEnabled(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS)) {
                        return jp.getDecimalValue();
                    }
                    return Double.valueOf(jp.getDoubleValue());
                case 9:
                    return Boolean.TRUE;
                case 10:
                    return Boolean.FALSE;
                case 11:
                    return null;
                case 12:
                    return jp.getEmbeddedObject();
            }
        }

        protected Object mapArray(JsonParser jp, DeserializationContext ctxt) throws IOException {
            Object value = deserialize(jp, ctxt);
            if (jp.nextToken() == JsonToken.END_ARRAY) {
                ArrayList<Object> l = new ArrayList<>(2);
                l.add(value);
                return l;
            }
            Object value2 = deserialize(jp, ctxt);
            if (jp.nextToken() == JsonToken.END_ARRAY) {
                ArrayList<Object> l2 = new ArrayList<>(2);
                l2.add(value);
                l2.add(value2);
                return l2;
            }
            ObjectBuffer buffer = ctxt.leaseObjectBuffer();
            Object[] values = buffer.resetAndStart();
            int ptr = 0 + 1;
            values[0] = value;
            int ptr2 = ptr + 1;
            values[ptr] = value2;
            int totalSize = ptr2;
            do {
                Object value3 = deserialize(jp, ctxt);
                totalSize++;
                if (ptr2 >= values.length) {
                    values = buffer.appendCompletedChunk(values);
                    ptr2 = 0;
                }
                int i = ptr2;
                ptr2++;
                values[i] = value3;
            } while (jp.nextToken() != JsonToken.END_ARRAY);
            ArrayList<Object> result = new ArrayList<>(totalSize);
            buffer.completeAndClearBuffer(values, ptr2, result);
            return result;
        }

        protected Object mapObject(JsonParser p, DeserializationContext ctxt) throws IOException {
            String nextFieldName;
            String key1 = p.getText();
            p.nextToken();
            Object value1 = deserialize(p, ctxt);
            String key2 = p.nextFieldName();
            if (key2 == null) {
                LinkedHashMap<String, Object> result = new LinkedHashMap<>(2);
                result.put(key1, value1);
                return result;
            }
            p.nextToken();
            Object value2 = deserialize(p, ctxt);
            String key = p.nextFieldName();
            if (key == null) {
                LinkedHashMap<String, Object> result2 = new LinkedHashMap<>(4);
                result2.put(key1, value1);
                result2.put(key2, value2);
                return result2;
            }
            LinkedHashMap<String, Object> result3 = new LinkedHashMap<>();
            result3.put(key1, value1);
            result3.put(key2, value2);
            do {
                p.nextToken();
                result3.put(key, deserialize(p, ctxt));
                nextFieldName = p.nextFieldName();
                key = nextFieldName;
            } while (nextFieldName != null);
            return result3;
        }

        protected Object[] mapArrayToArray(JsonParser jp, DeserializationContext ctxt) throws IOException {
            ObjectBuffer buffer = ctxt.leaseObjectBuffer();
            Object[] values = buffer.resetAndStart();
            int ptr = 0;
            do {
                Object value = deserialize(jp, ctxt);
                if (ptr >= values.length) {
                    values = buffer.appendCompletedChunk(values);
                    ptr = 0;
                }
                int i = ptr;
                ptr++;
                values[i] = value;
            } while (jp.nextToken() != JsonToken.END_ARRAY);
            return buffer.completeAndClearBuffer(values, ptr);
        }
    }
}
