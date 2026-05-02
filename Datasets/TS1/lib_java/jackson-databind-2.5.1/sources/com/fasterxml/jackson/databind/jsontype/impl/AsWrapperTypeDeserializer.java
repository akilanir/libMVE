package com.fasterxml.jackson.databind.jsontype.impl;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.util.JsonParserSequence;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeIdResolver;
import com.fasterxml.jackson.databind.util.TokenBuffer;
import java.io.IOException;
import java.io.Serializable;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/jsontype/impl/AsWrapperTypeDeserializer.class */
public class AsWrapperTypeDeserializer extends TypeDeserializerBase implements Serializable {
    private static final long serialVersionUID = 5345570420394408290L;

    public AsWrapperTypeDeserializer(JavaType bt, TypeIdResolver idRes, String typePropertyName, boolean typeIdVisible, Class<?> defaultImpl) {
        super(bt, idRes, typePropertyName, typeIdVisible, defaultImpl);
    }

    protected AsWrapperTypeDeserializer(AsWrapperTypeDeserializer src, BeanProperty property) {
        super(src, property);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.TypeDeserializerBase, com.fasterxml.jackson.databind.jsontype.TypeDeserializer
    public TypeDeserializer forProperty(BeanProperty prop) {
        return prop == this._property ? this : new AsWrapperTypeDeserializer(this, prop);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.TypeDeserializerBase, com.fasterxml.jackson.databind.jsontype.TypeDeserializer
    public JsonTypeInfo.As getTypeInclusion() {
        return JsonTypeInfo.As.WRAPPER_OBJECT;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeDeserializer
    public Object deserializeTypedFromObject(JsonParser jp, DeserializationContext ctxt) throws IOException {
        return _deserialize(jp, ctxt);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeDeserializer
    public Object deserializeTypedFromArray(JsonParser jp, DeserializationContext ctxt) throws IOException {
        return _deserialize(jp, ctxt);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeDeserializer
    public Object deserializeTypedFromScalar(JsonParser jp, DeserializationContext ctxt) throws IOException {
        return _deserialize(jp, ctxt);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeDeserializer
    public Object deserializeTypedFromAny(JsonParser jp, DeserializationContext ctxt) throws IOException {
        return _deserialize(jp, ctxt);
    }

    private final Object _deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        Object typeId;
        if (jp.canReadTypeId() && (typeId = jp.getTypeId()) != null) {
            return _deserializeWithNativeTypeId(jp, ctxt, typeId);
        }
        if (jp.getCurrentToken() != JsonToken.START_OBJECT) {
            throw ctxt.wrongTokenException(jp, JsonToken.START_OBJECT, "need JSON Object to contain As.WRAPPER_OBJECT type information for class " + baseTypeName());
        }
        if (jp.nextToken() != JsonToken.FIELD_NAME) {
            throw ctxt.wrongTokenException(jp, JsonToken.FIELD_NAME, "need JSON String that contains type id (for subtype of " + baseTypeName() + ")");
        }
        String typeId2 = jp.getText();
        JsonDeserializer<Object> deser = _findDeserializer(ctxt, typeId2);
        jp.nextToken();
        if (this._typeIdVisible && jp.getCurrentToken() == JsonToken.START_OBJECT) {
            TokenBuffer tb = new TokenBuffer(null, false);
            tb.writeStartObject();
            tb.writeFieldName(this._typePropertyName);
            tb.writeString(typeId2);
            jp = JsonParserSequence.createFlattened(tb.asParser(jp), jp);
            jp.nextToken();
        }
        Object value = deser.deserialize(jp, ctxt);
        if (jp.nextToken() != JsonToken.END_OBJECT) {
            throw ctxt.wrongTokenException(jp, JsonToken.END_OBJECT, "expected closing END_OBJECT after type information and deserialized value");
        }
        return value;
    }
}
