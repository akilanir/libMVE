package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.KeyDeserializer;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.annotation.JsonPOJOBuilder;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.cfg.MapperConfig;
import com.fasterxml.jackson.databind.jsontype.NamedType;
import com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/introspect/AnnotationIntrospectorPair.class */
public class AnnotationIntrospectorPair extends AnnotationIntrospector implements Serializable {
    private static final long serialVersionUID = 1;
    protected final AnnotationIntrospector _primary;
    protected final AnnotationIntrospector _secondary;

    public AnnotationIntrospectorPair(AnnotationIntrospector p, AnnotationIntrospector s) {
        this._primary = p;
        this._secondary = s;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Version version() {
        return this._primary.version();
    }

    public static AnnotationIntrospector create(AnnotationIntrospector primary, AnnotationIntrospector secondary) {
        if (primary == null) {
            return secondary;
        }
        if (secondary == null) {
            return primary;
        }
        return new AnnotationIntrospectorPair(primary, secondary);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Collection<AnnotationIntrospector> allIntrospectors() {
        return allIntrospectors(new ArrayList());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Collection<AnnotationIntrospector> allIntrospectors(Collection<AnnotationIntrospector> result) {
        this._primary.allIntrospectors(result);
        this._secondary.allIntrospectors(result);
        return result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean isAnnotationBundle(Annotation ann) {
        return this._primary.isAnnotationBundle(ann) || this._secondary.isAnnotationBundle(ann);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public PropertyName findRootName(AnnotatedClass ac) {
        PropertyName name1 = this._primary.findRootName(ac);
        if (name1 == null) {
            return this._secondary.findRootName(ac);
        }
        if (name1.hasSimpleName()) {
            return name1;
        }
        PropertyName name2 = this._secondary.findRootName(ac);
        return name2 == null ? name1 : name2;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    @Deprecated
    public String[] findPropertiesToIgnore(Annotated ac) {
        String[] result = this._primary.findPropertiesToIgnore(ac);
        if (result == null) {
            result = this._secondary.findPropertiesToIgnore(ac);
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String[] findPropertiesToIgnore(Annotated ac, boolean forSerialization) {
        String[] result = this._primary.findPropertiesToIgnore(ac, forSerialization);
        if (result == null) {
            result = this._secondary.findPropertiesToIgnore(ac, forSerialization);
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Boolean findIgnoreUnknownProperties(AnnotatedClass ac) {
        Boolean result = this._primary.findIgnoreUnknownProperties(ac);
        if (result == null) {
            result = this._secondary.findIgnoreUnknownProperties(ac);
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Boolean isIgnorableType(AnnotatedClass ac) {
        Boolean result = this._primary.isIgnorableType(ac);
        if (result == null) {
            result = this._secondary.isIgnorableType(ac);
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    @Deprecated
    public Object findFilterId(AnnotatedClass ac) {
        Object id = this._primary.findFilterId(ac);
        if (id == null) {
            id = this._secondary.findFilterId(ac);
        }
        return id;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findFilterId(Annotated ann) {
        Object id = this._primary.findFilterId(ann);
        if (id == null) {
            id = this._secondary.findFilterId(ann);
        }
        return id;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findNamingStrategy(AnnotatedClass ac) {
        Object str = this._primary.findNamingStrategy(ac);
        if (str == null) {
            str = this._secondary.findNamingStrategy(ac);
        }
        return str;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public VisibilityChecker<?> findAutoDetectVisibility(AnnotatedClass ac, VisibilityChecker<?> checker) {
        return this._primary.findAutoDetectVisibility(ac, this._secondary.findAutoDetectVisibility(ac, checker));
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public TypeResolverBuilder<?> findTypeResolver(MapperConfig<?> config, AnnotatedClass ac, JavaType baseType) {
        TypeResolverBuilder<?> b = this._primary.findTypeResolver(config, ac, baseType);
        if (b == null) {
            b = this._secondary.findTypeResolver(config, ac, baseType);
        }
        return b;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public TypeResolverBuilder<?> findPropertyTypeResolver(MapperConfig<?> config, AnnotatedMember am, JavaType baseType) {
        TypeResolverBuilder<?> b = this._primary.findPropertyTypeResolver(config, am, baseType);
        if (b == null) {
            b = this._secondary.findPropertyTypeResolver(config, am, baseType);
        }
        return b;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public TypeResolverBuilder<?> findPropertyContentTypeResolver(MapperConfig<?> config, AnnotatedMember am, JavaType baseType) {
        TypeResolverBuilder<?> b = this._primary.findPropertyContentTypeResolver(config, am, baseType);
        if (b == null) {
            b = this._secondary.findPropertyContentTypeResolver(config, am, baseType);
        }
        return b;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public List<NamedType> findSubtypes(Annotated a) {
        List<NamedType> types1 = this._primary.findSubtypes(a);
        List<NamedType> types2 = this._secondary.findSubtypes(a);
        if (types1 == null || types1.isEmpty()) {
            return types2;
        }
        if (types2 == null || types2.isEmpty()) {
            return types1;
        }
        ArrayList<NamedType> result = new ArrayList<>(types1.size() + types2.size());
        result.addAll(types1);
        result.addAll(types2);
        return result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String findTypeName(AnnotatedClass ac) {
        String name = this._primary.findTypeName(ac);
        if (name == null || name.length() == 0) {
            name = this._secondary.findTypeName(ac);
        }
        return name;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public AnnotationIntrospector.ReferenceProperty findReferenceType(AnnotatedMember member) {
        AnnotationIntrospector.ReferenceProperty r = this._primary.findReferenceType(member);
        return r == null ? this._secondary.findReferenceType(member) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public NameTransformer findUnwrappingNameTransformer(AnnotatedMember member) {
        NameTransformer r = this._primary.findUnwrappingNameTransformer(member);
        return r == null ? this._secondary.findUnwrappingNameTransformer(member) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findInjectableValueId(AnnotatedMember m) {
        Object r = this._primary.findInjectableValueId(m);
        return r == null ? this._secondary.findInjectableValueId(m) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean hasIgnoreMarker(AnnotatedMember m) {
        return this._primary.hasIgnoreMarker(m) || this._secondary.hasIgnoreMarker(m);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Boolean hasRequiredMarker(AnnotatedMember m) {
        Boolean r = this._primary.hasRequiredMarker(m);
        return r == null ? this._secondary.hasRequiredMarker(m) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findSerializer(Annotated am) {
        Object r = this._primary.findSerializer(am);
        return _isExplicitClassOrOb(r, JsonSerializer.None.class) ? r : this._secondary.findSerializer(am);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findKeySerializer(Annotated a) {
        Object r = this._primary.findKeySerializer(a);
        return _isExplicitClassOrOb(r, JsonSerializer.None.class) ? r : this._secondary.findKeySerializer(a);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findContentSerializer(Annotated a) {
        Object r = this._primary.findContentSerializer(a);
        return _isExplicitClassOrOb(r, JsonSerializer.None.class) ? r : this._secondary.findContentSerializer(a);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findNullSerializer(Annotated a) {
        Object r = this._primary.findNullSerializer(a);
        return _isExplicitClassOrOb(r, JsonSerializer.None.class) ? r : this._secondary.findNullSerializer(a);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonInclude.Include findSerializationInclusion(Annotated a, JsonInclude.Include defValue) {
        return this._primary.findSerializationInclusion(a, this._secondary.findSerializationInclusion(a, defValue));
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonInclude.Include findSerializationInclusionForContent(Annotated a, JsonInclude.Include defValue) {
        return this._primary.findSerializationInclusion(a, this._secondary.findSerializationInclusion(a, defValue));
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonInclude.Value findPropertyInclusion(Annotated a) {
        JsonInclude.Value v2 = this._secondary.findPropertyInclusion(a);
        JsonInclude.Value v1 = this._secondary.findPropertyInclusion(a);
        if (v2 == null) {
            return v1;
        }
        return v2.withOverrides(v1);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findSerializationType(Annotated a) {
        Class<?> r = this._primary.findSerializationType(a);
        return r == null ? this._secondary.findSerializationType(a) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findSerializationKeyType(Annotated am, JavaType baseType) {
        Class<?> r = this._primary.findSerializationKeyType(am, baseType);
        return r == null ? this._secondary.findSerializationKeyType(am, baseType) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findSerializationContentType(Annotated am, JavaType baseType) {
        Class<?> r = this._primary.findSerializationContentType(am, baseType);
        return r == null ? this._secondary.findSerializationContentType(am, baseType) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonSerialize.Typing findSerializationTyping(Annotated a) {
        JsonSerialize.Typing r = this._primary.findSerializationTyping(a);
        return r == null ? this._secondary.findSerializationTyping(a) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findSerializationConverter(Annotated a) {
        Object r = this._primary.findSerializationConverter(a);
        return r == null ? this._secondary.findSerializationConverter(a) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findSerializationContentConverter(AnnotatedMember a) {
        Object r = this._primary.findSerializationContentConverter(a);
        return r == null ? this._secondary.findSerializationContentConverter(a) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?>[] findViews(Annotated a) {
        Class<?>[] result = this._primary.findViews(a);
        if (result == null) {
            result = this._secondary.findViews(a);
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Boolean isTypeId(AnnotatedMember member) {
        Boolean b = this._primary.isTypeId(member);
        return b == null ? this._secondary.isTypeId(member) : b;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public ObjectIdInfo findObjectIdInfo(Annotated ann) {
        ObjectIdInfo r = this._primary.findObjectIdInfo(ann);
        return r == null ? this._secondary.findObjectIdInfo(ann) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public ObjectIdInfo findObjectReferenceInfo(Annotated ann, ObjectIdInfo objectIdInfo) {
        return this._primary.findObjectReferenceInfo(ann, this._secondary.findObjectReferenceInfo(ann, objectIdInfo));
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonFormat.Value findFormat(Annotated ann) {
        JsonFormat.Value r = this._primary.findFormat(ann);
        return r == null ? this._secondary.findFormat(ann) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public PropertyName findWrapperName(Annotated ann) {
        PropertyName name2;
        PropertyName name = this._primary.findWrapperName(ann);
        if (name == null) {
            name = this._secondary.findWrapperName(ann);
        } else if (name == PropertyName.USE_DEFAULT && (name2 = this._secondary.findWrapperName(ann)) != null) {
            name = name2;
        }
        return name;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String findPropertyDefaultValue(Annotated ann) {
        String str = this._primary.findPropertyDefaultValue(ann);
        return (str == null || str.isEmpty()) ? this._secondary.findPropertyDefaultValue(ann) : str;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String findPropertyDescription(Annotated ann) {
        String r = this._primary.findPropertyDescription(ann);
        return r == null ? this._secondary.findPropertyDescription(ann) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Integer findPropertyIndex(Annotated ann) {
        Integer r = this._primary.findPropertyIndex(ann);
        return r == null ? this._secondary.findPropertyIndex(ann) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String findImplicitPropertyName(AnnotatedMember param) {
        String r = this._primary.findImplicitPropertyName(param);
        return r == null ? this._secondary.findImplicitPropertyName(param) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonProperty.Access findPropertyAccess(Annotated ann) {
        JsonProperty.Access acc = this._primary.findPropertyAccess(ann);
        if (acc != null && acc != JsonProperty.Access.AUTO) {
            return acc;
        }
        JsonProperty.Access acc2 = this._secondary.findPropertyAccess(ann);
        if (acc2 != null) {
            return acc2;
        }
        return JsonProperty.Access.AUTO;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String[] findSerializationPropertyOrder(AnnotatedClass ac) {
        String[] r = this._primary.findSerializationPropertyOrder(ac);
        return r == null ? this._secondary.findSerializationPropertyOrder(ac) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Boolean findSerializationSortAlphabetically(Annotated ann) {
        Boolean r = this._primary.findSerializationSortAlphabetically(ann);
        return r == null ? this._secondary.findSerializationSortAlphabetically(ann) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public void findAndAddVirtualProperties(MapperConfig<?> config, AnnotatedClass ac, List<BeanPropertyWriter> properties) {
        this._primary.findAndAddVirtualProperties(config, ac, properties);
        this._secondary.findAndAddVirtualProperties(config, ac, properties);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public PropertyName findNameForSerialization(Annotated a) {
        PropertyName n2;
        PropertyName n = this._primary.findNameForSerialization(a);
        if (n == null) {
            n = this._secondary.findNameForSerialization(a);
        } else if (n == PropertyName.USE_DEFAULT && (n2 = this._secondary.findNameForSerialization(a)) != null) {
            n = n2;
        }
        return n;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean hasAsValueAnnotation(AnnotatedMethod am) {
        return this._primary.hasAsValueAnnotation(am) || this._secondary.hasAsValueAnnotation(am);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String findEnumValue(Enum<?> value) {
        String r = this._primary.findEnumValue(value);
        return r == null ? this._secondary.findEnumValue(value) : r;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findDeserializer(Annotated am) {
        Object r = this._primary.findDeserializer(am);
        return _isExplicitClassOrOb(r, JsonDeserializer.None.class) ? r : this._secondary.findDeserializer(am);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findKeyDeserializer(Annotated am) {
        Object r = this._primary.findKeyDeserializer(am);
        return _isExplicitClassOrOb(r, KeyDeserializer.None.class) ? r : this._secondary.findKeyDeserializer(am);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findContentDeserializer(Annotated am) {
        Object r = this._primary.findContentDeserializer(am);
        return _isExplicitClassOrOb(r, JsonDeserializer.None.class) ? r : this._secondary.findContentDeserializer(am);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findDeserializationType(Annotated am, JavaType baseType) {
        Class<?> r = this._primary.findDeserializationType(am, baseType);
        return r != null ? r : this._secondary.findDeserializationType(am, baseType);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findDeserializationKeyType(Annotated am, JavaType baseKeyType) {
        Class<?> result = this._primary.findDeserializationKeyType(am, baseKeyType);
        return result == null ? this._secondary.findDeserializationKeyType(am, baseKeyType) : result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findDeserializationContentType(Annotated am, JavaType baseContentType) {
        Class<?> result = this._primary.findDeserializationContentType(am, baseContentType);
        return result == null ? this._secondary.findDeserializationContentType(am, baseContentType) : result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findDeserializationConverter(Annotated a) {
        Object ob = this._primary.findDeserializationConverter(a);
        return ob == null ? this._secondary.findDeserializationConverter(a) : ob;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findDeserializationContentConverter(AnnotatedMember a) {
        Object ob = this._primary.findDeserializationContentConverter(a);
        return ob == null ? this._secondary.findDeserializationContentConverter(a) : ob;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findValueInstantiator(AnnotatedClass ac) {
        Object result = this._primary.findValueInstantiator(ac);
        return result == null ? this._secondary.findValueInstantiator(ac) : result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findPOJOBuilder(AnnotatedClass ac) {
        Class<?> result = this._primary.findPOJOBuilder(ac);
        return result == null ? this._secondary.findPOJOBuilder(ac) : result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonPOJOBuilder.Value findPOJOBuilderConfig(AnnotatedClass ac) {
        JsonPOJOBuilder.Value result = this._primary.findPOJOBuilderConfig(ac);
        return result == null ? this._secondary.findPOJOBuilderConfig(ac) : result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public PropertyName findNameForDeserialization(Annotated a) {
        PropertyName n2;
        PropertyName n = this._primary.findNameForDeserialization(a);
        if (n == null) {
            n = this._secondary.findNameForDeserialization(a);
        } else if (n == PropertyName.USE_DEFAULT && (n2 = this._secondary.findNameForDeserialization(a)) != null) {
            n = n2;
        }
        return n;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean hasAnySetterAnnotation(AnnotatedMethod am) {
        return this._primary.hasAnySetterAnnotation(am) || this._secondary.hasAnySetterAnnotation(am);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean hasAnyGetterAnnotation(AnnotatedMethod am) {
        return this._primary.hasAnyGetterAnnotation(am) || this._secondary.hasAnyGetterAnnotation(am);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean hasCreatorAnnotation(Annotated a) {
        return this._primary.hasCreatorAnnotation(a) || this._secondary.hasCreatorAnnotation(a);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonCreator.Mode findCreatorBinding(Annotated a) {
        JsonCreator.Mode mode = this._primary.findCreatorBinding(a);
        if (mode != null) {
            return mode;
        }
        return this._secondary.findCreatorBinding(a);
    }

    protected boolean _isExplicitClassOrOb(Object maybeCls, Class<?> implicit) {
        if (maybeCls == null) {
            return false;
        }
        if (!(maybeCls instanceof Class)) {
            return true;
        }
        Class<?> cls = (Class) maybeCls;
        return (cls == implicit || ClassUtil.isBogusClass(cls)) ? false : true;
    }
}
