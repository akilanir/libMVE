package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.annotation.JsonPOJOBuilder;
import com.fasterxml.jackson.databind.introspect.AnnotatedClass;
import com.fasterxml.jackson.databind.introspect.AnnotatedConstructor;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition;
import com.fasterxml.jackson.databind.introspect.ObjectIdInfo;
import com.fasterxml.jackson.databind.type.TypeBindings;
import com.fasterxml.jackson.databind.util.Annotations;
import com.fasterxml.jackson.databind.util.Converter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/BeanDescription.class */
public abstract class BeanDescription {
    protected final JavaType _type;

    public abstract AnnotatedClass getClassInfo();

    public abstract ObjectIdInfo getObjectIdInfo();

    public abstract boolean hasKnownClassAnnotations();

    public abstract TypeBindings bindingsForBeanType();

    public abstract JavaType resolveType(Type type);

    public abstract Annotations getClassAnnotations();

    public abstract List<BeanPropertyDefinition> findProperties();

    public abstract Map<String, AnnotatedMember> findBackReferenceProperties();

    public abstract Set<String> getIgnoredPropertyNames();

    public abstract List<AnnotatedConstructor> getConstructors();

    public abstract List<AnnotatedMethod> getFactoryMethods();

    public abstract AnnotatedConstructor findDefaultConstructor();

    public abstract Constructor<?> findSingleArgConstructor(Class<?>... clsArr);

    public abstract Method findFactoryMethod(Class<?>... clsArr);

    public abstract AnnotatedMember findAnyGetter();

    public abstract AnnotatedMethod findAnySetter();

    public abstract AnnotatedMethod findJsonValueMethod();

    public abstract AnnotatedMethod findMethod(String str, Class<?>[] clsArr);

    public abstract JsonInclude.Include findSerializationInclusion(JsonInclude.Include include);

    public abstract JsonInclude.Include findSerializationInclusionForContent(JsonInclude.Include include);

    public abstract JsonFormat.Value findExpectedFormat(JsonFormat.Value value);

    public abstract Converter<Object, Object> findSerializationConverter();

    public abstract Converter<Object, Object> findDeserializationConverter();

    public abstract Map<Object, AnnotatedMember> findInjectables();

    public abstract Class<?> findPOJOBuilder();

    public abstract JsonPOJOBuilder.Value findPOJOBuilderConfig();

    public abstract Object instantiateBean(boolean z);

    protected BeanDescription(JavaType type) {
        this._type = type;
    }

    public JavaType getType() {
        return this._type;
    }

    public Class<?> getBeanClass() {
        return this._type.getRawClass();
    }
}
