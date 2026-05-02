package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import com.fasterxml.jackson.databind.deser.UnresolvedForwardReference;
import com.fasterxml.jackson.databind.deser.impl.ReadableObjectId;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.ObjectIdInfo;
import java.io.IOException;
import java.lang.annotation.Annotation;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/impl/ObjectIdReferenceProperty.class */
public class ObjectIdReferenceProperty extends SettableBeanProperty {
    private static final long serialVersionUID = 8465266677345565407L;
    private SettableBeanProperty _forward;

    public ObjectIdReferenceProperty(SettableBeanProperty forward, ObjectIdInfo objectIdInfo) {
        super(forward);
        this._forward = forward;
        this._objectIdInfo = objectIdInfo;
    }

    public ObjectIdReferenceProperty(ObjectIdReferenceProperty src, JsonDeserializer<?> deser) {
        super(src, deser);
        this._forward = src._forward;
        this._objectIdInfo = src._objectIdInfo;
    }

    public ObjectIdReferenceProperty(ObjectIdReferenceProperty src, PropertyName newName) {
        super(src, newName);
        this._forward = src._forward;
        this._objectIdInfo = src._objectIdInfo;
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public SettableBeanProperty withValueDeserializer(JsonDeserializer<?> deser) {
        return new ObjectIdReferenceProperty(this, deser);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public SettableBeanProperty withName(PropertyName newName) {
        return new ObjectIdReferenceProperty(this, newName);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty, com.fasterxml.jackson.databind.BeanProperty
    public <A extends Annotation> A getAnnotation(Class<A> cls) {
        return (A) this._forward.getAnnotation(cls);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty, com.fasterxml.jackson.databind.BeanProperty
    public AnnotatedMember getMember() {
        return this._forward.getMember();
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public void deserializeAndSet(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException, JsonProcessingException {
        deserializeSetAndReturn(jp, ctxt, instance);
    }

    /* JADX WARN: Type inference failed for: r13v0, types: [com.fasterxml.jackson.databind.deser.UnresolvedForwardReference, java.lang.Throwable] */
    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public Object deserializeSetAndReturn(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException, JsonProcessingException {
        boolean usingIdentityInfo = (this._objectIdInfo == null && this._valueDeserializer.getObjectIdReader() == null) ? false : true;
        try {
            return setAndReturn(instance, deserialize(jp, ctxt));
        } catch (UnresolvedForwardReference e) {
            if (!usingIdentityInfo) {
                throw JsonMappingException.from(jp, "Unresolved forward reference but no identity info.", e);
            }
            e.getRoid().appendReferring(new PropertyReferring(this, e, this._type.getRawClass(), instance));
            return null;
        }
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public void set(Object instance, Object value) throws IOException {
        this._forward.set(instance, value);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public Object setAndReturn(Object instance, Object value) throws IOException {
        return this._forward.setAndReturn(instance, value);
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/impl/ObjectIdReferenceProperty$PropertyReferring.class */
    public static final class PropertyReferring extends ReadableObjectId.Referring {
        private final ObjectIdReferenceProperty _parent;
        public final Object _pojo;

        public PropertyReferring(ObjectIdReferenceProperty parent, UnresolvedForwardReference ref, Class<?> type, Object ob) {
            super(ref, type);
            this._parent = parent;
            this._pojo = ob;
        }

        @Override // com.fasterxml.jackson.databind.deser.impl.ReadableObjectId.Referring
        public void handleResolvedForwardReference(Object id, Object value) throws IOException {
            if (!hasId(id)) {
                throw new IllegalArgumentException("Trying to resolve a forward reference with id [" + id + "] that wasn't previously seen as unresolved.");
            }
            this._parent.set(this._pojo, value);
        }
    }
}
