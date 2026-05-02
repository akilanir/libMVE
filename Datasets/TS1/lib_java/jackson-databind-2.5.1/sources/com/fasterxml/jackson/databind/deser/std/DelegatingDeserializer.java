package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.fasterxml.jackson.databind.deser.ResolvableDeserializer;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import com.fasterxml.jackson.databind.deser.impl.ObjectIdReader;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;
import java.util.Collection;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/DelegatingDeserializer.class */
public abstract class DelegatingDeserializer extends StdDeserializer<Object> implements ContextualDeserializer, ResolvableDeserializer {
    private static final long serialVersionUID = 1;
    protected final JsonDeserializer<?> _delegatee;

    protected abstract JsonDeserializer<?> newDelegatingInstance(JsonDeserializer<?> jsonDeserializer);

    public DelegatingDeserializer(JsonDeserializer<?> delegatee) {
        super(_figureType(delegatee));
        this._delegatee = delegatee;
    }

    private static Class<?> _figureType(JsonDeserializer<?> deser) {
        Class<?> cls = deser.handledType();
        if (cls != null) {
            return cls;
        }
        return Object.class;
    }

    @Override // com.fasterxml.jackson.databind.deser.ResolvableDeserializer
    public void resolve(DeserializationContext ctxt) throws JsonMappingException {
        if (this._delegatee instanceof ResolvableDeserializer) {
            ((ResolvableDeserializer) this._delegatee).resolve(ctxt);
        }
    }

    @Override // com.fasterxml.jackson.databind.deser.ContextualDeserializer
    public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
        JavaType vt = ctxt.constructType(this._delegatee.handledType());
        JsonDeserializer<?> del = ctxt.handleSecondaryContextualization(this._delegatee, property, vt);
        if (del == this._delegatee) {
            return this;
        }
        return newDelegatingInstance(del);
    }

    @Deprecated
    protected JsonDeserializer<?> _createContextual(DeserializationContext ctxt, BeanProperty property, JsonDeserializer<?> newDelegatee) {
        if (newDelegatee == this._delegatee) {
            return this;
        }
        return newDelegatingInstance(newDelegatee);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public SettableBeanProperty findBackReference(String logicalName) {
        return this._delegatee.findBackReference(logicalName);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        return this._delegatee.deserialize(jp, ctxt);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser jp, DeserializationContext ctxt, Object intoValue) throws IOException, JsonProcessingException {
        return this._delegatee.deserialize(jp, ctxt, intoValue);
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
        return this._delegatee.deserializeWithType(jp, ctxt, typeDeserializer);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public JsonDeserializer<?> replaceDelegatee(JsonDeserializer<?> delegatee) {
        if (delegatee == this._delegatee) {
            return this;
        }
        return newDelegatingInstance(delegatee);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object getNullValue() {
        return this._delegatee.getNullValue();
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object getEmptyValue() {
        return this._delegatee.getEmptyValue();
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Collection<Object> getKnownPropertyNames() {
        return this._delegatee.getKnownPropertyNames();
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public boolean isCachable() {
        return this._delegatee.isCachable();
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public ObjectIdReader getObjectIdReader() {
        return this._delegatee.getObjectIdReader();
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public JsonDeserializer<?> getDelegatee() {
        return this._delegatee;
    }
}
