package com.fasterxml.jackson.databind.util;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.cfg.MapperConfig;
import com.fasterxml.jackson.databind.introspect.AnnotatedField;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.introspect.AnnotatedParameter;
import com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition;
import java.util.Collections;
import java.util.Iterator;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition.class */
public class SimpleBeanPropertyDefinition extends BeanPropertyDefinition {
    protected final AnnotationIntrospector _introspector;
    protected final AnnotatedMember _member;
    protected final PropertyMetadata _metadata;
    protected final PropertyName _fullName;
    protected final JsonInclude.Include _inclusion;

    @Deprecated
    protected final String _name;

    @Deprecated
    public SimpleBeanPropertyDefinition(AnnotatedMember member) {
        this(member, member.getName(), null);
    }

    @Deprecated
    public SimpleBeanPropertyDefinition(AnnotatedMember member, String name) {
        this(member, new PropertyName(name), null, null, null);
    }

    protected SimpleBeanPropertyDefinition(AnnotatedMember member, PropertyName fullName, AnnotationIntrospector intr, PropertyMetadata metadata, JsonInclude.Include inclusion) {
        this._introspector = intr;
        this._member = member;
        this._fullName = fullName;
        this._name = fullName.getSimpleName();
        this._metadata = metadata == null ? PropertyMetadata.STD_OPTIONAL : metadata;
        this._inclusion = inclusion;
    }

    @Deprecated
    protected SimpleBeanPropertyDefinition(AnnotatedMember member, String name, AnnotationIntrospector intr) {
        this(member, new PropertyName(name), intr, null, null);
    }

    public static SimpleBeanPropertyDefinition construct(MapperConfig<?> config, AnnotatedMember member) {
        return new SimpleBeanPropertyDefinition(member, PropertyName.construct(member.getName()), config == null ? null : config.getAnnotationIntrospector(), null, null);
    }

    @Deprecated
    public static SimpleBeanPropertyDefinition construct(MapperConfig<?> config, AnnotatedMember member, String name) {
        return new SimpleBeanPropertyDefinition(member, PropertyName.construct(name), config == null ? null : config.getAnnotationIntrospector(), null, null);
    }

    public static SimpleBeanPropertyDefinition construct(MapperConfig<?> config, AnnotatedMember member, PropertyName name) {
        return construct(config, member, name, null, null);
    }

    public static SimpleBeanPropertyDefinition construct(MapperConfig<?> config, AnnotatedMember member, PropertyName name, PropertyMetadata metadata, JsonInclude.Include inclusion) {
        return new SimpleBeanPropertyDefinition(member, name, config == null ? null : config.getAnnotationIntrospector(), metadata, inclusion);
    }

    @Deprecated
    public BeanPropertyDefinition withName(String newName) {
        return withSimpleName(newName);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public BeanPropertyDefinition withSimpleName(String newName) {
        if (this._fullName.hasSimpleName(newName) && !this._fullName.hasNamespace()) {
            return this;
        }
        return new SimpleBeanPropertyDefinition(this._member, new PropertyName(newName), this._introspector, this._metadata, this._inclusion);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public BeanPropertyDefinition withName(PropertyName newName) {
        if (this._fullName.equals(newName)) {
            return this;
        }
        return new SimpleBeanPropertyDefinition(this._member, newName, this._introspector, this._metadata, this._inclusion);
    }

    public BeanPropertyDefinition withMetadata(PropertyMetadata metadata) {
        if (metadata.equals(this._metadata)) {
            return this;
        }
        return new SimpleBeanPropertyDefinition(this._member, this._fullName, this._introspector, metadata, this._inclusion);
    }

    public BeanPropertyDefinition withInclusion(JsonInclude.Include inclusion) {
        if (this._inclusion == inclusion) {
            return this;
        }
        return new SimpleBeanPropertyDefinition(this._member, this._fullName, this._introspector, this._metadata, inclusion);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition, com.fasterxml.jackson.databind.util.Named
    public String getName() {
        return this._fullName.getSimpleName();
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public PropertyName getFullName() {
        return this._fullName;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean hasName(PropertyName name) {
        return this._fullName.equals(name);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public String getInternalName() {
        return getName();
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public PropertyName getWrapperName() {
        if (this._introspector != null || this._member == null) {
            return this._introspector.findWrapperName(this._member);
        }
        return null;
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
        return this._metadata;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public JsonInclude.Include findInclusion() {
        return this._inclusion;
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
    public Iterator<AnnotatedParameter> getConstructorParameters() {
        AnnotatedParameter param = getConstructorParameter();
        if (param == null) {
            return EmptyIterator.instance();
        }
        return Collections.singleton(param).iterator();
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
