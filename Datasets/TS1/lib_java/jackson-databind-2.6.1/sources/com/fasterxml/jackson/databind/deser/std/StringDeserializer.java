package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.Base64Variants;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;

@JacksonStdImpl
/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/StringDeserializer.class */
public final class StringDeserializer extends StdScalarDeserializer<String> {
    private static final long serialVersionUID = 1;
    public static final StringDeserializer instance = new StringDeserializer();

    public StringDeserializer() {
        super((Class<?>) String.class);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public boolean isCachable() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public String deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        JsonToken curr = jp.getCurrentToken();
        if (curr == JsonToken.VALUE_STRING) {
            return jp.getText();
        }
        if (curr == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jp.nextToken();
            String parsed = _parseString(jp, ctxt);
            if (jp.nextToken() != JsonToken.END_ARRAY) {
                throw ctxt.wrongTokenException(jp, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'String' value but there was more than a single value in the array");
            }
            return parsed;
        }
        if (curr == JsonToken.VALUE_EMBEDDED_OBJECT) {
            Object ob = jp.getEmbeddedObject();
            if (ob == null) {
                return null;
            }
            if (ob instanceof byte[]) {
                return Base64Variants.getDefaultVariant().encode((byte[]) ob, false);
            }
            return ob.toString();
        }
        String text = jp.getValueAsString();
        if (text != null) {
            return text;
        }
        throw ctxt.mappingException(this._valueClass, curr);
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdScalarDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public String deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
        return deserialize(jp, ctxt);
    }
}
