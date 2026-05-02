package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.type.ArrayType;
import com.fasterxml.jackson.databind.util.ObjectBuffer;
import java.io.IOException;
import java.lang.reflect.Array;

@JacksonStdImpl
/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/ObjectArrayDeserializer.class */
public class ObjectArrayDeserializer extends ContainerDeserializerBase<Object[]> implements ContextualDeserializer {
    private static final long serialVersionUID = 1;
    protected final ArrayType _arrayType;
    protected final boolean _untyped;
    protected final Class<?> _elementClass;
    protected JsonDeserializer<Object> _elementDeserializer;
    protected final TypeDeserializer _elementTypeDeserializer;

    public ObjectArrayDeserializer(ArrayType arrayType, JsonDeserializer<Object> elemDeser, TypeDeserializer elemTypeDeser) {
        super(arrayType);
        this._arrayType = arrayType;
        this._elementClass = arrayType.mo4getContentType().getRawClass();
        this._untyped = this._elementClass == Object.class;
        this._elementDeserializer = elemDeser;
        this._elementTypeDeserializer = elemTypeDeser;
    }

    public ObjectArrayDeserializer withDeserializer(TypeDeserializer elemTypeDeser, JsonDeserializer<?> elemDeser) {
        if (elemDeser == this._elementDeserializer && elemTypeDeser == this._elementTypeDeserializer) {
            return this;
        }
        return new ObjectArrayDeserializer(this._arrayType, elemDeser, elemTypeDeser);
    }

    @Override // com.fasterxml.jackson.databind.deser.ContextualDeserializer
    public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
        JsonDeserializer<?> deser;
        JsonDeserializer<?> deser2 = findConvertingContentDeserializer(ctxt, property, this._elementDeserializer);
        JavaType vt = this._arrayType.mo4getContentType();
        if (deser2 == null) {
            deser = ctxt.findContextualValueDeserializer(vt, property);
        } else {
            deser = ctxt.handleSecondaryContextualization(deser2, property, vt);
        }
        TypeDeserializer elemTypeDeser = this._elementTypeDeserializer;
        if (elemTypeDeser != null) {
            elemTypeDeser = elemTypeDeser.forProperty(property);
        }
        return withDeserializer(elemTypeDeser, deser);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public boolean isCachable() {
        return this._elementDeserializer == null && this._elementTypeDeserializer == null;
    }

    @Override // com.fasterxml.jackson.databind.deser.std.ContainerDeserializerBase
    public JavaType getContentType() {
        return this._arrayType.mo4getContentType();
    }

    @Override // com.fasterxml.jackson.databind.deser.std.ContainerDeserializerBase
    public JsonDeserializer<Object> getContentDeserializer() {
        return this._elementDeserializer;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object[] deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        Object[] result;
        Object value;
        if (!jp.isExpectedStartArrayToken()) {
            return handleNonArray(jp, ctxt);
        }
        ObjectBuffer buffer = ctxt.leaseObjectBuffer();
        Object[] chunk = buffer.resetAndStart();
        int ix = 0;
        TypeDeserializer typeDeser = this._elementTypeDeserializer;
        while (true) {
            try {
                JsonToken t = jp.nextToken();
                if (t == JsonToken.END_ARRAY) {
                    break;
                }
                if (t == JsonToken.VALUE_NULL) {
                    value = this._elementDeserializer.getNullValue(ctxt);
                } else if (typeDeser == null) {
                    value = this._elementDeserializer.deserialize(jp, ctxt);
                } else {
                    value = this._elementDeserializer.deserializeWithType(jp, ctxt, typeDeser);
                }
                if (ix >= chunk.length) {
                    chunk = buffer.appendCompletedChunk(chunk);
                    ix = 0;
                }
                int i = ix;
                ix++;
                chunk[i] = value;
            } catch (Exception e) {
                throw JsonMappingException.wrapWithPath(e, chunk, buffer.bufferedSize() + ix);
            }
        }
        if (this._untyped) {
            result = buffer.completeAndClearBuffer(chunk, ix);
        } else {
            result = buffer.completeAndClearBuffer(chunk, ix, this._elementClass);
        }
        ctxt.returnObjectBuffer(buffer);
        return result;
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object[] deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
        return (Object[]) typeDeserializer.deserializeTypedFromArray(jp, ctxt);
    }

    protected Byte[] deserializeFromBase64(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        byte[] b = jp.getBinaryValue(ctxt.getBase64Variant());
        Byte[] result = new Byte[b.length];
        int len = b.length;
        for (int i = 0; i < len; i++) {
            result[i] = Byte.valueOf(b[i]);
        }
        return result;
    }

    private final Object[] handleNonArray(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        Object value;
        Object[] result;
        if (jp.getCurrentToken() == JsonToken.VALUE_STRING && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) {
            String str = jp.getText();
            if (str.length() == 0) {
                return null;
            }
        }
        if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY)) {
            if (jp.getCurrentToken() == JsonToken.VALUE_STRING && this._elementClass == Byte.class) {
                return deserializeFromBase64(jp, ctxt);
            }
            throw ctxt.mappingException(this._arrayType.getRawClass());
        }
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.VALUE_NULL) {
            value = this._elementDeserializer.getNullValue(ctxt);
        } else if (this._elementTypeDeserializer == null) {
            value = this._elementDeserializer.deserialize(jp, ctxt);
        } else {
            value = this._elementDeserializer.deserializeWithType(jp, ctxt, this._elementTypeDeserializer);
        }
        if (this._untyped) {
            result = new Object[1];
        } else {
            result = (Object[]) Array.newInstance(this._elementClass, 1);
        }
        result[0] = value;
        return result;
    }
}
