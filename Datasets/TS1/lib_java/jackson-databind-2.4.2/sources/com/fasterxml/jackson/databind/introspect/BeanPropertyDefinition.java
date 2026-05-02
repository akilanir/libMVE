package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.util.Named;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/introspect/BeanPropertyDefinition.class */
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

    @Deprecated
    public BeanPropertyDefinition withName(String newName) {
        return withSimpleName(newName);
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

    public AnnotatedMember getPrimaryMember() {
        return null;
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

    public final boolean isRequired() {
        PropertyMetadata md = getMetadata();
        return md != null && md.isRequired();
    }
}
