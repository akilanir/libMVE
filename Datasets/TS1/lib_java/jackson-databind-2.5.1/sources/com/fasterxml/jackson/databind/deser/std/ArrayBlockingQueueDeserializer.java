package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.ValueInstantiator;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.concurrent.ArrayBlockingQueue;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/ArrayBlockingQueueDeserializer.class */
public class ArrayBlockingQueueDeserializer extends CollectionDeserializer {
    private static final long serialVersionUID = 1;

    @Override // com.fasterxml.jackson.databind.deser.std.CollectionDeserializer
    protected /* bridge */ /* synthetic */ CollectionDeserializer withResolved(JsonDeserializer x0, JsonDeserializer x1, TypeDeserializer x2) {
        return withResolved((JsonDeserializer<?>) x0, (JsonDeserializer<?>) x1, x2);
    }

    public ArrayBlockingQueueDeserializer(JavaType collectionType, JsonDeserializer<Object> valueDeser, TypeDeserializer valueTypeDeser, ValueInstantiator valueInstantiator, JsonDeserializer<Object> delegateDeser) {
        super(collectionType, valueDeser, valueTypeDeser, valueInstantiator, delegateDeser);
    }

    protected ArrayBlockingQueueDeserializer(ArrayBlockingQueueDeserializer src) {
        super(src);
    }

    @Override // com.fasterxml.jackson.databind.deser.std.CollectionDeserializer
    protected ArrayBlockingQueueDeserializer withResolved(JsonDeserializer<?> dd, JsonDeserializer<?> vd, TypeDeserializer vtd) {
        if (dd == this._delegateDeserializer && vd == this._valueDeserializer && vtd == this._valueTypeDeserializer) {
            return this;
        }
        return new ArrayBlockingQueueDeserializer(this._collectionType, vd, vtd, this._valueInstantiator, dd);
    }

    @Override // com.fasterxml.jackson.databind.deser.std.CollectionDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Collection<Object> deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (this._delegateDeserializer != null) {
            return (Collection) this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(jp, ctxt));
        }
        if (jp.getCurrentToken() == JsonToken.VALUE_STRING) {
            String str = jp.getText();
            if (str.length() == 0) {
                return (Collection) this._valueInstantiator.createFromString(ctxt, str);
            }
        }
        return deserialize(jp, ctxt, (Collection<Object>) null);
    }

    @Override // com.fasterxml.jackson.databind.deser.std.CollectionDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Collection<Object> deserialize(JsonParser jp, DeserializationContext ctxt, Collection<Object> result0) throws IOException {
        Object value;
        if (!jp.isExpectedStartArrayToken()) {
            return handleNonArray(jp, ctxt, new ArrayBlockingQueue(1));
        }
        ArrayList<Object> tmp = new ArrayList<>();
        JsonDeserializer<Object> valueDes = this._valueDeserializer;
        TypeDeserializer typeDeser = this._valueTypeDeserializer;
        while (true) {
            try {
                JsonToken t = jp.nextToken();
                if (t == JsonToken.END_ARRAY) {
                    break;
                }
                if (t == JsonToken.VALUE_NULL) {
                    value = valueDes.getNullValue();
                } else if (typeDeser == null) {
                    value = valueDes.deserialize(jp, ctxt);
                } else {
                    value = valueDes.deserializeWithType(jp, ctxt, typeDeser);
                }
                tmp.add(value);
            } catch (Exception e) {
                throw JsonMappingException.wrapWithPath(e, tmp, tmp.size());
            }
        }
        if (result0 != null) {
            result0.addAll(tmp);
            return result0;
        }
        return new ArrayBlockingQueue(tmp.size(), false, tmp);
    }

    @Override // com.fasterxml.jackson.databind.deser.std.CollectionDeserializer, com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
        return typeDeserializer.deserializeTypedFromArray(jp, ctxt);
    }
}
