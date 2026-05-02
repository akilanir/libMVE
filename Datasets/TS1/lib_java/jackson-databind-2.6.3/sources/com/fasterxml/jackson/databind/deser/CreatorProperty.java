package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.AnnotatedParameter;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.util.Annotations;
import java.io.IOException;
import java.lang.annotation.Annotation;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/CreatorProperty.class */
public class CreatorProperty extends SettableBeanProperty {
    private static final long serialVersionUID = 1;
    protected final AnnotatedParameter _annotated;
    protected final Object _injectableValueId;
    protected final int _creatorIndex;
    protected SettableBeanProperty _fallbackSetter;

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public /* bridge */ /* synthetic */ SettableBeanProperty withValueDeserializer(JsonDeserializer x0) {
        return withValueDeserializer((JsonDeserializer<?>) x0);
    }

    public CreatorProperty(PropertyName name, JavaType type, PropertyName wrapperName, TypeDeserializer typeDeser, Annotations contextAnnotations, AnnotatedParameter param, int index, Object injectableValueId, PropertyMetadata metadata) {
        super(name, type, wrapperName, typeDeser, contextAnnotations, metadata);
        this._annotated = param;
        this._creatorIndex = index;
        this._injectableValueId = injectableValueId;
        this._fallbackSetter = null;
    }

    protected CreatorProperty(CreatorProperty src, PropertyName newName) {
        super(src, newName);
        this._annotated = src._annotated;
        this._creatorIndex = src._creatorIndex;
        this._injectableValueId = src._injectableValueId;
        this._fallbackSetter = src._fallbackSetter;
    }

    protected CreatorProperty(CreatorProperty src, JsonDeserializer<?> deser) {
        super(src, deser);
        this._annotated = src._annotated;
        this._creatorIndex = src._creatorIndex;
        this._injectableValueId = src._injectableValueId;
        this._fallbackSetter = src._fallbackSetter;
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public CreatorProperty withName(PropertyName newName) {
        return new CreatorProperty(this, newName);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public CreatorProperty withValueDeserializer(JsonDeserializer<?> deser) {
        return new CreatorProperty(this, deser);
    }

    public void setFallbackSetter(SettableBeanProperty fallbackSetter) {
        this._fallbackSetter = fallbackSetter;
    }

    public Object findInjectableValue(DeserializationContext context, Object beanInstance) {
        if (this._injectableValueId == null) {
            throw new IllegalStateException("Property '" + getName() + "' (type " + getClass().getName() + ") has no injectable value id configured");
        }
        return context.findInjectableValue(this._injectableValueId, this, beanInstance);
    }

    public void inject(DeserializationContext context, Object beanInstance) throws IOException {
        set(beanInstance, findInjectableValue(context, beanInstance));
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty, com.fasterxml.jackson.databind.BeanProperty
    public <A extends Annotation> A getAnnotation(Class<A> cls) {
        if (this._annotated == null) {
            return null;
        }
        return (A) this._annotated.getAnnotation(cls);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty, com.fasterxml.jackson.databind.BeanProperty
    public AnnotatedMember getMember() {
        return this._annotated;
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public int getCreatorIndex() {
        return this._creatorIndex;
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public void deserializeAndSet(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException, JsonProcessingException {
        set(instance, deserialize(jp, ctxt));
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public Object deserializeSetAndReturn(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException, JsonProcessingException {
        return setAndReturn(instance, deserialize(jp, ctxt));
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public void set(Object instance, Object value) throws IOException {
        if (this._fallbackSetter == null) {
            throw new IllegalStateException("No fallback setter/field defined: can not use creator property for " + getClass().getName());
        }
        this._fallbackSetter.set(instance, value);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public Object setAndReturn(Object instance, Object value) throws IOException {
        if (this._fallbackSetter == null) {
            throw new IllegalStateException("No fallback setter/field defined: can not use creator property for " + getClass().getName());
        }
        return this._fallbackSetter.setAndReturn(instance, value);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public Object getInjectableValueId() {
        return this._injectableValueId;
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public String toString() {
        return "[creator property, name '" + getName() + "'; inject id '" + this._injectableValueId + "']";
    }
}
