package com.fasterxml.jackson.databind.ser;

import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.cfg.SerializerFactoryConfig;
import com.fasterxml.jackson.databind.introspect.AnnotatedClass;
import com.fasterxml.jackson.databind.introspect.AnnotatedField;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition;
import com.fasterxml.jackson.databind.introspect.ObjectIdInfo;
import com.fasterxml.jackson.databind.jsontype.NamedType;
import com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.impl.FilteredBeanPropertyWriter;
import com.fasterxml.jackson.databind.ser.impl.ObjectIdWriter;
import com.fasterxml.jackson.databind.ser.impl.PropertyBasedObjectIdGenerator;
import com.fasterxml.jackson.databind.ser.std.MapSerializer;
import com.fasterxml.jackson.databind.ser.std.StdDelegatingSerializer;
import com.fasterxml.jackson.databind.type.TypeBindings;
import com.fasterxml.jackson.databind.util.ArrayBuilders;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.Converter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/BeanSerializerFactory.class */
public class BeanSerializerFactory extends BasicSerializerFactory implements Serializable {
    private static final long serialVersionUID = 1;
    public static final BeanSerializerFactory instance = new BeanSerializerFactory(null);

    protected BeanSerializerFactory(SerializerFactoryConfig config) {
        super(config);
    }

    @Override // com.fasterxml.jackson.databind.ser.BasicSerializerFactory
    public SerializerFactory withConfig(SerializerFactoryConfig config) {
        if (this._factoryConfig == config) {
            return this;
        }
        if (getClass() != BeanSerializerFactory.class) {
            throw new IllegalStateException("Subtype of BeanSerializerFactory (" + getClass().getName() + ") has not properly overridden method 'withAdditionalSerializers': can not instantiate subtype with additional serializer definitions");
        }
        return new BeanSerializerFactory(config);
    }

    @Override // com.fasterxml.jackson.databind.ser.BasicSerializerFactory
    protected Iterable<Serializers> customSerializers() {
        return this._factoryConfig.serializers();
    }

    @Override // com.fasterxml.jackson.databind.ser.BasicSerializerFactory, com.fasterxml.jackson.databind.ser.SerializerFactory
    public JsonSerializer<Object> createSerializer(SerializerProvider prov, JavaType origType) throws JsonMappingException {
        boolean staticTyping;
        SerializationConfig config = prov.getConfig();
        BeanDescription beanDesc = config.introspect(origType);
        JsonSerializer<?> ser = findSerializerFromAnnotation(prov, beanDesc.getClassInfo());
        if (ser != null) {
            return ser;
        }
        JavaType type = modifyTypeByAnnotation(config, beanDesc.getClassInfo(), origType);
        if (type == origType) {
            staticTyping = false;
        } else {
            staticTyping = true;
            if (!type.hasRawClass(origType.getRawClass())) {
                beanDesc = config.introspect(type);
            }
        }
        Converter<Object, Object> conv = beanDesc.findSerializationConverter();
        if (conv == null) {
            return _createSerializer2(prov, type, beanDesc, staticTyping);
        }
        JavaType delegateType = conv.getOutputType(prov.getTypeFactory());
        if (!delegateType.hasRawClass(type.getRawClass())) {
            beanDesc = config.introspect(delegateType);
            ser = findSerializerFromAnnotation(prov, beanDesc.getClassInfo());
        }
        if (ser == null) {
            ser = _createSerializer2(prov, delegateType, beanDesc, true);
        }
        return new StdDelegatingSerializer(conv, delegateType, ser);
    }

    protected JsonSerializer<?> _createSerializer2(SerializerProvider prov, JavaType type, BeanDescription beanDesc, boolean staticTyping) throws JsonMappingException {
        JsonSerializer<?> ser = findSerializerByAnnotations(prov, type, beanDesc);
        if (ser != null) {
            return ser;
        }
        SerializationConfig config = prov.getConfig();
        if (type.isContainerType()) {
            if (!staticTyping) {
                staticTyping = usesStaticTyping(config, beanDesc, null);
            }
            ser = buildContainerSerializer(prov, type, beanDesc, staticTyping);
            if (ser != null) {
                return ser;
            }
        } else {
            for (Serializers serializers : customSerializers()) {
                ser = serializers.findSerializer(config, type, beanDesc);
                if (ser != null) {
                    break;
                }
            }
        }
        if (ser == null) {
            ser = findSerializerByLookup(type, config, beanDesc, staticTyping);
            if (ser == null) {
                ser = findSerializerByPrimaryType(prov, type, beanDesc, staticTyping);
                if (ser == null) {
                    ser = findBeanSerializer(prov, type, beanDesc);
                    if (ser == null) {
                        ser = findSerializerByAddonType(config, type, beanDesc, staticTyping);
                    }
                }
            }
        }
        if (ser != null && this._factoryConfig.hasSerializerModifiers()) {
            for (BeanSerializerModifier mod : this._factoryConfig.serializerModifiers()) {
                ser = mod.modifySerializer(config, beanDesc, ser);
            }
        }
        return ser;
    }

    public JsonSerializer<Object> findBeanSerializer(SerializerProvider prov, JavaType type, BeanDescription beanDesc) throws JsonMappingException {
        if (!isPotentialBeanType(type.getRawClass()) && !type.isEnumType()) {
            return null;
        }
        return constructBeanSerializer(prov, beanDesc);
    }

    public TypeSerializer findPropertyTypeSerializer(JavaType baseType, SerializationConfig config, AnnotatedMember accessor) throws JsonMappingException {
        AnnotationIntrospector ai = config.getAnnotationIntrospector();
        TypeResolverBuilder<?> b = ai.findPropertyTypeResolver(config, accessor, baseType);
        if (b == null) {
            return createTypeSerializer(config, baseType);
        }
        Collection<NamedType> subtypes = config.getSubtypeResolver().collectAndResolveSubtypes(accessor, config, ai, baseType);
        return b.buildTypeSerializer(config, baseType, subtypes);
    }

    public TypeSerializer findPropertyContentTypeSerializer(JavaType containerType, SerializationConfig config, AnnotatedMember accessor) throws JsonMappingException {
        JavaType contentType = containerType.mo3getContentType();
        AnnotationIntrospector ai = config.getAnnotationIntrospector();
        TypeResolverBuilder<?> b = ai.findPropertyContentTypeResolver(config, accessor, containerType);
        if (b == null) {
            return createTypeSerializer(config, contentType);
        }
        Collection<NamedType> subtypes = config.getSubtypeResolver().collectAndResolveSubtypes(accessor, config, ai, contentType);
        return b.buildTypeSerializer(config, contentType, subtypes);
    }

    protected JsonSerializer<Object> constructBeanSerializer(SerializerProvider prov, BeanDescription beanDesc) throws JsonMappingException {
        if (beanDesc.getBeanClass() == Object.class) {
            return prov.getUnknownTypeSerializer(Object.class);
        }
        SerializationConfig config = prov.getConfig();
        BeanSerializerBuilder builder = constructBeanSerializerBuilder(beanDesc);
        builder.setConfig(config);
        List<BeanPropertyWriter> props = findBeanProperties(prov, beanDesc, builder);
        if (props == null) {
            props = new ArrayList();
        }
        if (this._factoryConfig.hasSerializerModifiers()) {
            for (BeanSerializerModifier mod : this._factoryConfig.serializerModifiers()) {
                props = mod.changeProperties(config, beanDesc, props);
            }
        }
        List<BeanPropertyWriter> props2 = filterBeanProperties(config, beanDesc, props);
        if (this._factoryConfig.hasSerializerModifiers()) {
            for (BeanSerializerModifier mod2 : this._factoryConfig.serializerModifiers()) {
                props2 = mod2.orderProperties(config, beanDesc, props2);
            }
        }
        builder.setObjectIdWriter(constructObjectIdHandler(prov, beanDesc, props2));
        builder.setProperties(props2);
        builder.setFilterId(findFilterId(config, beanDesc));
        AnnotatedMember anyGetter = beanDesc.findAnyGetter();
        if (anyGetter != null) {
            if (config.canOverrideAccessModifiers()) {
                anyGetter.fixAccess();
            }
            JavaType type = anyGetter.getType(beanDesc.bindingsForBeanType());
            boolean staticTyping = config.isEnabled(MapperFeature.USE_STATIC_TYPING);
            JavaType valueType = type.mo3getContentType();
            TypeSerializer typeSer = createTypeSerializer(config, valueType);
            MapSerializer mapSer = MapSerializer.construct(null, type, staticTyping, typeSer, null, null, null);
            PropertyName name = new PropertyName(anyGetter.getName());
            BeanProperty.Std anyProp = new BeanProperty.Std(name, valueType, (PropertyName) null, beanDesc.getClassAnnotations(), anyGetter, PropertyMetadata.STD_OPTIONAL);
            builder.setAnyGetter(new AnyGetterWriter(anyProp, anyGetter, mapSer));
        }
        processViews(config, builder);
        if (this._factoryConfig.hasSerializerModifiers()) {
            for (BeanSerializerModifier mod3 : this._factoryConfig.serializerModifiers()) {
                builder = mod3.updateBuilder(config, beanDesc, builder);
            }
        }
        JsonSerializer<Object> ser = builder.build();
        if (ser == null && beanDesc.hasKnownClassAnnotations()) {
            return builder.createDummy();
        }
        return ser;
    }

    protected ObjectIdWriter constructObjectIdHandler(SerializerProvider prov, BeanDescription beanDesc, List<BeanPropertyWriter> props) throws JsonMappingException {
        ObjectIdInfo objectIdInfo = beanDesc.getObjectIdInfo();
        if (objectIdInfo == null) {
            return null;
        }
        Class<?> implClass = objectIdInfo.getGeneratorType();
        if (implClass == ObjectIdGenerators.PropertyGenerator.class) {
            String propName = objectIdInfo.getPropertyName().getSimpleName();
            int len = props.size();
            for (int i = 0; i != len; i++) {
                BeanPropertyWriter prop = props.get(i);
                if (propName.equals(prop.getName())) {
                    if (i > 0) {
                        props.remove(i);
                        props.add(0, prop);
                    }
                    JavaType idType = prop.getType();
                    return ObjectIdWriter.construct(idType, (PropertyName) null, (ObjectIdGenerator<?>) new PropertyBasedObjectIdGenerator(objectIdInfo, prop), objectIdInfo.getAlwaysAsId());
                }
            }
            throw new IllegalArgumentException("Invalid Object Id definition for " + beanDesc.getBeanClass().getName() + ": can not find property with name '" + propName + "'");
        }
        JavaType type = prov.constructType(implClass);
        JavaType idType2 = prov.getTypeFactory().findTypeParameters(type, ObjectIdGenerator.class)[0];
        ObjectIdGenerator<?> gen = prov.objectIdGeneratorInstance(beanDesc.getClassInfo(), objectIdInfo);
        return ObjectIdWriter.construct(idType2, objectIdInfo.getPropertyName(), gen, objectIdInfo.getAlwaysAsId());
    }

    protected BeanPropertyWriter constructFilteredBeanWriter(BeanPropertyWriter writer, Class<?>[] inViews) {
        return FilteredBeanPropertyWriter.constructViewBased(writer, inViews);
    }

    protected PropertyBuilder constructPropertyBuilder(SerializationConfig config, BeanDescription beanDesc) {
        return new PropertyBuilder(config, beanDesc);
    }

    protected BeanSerializerBuilder constructBeanSerializerBuilder(BeanDescription beanDesc) {
        return new BeanSerializerBuilder(beanDesc);
    }

    protected boolean isPotentialBeanType(Class<?> type) {
        return ClassUtil.canBeABeanType(type) == null && !ClassUtil.isProxyType(type);
    }

    protected List<BeanPropertyWriter> findBeanProperties(SerializerProvider prov, BeanDescription beanDesc, BeanSerializerBuilder builder) throws JsonMappingException {
        List<BeanPropertyDefinition> properties = beanDesc.findProperties();
        SerializationConfig config = prov.getConfig();
        removeIgnorableTypes(config, beanDesc, properties);
        if (config.isEnabled(MapperFeature.REQUIRE_SETTERS_FOR_GETTERS)) {
            removeSetterlessGetters(config, beanDesc, properties);
        }
        if (properties.isEmpty()) {
            return null;
        }
        boolean staticTyping = usesStaticTyping(config, beanDesc, null);
        PropertyBuilder pb = constructPropertyBuilder(config, beanDesc);
        ArrayList<BeanPropertyWriter> result = new ArrayList<>(properties.size());
        TypeBindings typeBind = beanDesc.bindingsForBeanType();
        for (BeanPropertyDefinition property : properties) {
            AnnotatedMember accessor = property.getAccessor();
            if (property.isTypeId()) {
                if (accessor != null) {
                    if (config.canOverrideAccessModifiers()) {
                        accessor.fixAccess();
                    }
                    builder.setTypeId(accessor);
                }
            } else {
                AnnotationIntrospector.ReferenceProperty refType = property.findReferenceType();
                if (refType == null || !refType.isBackReference()) {
                    if (accessor instanceof AnnotatedMethod) {
                        result.add(_constructWriter(prov, property, typeBind, pb, staticTyping, (AnnotatedMethod) accessor));
                    } else {
                        result.add(_constructWriter(prov, property, typeBind, pb, staticTyping, (AnnotatedField) accessor));
                    }
                }
            }
        }
        return result;
    }

    protected List<BeanPropertyWriter> filterBeanProperties(SerializationConfig config, BeanDescription beanDesc, List<BeanPropertyWriter> props) {
        AnnotationIntrospector intr = config.getAnnotationIntrospector();
        AnnotatedClass ac = beanDesc.getClassInfo();
        String[] ignored = intr.findPropertiesToIgnore(ac);
        if (ignored != null && ignored.length > 0) {
            HashSet<String> ignoredSet = ArrayBuilders.arrayToSet(ignored);
            Iterator<BeanPropertyWriter> it = props.iterator();
            while (it.hasNext()) {
                if (ignoredSet.contains(it.next().getName())) {
                    it.remove();
                }
            }
        }
        return props;
    }

    protected void processViews(SerializationConfig config, BeanSerializerBuilder builder) {
        List<BeanPropertyWriter> props = builder.getProperties();
        boolean includeByDefault = config.isEnabled(MapperFeature.DEFAULT_VIEW_INCLUSION);
        int propCount = props.size();
        int viewsFound = 0;
        BeanPropertyWriter[] filtered = new BeanPropertyWriter[propCount];
        for (int i = 0; i < propCount; i++) {
            BeanPropertyWriter bpw = props.get(i);
            Class<?>[] views = bpw.getViews();
            if (views == null) {
                if (includeByDefault) {
                    filtered[i] = bpw;
                }
            } else {
                viewsFound++;
                filtered[i] = constructFilteredBeanWriter(bpw, views);
            }
        }
        if (includeByDefault && viewsFound == 0) {
            return;
        }
        builder.setFilteredProperties(filtered);
    }

    protected void removeIgnorableTypes(SerializationConfig config, BeanDescription beanDesc, List<BeanPropertyDefinition> properties) {
        AnnotationIntrospector intr = config.getAnnotationIntrospector();
        HashMap<Class<?>, Boolean> ignores = new HashMap<>();
        Iterator<BeanPropertyDefinition> it = properties.iterator();
        while (it.hasNext()) {
            BeanPropertyDefinition property = it.next();
            AnnotatedMember accessor = property.getAccessor();
            if (accessor == null) {
                it.remove();
            } else {
                Class<?> type = accessor.getRawType();
                Boolean result = ignores.get(type);
                if (result == null) {
                    BeanDescription desc = config.introspectClassAnnotations(type);
                    AnnotatedClass ac = desc.getClassInfo();
                    result = intr.isIgnorableType(ac);
                    if (result == null) {
                        result = Boolean.FALSE;
                    }
                    ignores.put(type, result);
                }
                if (result.booleanValue()) {
                    it.remove();
                }
            }
        }
    }

    protected void removeSetterlessGetters(SerializationConfig config, BeanDescription beanDesc, List<BeanPropertyDefinition> properties) {
        Iterator<BeanPropertyDefinition> it = properties.iterator();
        while (it.hasNext()) {
            BeanPropertyDefinition property = it.next();
            if (!property.couldDeserialize() && !property.isExplicitlyIncluded()) {
                it.remove();
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected BeanPropertyWriter _constructWriter(SerializerProvider serializerProvider, BeanPropertyDefinition propDef, TypeBindings typeContext, PropertyBuilder pb, boolean staticTyping, AnnotatedMember accessor) throws JsonMappingException {
        PropertyName name = propDef.getFullName();
        if (serializerProvider.canOverrideAccessModifiers()) {
            accessor.fixAccess();
        }
        JavaType type = accessor.getType(typeContext);
        BeanProperty.Std property = new BeanProperty.Std(name, type, propDef.getWrapperName(), pb.getClassAnnotations(), accessor, propDef.getMetadata());
        JsonSerializer<Object> findSerializerFromAnnotation = findSerializerFromAnnotation(serializerProvider, accessor);
        if (findSerializerFromAnnotation instanceof ResolvableSerializer) {
            ((ResolvableSerializer) findSerializerFromAnnotation).resolve(serializerProvider);
        }
        JsonSerializer<?> annotatedSerializer = serializerProvider.handlePrimaryContextualization(findSerializerFromAnnotation, property);
        TypeSerializer contentTypeSer = null;
        if (ClassUtil.isCollectionMapOrArray(type.getRawClass()) || type.isCollectionLikeType() || type.isMapLikeType()) {
            contentTypeSer = findPropertyContentTypeSerializer(type, serializerProvider.getConfig(), accessor);
        }
        TypeSerializer typeSer = findPropertyTypeSerializer(type, serializerProvider.getConfig(), accessor);
        BeanPropertyWriter pbw = pb.buildWriter(serializerProvider, propDef, type, annotatedSerializer, typeSer, contentTypeSer, accessor, staticTyping);
        return pbw;
    }
}
