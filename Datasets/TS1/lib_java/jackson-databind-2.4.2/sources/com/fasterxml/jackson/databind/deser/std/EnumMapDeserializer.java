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
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;
import java.util.EnumMap;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/std/EnumMapDeserializer.class */
public class EnumMapDeserializer extends StdDeserializer<EnumMap<?, ?>> implements ContextualDeserializer {
    private static final long serialVersionUID = 4564890642370311174L;
    protected final JavaType _mapType;
    protected final Class<?> _enumClass;
    protected JsonDeserializer<Enum<?>> _keyDeserializer;
    protected JsonDeserializer<Object> _valueDeserializer;
    protected final TypeDeserializer _valueTypeDeserializer;

    /* JADX WARN: Multi-variable type inference failed */
    public EnumMapDeserializer(JavaType mapType, JsonDeserializer<?> jsonDeserializer, JsonDeserializer<?> valueDeser, TypeDeserializer valueTypeDeser) {
        super((Class<?>) EnumMap.class);
        this._mapType = mapType;
        this._enumClass = mapType.mo4getKeyType().getRawClass();
        this._keyDeserializer = jsonDeserializer;
        this._valueDeserializer = valueDeser;
        this._valueTypeDeserializer = valueTypeDeser;
    }

    public EnumMapDeserializer withResolved(JsonDeserializer<?> keyDeserializer, JsonDeserializer<?> valueDeserializer, TypeDeserializer valueTypeDeser) {
        if (keyDeserializer == this._keyDeserializer && valueDeserializer == this._valueDeserializer && valueTypeDeser == this._valueTypeDeserializer) {
            return this;
        }
        return new EnumMapDeserializer(this._mapType, keyDeserializer, valueDeserializer, this._valueTypeDeserializer);
    }

    @Override // com.fasterxml.jackson.databind.deser.ContextualDeserializer
    public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
        JsonDeserializer<?> vd;
        JsonDeserializer<?> kd = this._keyDeserializer;
        if (kd == null) {
            kd = ctxt.findContextualValueDeserializer(this._mapType.mo4getKeyType(), property);
        }
        JsonDeserializer<?> vd2 = this._valueDeserializer;
        if (vd2 == null) {
            vd = ctxt.findContextualValueDeserializer(this._mapType.mo3getContentType(), property);
        } else {
            vd = ctxt.handleSecondaryContextualization(vd2, property);
        }
        TypeDeserializer vtd = this._valueTypeDeserializer;
        if (vtd != null) {
            vtd = vtd.forProperty(property);
        }
        return withResolved(kd, vd, vtd);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public boolean isCachable() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public EnumMap<?, ?> deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        Object value;
        if (jp.getCurrentToken() != JsonToken.START_OBJECT) {
            throw ctxt.mappingException(EnumMap.class);
        }
        EnumMap result = constructMap();
        JsonDeserializer<Object> valueDes = this._valueDeserializer;
        TypeDeserializer typeDeser = this._valueTypeDeserializer;
        while (jp.nextToken() != JsonToken.END_OBJECT) {
            Enum<?> key = this._keyDeserializer.deserialize(jp, ctxt);
            if (key == null) {
                if (!ctxt.isEnabled(DeserializationFeature.READ_UNKNOWN_ENUM_VALUES_AS_NULL)) {
                    String value2 = null;
                    try {
                        if (jp.hasCurrentToken()) {
                            value2 = jp.getText();
                        }
                    } catch (Exception e) {
                    }
                    throw ctxt.weirdStringException(value2, this._enumClass, "value not one of declared Enum instance names");
                }
                jp.nextToken();
                jp.skipChildren();
            } else {
                JsonToken t = jp.nextToken();
                if (t == JsonToken.VALUE_NULL) {
                    value = valueDes.getNullValue();
                } else if (typeDeser == null) {
                    value = valueDes.deserialize(jp, ctxt);
                } else {
                    value = valueDes.deserializeWithType(jp, ctxt, typeDeser);
                }
                result.put((EnumMap) key, (Enum<?>) value);
            }
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
        return typeDeserializer.deserializeTypedFromObject(jp, ctxt);
    }

    private EnumMap<?, ?> constructMap() {
        return new EnumMap<>(this._enumClass);
    }
}
