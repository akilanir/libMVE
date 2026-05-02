package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.util.EmptyIterator;
import com.fasterxml.jackson.databind.util.Named;
import java.util.Iterator;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/introspect/BeanPropertyDefinition.class */
public abstract class BeanPropertyDefinition implements Named {
    public abstract BeanPropertyDefinition withName(PropertyName propertyName);

    public abstract BeanPropertyDefinition withSimpleName(String str);

    @Override // com.fasterxml.jackson.databind.util.Named
    public abstract String getName();

    public abstract PropertyName getFullName();

    public abstract String getInternalName();

    public abstract PropertyName getWrapperName();

    public abstract PropertyMetadata getMetadata();

    public abstract boolean isExplicitlyIncluded();

    public abstract boolean hasGetter();

    public abstract boolean hasSetter();

    public abstract boolean hasField();

    public abstract boolean hasConstructorParameter();

    public abstract AnnotatedMethod getGetter();

    public abstract AnnotatedMethod getSetter();

    public abstract AnnotatedField getField();

    public abstract AnnotatedParameter getConstructorParameter();

    public abstract AnnotatedMember getAccessor();

    public abstract AnnotatedMember getMutator();

    public abstract AnnotatedMember getNonConstructorMutator();

    public abstract AnnotatedMember getPrimaryMember();

    public boolean hasName(PropertyName name) {
        return getFullName().equals(name);
    }

    public boolean isExplicitlyNamed() {
        return isExplicitlyIncluded();
    }

    public boolean couldDeserialize() {
        return getMutator() != null;
    }

    public boolean couldSerialize() {
        return getAccessor() != null;
    }

    public Iterator<AnnotatedParameter> getConstructorParameters() {
        return EmptyIterator.instance();
    }

    public Class<?>[] findViews() {
        return null;
    }

    public AnnotationIntrospector.ReferenceProperty findReferenceType() {
        return null;
    }

    public boolean isTypeId() {
        return false;
    }

    public ObjectIdInfo findObjectIdInfo() {
        return null;
    }

    public boolean isRequired() {
        PropertyMetadata md = getMetadata();
        return md != null && md.isRequired();
    }

    public JsonInclude.Include findInclusion() {
        return null;
    }
}
