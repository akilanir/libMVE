package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.annotation.JacksonAnnotationsInside;
import com.fasterxml.jackson.annotation.JacksonInject;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonIgnoreType;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyDescription;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.fasterxml.jackson.annotation.JsonRawValue;
import com.fasterxml.jackson.annotation.JsonRootName;
import com.fasterxml.jackson.annotation.JsonSetter;
import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeId;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.annotation.JsonTypeName;
import com.fasterxml.jackson.annotation.JsonUnwrapped;
import com.fasterxml.jackson.annotation.JsonValue;
import com.fasterxml.jackson.annotation.JsonView;
import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.annotation.ObjectIdResolver;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.KeyDeserializer;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.fasterxml.jackson.databind.annotation.JsonPOJOBuilder;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.annotation.JsonTypeIdResolver;
import com.fasterxml.jackson.databind.annotation.JsonTypeResolver;
import com.fasterxml.jackson.databind.annotation.JsonValueInstantiator;
import com.fasterxml.jackson.databind.cfg.HandlerInstantiator;
import com.fasterxml.jackson.databind.cfg.MapperConfig;
import com.fasterxml.jackson.databind.cfg.PackageVersion;
import com.fasterxml.jackson.databind.jsontype.NamedType;
import com.fasterxml.jackson.databind.jsontype.TypeIdResolver;
import com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder;
import com.fasterxml.jackson.databind.jsontype.impl.StdTypeResolverBuilder;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.fasterxml.jackson.databind.ser.VirtualBeanPropertyWriter;
import com.fasterxml.jackson.databind.ser.impl.AttributePropertyWriter;
import com.fasterxml.jackson.databind.ser.std.RawSerializer;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.Converter;
import com.fasterxml.jackson.databind.util.NameTransformer;
import com.fasterxml.jackson.databind.util.SimpleBeanPropertyDefinition;
import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector.class */
public class JacksonAnnotationIntrospector extends AnnotationIntrospector implements Serializable {
    private static final long serialVersionUID = 1;

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Version version() {
        return PackageVersion.VERSION;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean isAnnotationBundle(Annotation ann) {
        return ann.annotationType().getAnnotation(JacksonAnnotationsInside.class) != null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String findEnumValue(Enum<?> value) {
        JsonProperty prop;
        String n;
        try {
            Field f = value.getClass().getField(value.name());
            if (f != null && (prop = f.getAnnotation(JsonProperty.class)) != null && (n = prop.value()) != null) {
                if (!n.isEmpty()) {
                    return n;
                }
            }
        } catch (NoSuchFieldException e) {
        } catch (SecurityException e2) {
        }
        return value.name();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public PropertyName findRootName(AnnotatedClass ac) {
        JsonRootName ann = _findAnnotation(ac, JsonRootName.class);
        if (ann == null) {
            return null;
        }
        String ns = ann.namespace();
        if (ns != null && ns.length() == 0) {
            ns = null;
        }
        return PropertyName.construct(ann.value(), ns);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    @Deprecated
    public String[] findPropertiesToIgnore(Annotated ac) {
        JsonIgnoreProperties ignore = _findAnnotation(ac, JsonIgnoreProperties.class);
        if (ignore == null) {
            return null;
        }
        return ignore.value();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String[] findPropertiesToIgnore(Annotated ac, boolean forSerialization) {
        JsonIgnoreProperties ignore = _findAnnotation(ac, JsonIgnoreProperties.class);
        if (ignore == null) {
            return null;
        }
        if (forSerialization) {
            if (ignore.allowGetters()) {
                return null;
            }
        } else if (ignore.allowSetters()) {
            return null;
        }
        return ignore.value();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Boolean findIgnoreUnknownProperties(AnnotatedClass ac) {
        JsonIgnoreProperties ignore = _findAnnotation(ac, JsonIgnoreProperties.class);
        if (ignore == null) {
            return null;
        }
        return Boolean.valueOf(ignore.ignoreUnknown());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Boolean isIgnorableType(AnnotatedClass ac) {
        JsonIgnoreType ignore = _findAnnotation(ac, JsonIgnoreType.class);
        if (ignore == null) {
            return null;
        }
        return Boolean.valueOf(ignore.value());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    @Deprecated
    public Object findFilterId(AnnotatedClass ac) {
        return _findFilterId(ac);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findFilterId(Annotated a) {
        return _findFilterId(a);
    }

    protected final Object _findFilterId(Annotated a) {
        JsonFilter ann = _findAnnotation(a, JsonFilter.class);
        if (ann != null) {
            String id = ann.value();
            if (id.length() > 0) {
                return id;
            }
            return null;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findNamingStrategy(AnnotatedClass ac) {
        JsonNaming ann = (JsonNaming) _findAnnotation(ac, JsonNaming.class);
        if (ann == null) {
            return null;
        }
        return ann.value();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public VisibilityChecker<?> findAutoDetectVisibility(AnnotatedClass ac, VisibilityChecker<?> checker) {
        JsonAutoDetect ann = _findAnnotation(ac, JsonAutoDetect.class);
        return ann == null ? checker : checker.with(ann);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String findImplicitPropertyName(AnnotatedMember param) {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean hasIgnoreMarker(AnnotatedMember m) {
        return _isIgnorable(m);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Boolean hasRequiredMarker(AnnotatedMember m) {
        JsonProperty ann = _findAnnotation(m, JsonProperty.class);
        if (ann != null) {
            return Boolean.valueOf(ann.required());
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonProperty.Access findPropertyAccess(Annotated m) {
        JsonProperty ann = _findAnnotation(m, JsonProperty.class);
        if (ann != null) {
            return ann.access();
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String findPropertyDescription(Annotated ann) {
        JsonPropertyDescription desc = _findAnnotation(ann, JsonPropertyDescription.class);
        if (desc == null) {
            return null;
        }
        return desc.value();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Integer findPropertyIndex(Annotated ann) {
        int ix;
        JsonProperty prop = _findAnnotation(ann, JsonProperty.class);
        if (prop != null && (ix = prop.index()) != -1) {
            return Integer.valueOf(ix);
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String findPropertyDefaultValue(Annotated ann) {
        JsonProperty prop = _findAnnotation(ann, JsonProperty.class);
        if (prop == null) {
            return null;
        }
        String str = prop.defaultValue();
        if (str.isEmpty()) {
            return null;
        }
        return str;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonFormat.Value findFormat(Annotated ann) {
        JsonFormat f = _findAnnotation(ann, JsonFormat.class);
        if (f == null) {
            return null;
        }
        return new JsonFormat.Value(f);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public AnnotationIntrospector.ReferenceProperty findReferenceType(AnnotatedMember member) {
        JsonManagedReference ref1 = _findAnnotation(member, JsonManagedReference.class);
        if (ref1 != null) {
            return AnnotationIntrospector.ReferenceProperty.managed(ref1.value());
        }
        JsonBackReference ref2 = _findAnnotation(member, JsonBackReference.class);
        if (ref2 != null) {
            return AnnotationIntrospector.ReferenceProperty.back(ref2.value());
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public NameTransformer findUnwrappingNameTransformer(AnnotatedMember member) {
        JsonUnwrapped ann = _findAnnotation(member, JsonUnwrapped.class);
        if (ann == null || !ann.enabled()) {
            return null;
        }
        String prefix = ann.prefix();
        String suffix = ann.suffix();
        return NameTransformer.simpleTransformer(prefix, suffix);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findInjectableValueId(AnnotatedMember m) {
        JacksonInject ann = _findAnnotation(m, JacksonInject.class);
        if (ann == null) {
            return null;
        }
        String id = ann.value();
        if (id.length() == 0) {
            if (!(m instanceof AnnotatedMethod)) {
                return m.getRawType().getName();
            }
            AnnotatedMethod am = (AnnotatedMethod) m;
            if (am.getParameterCount() == 0) {
                return m.getRawType().getName();
            }
            return am.getRawParameterType(0).getName();
        }
        return id;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?>[] findViews(Annotated a) {
        JsonView ann = _findAnnotation(a, JsonView.class);
        if (ann == null) {
            return null;
        }
        return ann.value();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public TypeResolverBuilder<?> findTypeResolver(MapperConfig<?> config, AnnotatedClass ac, JavaType baseType) {
        return _findTypeResolver(config, ac, baseType);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public TypeResolverBuilder<?> findPropertyTypeResolver(MapperConfig<?> config, AnnotatedMember am, JavaType baseType) {
        if (baseType.isContainerType()) {
            return null;
        }
        return _findTypeResolver(config, am, baseType);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public TypeResolverBuilder<?> findPropertyContentTypeResolver(MapperConfig<?> config, AnnotatedMember am, JavaType containerType) {
        if (!containerType.isContainerType()) {
            throw new IllegalArgumentException("Must call method with a container type (got " + containerType + ")");
        }
        return _findTypeResolver(config, am, containerType);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public List<NamedType> findSubtypes(Annotated a) {
        JsonSubTypes t = _findAnnotation(a, JsonSubTypes.class);
        if (t == null) {
            return null;
        }
        JsonSubTypes.Type[] types = t.value();
        ArrayList<NamedType> result = new ArrayList<>(types.length);
        for (JsonSubTypes.Type type : types) {
            result.add(new NamedType(type.value(), type.name()));
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String findTypeName(AnnotatedClass ac) {
        JsonTypeName tn = _findAnnotation(ac, JsonTypeName.class);
        if (tn == null) {
            return null;
        }
        return tn.value();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Boolean isTypeId(AnnotatedMember member) {
        return Boolean.valueOf(_hasAnnotation(member, JsonTypeId.class));
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public ObjectIdInfo findObjectIdInfo(Annotated ann) {
        JsonIdentityInfo info = _findAnnotation(ann, JsonIdentityInfo.class);
        if (info == null || info.generator() == ObjectIdGenerators.None.class) {
            return null;
        }
        PropertyName name = PropertyName.construct(info.property());
        return new ObjectIdInfo(name, (Class<?>) info.scope(), (Class<? extends ObjectIdGenerator<?>>) info.generator(), (Class<? extends ObjectIdResolver>) info.resolver());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public ObjectIdInfo findObjectReferenceInfo(Annotated ann, ObjectIdInfo objectIdInfo) {
        JsonIdentityReference ref = _findAnnotation(ann, JsonIdentityReference.class);
        if (ref != null) {
            objectIdInfo = objectIdInfo.withAlwaysAsId(ref.alwaysAsId());
        }
        return objectIdInfo;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findSerializer(Annotated a) {
        Class<? extends JsonSerializer> serClass;
        JsonSerialize ann = (JsonSerialize) _findAnnotation(a, JsonSerialize.class);
        if (ann != null && (serClass = ann.using()) != JsonSerializer.None.class) {
            return serClass;
        }
        JsonRawValue annRaw = _findAnnotation(a, JsonRawValue.class);
        if (annRaw != null && annRaw.value()) {
            Class<?> cls = a.getRawType();
            return new RawSerializer(cls);
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findKeySerializer(Annotated a) {
        Class<? extends JsonSerializer> serClass;
        JsonSerialize ann = (JsonSerialize) _findAnnotation(a, JsonSerialize.class);
        if (ann != null && (serClass = ann.keyUsing()) != JsonSerializer.None.class) {
            return serClass;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findContentSerializer(Annotated a) {
        Class<? extends JsonSerializer> serClass;
        JsonSerialize ann = (JsonSerialize) _findAnnotation(a, JsonSerialize.class);
        if (ann != null && (serClass = ann.contentUsing()) != JsonSerializer.None.class) {
            return serClass;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findNullSerializer(Annotated a) {
        Class<? extends JsonSerializer> serClass;
        JsonSerialize ann = (JsonSerialize) _findAnnotation(a, JsonSerialize.class);
        if (ann != null && (serClass = ann.nullsUsing()) != JsonSerializer.None.class) {
            return serClass;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonInclude.Include findSerializationInclusion(Annotated a, JsonInclude.Include defValue) {
        JsonInclude.Include v;
        JsonInclude inc = _findAnnotation(a, JsonInclude.class);
        if (inc != null && (v = inc.value()) != JsonInclude.Include.USE_DEFAULTS) {
            return v;
        }
        JsonSerialize ann = (JsonSerialize) _findAnnotation(a, JsonSerialize.class);
        if (ann != null) {
            JsonSerialize.Inclusion i2 = ann.include();
            switch (i2) {
                case ALWAYS:
                    return JsonInclude.Include.ALWAYS;
                case NON_NULL:
                    return JsonInclude.Include.NON_NULL;
                case NON_DEFAULT:
                    return JsonInclude.Include.NON_DEFAULT;
                case NON_EMPTY:
                    return JsonInclude.Include.NON_EMPTY;
            }
        }
        return defValue;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonInclude.Include findSerializationInclusionForContent(Annotated a, JsonInclude.Include defValue) {
        JsonInclude.Include incl;
        JsonInclude inc = _findAnnotation(a, JsonInclude.class);
        if (inc != null && (incl = inc.content()) != JsonInclude.Include.USE_DEFAULTS) {
            return incl;
        }
        return defValue;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonInclude.Value findPropertyInclusion(Annotated a) {
        JsonSerialize ann;
        JsonInclude inc = _findAnnotation(a, JsonInclude.class);
        JsonInclude.Include valueIncl = inc == null ? JsonInclude.Include.USE_DEFAULTS : inc.value();
        if (valueIncl == JsonInclude.Include.USE_DEFAULTS && (ann = (JsonSerialize) _findAnnotation(a, JsonSerialize.class)) != null) {
            JsonSerialize.Inclusion i2 = ann.include();
            switch (i2) {
                case ALWAYS:
                    valueIncl = JsonInclude.Include.ALWAYS;
                    break;
                case NON_NULL:
                    valueIncl = JsonInclude.Include.NON_NULL;
                    break;
                case NON_DEFAULT:
                    valueIncl = JsonInclude.Include.NON_DEFAULT;
                    break;
                case NON_EMPTY:
                    valueIncl = JsonInclude.Include.NON_EMPTY;
                    break;
            }
        }
        JsonInclude.Include contentIncl = inc == null ? JsonInclude.Include.USE_DEFAULTS : inc.content();
        return JsonInclude.Value.construct(valueIncl, contentIncl);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findSerializationType(Annotated am) {
        JsonSerialize ann = (JsonSerialize) _findAnnotation(am, JsonSerialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.as());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findSerializationKeyType(Annotated am, JavaType baseType) {
        JsonSerialize ann = (JsonSerialize) _findAnnotation(am, JsonSerialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.keyAs());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findSerializationContentType(Annotated am, JavaType baseType) {
        JsonSerialize ann = (JsonSerialize) _findAnnotation(am, JsonSerialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.contentAs());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonSerialize.Typing findSerializationTyping(Annotated a) {
        JsonSerialize ann = (JsonSerialize) _findAnnotation(a, JsonSerialize.class);
        if (ann == null) {
            return null;
        }
        return ann.typing();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findSerializationConverter(Annotated a) {
        JsonSerialize ann = (JsonSerialize) _findAnnotation(a, JsonSerialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.converter(), Converter.None.class);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findSerializationContentConverter(AnnotatedMember a) {
        JsonSerialize ann = (JsonSerialize) _findAnnotation(a, JsonSerialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.contentConverter(), Converter.None.class);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public String[] findSerializationPropertyOrder(AnnotatedClass ac) {
        JsonPropertyOrder order = _findAnnotation(ac, JsonPropertyOrder.class);
        if (order == null) {
            return null;
        }
        return order.value();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Boolean findSerializationSortAlphabetically(Annotated ann) {
        return _findSortAlpha(ann);
    }

    private final Boolean _findSortAlpha(Annotated ann) {
        JsonPropertyOrder order = _findAnnotation(ann, JsonPropertyOrder.class);
        if (order != null && order.alphabetic()) {
            return Boolean.TRUE;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public void findAndAddVirtualProperties(MapperConfig<?> config, AnnotatedClass ac, List<BeanPropertyWriter> properties) {
        JsonAppend ann = (JsonAppend) _findAnnotation(ac, JsonAppend.class);
        if (ann == null) {
            return;
        }
        boolean prepend = ann.prepend();
        JavaType propType = null;
        JsonAppend.Attr[] attrs = ann.attrs();
        int len = attrs.length;
        for (int i = 0; i < len; i++) {
            if (propType == null) {
                propType = config.constructType(Object.class);
            }
            BeanPropertyWriter bpw = _constructVirtualProperty(attrs[i], config, ac, propType);
            if (prepend) {
                properties.add(i, bpw);
            } else {
                properties.add(bpw);
            }
        }
        JsonAppend.Prop[] props = ann.props();
        int len2 = props.length;
        for (int i2 = 0; i2 < len2; i2++) {
            BeanPropertyWriter bpw2 = _constructVirtualProperty(props[i2], config, ac);
            if (prepend) {
                properties.add(i2, bpw2);
            } else {
                properties.add(bpw2);
            }
        }
    }

    protected BeanPropertyWriter _constructVirtualProperty(JsonAppend.Attr attr, MapperConfig<?> config, AnnotatedClass ac, JavaType type) {
        PropertyMetadata metadata = attr.required() ? PropertyMetadata.STD_REQUIRED : PropertyMetadata.STD_OPTIONAL;
        String attrName = attr.value();
        PropertyName propName = _propertyName(attr.propName(), attr.propNamespace());
        if (!propName.hasSimpleName()) {
            propName = PropertyName.construct(attrName);
        }
        AnnotatedMember member = new VirtualAnnotatedMember(ac, ac.getRawType(), attrName, type.getRawClass());
        SimpleBeanPropertyDefinition propDef = SimpleBeanPropertyDefinition.construct(config, member, propName, metadata, attr.include());
        return AttributePropertyWriter.construct(attrName, propDef, ac.getAnnotations(), type);
    }

    protected BeanPropertyWriter _constructVirtualProperty(JsonAppend.Prop prop, MapperConfig<?> config, AnnotatedClass ac) {
        PropertyMetadata metadata = prop.required() ? PropertyMetadata.STD_REQUIRED : PropertyMetadata.STD_OPTIONAL;
        PropertyName propName = _propertyName(prop.name(), prop.namespace());
        JavaType type = config.constructType(prop.type());
        AnnotatedMember member = new VirtualAnnotatedMember(ac, ac.getRawType(), propName.getSimpleName(), type.getRawClass());
        SimpleBeanPropertyDefinition propDef = SimpleBeanPropertyDefinition.construct(config, member, propName, metadata, prop.include());
        Class<?> implClass = prop.value();
        HandlerInstantiator hi = config.getHandlerInstantiator();
        VirtualBeanPropertyWriter bpw = hi == null ? null : hi.virtualPropertyWriterInstance(config, implClass);
        if (bpw == null) {
            bpw = (VirtualBeanPropertyWriter) ClassUtil.createInstance(implClass, config.canOverrideAccessModifiers());
        }
        return bpw.withConfig(config, ac, propDef, type);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public PropertyName findNameForSerialization(Annotated a) {
        String name;
        JsonGetter jg = _findAnnotation(a, JsonGetter.class);
        if (jg != null) {
            name = jg.value();
        } else {
            JsonProperty pann = _findAnnotation(a, JsonProperty.class);
            if (pann != null) {
                name = pann.value();
            } else if (_hasAnnotation(a, JsonSerialize.class) || _hasAnnotation(a, JsonView.class) || _hasAnnotation(a, JsonRawValue.class)) {
                name = "";
            } else {
                return null;
            }
        }
        return PropertyName.construct(name);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean hasAsValueAnnotation(AnnotatedMethod am) {
        JsonValue ann = _findAnnotation(am, JsonValue.class);
        return ann != null && ann.value();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findDeserializer(Annotated a) {
        Class<? extends JsonDeserializer> deserClass;
        JsonDeserialize ann = (JsonDeserialize) _findAnnotation(a, JsonDeserialize.class);
        if (ann != null && (deserClass = ann.using()) != JsonDeserializer.None.class) {
            return deserClass;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findKeyDeserializer(Annotated a) {
        Class<? extends KeyDeserializer> deserClass;
        JsonDeserialize ann = (JsonDeserialize) _findAnnotation(a, JsonDeserialize.class);
        if (ann != null && (deserClass = ann.keyUsing()) != KeyDeserializer.None.class) {
            return deserClass;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findContentDeserializer(Annotated a) {
        Class<? extends JsonDeserializer> deserClass;
        JsonDeserialize ann = (JsonDeserialize) _findAnnotation(a, JsonDeserialize.class);
        if (ann != null && (deserClass = ann.contentUsing()) != JsonDeserializer.None.class) {
            return deserClass;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findDeserializationType(Annotated am, JavaType baseType) {
        JsonDeserialize ann = (JsonDeserialize) _findAnnotation(am, JsonDeserialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.as());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findDeserializationKeyType(Annotated am, JavaType baseKeyType) {
        JsonDeserialize ann = (JsonDeserialize) _findAnnotation(am, JsonDeserialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.keyAs());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findDeserializationContentType(Annotated am, JavaType baseContentType) {
        JsonDeserialize ann = (JsonDeserialize) _findAnnotation(am, JsonDeserialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.contentAs());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findDeserializationConverter(Annotated a) {
        JsonDeserialize ann = (JsonDeserialize) _findAnnotation(a, JsonDeserialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.converter(), Converter.None.class);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findDeserializationContentConverter(AnnotatedMember a) {
        JsonDeserialize ann = (JsonDeserialize) _findAnnotation(a, JsonDeserialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.contentConverter(), Converter.None.class);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Object findValueInstantiator(AnnotatedClass ac) {
        JsonValueInstantiator ann = (JsonValueInstantiator) _findAnnotation(ac, JsonValueInstantiator.class);
        if (ann == null) {
            return null;
        }
        return ann.value();
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public Class<?> findPOJOBuilder(AnnotatedClass ac) {
        JsonDeserialize ann = (JsonDeserialize) _findAnnotation(ac, JsonDeserialize.class);
        if (ann == null) {
            return null;
        }
        return _classIfExplicit(ann.builder());
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonPOJOBuilder.Value findPOJOBuilderConfig(AnnotatedClass ac) {
        JsonPOJOBuilder ann = (JsonPOJOBuilder) _findAnnotation(ac, JsonPOJOBuilder.class);
        if (ann == null) {
            return null;
        }
        return new JsonPOJOBuilder.Value(ann);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public PropertyName findNameForDeserialization(Annotated a) {
        String name;
        JsonSetter js = _findAnnotation(a, JsonSetter.class);
        if (js != null) {
            name = js.value();
        } else {
            JsonProperty pann = _findAnnotation(a, JsonProperty.class);
            if (pann != null) {
                name = pann.value();
            } else if (_hasAnnotation(a, JsonDeserialize.class) || _hasAnnotation(a, JsonView.class) || _hasAnnotation(a, JsonUnwrapped.class) || _hasAnnotation(a, JsonBackReference.class) || _hasAnnotation(a, JsonManagedReference.class)) {
                name = "";
            } else {
                return null;
            }
        }
        return PropertyName.construct(name);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean hasAnySetterAnnotation(AnnotatedMethod am) {
        return _hasAnnotation(am, JsonAnySetter.class);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean hasAnyGetterAnnotation(AnnotatedMethod am) {
        return _hasAnnotation(am, JsonAnyGetter.class);
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public boolean hasCreatorAnnotation(Annotated a) {
        JsonCreator ann = _findAnnotation(a, JsonCreator.class);
        return (ann == null || ann.mode() == JsonCreator.Mode.DISABLED) ? false : true;
    }

    @Override // com.fasterxml.jackson.databind.AnnotationIntrospector
    public JsonCreator.Mode findCreatorBinding(Annotated a) {
        JsonCreator ann = _findAnnotation(a, JsonCreator.class);
        if (ann == null) {
            return null;
        }
        return ann.mode();
    }

    protected boolean _isIgnorable(Annotated a) {
        JsonIgnore ann = _findAnnotation(a, JsonIgnore.class);
        return ann != null && ann.value();
    }

    protected Class<?> _classIfExplicit(Class<?> cls) {
        if (cls == null || ClassUtil.isBogusClass(cls)) {
            return null;
        }
        return cls;
    }

    protected Class<?> _classIfExplicit(Class<?> cls, Class<?> implicit) {
        Class<?> cls2 = _classIfExplicit(cls);
        if (cls2 == null || cls2 == implicit) {
            return null;
        }
        return cls2;
    }

    protected PropertyName _propertyName(String localName, String namespace) {
        if (localName.isEmpty()) {
            return PropertyName.USE_DEFAULT;
        }
        if (namespace == null || namespace.isEmpty()) {
            return PropertyName.construct(localName);
        }
        return PropertyName.construct(localName, namespace);
    }

    protected TypeResolverBuilder<?> _findTypeResolver(MapperConfig<?> config, Annotated ann, JavaType baseType) {
        TypeResolverBuilder<?> b;
        JsonTypeInfo info = _findAnnotation(ann, JsonTypeInfo.class);
        JsonTypeResolver resAnn = (JsonTypeResolver) _findAnnotation(ann, JsonTypeResolver.class);
        if (resAnn != null) {
            if (info == null) {
                return null;
            }
            b = config.typeResolverBuilderInstance(ann, resAnn.value());
        } else {
            if (info == null) {
                return null;
            }
            if (info.use() == JsonTypeInfo.Id.NONE) {
                return _constructNoTypeResolverBuilder();
            }
            b = _constructStdTypeResolverBuilder();
        }
        JsonTypeIdResolver idResInfo = (JsonTypeIdResolver) _findAnnotation(ann, JsonTypeIdResolver.class);
        TypeIdResolver idRes = idResInfo == null ? null : config.typeIdResolverInstance(ann, idResInfo.value());
        if (idRes != null) {
            idRes.init(baseType);
        }
        TypeResolverBuilder<?> b2 = b.init(info.use(), idRes);
        JsonTypeInfo.As inclusion = info.include();
        if (inclusion == JsonTypeInfo.As.EXTERNAL_PROPERTY && (ann instanceof AnnotatedClass)) {
            inclusion = JsonTypeInfo.As.PROPERTY;
        }
        TypeResolverBuilder<?> b3 = b2.inclusion(inclusion).typeProperty(info.property());
        Class<?> defaultImpl = info.defaultImpl();
        if (defaultImpl != JsonTypeInfo.None.class && !defaultImpl.isAnnotation()) {
            b3 = b3.defaultImpl(defaultImpl);
        }
        return b3.typeIdVisibility(info.visible());
    }

    protected StdTypeResolverBuilder _constructStdTypeResolverBuilder() {
        return new StdTypeResolverBuilder();
    }

    protected StdTypeResolverBuilder _constructNoTypeResolverBuilder() {
        return StdTypeResolverBuilder.noTypeInfoBuilder();
    }
}
