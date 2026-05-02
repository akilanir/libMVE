package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;
import java.util.EnumSet;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/EnumSetDeserializer.class */
public class EnumSetDeserializer extends StdDeserializer<EnumSet<?>> implements ContextualDeserializer {
    private static final long serialVersionUID = 1;
    protected final JavaType _enumType;
    protected final Class<Enum> _enumClass;
    protected JsonDeserializer<Enum<?>> _enumDeserializer;

    /* JADX WARN: Multi-variable type inference failed */
    public EnumSetDeserializer(JavaType enumType, JsonDeserializer<?> jsonDeserializer) {
        super((Class<?>) EnumSet.class);
        this._enumType = enumType;
        this._enumClass = enumType.getRawClass();
        this._enumDeserializer = jsonDeserializer;
    }

    public EnumSetDeserializer withDeserializer(JsonDeserializer<?> deser) {
        if (this._enumDeserializer == deser) {
            return this;
        }
        return new EnumSetDeserializer(this._enumType, deser);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public boolean isCachable() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.deser.ContextualDeserializer
    public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
        JsonDeserializer<?> deser;
        JsonDeserializer<?> deser2 = this._enumDeserializer;
        if (deser2 == null) {
            deser = ctxt.findContextualValueDeserializer(this._enumType, property);
        } else {
            deser = ctxt.handleSecondaryContextualization(deser2, property, this._enumType);
        }
        return withDeserializer(deser);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public EnumSet<?> deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        if (!jp.isExpectedStartArrayToken()) {
            throw ctxt.mappingException(EnumSet.class);
        }
        EnumSet result = constructSet();
        while (true) {
            try {
                JsonToken t = jp.nextToken();
                if (t != JsonToken.END_ARRAY) {
                    if (t == JsonToken.VALUE_NULL) {
                        throw ctxt.mappingException(this._enumClass);
                    }
                    Enum<?> value = this._enumDeserializer.deserialize(jp, ctxt);
                    if (value != null) {
                        result.add(value);
                    }
                } else {
                    return result;
                }
            } catch (Exception e) {
                throw JsonMappingException.wrapWithPath(e, result, result.size());
            }
        }
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
        return typeDeserializer.deserializeTypedFromArray(jp, ctxt);
    }

    private EnumSet constructSet() {
        return EnumSet.noneOf(this._enumClass);
    }
}
