package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.util.Annotations;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/impl/MethodProperty.class */
public final class MethodProperty extends SettableBeanProperty {
    private static final long serialVersionUID = 1;
    protected final AnnotatedMethod _annotated;
    protected final transient Method _setter;

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public /* bridge */ /* synthetic */ SettableBeanProperty withValueDeserializer(JsonDeserializer x0) {
        return withValueDeserializer((JsonDeserializer<?>) x0);
    }

    public MethodProperty(BeanPropertyDefinition propDef, JavaType type, TypeDeserializer typeDeser, Annotations contextAnnotations, AnnotatedMethod method) {
        super(propDef, type, typeDeser, contextAnnotations);
        this._annotated = method;
        this._setter = method.getAnnotated();
    }

    protected MethodProperty(MethodProperty src, JsonDeserializer<?> deser) {
        super(src, deser);
        this._annotated = src._annotated;
        this._setter = src._setter;
    }

    protected MethodProperty(MethodProperty src, PropertyName newName) {
        super(src, newName);
        this._annotated = src._annotated;
        this._setter = src._setter;
    }

    protected MethodProperty(MethodProperty src, Method m) {
        super(src);
        this._annotated = src._annotated;
        this._setter = m;
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public MethodProperty withName(PropertyName newName) {
        return new MethodProperty(this, newName);
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public MethodProperty withValueDeserializer(JsonDeserializer<?> deser) {
        return new MethodProperty(this, deser);
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
    public void deserializeAndSet(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException {
        Object value = deserialize(jp, ctxt);
        try {
            this._setter.invoke(instance, value);
        } catch (Exception e) {
            _throwAsIOE(e, value);
        }
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public Object deserializeSetAndReturn(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException {
        Object value = deserialize(jp, ctxt);
        try {
            Object result = this._setter.invoke(instance, value);
            return result == null ? instance : result;
        } catch (Exception e) {
            _throwAsIOE(e, value);
            return null;
        }
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public final void set(Object instance, Object value) throws IOException {
        try {
            this._setter.invoke(instance, value);
        } catch (Exception e) {
            _throwAsIOE(e, value);
        }
    }

    @Override // com.fasterxml.jackson.databind.deser.SettableBeanProperty
    public Object setAndReturn(Object instance, Object value) throws IOException {
        try {
            Object result = this._setter.invoke(instance, value);
            return result == null ? instance : result;
        } catch (Exception e) {
            _throwAsIOE(e, value);
            return null;
        }
    }

    Object readResolve() {
        return new MethodProperty(this, this._annotated.getAnnotated());
    }
}
