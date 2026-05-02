package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.util.EmptyIterator;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/introspect/POJOPropertyBuilder.class */
public class POJOPropertyBuilder extends BeanPropertyDefinition implements Comparable<POJOPropertyBuilder> {
    protected final boolean _forSerialization;
    protected final AnnotationIntrospector _annotationIntrospector;
    protected final PropertyName _name;
    protected final PropertyName _internalName;
    protected Linked<AnnotatedField> _fields;
    protected Linked<AnnotatedParameter> _ctorParameters;
    protected Linked<AnnotatedMethod> _getters;
    protected Linked<AnnotatedMethod> _setters;

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/introspect/POJOPropertyBuilder$WithMember.class */
    private interface WithMember<T> {
        T withMember(AnnotatedMember annotatedMember);
    }

    public POJOPropertyBuilder(PropertyName internalName, AnnotationIntrospector ai, boolean forSerialization) {
        this(internalName, internalName, ai, forSerialization);
    }

    protected POJOPropertyBuilder(PropertyName internalName, PropertyName name, AnnotationIntrospector annotationIntrospector, boolean forSerialization) {
        this._internalName = internalName;
        this._name = name;
        this._annotationIntrospector = annotationIntrospector;
        this._forSerialization = forSerialization;
    }

    public POJOPropertyBuilder(POJOPropertyBuilder src, PropertyName newName) {
        this._internalName = src._internalName;
        this._name = newName;
        this._annotationIntrospector = src._annotationIntrospector;
        this._fields = src._fields;
        this._ctorParameters = src._ctorParameters;
        this._getters = src._getters;
        this._setters = src._setters;
        this._forSerialization = src._forSerialization;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public POJOPropertyBuilder withName(PropertyName newName) {
        return new POJOPropertyBuilder(this, newName);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public POJOPropertyBuilder withSimpleName(String newSimpleName) {
        PropertyName newName = this._name.withSimpleName(newSimpleName);
        return newName == this._name ? this : new POJOPropertyBuilder(this, newName);
    }

    @Override // java.lang.Comparable
    public int compareTo(POJOPropertyBuilder other) {
        if (this._ctorParameters != null) {
            if (other._ctorParameters == null) {
                return -1;
            }
        } else if (other._ctorParameters != null) {
            return 1;
        }
        return getName().compareTo(other.getName());
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition, com.fasterxml.jackson.databind.util.Named
    public String getName() {
        if (this._name == null) {
            return null;
        }
        return this._name.getSimpleName();
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public PropertyName getFullName() {
        return this._name;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public String getInternalName() {
        return this._internalName.getSimpleName();
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public PropertyName getWrapperName() {
        AnnotatedMember member = getPrimaryMember();
        if (member == null || this._annotationIntrospector == null) {
            return null;
        }
        return this._annotationIntrospector.findWrapperName(member);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean isExplicitlyIncluded() {
        return _anyExplicits(this._fields) || _anyExplicits(this._getters) || _anyExplicits(this._setters) || _anyExplicits(this._ctorParameters);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean isExplicitlyNamed() {
        return _anyExplicitNames(this._fields) || _anyExplicitNames(this._getters) || _anyExplicitNames(this._setters) || _anyExplicitNames(this._ctorParameters);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean hasGetter() {
        return this._getters != null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean hasSetter() {
        return this._setters != null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean hasField() {
        return this._fields != null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean hasConstructorParameter() {
        return this._ctorParameters != null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean couldDeserialize() {
        return (this._ctorParameters == null && this._setters == null && this._fields == null) ? false : true;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean couldSerialize() {
        return (this._getters == null && this._fields == null) ? false : true;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0057  */
    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.fasterxml.jackson.databind.introspect.AnnotatedMethod getGetter() {
        /*
            Method dump skipped, instructions count: 222
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.getGetter():com.fasterxml.jackson.databind.introspect.AnnotatedMethod");
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0057  */
    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.fasterxml.jackson.databind.introspect.AnnotatedMethod getSetter() {
        /*
            Method dump skipped, instructions count: 222
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.getSetter():com.fasterxml.jackson.databind.introspect.AnnotatedMethod");
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedField getField() {
        AnnotatedField nextField;
        if (this._fields == null) {
            return null;
        }
        AnnotatedField field = this._fields.value;
        Linked linked = this._fields.next;
        while (true) {
            Linked linked2 = linked;
            if (linked2 != null) {
                nextField = (AnnotatedField) linked2.value;
                Class<?> fieldClass = field.getDeclaringClass();
                Class<?> nextClass = nextField.getDeclaringClass();
                if (fieldClass == nextClass) {
                    break;
                }
                if (fieldClass.isAssignableFrom(nextClass)) {
                    field = nextField;
                } else if (!nextClass.isAssignableFrom(fieldClass)) {
                    break;
                }
                linked = linked2.next;
            } else {
                return field;
            }
        }
        throw new IllegalArgumentException("Multiple fields representing property \"" + getName() + "\": " + field.getFullName() + " vs " + nextField.getFullName());
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedParameter getConstructorParameter() {
        if (this._ctorParameters == null) {
            return null;
        }
        Linked<AnnotatedParameter> curr = this._ctorParameters;
        while (!(curr.value.getOwner() instanceof AnnotatedConstructor)) {
            curr = curr.next;
            if (curr == null) {
                return this._ctorParameters.value;
            }
        }
        return curr.value;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public Iterator<AnnotatedParameter> getConstructorParameters() {
        if (this._ctorParameters == null) {
            return EmptyIterator.instance();
        }
        return new MemberIterator(this._ctorParameters);
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedMember getAccessor() {
        AnnotatedMember m = getGetter();
        if (m == null) {
            m = getField();
        }
        return m;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedMember getMutator() {
        AnnotatedMember m = getConstructorParameter();
        if (m == null) {
            m = getSetter();
            if (m == null) {
                m = getField();
            }
        }
        return m;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedMember getNonConstructorMutator() {
        AnnotatedMember m = getSetter();
        if (m == null) {
            m = getField();
        }
        return m;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotatedMember getPrimaryMember() {
        if (this._forSerialization) {
            return getAccessor();
        }
        return getMutator();
    }

    protected int _getterPriority(AnnotatedMethod m) {
        String name = m.getName();
        if (name.startsWith("get") && name.length() > 3) {
            return 1;
        }
        if (name.startsWith("is") && name.length() > 2) {
            return 2;
        }
        return 3;
    }

    protected int _setterPriority(AnnotatedMethod m) {
        String name = m.getName();
        if (name.startsWith("set") && name.length() > 3) {
            return 1;
        }
        return 2;
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public Class<?>[] findViews() {
        return (Class[]) fromMemberAnnotations(new WithMember<Class<?>[]>() { // from class: com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.WithMember
            public Class<?>[] withMember(AnnotatedMember member) {
                return POJOPropertyBuilder.this._annotationIntrospector.findViews(member);
            }
        });
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public AnnotationIntrospector.ReferenceProperty findReferenceType() {
        return (AnnotationIntrospector.ReferenceProperty) fromMemberAnnotations(new WithMember<AnnotationIntrospector.ReferenceProperty>() { // from class: com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.2
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.WithMember
            public AnnotationIntrospector.ReferenceProperty withMember(AnnotatedMember member) {
                return POJOPropertyBuilder.this._annotationIntrospector.findReferenceType(member);
            }
        });
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public boolean isTypeId() {
        Boolean b = (Boolean) fromMemberAnnotations(new WithMember<Boolean>() { // from class: com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.3
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.WithMember
            public Boolean withMember(AnnotatedMember member) {
                return POJOPropertyBuilder.this._annotationIntrospector.isTypeId(member);
            }
        });
        return b != null && b.booleanValue();
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public PropertyMetadata getMetadata() {
        Boolean b = _findRequired();
        String desc = _findDescription();
        Integer idx = _findIndex();
        String def = _findDefaultValue();
        if (b == null && idx == null && def == null) {
            return desc == null ? PropertyMetadata.STD_REQUIRED_OR_OPTIONAL : PropertyMetadata.STD_REQUIRED_OR_OPTIONAL.withDescription(desc);
        }
        return PropertyMetadata.construct(b.booleanValue(), desc, idx, def);
    }

    protected Boolean _findRequired() {
        Boolean b = (Boolean) fromMemberAnnotations(new WithMember<Boolean>() { // from class: com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.4
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.WithMember
            public Boolean withMember(AnnotatedMember member) {
                return POJOPropertyBuilder.this._annotationIntrospector.hasRequiredMarker(member);
            }
        });
        return b;
    }

    protected String _findDescription() {
        return (String) fromMemberAnnotations(new WithMember<String>() { // from class: com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.5
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.WithMember
            public String withMember(AnnotatedMember member) {
                return POJOPropertyBuilder.this._annotationIntrospector.findPropertyDescription(member);
            }
        });
    }

    protected Integer _findIndex() {
        return (Integer) fromMemberAnnotations(new WithMember<Integer>() { // from class: com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.6
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.WithMember
            public Integer withMember(AnnotatedMember member) {
                return POJOPropertyBuilder.this._annotationIntrospector.findPropertyIndex(member);
            }
        });
    }

    protected String _findDefaultValue() {
        return (String) fromMemberAnnotations(new WithMember<String>() { // from class: com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.7
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.WithMember
            public String withMember(AnnotatedMember member) {
                return POJOPropertyBuilder.this._annotationIntrospector.findPropertyDefaultValue(member);
            }
        });
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public ObjectIdInfo findObjectIdInfo() {
        return (ObjectIdInfo) fromMemberAnnotations(new WithMember<ObjectIdInfo>() { // from class: com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.8
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.fasterxml.jackson.databind.introspect.POJOPropertyBuilder.WithMember
            public ObjectIdInfo withMember(AnnotatedMember member) {
                ObjectIdInfo info = POJOPropertyBuilder.this._annotationIntrospector.findObjectIdInfo(member);
                if (info != null) {
                    info = POJOPropertyBuilder.this._annotationIntrospector.findObjectReferenceInfo(member, info);
                }
                return info;
            }
        });
    }

    @Override // com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition
    public JsonInclude.Include findInclusion() {
        if (this._annotationIntrospector == null) {
            return null;
        }
        AnnotatedMember am = getAccessor();
        return this._annotationIntrospector.findSerializationInclusion(am, null);
    }

    public void addField(AnnotatedField a, PropertyName name, boolean explName, boolean visible, boolean ignored) {
        this._fields = new Linked<>(a, this._fields, name, explName, visible, ignored);
    }

    public void addCtor(AnnotatedParameter a, PropertyName name, boolean explName, boolean visible, boolean ignored) {
        this._ctorParameters = new Linked<>(a, this._ctorParameters, name, explName, visible, ignored);
    }

    public void addGetter(AnnotatedMethod a, PropertyName name, boolean explName, boolean visible, boolean ignored) {
        this._getters = new Linked<>(a, this._getters, name, explName, visible, ignored);
    }

    public void addSetter(AnnotatedMethod a, PropertyName name, boolean explName, boolean visible, boolean ignored) {
        this._setters = new Linked<>(a, this._setters, name, explName, visible, ignored);
    }

    public void addAll(POJOPropertyBuilder src) {
        this._fields = merge(this._fields, src._fields);
        this._ctorParameters = merge(this._ctorParameters, src._ctorParameters);
        this._getters = merge(this._getters, src._getters);
        this._setters = merge(this._setters, src._setters);
    }

    private static <T> Linked<T> merge(Linked<T> chain1, Linked<T> chain2) {
        if (chain1 == null) {
            return chain2;
        }
        if (chain2 == null) {
            return chain1;
        }
        return chain1.append(chain2);
    }

    @Deprecated
    public void addField(AnnotatedField a, String name, boolean visible, boolean ignored) {
        addField(a, _propName(name), name != null, visible, ignored);
    }

    @Deprecated
    public void addField(AnnotatedField a, String name, boolean explName, boolean visible, boolean ignored) {
        addField(a, _propName(name), explName, visible, ignored);
    }

    @Deprecated
    public void addCtor(AnnotatedParameter a, String name, boolean visible, boolean ignored) {
        addCtor(a, _propName(name), name != null, visible, ignored);
    }

    @Deprecated
    public void addCtor(AnnotatedParameter a, String name, boolean explName, boolean visible, boolean ignored) {
        addCtor(a, _propName(name), explName, visible, ignored);
    }

    @Deprecated
    public void addGetter(AnnotatedMethod a, String name, boolean visible, boolean ignored) {
        addGetter(a, _propName(name), name != null, visible, ignored);
    }

    @Deprecated
    public void addGetter(AnnotatedMethod a, String name, boolean explName, boolean visible, boolean ignored) {
        addGetter(a, _propName(name), explName, visible, ignored);
    }

    @Deprecated
    public void addSetter(AnnotatedMethod a, String name, boolean visible, boolean ignored) {
        addSetter(a, _propName(name), name != null, visible, ignored);
    }

    @Deprecated
    public void addSetter(AnnotatedMethod a, String name, boolean explName, boolean visible, boolean ignored) {
        addSetter(a, _propName(name), explName, visible, ignored);
    }

    private PropertyName _propName(String simple) {
        return PropertyName.construct(simple, null);
    }

    public void removeIgnored() {
        this._fields = _removeIgnored(this._fields);
        this._getters = _removeIgnored(this._getters);
        this._setters = _removeIgnored(this._setters);
        this._ctorParameters = _removeIgnored(this._ctorParameters);
    }

    public void removeNonVisible(boolean force) {
        this._getters = _removeNonVisible(this._getters);
        this._ctorParameters = _removeNonVisible(this._ctorParameters);
        if (force || this._getters == null) {
            this._fields = _removeNonVisible(this._fields);
            this._setters = _removeNonVisible(this._setters);
        }
    }

    public void removeConstructors() {
        this._ctorParameters = null;
    }

    public void trimByVisibility() {
        this._fields = _trimByVisibility(this._fields);
        this._getters = _trimByVisibility(this._getters);
        this._setters = _trimByVisibility(this._setters);
        this._ctorParameters = _trimByVisibility(this._ctorParameters);
    }

    public void mergeAnnotations(boolean forSerialization) {
        if (forSerialization) {
            if (this._getters != null) {
                AnnotationMap ann = _mergeAnnotations(0, this._getters, this._fields, this._ctorParameters, this._setters);
                this._getters = this._getters.withValue(this._getters.value.withAnnotations(ann));
                return;
            } else {
                if (this._fields != null) {
                    AnnotationMap ann2 = _mergeAnnotations(0, this._fields, this._ctorParameters, this._setters);
                    this._fields = this._fields.withValue(this._fields.value.withAnnotations(ann2));
                    return;
                }
                return;
            }
        }
        if (this._ctorParameters != null) {
            AnnotationMap ann3 = _mergeAnnotations(0, this._ctorParameters, this._setters, this._fields, this._getters);
            this._ctorParameters = this._ctorParameters.withValue(this._ctorParameters.value.withAnnotations(ann3));
        } else if (this._setters != null) {
            AnnotationMap ann4 = _mergeAnnotations(0, this._setters, this._fields, this._getters);
            this._setters = this._setters.withValue(this._setters.value.withAnnotations(ann4));
        } else if (this._fields != null) {
            AnnotationMap ann5 = _mergeAnnotations(0, this._fields, this._getters);
            this._fields = this._fields.withValue(this._fields.value.withAnnotations(ann5));
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private AnnotationMap _mergeAnnotations(int index, Linked<? extends AnnotatedMember>... nodes) {
        AnnotationMap ann = ((AnnotatedMember) nodes[index].value).getAllAnnotations();
        do {
            index++;
            if (index >= nodes.length) {
                return ann;
            }
        } while (nodes[index] == null);
        return AnnotationMap.merge(ann, _mergeAnnotations(index, nodes));
    }

    private <T> Linked<T> _removeIgnored(Linked<T> node) {
        if (node == null) {
            return node;
        }
        return node.withoutIgnored();
    }

    private <T> Linked<T> _removeNonVisible(Linked<T> node) {
        if (node == null) {
            return node;
        }
        return node.withoutNonVisible();
    }

    private <T> Linked<T> _trimByVisibility(Linked<T> node) {
        if (node == null) {
            return node;
        }
        return node.trimByVisibility();
    }

    private <T> boolean _anyExplicits(Linked<T> n) {
        while (n != null) {
            if (n.name == null || !n.name.hasSimpleName()) {
                n = n.next;
            } else {
                return true;
            }
        }
        return false;
    }

    private <T> boolean _anyExplicitNames(Linked<T> n) {
        while (n != null) {
            if (n.name == null || !n.isNameExplicit) {
                n = n.next;
            } else {
                return true;
            }
        }
        return false;
    }

    public boolean anyVisible() {
        return _anyVisible(this._fields) || _anyVisible(this._getters) || _anyVisible(this._setters) || _anyVisible(this._ctorParameters);
    }

    private <T> boolean _anyVisible(Linked<T> n) {
        while (n != null) {
            if (!n.isVisible) {
                n = n.next;
            } else {
                return true;
            }
        }
        return false;
    }

    public boolean anyIgnorals() {
        return _anyIgnorals(this._fields) || _anyIgnorals(this._getters) || _anyIgnorals(this._setters) || _anyIgnorals(this._ctorParameters);
    }

    private <T> boolean _anyIgnorals(Linked<T> n) {
        while (n != null) {
            if (!n.isMarkedIgnored) {
                n = n.next;
            } else {
                return true;
            }
        }
        return false;
    }

    @Deprecated
    public String findNewName() {
        Collection<PropertyName> l = findExplicitNames();
        if (l == null) {
            return null;
        }
        if (l.size() > 1) {
            throw new IllegalStateException("Conflicting/ambiguous property name definitions (implicit name '" + this._name + "'): found more than one explicit name: " + l);
        }
        PropertyName first = l.iterator().next();
        if (first.equals(this._name)) {
            return null;
        }
        return first.getSimpleName();
    }

    public Set<PropertyName> findExplicitNames() {
        Set<PropertyName> renamed = _findExplicitNames(this._fields, null);
        Set<PropertyName> renamed2 = _findExplicitNames(this._ctorParameters, _findExplicitNames(this._setters, _findExplicitNames(this._getters, renamed)));
        if (renamed2 == null) {
            return Collections.emptySet();
        }
        return renamed2;
    }

    public Collection<POJOPropertyBuilder> explode(Collection<PropertyName> newNames) {
        HashMap<PropertyName, POJOPropertyBuilder> props = new HashMap<>();
        _explode(newNames, props, this._fields);
        _explode(newNames, props, this._getters);
        _explode(newNames, props, this._setters);
        _explode(newNames, props, this._ctorParameters);
        return props.values();
    }

    private void _explode(Collection<PropertyName> newNames, Map<PropertyName, POJOPropertyBuilder> props, Linked<?> accessors) {
        Linked linked = accessors;
        while (true) {
            Linked linked2 = linked;
            if (linked2 != null) {
                PropertyName name = linked2.name;
                if (!linked2.isNameExplicit || name == null) {
                    if (linked2.isVisible) {
                        throw new IllegalStateException("Conflicting/ambiguous property name definitions (implicit name '" + this._name + "'): found multiple explicit names: " + newNames + ", but also implicit accessor: " + linked2);
                    }
                } else {
                    POJOPropertyBuilder prop = props.get(name);
                    if (prop == null) {
                        prop = new POJOPropertyBuilder(this._internalName, name, this._annotationIntrospector, this._forSerialization);
                        props.put(name, prop);
                    }
                    if (accessors != this._fields) {
                        if (accessors != this._getters) {
                            if (accessors != this._setters) {
                                if (accessors == this._ctorParameters) {
                                    prop._ctorParameters = linked2.withNext(prop._ctorParameters);
                                } else {
                                    throw new IllegalStateException("Internal error: mismatched accessors, property: " + this);
                                }
                            } else {
                                prop._setters = linked2.withNext(prop._setters);
                            }
                        } else {
                            prop._getters = linked2.withNext(prop._getters);
                        }
                    } else {
                        prop._fields = linked2.withNext(prop._fields);
                    }
                }
                linked = linked2.next;
            } else {
                return;
            }
        }
    }

    private Set<PropertyName> _findExplicitNames(Linked<? extends AnnotatedMember> node, Set<PropertyName> renamed) {
        while (node != null) {
            if (node.isNameExplicit && node.name != null) {
                if (renamed == null) {
                    renamed = new HashSet();
                }
                renamed.add(node.name);
            }
            node = node.next;
        }
        return renamed;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[Property '").append(this._name).append("'; ctors: ").append(this._ctorParameters).append(", field(s): ").append(this._fields).append(", getter(s): ").append(this._getters).append(", setter(s): ").append(this._setters);
        sb.append("]");
        return sb.toString();
    }

    protected <T> T fromMemberAnnotations(WithMember<T> func) {
        T result = null;
        if (this._annotationIntrospector != null) {
            if (this._forSerialization) {
                if (this._getters != null) {
                    result = func.withMember(this._getters.value);
                }
            } else {
                if (this._ctorParameters != null) {
                    result = func.withMember(this._ctorParameters.value);
                }
                if (result == null && this._setters != null) {
                    result = func.withMember(this._setters.value);
                }
            }
            if (result == null && this._fields != null) {
                result = func.withMember(this._fields.value);
            }
        }
        return result;
    }

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/introspect/POJOPropertyBuilder$MemberIterator.class */
    protected static class MemberIterator<T extends AnnotatedMember> implements Iterator<T> {
        private Linked<T> next;

        public MemberIterator(Linked<T> first) {
            this.next = first;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.next != null;
        }

        @Override // java.util.Iterator
        public T next() {
            if (this.next == null) {
                throw new NoSuchElementException();
            }
            T result = this.next.value;
            this.next = this.next.next;
            return result;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/introspect/POJOPropertyBuilder$Linked.class */
    private static final class Linked<T> {
        public final T value;
        public final Linked<T> next;
        public final PropertyName name;
        public final boolean isNameExplicit;
        public final boolean isVisible;
        public final boolean isMarkedIgnored;

        public Linked(T v, Linked<T> n, PropertyName name, boolean explName, boolean visible, boolean ignored) {
            this.value = v;
            this.next = n;
            this.name = (name == null || name.isEmpty()) ? null : name;
            if (explName) {
                if (this.name == null) {
                    throw new IllegalArgumentException("Can not pass true for 'explName' if name is null/empty");
                }
                if (!name.hasSimpleName()) {
                    explName = false;
                }
            }
            this.isNameExplicit = explName;
            this.isVisible = visible;
            this.isMarkedIgnored = ignored;
        }

        public Linked<T> withoutNext() {
            if (this.next == null) {
                return this;
            }
            return new Linked<>(this.value, null, this.name, this.isNameExplicit, this.isVisible, this.isMarkedIgnored);
        }

        public Linked<T> withValue(T newValue) {
            if (newValue == this.value) {
                return this;
            }
            return new Linked<>(newValue, this.next, this.name, this.isNameExplicit, this.isVisible, this.isMarkedIgnored);
        }

        public Linked<T> withNext(Linked<T> newNext) {
            if (newNext == this.next) {
                return this;
            }
            return new Linked<>(this.value, newNext, this.name, this.isNameExplicit, this.isVisible, this.isMarkedIgnored);
        }

        public Linked<T> withoutIgnored() {
            Linked<T> newNext;
            if (this.isMarkedIgnored) {
                if (this.next == null) {
                    return null;
                }
                return this.next.withoutIgnored();
            }
            if (this.next != null && (newNext = this.next.withoutIgnored()) != this.next) {
                return withNext(newNext);
            }
            return this;
        }

        public Linked<T> withoutNonVisible() {
            Linked<T> newNext = this.next == null ? null : this.next.withoutNonVisible();
            return this.isVisible ? withNext(newNext) : newNext;
        }

        protected Linked<T> append(Linked<T> appendable) {
            if (this.next == null) {
                return withNext(appendable);
            }
            return withNext(this.next.append(appendable));
        }

        public Linked<T> trimByVisibility() {
            if (this.next == null) {
                return this;
            }
            Linked<T> newNext = this.next.trimByVisibility();
            if (this.name != null) {
                if (newNext.name == null) {
                    return withNext(null);
                }
                return withNext(newNext);
            }
            if (newNext.name != null) {
                return newNext;
            }
            if (this.isVisible == newNext.isVisible) {
                return withNext(newNext);
            }
            return this.isVisible ? withNext(null) : newNext;
        }

        public String toString() {
            String msg = this.value.toString() + "[visible=" + this.isVisible + ",ignore=" + this.isMarkedIgnored + ",explicitName=" + this.isNameExplicit + "]";
            if (this.next != null) {
                msg = msg + ", " + this.next.toString();
            }
            return msg;
        }
    }
}
