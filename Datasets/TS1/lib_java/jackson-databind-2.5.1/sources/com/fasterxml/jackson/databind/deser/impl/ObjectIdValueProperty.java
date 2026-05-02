package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import java.io.IOException;
import java.lang.annotation.Annotation;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/impl/ObjectIdValueProperty.class */
public final class ObjectIdValueProperty extends SettableBeanProperty {
    private static final long serialVersionUID = 1;
    protected final ObjectIdReader _objectIdReader;

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public /* bridge */ /* synthetic */ SettableBeanProperty withValueDeserializer(JsonDeserializer x0) {
        return withValueDeserializer((JsonDeserializer<?>) x0);
    }

    public ObjectIdValueProperty(ObjectIdReader objectIdReader, PropertyMetadata metadata) {
        super(objectIdReader.propertyName, objectIdReader.getIdType(), metadata, objectIdReader.getDeserializer());
        this._objectIdReader = objectIdReader;
    }

    protected ObjectIdValueProperty(ObjectIdValueProperty src, JsonDeserializer<?> deser) {
        super(src, deser);
        this._objectIdReader = src._objectIdReader;
    }

    @Deprecated
    protected ObjectIdValueProperty(ObjectIdValueProperty src, PropertyName newName) {
        super(src, newName);
        this._objectIdReader = src._objectIdReader;
    }

    @Deprecated
    protected ObjectIdValueProperty(ObjectIdValueProperty src, String newName) {
        this(src, new PropertyName(newName));
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public ObjectIdValueProperty withName(PropertyName newName) {
        return new ObjectIdValueProperty(this, newName);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public ObjectIdValueProperty withValueDeserializer(JsonDeserializer<?> deser) {
        return new ObjectIdValueProperty(this, deser);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty, com.fasterxml.jackson.databind.BeanProperty
    public <A extends Annotation> A getAnnotation(Class<A> acls) {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty, com.fasterxml.jackson.databind.BeanProperty
    public AnnotatedMember getMember() {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public void deserializeAndSet(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException {
        deserializeSetAndReturn(jp, ctxt, instance);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public Object deserializeSetAndReturn(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException {
        Object id = this._valueDeserializer.deserialize(jp, ctxt);
        ReadableObjectId roid = ctxt.findObjectId(id, this._objectIdReader.generator, this._objectIdReader.resolver);
        roid.bindItem(instance);
        SettableBeanProperty idProp = this._objectIdReader.idProperty;
        if (idProp != null) {
            return idProp.setAndReturn(instance, id);
        }
        return instance;
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public void set(Object instance, Object value) throws IOException {
        setAndReturn(instance, value);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public Object setAndReturn(Object instance, Object value) throws IOException {
        SettableBeanProperty idProp = this._objectIdReader.idProperty;
        if (idProp == null) {
            throw new UnsupportedOperationException("Should not call set() on ObjectIdProperty that has no SettableBeanProperty");
        }
        return idProp.setAndReturn(instance, value);
    }
}
