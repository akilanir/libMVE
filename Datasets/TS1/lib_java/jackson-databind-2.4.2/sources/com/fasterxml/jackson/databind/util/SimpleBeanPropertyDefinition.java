package com.fasterxml.jackson.databind.util;

import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.cfg.MapperConfig;
import com.fasterxml.jackson.databind.introspect.AnnotatedField;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.introspect.AnnotatedParameter;
import com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition.class */
public class SimpleBeanPropertyDefinition extends BeanPropertyDefinition {
    protected final AnnotationIntrospector _introspector;
    protected final AnnotatedMember _member;
    protected final String _name;

    @Deprecated
    public SimpleBeanPropertyDefinition(AnnotatedMember member) {
        this(member, member.getName(), null);
    }

    @Deprecated
    public SimpleBeanPropertyDefinition(AnnotatedMember member, String name) {
        this(member, name, null);
    }

    private SimpleBeanPropertyDefinition(AnnotatedMember member, String name, AnnotationIntrospector intr) {
        this._introspector = intr;
        this._member = member;
        this._name = name;
    }

    public static SimpleBeanPropertyDefinition construct(MapperConfig<?> config, AnnotatedMember member) {
        return new SimpleBeanPropertyDefinition(member, member.getName(), config == null ? null : config.getAnnotationIntrospector());
    }

    public static SimpleBeanPropertyDefinition construct(MapperConfig<?> config, AnnotatedMember member, String name) {
        return new SimpleBeanPropertyDefinition(member, name, config == null ? null : config.getAnnotationIntrospector());
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    @Deprecated
    public SimpleBeanPropertyDefinition withName(String newName) {
        return withSimpleName(newName);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public SimpleBeanPropertyDefinition withSimpleName(String newName) {
        if (this._name.equals(newName)) {
            return this;
        }
        return new SimpleBeanPropertyDefinition(this._member, newName, this._introspector);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public SimpleBeanPropertyDefinition withName(PropertyName newName) {
        return withSimpleName(newName.getSimpleName());
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition, com.fasterxml.jackson.databind.util.Named
    public String getName() {
        return this._name;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public PropertyName getFullName() {
        return new PropertyName(this._name);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public String getInternalName() {
        return getName();
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public PropertyName getWrapperName() {
        if (this._introspector == null) {
            return null;
        }
        return this._introspector.findWrapperName(this._member);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean isExplicitlyIncluded() {
        return false;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean isExplicitlyNamed() {
        return false;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public PropertyMetadata getMetadata() {
        return PropertyMetadata.STD_OPTIONAL;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean hasGetter() {
        return getGetter() != null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean hasSetter() {
        return getSetter() != null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean hasField() {
        return this._member instanceof AnnotatedField;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean hasConstructorParameter() {
        return this._member instanceof AnnotatedParameter;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedMethod getGetter() {
        if ((this._member instanceof AnnotatedMethod) && ((AnnotatedMethod) this._member).getParameterCount() == 0) {
            return (AnnotatedMethod) this._member;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedMethod getSetter() {
        if ((this._member instanceof AnnotatedMethod) && ((AnnotatedMethod) this._member).getParameterCount() == 1) {
            return (AnnotatedMethod) this._member;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedField getField() {
        if (this._member instanceof AnnotatedField) {
            return (AnnotatedField) this._member;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedParameter getConstructorParameter() {
        if (this._member instanceof AnnotatedParameter) {
            return (AnnotatedParameter) this._member;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedMember getAccessor() {
        AnnotatedMember acc = getGetter();
        if (acc == null) {
            acc = getField();
        }
        return acc;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedMember getMutator() {
        AnnotatedMember acc = getConstructorParameter();
        if (acc == null) {
            acc = getSetter();
            if (acc == null) {
                acc = getField();
            }
        }
        return acc;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedMember getNonConstructorMutator() {
        AnnotatedMember acc = getSetter();
        if (acc == null) {
            acc = getField();
        }
        return acc;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedMember getPrimaryMember() {
        return this._member;
    }
}
