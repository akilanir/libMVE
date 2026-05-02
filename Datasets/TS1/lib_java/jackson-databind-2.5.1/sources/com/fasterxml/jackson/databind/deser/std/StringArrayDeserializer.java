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
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.util.ObjectBuffer;
import java.io.IOException;

@JacksonStdImpl
/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/StringArrayDeserializer.class */
public final class StringArrayDeserializer extends StdDeserializer<String[]> implements ContextualDeserializer {
    private static final long serialVersionUID = 1;
    public static final StringArrayDeserializer instance = new StringArrayDeserializer();
    protected JsonDeserializer<String> _elementDeserializer;

    public StringArrayDeserializer() {
        super((Class<?>) String[].class);
        this._elementDeserializer = null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected StringArrayDeserializer(JsonDeserializer<?> jsonDeserializer) {
        super((Class<?>) String[].class);
        this._elementDeserializer = jsonDeserializer;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public String[] deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (!jp.isExpectedStartArrayToken()) {
            return handleNonArray(jp, ctxt);
        }
        if (this._elementDeserializer != null) {
            return _deserializeCustom(jp, ctxt);
        }
        ObjectBuffer buffer = ctxt.leaseObjectBuffer();
        Object[] chunk = buffer.resetAndStart();
        int ix = 0;
        while (true) {
            try {
                String value = jp.nextTextValue();
                if (value == null) {
                    JsonToken t = jp.getCurrentToken();
                    if (t != JsonToken.END_ARRAY) {
                        if (t != JsonToken.VALUE_NULL) {
                            value = _parseString(jp, ctxt);
                        }
                    } else {
                        String[] result = (String[]) buffer.completeAndClearBuffer(chunk, ix, String.class);
                        ctxt.returnObjectBuffer(buffer);
                        return result;
                    }
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
    }

    protected final String[] _deserializeCustom(JsonParser jp, DeserializationContext ctxt) throws IOException {
        String value;
        ObjectBuffer buffer = ctxt.leaseObjectBuffer();
        Object[] chunk = buffer.resetAndStart();
        JsonDeserializer<String> deser = this._elementDeserializer;
        int ix = 0;
        while (true) {
            try {
                if (jp.nextTextValue() == null) {
                    JsonToken t = jp.getCurrentToken();
                    if (t != JsonToken.END_ARRAY) {
                        value = t == JsonToken.VALUE_NULL ? deser.getNullValue() : deser.deserialize(jp, ctxt);
                    } else {
                        String[] result = (String[]) buffer.completeAndClearBuffer(chunk, ix, String.class);
                        ctxt.returnObjectBuffer(buffer);
                        return result;
                    }
                } else {
                    value = deser.deserialize(jp, ctxt);
                }
                if (ix >= chunk.length) {
                    chunk = buffer.appendCompletedChunk(chunk);
                    ix = 0;
                }
                int i = ix;
                ix++;
                chunk[i] = value;
            } catch (Exception e) {
                throw JsonMappingException.wrapWithPath(e, String.class, ix);
            }
        }
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
        return typeDeserializer.deserializeTypedFromArray(jp, ctxt);
    }

    private final String[] handleNonArray(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY)) {
            if (jp.getCurrentToken() == JsonToken.VALUE_STRING && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) {
                String str = jp.getText();
                if (str.length() == 0) {
                    return null;
                }
            }
            throw ctxt.mappingException(this._valueClass);
        }
        String[] strArr = new String[1];
        strArr[0] = jp.getCurrentToken() == JsonToken.VALUE_NULL ? null : _parseString(jp, ctxt);
        return strArr;
    }

    @Override // com.fasterxml.jackson.databind.deser.ContextualDeserializer
    public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
        JsonDeserializer<?> deser;
        JsonDeserializer<?> deser2 = findConvertingContentDeserializer(ctxt, property, this._elementDeserializer);
        JavaType type = ctxt.constructType(String.class);
        if (deser2 == null) {
            deser = ctxt.findContextualValueDeserializer(type, property);
        } else {
            deser = ctxt.handleSecondaryContextualization(deser2, property, type);
        }
        if (deser != null && isDefaultDeserializer(deser)) {
            deser = null;
        }
        if (this._elementDeserializer != deser) {
            return new StringArrayDeserializer(deser);
        }
        return this;
    }
}
