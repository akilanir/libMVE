package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/AtomicReferenceDeserializer.class */
public class AtomicReferenceDeserializer extends StdDeserializer<AtomicReference<?>> implements ContextualDeserializer {
    private static final long serialVersionUID = 1;
    protected final JavaType _referencedType;
    protected final TypeDeserializer _valueTypeDeserializer;
    protected final JsonDeserializer<?> _valueDeserializer;

    public AtomicReferenceDeserializer(JavaType referencedType) {
        this(referencedType, null, null);
    }

    public AtomicReferenceDeserializer(JavaType referencedType, TypeDeserializer typeDeser, JsonDeserializer<?> deser) {
        super((Class<?>) AtomicReference.class);
        this._referencedType = referencedType;
        this._valueDeserializer = deser;
        this._valueTypeDeserializer = typeDeser;
    }

    public AtomicReferenceDeserializer withResolved(TypeDeserializer typeDeser, JsonDeserializer<?> valueDeser) {
        return new AtomicReferenceDeserializer(this._referencedType, typeDeser, valueDeser);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public AtomicReference<?> getNullValue() {
        return new AtomicReference<>();
    }

    @Override // com.fasterxml.jackson.databind.deser.ContextualDeserializer
    public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
        JsonDeserializer<?> deser = this._valueDeserializer;
        TypeDeserializer typeDeser = this._valueTypeDeserializer;
        if (deser == null) {
            deser = ctxt.findContextualValueDeserializer(this._referencedType, property);
        }
        if (typeDeser != null) {
            typeDeser = typeDeser.forProperty(property);
        }
        if (deser == this._valueDeserializer && typeDeser == this._valueTypeDeserializer) {
            return this;
        }
        return withResolved(typeDeser, deser);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public AtomicReference<?> deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (this._valueTypeDeserializer != null) {
            return new AtomicReference<>(this._valueDeserializer.deserializeWithType(jp, ctxt, this._valueTypeDeserializer));
        }
        return new AtomicReference<>(this._valueDeserializer.deserialize(jp, ctxt));
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object[] deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
        return (Object[]) typeDeserializer.deserializeTypedFromAny(jp, ctxt);
    }
}
