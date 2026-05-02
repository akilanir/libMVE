package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.annotation.ObjectIdResolver;
import com.fasterxml.jackson.databind.AbstractTypeResolver;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.annotation.JsonPOJOBuilder;
import com.fasterxml.jackson.databind.cfg.DeserializerFactoryConfig;
import com.fasterxml.jackson.databind.deser.impl.FieldProperty;
import com.fasterxml.jackson.databind.deser.impl.MethodProperty;
import com.fasterxml.jackson.databind.deser.impl.ObjectIdReader;
import com.fasterxml.jackson.databind.deser.impl.PropertyBasedObjectIdGenerator;
import com.fasterxml.jackson.databind.deser.impl.SetterlessProperty;
import com.fasterxml.jackson.databind.deser.std.ThrowableDeserializer;
import com.fasterxml.jackson.databind.introspect.AnnotatedField;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition;
import com.fasterxml.jackson.databind.introspect.ObjectIdInfo;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.util.ArrayBuilders;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.SimpleBeanPropertyDefinition;
import java.io.Serializable;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/BeanDeserializerFactory.class */
public class BeanDeserializerFactory extends BasicDeserializerFactory implements Serializable {
    private static final long serialVersionUID = 1;
    private static final Class<?>[] INIT_CAUSE_PARAMS = {Throwable.class};
    private static final Class<?>[] NO_VIEWS = new Class[0];
    public static final BeanDeserializerFactory instance = new BeanDeserializerFactory(new DeserializerFactoryConfig());

    public BeanDeserializerFactory(DeserializerFactoryConfig config) {
        super(config);
    }

    @Override // com.fasterxml.jackson.databind.deser.BasicDeserializerFactory
    public DeserializerFactory withConfig(DeserializerFactoryConfig config) {
        if (this._factoryConfig == config) {
            return this;
        }
        if (getClass() != BeanDeserializerFactory.class) {
            throw new IllegalStateException("Subtype of BeanDeserializerFactory (" + getClass().getName() + ") has not properly overridden method 'withAdditionalDeserializers': can not instantiate subtype with additional deserializer definitions");
        }
        return new BeanDeserializerFactory(config);
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public JsonDeserializer<Object> createBeanDeserializer(DeserializationContext ctxt, JavaType type, BeanDescription beanDesc) throws JsonMappingException {
        JavaType concreteType;
        DeserializationConfig config = ctxt.getConfig();
        JsonDeserializer<Object> custom = _findCustomBeanDeserializer(type, config, beanDesc);
        if (custom != null) {
            return custom;
        }
        if (type.isThrowable()) {
            return buildThrowableDeserializer(ctxt, type, beanDesc);
        }
        if (type.isAbstract() && (concreteType = materializeAbstractType(ctxt, type, beanDesc)) != null) {
            return buildBeanDeserializer(ctxt, concreteType, config.introspect(concreteType));
        }
        JsonDeserializer<Object> deser = findStdDeserializer(ctxt, type, beanDesc);
        if (deser != null) {
            return deser;
        }
        if (!isPotentialBeanType(type.getRawClass())) {
            return null;
        }
        return buildBeanDeserializer(ctxt, type, beanDesc);
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public JsonDeserializer<Object> createBuilderBasedDeserializer(DeserializationContext ctxt, JavaType valueType, BeanDescription beanDesc, Class<?> builderClass) throws JsonMappingException {
        JavaType builderType = ctxt.constructType(builderClass);
        BeanDescription builderDesc = ctxt.getConfig().introspectForBuilder(builderType);
        return buildBuilderBasedDeserializer(ctxt, valueType, builderDesc);
    }

    protected JsonDeserializer<?> findStdDeserializer(DeserializationContext ctxt, JavaType type, BeanDescription beanDesc) throws JsonMappingException {
        JsonDeserializer<?> deser = findDefaultDeserializer(ctxt, type, beanDesc);
        if (deser != null && this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                deser = mod.modifyDeserializer(ctxt.getConfig(), beanDesc, deser);
            }
        }
        return deser;
    }

    protected JavaType materializeAbstractType(DeserializationContext ctxt, JavaType type, BeanDescription beanDesc) throws JsonMappingException {
        JavaType abstractType = beanDesc.getType();
        for (AbstractTypeResolver r : this._factoryConfig.abstractTypeResolvers()) {
            JavaType concrete = r.resolveAbstractType(ctxt.getConfig(), abstractType);
            if (concrete != null) {
                return concrete;
            }
        }
        return null;
    }

    public JsonDeserializer<Object> buildBeanDeserializer(DeserializationContext ctxt, JavaType type, BeanDescription beanDesc) throws JsonMappingException {
        JsonDeserializer<?> deserializer;
        ValueInstantiator valueInstantiator = findValueInstantiator(ctxt, beanDesc);
        BeanDeserializerBuilder builder = constructBeanDeserializerBuilder(ctxt, beanDesc);
        builder.setValueInstantiator(valueInstantiator);
        addBeanProps(ctxt, beanDesc, builder);
        addObjectIdReader(ctxt, beanDesc, builder);
        addReferenceProperties(ctxt, beanDesc, builder);
        addInjectables(ctxt, beanDesc, builder);
        DeserializationConfig config = ctxt.getConfig();
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                builder = mod.updateBuilder(config, beanDesc, builder);
            }
        }
        if (type.isAbstract() && !valueInstantiator.canInstantiate()) {
            deserializer = builder.buildAbstract();
        } else {
            deserializer = builder.build();
        }
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod2 : this._factoryConfig.deserializerModifiers()) {
                deserializer = mod2.modifyDeserializer(config, beanDesc, deserializer);
            }
        }
        return deserializer;
    }

    protected JsonDeserializer<Object> buildBuilderBasedDeserializer(DeserializationContext ctxt, JavaType valueType, BeanDescription builderDesc) throws JsonMappingException {
        ValueInstantiator valueInstantiator = findValueInstantiator(ctxt, builderDesc);
        DeserializationConfig config = ctxt.getConfig();
        BeanDeserializerBuilder builder = constructBeanDeserializerBuilder(ctxt, builderDesc);
        builder.setValueInstantiator(valueInstantiator);
        addBeanProps(ctxt, builderDesc, builder);
        addObjectIdReader(ctxt, builderDesc, builder);
        addReferenceProperties(ctxt, builderDesc, builder);
        addInjectables(ctxt, builderDesc, builder);
        JsonPOJOBuilder.Value builderConfig = builderDesc.findPOJOBuilderConfig();
        String buildMethodName = builderConfig == null ? "build" : builderConfig.buildMethodName;
        AnnotatedMethod buildMethod = builderDesc.findMethod(buildMethodName, null);
        if (buildMethod != null && config.canOverrideAccessModifiers()) {
            ClassUtil.checkAndFixAccess(buildMethod.getMember());
        }
        builder.setPOJOBuilder(buildMethod, builderConfig);
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                builder = mod.updateBuilder(config, builderDesc, builder);
            }
        }
        JsonDeserializer<?> deserializer = builder.buildBuilderBased(valueType, buildMethodName);
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod2 : this._factoryConfig.deserializerModifiers()) {
                deserializer = mod2.modifyDeserializer(config, builderDesc, deserializer);
            }
        }
        return deserializer;
    }

    protected void addObjectIdReader(DeserializationContext ctxt, BeanDescription beanDesc, BeanDeserializerBuilder builder) throws JsonMappingException {
        JavaType idType;
        SettableBeanProperty idProp;
        PropertyBasedObjectIdGenerator objectIdGeneratorInstance;
        ObjectIdInfo objectIdInfo = beanDesc.getObjectIdInfo();
        if (objectIdInfo == null) {
            return;
        }
        Class<?> implClass = objectIdInfo.getGeneratorType();
        ObjectIdResolver resolver = ctxt.objectIdResolverInstance(beanDesc.getClassInfo(), objectIdInfo);
        if (implClass == ObjectIdGenerators.PropertyGenerator.class) {
            PropertyName propName = objectIdInfo.getPropertyName();
            idProp = builder.findProperty(propName);
            if (idProp == null) {
                throw new IllegalArgumentException("Invalid Object Id definition for " + beanDesc.getBeanClass().getName() + ": can not find property with name '" + propName + "'");
            }
            idType = idProp.getType();
            objectIdGeneratorInstance = new PropertyBasedObjectIdGenerator(objectIdInfo.getScope());
        } else {
            JavaType type = ctxt.constructType(implClass);
            idType = ctxt.getTypeFactory().findTypeParameters(type, ObjectIdGenerator.class)[0];
            idProp = null;
            objectIdGeneratorInstance = ctxt.objectIdGeneratorInstance(beanDesc.getClassInfo(), objectIdInfo);
        }
        JsonDeserializer<?> deser = ctxt.findRootValueDeserializer(idType);
        builder.setObjectIdReader(ObjectIdReader.construct(idType, objectIdInfo.getPropertyName(), objectIdGeneratorInstance, deser, idProp, resolver));
    }

    public JsonDeserializer<Object> buildThrowableDeserializer(DeserializationContext ctxt, JavaType type, BeanDescription beanDesc) throws JsonMappingException {
        DeserializationConfig config = ctxt.getConfig();
        BeanDeserializerBuilder builder = constructBeanDeserializerBuilder(ctxt, beanDesc);
        builder.setValueInstantiator(findValueInstantiator(ctxt, beanDesc));
        addBeanProps(ctxt, beanDesc, builder);
        AnnotatedMethod am = beanDesc.findMethod("initCause", INIT_CAUSE_PARAMS);
        if (am != null) {
            SimpleBeanPropertyDefinition propDef = SimpleBeanPropertyDefinition.construct(ctxt.getConfig(), am, new PropertyName("cause"));
            SettableBeanProperty prop = constructSettableProperty(ctxt, beanDesc, propDef, am.getGenericParameterType(0));
            if (prop != null) {
                builder.addOrReplaceProperty(prop, true);
            }
        }
        builder.addIgnorable("localizedMessage");
        builder.addIgnorable("suppressed");
        builder.addIgnorable("message");
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                builder = mod.updateBuilder(config, beanDesc, builder);
            }
        }
        JsonDeserializer<?> deserializer = builder.build();
        if (deserializer instanceof BeanDeserializer) {
            deserializer = new ThrowableDeserializer((BeanDeserializer) deserializer);
        }
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod2 : this._factoryConfig.deserializerModifiers()) {
                deserializer = mod2.modifyDeserializer(config, beanDesc, deserializer);
            }
        }
        return deserializer;
    }

    protected BeanDeserializerBuilder constructBeanDeserializerBuilder(DeserializationContext ctxt, BeanDescription beanDesc) {
        return new BeanDeserializerBuilder(beanDesc, ctxt.getConfig());
    }

    protected void addBeanProps(DeserializationContext ctxt, BeanDescription beanDesc, BeanDeserializerBuilder builder) throws JsonMappingException {
        Collection<String> ignored2;
        SettableBeanProperty[] creatorProps = builder.getValueInstantiator().getFromObjectArguments(ctxt.getConfig());
        boolean isConcrete = !beanDesc.getType().isAbstract();
        AnnotationIntrospector intr = ctxt.getAnnotationIntrospector();
        Boolean B = intr.findIgnoreUnknownProperties(beanDesc.getClassInfo());
        if (B != null) {
            boolean ignoreAny = B.booleanValue();
            builder.setIgnoreUnknownProperties(ignoreAny);
        }
        Set<String> ignored = ArrayBuilders.arrayToSet(intr.findPropertiesToIgnore(beanDesc.getClassInfo()));
        for (String propName : ignored) {
            builder.addIgnorable(propName);
        }
        AnnotatedMethod anySetter = beanDesc.findAnySetter();
        if (anySetter != null) {
            builder.setAnySetter(constructAnySetter(ctxt, beanDesc, anySetter));
        }
        if (anySetter == null && (ignored2 = beanDesc.getIgnoredPropertyNames()) != null) {
            for (String propName2 : ignored2) {
                builder.addIgnorable(propName2);
            }
        }
        boolean useGettersAsSetters = ctxt.isEnabled(MapperFeature.USE_GETTERS_AS_SETTERS) && ctxt.isEnabled(MapperFeature.AUTO_DETECT_GETTERS);
        List<BeanPropertyDefinition> propDefs = filterBeanProps(ctxt, beanDesc, builder, beanDesc.findProperties(), ignored);
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                propDefs = mod.updateProperties(ctxt.getConfig(), beanDesc, propDefs);
            }
        }
        for (BeanPropertyDefinition propDef : propDefs) {
            SettableBeanProperty prop = null;
            if (propDef.hasSetter()) {
                Type propertyType = propDef.getSetter().getGenericParameterType(0);
                prop = constructSettableProperty(ctxt, beanDesc, propDef, propertyType);
            } else if (propDef.hasField()) {
                Type propertyType2 = propDef.getField().getGenericType();
                prop = constructSettableProperty(ctxt, beanDesc, propDef, propertyType2);
            } else if (useGettersAsSetters && propDef.hasGetter()) {
                AnnotatedMethod getter = propDef.getGetter();
                Class<?> rawPropertyType = getter.getRawType();
                if (Collection.class.isAssignableFrom(rawPropertyType) || Map.class.isAssignableFrom(rawPropertyType)) {
                    prop = constructSetterlessProperty(ctxt, beanDesc, propDef);
                }
            }
            if (isConcrete && propDef.hasConstructorParameter()) {
                String name = propDef.getName();
                CreatorProperty cprop = null;
                if (creatorProps != null) {
                    int len$ = creatorProps.length;
                    int i$ = 0;
                    while (true) {
                        if (i$ >= len$) {
                            break;
                        }
                        SettableBeanProperty cp = creatorProps[i$];
                        if (!name.equals(cp.getName())) {
                            i$++;
                        } else {
                            cprop = (CreatorProperty) cp;
                            break;
                        }
                    }
                }
                if (cprop == null) {
                    throw ctxt.mappingException("Could not find creator property with name '" + name + "' (in class " + beanDesc.getBeanClass().getName() + ")");
                }
                if (prop != null) {
                    cprop = cprop.withFallbackSetter(prop);
                }
                builder.addCreatorProperty(cprop);
            } else if (prop != null) {
                Class<?>[] views = propDef.findViews();
                if (views == null && !ctxt.isEnabled(MapperFeature.DEFAULT_VIEW_INCLUSION)) {
                    views = NO_VIEWS;
                }
                prop.setViews(views);
                builder.addProperty(prop);
            }
        }
    }

    protected List<BeanPropertyDefinition> filterBeanProps(DeserializationContext ctxt, BeanDescription beanDesc, BeanDeserializerBuilder builder, List<BeanPropertyDefinition> propDefsIn, Set<String> ignored) throws JsonMappingException {
        ArrayList<BeanPropertyDefinition> result = new ArrayList<>(Math.max(4, propDefsIn.size()));
        HashMap<Class<?>, Boolean> ignoredTypes = new HashMap<>();
        for (BeanPropertyDefinition property : propDefsIn) {
            String name = property.getName();
            if (!ignored.contains(name)) {
                if (!property.hasConstructorParameter()) {
                    Class<?> rawPropertyType = null;
                    if (property.hasSetter()) {
                        rawPropertyType = property.getSetter().getRawParameterType(0);
                    } else if (property.hasField()) {
                        rawPropertyType = property.getField().getRawType();
                    }
                    if (rawPropertyType != null && isIgnorableType(ctxt.getConfig(), beanDesc, rawPropertyType, ignoredTypes)) {
                        builder.addIgnorable(name);
                    }
                }
                result.add(property);
            }
        }
        return result;
    }

    protected void addReferenceProperties(DeserializationContext ctxt, BeanDescription beanDesc, BeanDeserializerBuilder builder) throws JsonMappingException {
        Type rawType;
        Map<String, AnnotatedMember> refs = beanDesc.findBackReferenceProperties();
        if (refs != null) {
            for (Map.Entry<String, AnnotatedMember> en : refs.entrySet()) {
                String name = en.getKey();
                AnnotatedMember m = en.getValue();
                if (m instanceof AnnotatedMethod) {
                    rawType = ((AnnotatedMethod) m).getGenericParameterType(0);
                } else {
                    rawType = m.getRawType();
                }
                Type genericType = rawType;
                SimpleBeanPropertyDefinition propDef = SimpleBeanPropertyDefinition.construct(ctxt.getConfig(), m);
                builder.addBackReferenceProperty(name, constructSettableProperty(ctxt, beanDesc, propDef, genericType));
            }
        }
    }

    protected void addInjectables(DeserializationContext ctxt, BeanDescription beanDesc, BeanDeserializerBuilder builder) throws JsonMappingException {
        Map<Object, AnnotatedMember> raw = beanDesc.findInjectables();
        if (raw != null) {
            boolean fixAccess = ctxt.canOverrideAccessModifiers();
            for (Map.Entry<Object, AnnotatedMember> entry : raw.entrySet()) {
                AnnotatedMember m = entry.getValue();
                if (fixAccess) {
                    m.fixAccess();
                }
                builder.addInjectable(new PropertyName(m.getName()), beanDesc.resolveType(m.getGenericType()), beanDesc.getClassAnnotations(), m, entry.getKey());
            }
        }
    }

    protected SettableAnyProperty constructAnySetter(DeserializationContext ctxt, BeanDescription beanDesc, AnnotatedMethod setter) throws JsonMappingException {
        if (ctxt.canOverrideAccessModifiers()) {
            setter.fixAccess();
        }
        JavaType type = beanDesc.bindingsForBeanType().resolveType(setter.getGenericParameterType(1));
        BeanProperty.Std property = new BeanProperty.Std(new PropertyName(setter.getName()), type, (PropertyName) null, beanDesc.getClassAnnotations(), setter, PropertyMetadata.STD_OPTIONAL);
        JavaType type2 = resolveType(ctxt, beanDesc, type, setter);
        JsonDeserializer<Object> deser = findDeserializerFromAnnotation(ctxt, setter);
        JavaType type3 = modifyTypeByAnnotation(ctxt, setter, type2);
        if (deser == null) {
            deser = (JsonDeserializer) type3.getValueHandler();
        }
        TypeDeserializer typeDeser = (TypeDeserializer) type3.getTypeHandler();
        return new SettableAnyProperty(property, setter, type3, deser, typeDeser);
    }

    protected SettableBeanProperty constructSettableProperty(DeserializationContext ctxt, BeanDescription beanDesc, BeanPropertyDefinition propDef, Type jdkType) throws JsonMappingException {
        SettableBeanProperty prop;
        AnnotatedMember mutator = propDef.getNonConstructorMutator();
        if (ctxt.canOverrideAccessModifiers()) {
            mutator.fixAccess();
        }
        JavaType t0 = beanDesc.resolveType(jdkType);
        BeanProperty.Std property = new BeanProperty.Std(propDef.getFullName(), t0, propDef.getWrapperName(), beanDesc.getClassAnnotations(), mutator, propDef.getMetadata());
        JavaType type = resolveType(ctxt, beanDesc, t0, mutator);
        if (type != t0) {
            property.withType(type);
        }
        JsonDeserializer<?> propDeser = findDeserializerFromAnnotation(ctxt, mutator);
        JavaType type2 = modifyTypeByAnnotation(ctxt, mutator, type);
        TypeDeserializer typeDeser = (TypeDeserializer) type2.getTypeHandler();
        if (mutator instanceof AnnotatedMethod) {
            prop = new MethodProperty(propDef, type2, typeDeser, beanDesc.getClassAnnotations(), (AnnotatedMethod) mutator);
        } else {
            prop = new FieldProperty(propDef, type2, typeDeser, beanDesc.getClassAnnotations(), (AnnotatedField) mutator);
        }
        if (propDeser != null) {
            prop = prop.withValueDeserializer(propDeser);
        }
        AnnotationIntrospector.ReferenceProperty ref = propDef.findReferenceType();
        if (ref != null && ref.isManagedReference()) {
            prop.setManagedReferenceName(ref.getName());
        }
        ObjectIdInfo objectIdInfo = propDef.findObjectIdInfo();
        if (objectIdInfo != null) {
            prop.setObjectIdInfo(objectIdInfo);
        }
        return prop;
    }

    protected SettableBeanProperty constructSetterlessProperty(DeserializationContext ctxt, BeanDescription beanDesc, BeanPropertyDefinition propDef) throws JsonMappingException {
        AnnotatedMethod getter = propDef.getGetter();
        if (ctxt.canOverrideAccessModifiers()) {
            getter.fixAccess();
        }
        JavaType type = getter.getType(beanDesc.bindingsForBeanType());
        JsonDeserializer<?> propDeser = findDeserializerFromAnnotation(ctxt, getter);
        JavaType type2 = resolveType(ctxt, beanDesc, modifyTypeByAnnotation(ctxt, getter, type), getter);
        TypeDeserializer typeDeser = (TypeDeserializer) type2.getTypeHandler();
        SettableBeanProperty prop = new SetterlessProperty(propDef, type2, typeDeser, beanDesc.getClassAnnotations(), getter);
        if (propDeser != null) {
            prop = prop.withValueDeserializer(propDeser);
        }
        return prop;
    }

    protected boolean isPotentialBeanType(Class<?> type) {
        String typeStr = ClassUtil.canBeABeanType(type);
        if (typeStr != null) {
            throw new IllegalArgumentException("Can not deserialize Class " + type.getName() + " (of type " + typeStr + ") as a Bean");
        }
        if (ClassUtil.isProxyType(type)) {
            throw new IllegalArgumentException("Can not deserialize Proxy class " + type.getName() + " as a Bean");
        }
        String typeStr2 = ClassUtil.isLocalType(type, true);
        if (typeStr2 != null) {
            throw new IllegalArgumentException("Can not deserialize Class " + type.getName() + " (of type " + typeStr2 + ") as a Bean");
        }
        return true;
    }

    protected boolean isIgnorableType(DeserializationConfig config, BeanDescription beanDesc, Class<?> type, Map<Class<?>, Boolean> ignoredTypes) {
        Boolean status = ignoredTypes.get(type);
        if (status != null) {
            return status.booleanValue();
        }
        BeanDescription desc = config.introspectClassAnnotations(type);
        Boolean status2 = config.getAnnotationIntrospector().isIgnorableType(desc.getClassInfo());
        if (status2 == null) {
            return false;
        }
        return status2.booleanValue();
    }
}
