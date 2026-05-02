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
import com.fasterxml.jackson.databind.deser.ValueInstantiator;
import com.fasterxml.jackson.databind.introspect.AnnotatedWithParams;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;
import java.util.Collection;

@JacksonStdImpl
/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/std/StringCollectionDeserializer.class */
public final class StringCollectionDeserializer extends ContainerDeserializerBase<Collection<String>> implements ContextualDeserializer {
    private static final long serialVersionUID = 1;
    protected final JavaType _collectionType;
    protected final JsonDeserializer<String> _valueDeserializer;
    protected final ValueInstantiator _valueInstantiator;
    protected final JsonDeserializer<Object> _delegateDeserializer;

    public StringCollectionDeserializer(JavaType collectionType, JsonDeserializer<?> valueDeser, ValueInstantiator valueInstantiator) {
        this(collectionType, valueInstantiator, null, valueDeser);
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected StringCollectionDeserializer(JavaType collectionType, ValueInstantiator valueInstantiator, JsonDeserializer<?> delegateDeser, JsonDeserializer<?> jsonDeserializer) {
        super(collectionType);
        this._collectionType = collectionType;
        this._valueDeserializer = jsonDeserializer;
        this._valueInstantiator = valueInstantiator;
        this._delegateDeserializer = delegateDeser;
    }

    protected StringCollectionDeserializer withResolved(JsonDeserializer<?> delegateDeser, JsonDeserializer<?> valueDeser) {
        if (this._valueDeserializer == valueDeser && this._delegateDeserializer == delegateDeser) {
            return this;
        }
        return new StringCollectionDeserializer(this._collectionType, this._valueInstantiator, delegateDeser, valueDeser);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public boolean isCachable() {
        return this._valueDeserializer == null && this._delegateDeserializer == null;
    }

    @Override // com.fasterxml.jackson.databind.deser.ContextualDeserializer
    public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
        JsonDeserializer<?> valueDeser;
        JsonDeserializer<Object> delegate = null;
        if (this._valueInstantiator != null) {
            AnnotatedWithParams delegateCreator = this._valueInstantiator.getDelegateCreator();
            if (delegateCreator != null) {
                JavaType delegateType = this._valueInstantiator.getDelegateType(ctxt.getConfig());
                delegate = findDeserializer(ctxt, delegateType, property);
            }
        }
        JsonDeserializer<?> valueDeser2 = this._valueDeserializer;
        JavaType valueType = this._collectionType.mo4getContentType();
        if (valueDeser2 == null) {
            valueDeser = findConvertingContentDeserializer(ctxt, property, valueDeser2);
            if (valueDeser == null) {
                valueDeser = ctxt.findContextualValueDeserializer(valueType, property);
            }
        } else {
            valueDeser = ctxt.handleSecondaryContextualization(valueDeser2, property, valueType);
        }
        if (isDefaultDeserializer(valueDeser)) {
            valueDeser = null;
        }
        return withResolved(delegate, valueDeser);
    }

    @Override // com.fasterxml.jackson.databind.deser.std.ContainerDeserializerBase
    public JavaType getContentType() {
        return this._collectionType.mo4getContentType();
    }

    @Override // com.fasterxml.jackson.databind.deser.std.ContainerDeserializerBase
    public JsonDeserializer<Object> getContentDeserializer() {
        JsonDeserializer<?> deser = this._valueDeserializer;
        return deser;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Collection<String> deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (this._delegateDeserializer != null) {
            return (Collection) this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(jp, ctxt));
        }
        Collection<String> result = (Collection) this._valueInstantiator.createUsingDefault(ctxt);
        return deserialize(jp, ctxt, result);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Collection<String> deserialize(JsonParser jp, DeserializationContext ctxt, Collection<String> result) throws IOException {
        if (!jp.isExpectedStartArrayToken()) {
            return handleNonArray(jp, ctxt, result);
        }
        if (this._valueDeserializer != null) {
            return deserializeUsingCustom(jp, ctxt, result, this._valueDeserializer);
        }
        while (true) {
            try {
                String value = jp.nextTextValue();
                if (value != null) {
                    result.add(value);
                } else {
                    JsonToken t = jp.getCurrentToken();
                    if (t != JsonToken.END_ARRAY) {
                        if (t != JsonToken.VALUE_NULL) {
                            value = _parseString(jp, ctxt);
                        }
                        result.add(value);
                    } else {
                        return result;
                    }
                }
            } catch (Exception e) {
                throw JsonMappingException.wrapWithPath(e, result, result.size());
            }
        }
    }

    private Collection<String> deserializeUsingCustom(JsonParser jp, DeserializationContext ctxt, Collection<String> result, JsonDeserializer<String> deser) throws IOException {
        String deserialize;
        while (true) {
            if (jp.nextTextValue() == null) {
                JsonToken t = jp.getCurrentToken();
                if (t != JsonToken.END_ARRAY) {
                    deserialize = t == JsonToken.VALUE_NULL ? deser.getNullValue(ctxt) : deser.deserialize(jp, ctxt);
                } else {
                    return result;
                }
            } else {
                deserialize = deser.deserialize(jp, ctxt);
            }
            String value = deserialize;
            result.add(value);
        }
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
        return typeDeserializer.deserializeTypedFromArray(jp, ctxt);
    }

    private final Collection<String> handleNonArray(JsonParser jp, DeserializationContext ctxt, Collection<String> result) throws IOException {
        String value;
        if (!ctxt.isEnabled(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY)) {
            throw ctxt.mappingException(this._collectionType.getRawClass());
        }
        JsonDeserializer<String> valueDes = this._valueDeserializer;
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.VALUE_NULL) {
            value = valueDes == null ? null : valueDes.getNullValue(ctxt);
        } else {
            value = valueDes == null ? _parseString(jp, ctxt) : valueDes.deserialize(jp, ctxt);
        }
        result.add(value);
        return result;
    }
}
