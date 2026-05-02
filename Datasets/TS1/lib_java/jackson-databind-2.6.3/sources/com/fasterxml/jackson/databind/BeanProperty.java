package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.fasterxml.jackson.databind.util.Annotations;
import com.fasterxml.jackson.databind.util.Named;
import java.lang.annotation.Annotation;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/BeanProperty.class */
public interface BeanProperty extends Named {
    @Override // com.fasterxml.jackson.databind.util.Named
    String getName();

    PropertyName getFullName();

    JavaType getType();

    PropertyName getWrapperName();

    PropertyMetadata getMetadata();

    boolean isRequired();

    <A extends Annotation> A getAnnotation(Class<A> cls);

    <A extends Annotation> A getContextAnnotation(Class<A> cls);

    AnnotatedMember getMember();

    JsonFormat.Value findFormatOverrides(AnnotationIntrospector annotationIntrospector);

    void depositSchemaProperty(JsonObjectFormatVisitor jsonObjectFormatVisitor) throws JsonMappingException;

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/BeanProperty$Std.class */
    public static class Std implements BeanProperty {
        protected final PropertyName _name;
        protected final JavaType _type;
        protected final PropertyName _wrapperName;
        protected final PropertyMetadata _metadata;
        protected final AnnotatedMember _member;
        protected final Annotations _contextAnnotations;

        public Std(PropertyName name, JavaType type, PropertyName wrapperName, Annotations contextAnnotations, AnnotatedMember member, PropertyMetadata metadata) {
            this._name = name;
            this._type = type;
            this._wrapperName = wrapperName;
            this._metadata = metadata;
            this._member = member;
            this._contextAnnotations = contextAnnotations;
        }

        public Std(Std base, JavaType newType) {
            this(base._name, newType, base._wrapperName, base._contextAnnotations, base._member, base._metadata);
        }

        @Deprecated
        public Std(String name, JavaType type, PropertyName wrapperName, Annotations contextAnnotations, AnnotatedMember member, boolean isRequired) {
            this(new PropertyName(name), type, wrapperName, contextAnnotations, member, isRequired ? PropertyMetadata.STD_REQUIRED : PropertyMetadata.STD_OPTIONAL);
        }

        public Std withType(JavaType type) {
            return new Std(this, type);
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty
        public <A extends Annotation> A getAnnotation(Class<A> cls) {
            if (this._member == null) {
                return null;
            }
            return (A) this._member.getAnnotation(cls);
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty
        public <A extends Annotation> A getContextAnnotation(Class<A> cls) {
            if (this._contextAnnotations == null) {
                return null;
            }
            return (A) this._contextAnnotations.get(cls);
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty
        public JsonFormat.Value findFormatOverrides(AnnotationIntrospector intr) {
            return null;
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty, com.fasterxml.jackson.databind.util.Named
        public String getName() {
            return this._name.getSimpleName();
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty
        public PropertyName getFullName() {
            return this._name;
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty
        public JavaType getType() {
            return this._type;
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty
        public PropertyName getWrapperName() {
            return this._wrapperName;
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty
        public boolean isRequired() {
            return this._metadata.isRequired();
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty
        public PropertyMetadata getMetadata() {
            return this._metadata;
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty
        public AnnotatedMember getMember() {
            return this._member;
        }

        public boolean isVirtual() {
            return false;
        }

        @Override // com.fasterxml.jackson.databind.BeanProperty
        public void depositSchemaProperty(JsonObjectFormatVisitor objectVisitor) {
            throw new UnsupportedOperationException("Instances of " + getClass().getName() + " should not get visited");
        }
    }
}
