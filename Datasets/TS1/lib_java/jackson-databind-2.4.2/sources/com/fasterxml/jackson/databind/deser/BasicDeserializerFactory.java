package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.databind.AbstractTypeResolver;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.KeyDeserializer;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.cfg.DeserializerFactoryConfig;
import com.fasterxml.jackson.databind.cfg.HandlerInstantiator;
import com.fasterxml.jackson.databind.deser.impl.CreatorCollector;
import com.fasterxml.jackson.databind.deser.std.ArrayBlockingQueueDeserializer;
import com.fasterxml.jackson.databind.deser.std.CollectionDeserializer;
import com.fasterxml.jackson.databind.deser.std.DateDeserializers;
import com.fasterxml.jackson.databind.deser.std.EnumMapDeserializer;
import com.fasterxml.jackson.databind.deser.std.EnumSetDeserializer;
import com.fasterxml.jackson.databind.deser.std.JdkDeserializers;
import com.fasterxml.jackson.databind.deser.std.JsonLocationInstantiator;
import com.fasterxml.jackson.databind.deser.std.JsonNodeDeserializer;
import com.fasterxml.jackson.databind.deser.std.MapDeserializer;
import com.fasterxml.jackson.databind.deser.std.NumberDeserializers;
import com.fasterxml.jackson.databind.deser.std.ObjectArrayDeserializer;
import com.fasterxml.jackson.databind.deser.std.PrimitiveArrayDeserializers;
import com.fasterxml.jackson.databind.deser.std.StdKeyDeserializers;
import com.fasterxml.jackson.databind.deser.std.StringArrayDeserializer;
import com.fasterxml.jackson.databind.deser.std.StringCollectionDeserializer;
import com.fasterxml.jackson.databind.deser.std.StringDeserializer;
import com.fasterxml.jackson.databind.deser.std.TokenBufferDeserializer;
import com.fasterxml.jackson.databind.deser.std.UntypedObjectDeserializer;
import com.fasterxml.jackson.databind.introspect.Annotated;
import com.fasterxml.jackson.databind.introspect.AnnotatedClass;
import com.fasterxml.jackson.databind.introspect.AnnotatedConstructor;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.introspect.AnnotatedParameter;
import com.fasterxml.jackson.databind.introspect.AnnotatedWithParams;
import com.fasterxml.jackson.databind.introspect.BeanPropertyDefinition;
import com.fasterxml.jackson.databind.introspect.VisibilityChecker;
import com.fasterxml.jackson.databind.jsontype.NamedType;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder;
import com.fasterxml.jackson.databind.type.ArrayType;
import com.fasterxml.jackson.databind.type.CollectionLikeType;
import com.fasterxml.jackson.databind.type.CollectionType;
import com.fasterxml.jackson.databind.type.MapLikeType;
import com.fasterxml.jackson.databind.type.MapType;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.EnumResolver;
import com.fasterxml.jackson.databind.util.NameTransformer;
import com.fasterxml.jackson.databind.util.TokenBuffer;
import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ConcurrentNavigableMap;
import java.util.concurrent.ConcurrentSkipListMap;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/BasicDeserializerFactory.class */
public abstract class BasicDeserializerFactory extends DeserializerFactory implements Serializable {
    private static final Class<?> CLASS_OBJECT = Object.class;
    private static final Class<?> CLASS_STRING = String.class;
    private static final Class<?> CLASS_CHAR_BUFFER = CharSequence.class;
    private static final Class<?> CLASS_ITERABLE = Iterable.class;
    protected static final PropertyName UNWRAPPED_CREATOR_PARAM_NAME = new PropertyName("@JsonUnwrapped");
    static final HashMap<String, Class<? extends Map>> _mapFallbacks = new HashMap<>();
    static final HashMap<String, Class<? extends Collection>> _collectionFallbacks;
    protected final DeserializerFactoryConfig _factoryConfig;

    protected abstract DeserializerFactory withConfig(DeserializerFactoryConfig deserializerFactoryConfig);

    static {
        _mapFallbacks.put(Map.class.getName(), LinkedHashMap.class);
        _mapFallbacks.put(ConcurrentMap.class.getName(), ConcurrentHashMap.class);
        _mapFallbacks.put(SortedMap.class.getName(), TreeMap.class);
        _mapFallbacks.put("java.util.NavigableMap", TreeMap.class);
        try {
            _mapFallbacks.put(ConcurrentNavigableMap.class.getName(), ConcurrentSkipListMap.class);
        } catch (Throwable e) {
            System.err.println("Problems with (optional) types: " + e);
        }
        _collectionFallbacks = new HashMap<>();
        _collectionFallbacks.put(Collection.class.getName(), ArrayList.class);
        _collectionFallbacks.put(List.class.getName(), ArrayList.class);
        _collectionFallbacks.put(Set.class.getName(), HashSet.class);
        _collectionFallbacks.put(SortedSet.class.getName(), TreeSet.class);
        _collectionFallbacks.put(Queue.class.getName(), LinkedList.class);
        _collectionFallbacks.put("java.util.Deque", LinkedList.class);
        _collectionFallbacks.put("java.util.NavigableSet", TreeSet.class);
    }

    protected BasicDeserializerFactory(DeserializerFactoryConfig config) {
        this._factoryConfig = config;
    }

    public DeserializerFactoryConfig getFactoryConfig() {
        return this._factoryConfig;
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public final DeserializerFactory withAdditionalDeserializers(Deserializers additional) {
        return withConfig(this._factoryConfig.withAdditionalDeserializers(additional));
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public final DeserializerFactory withAdditionalKeyDeserializers(KeyDeserializers additional) {
        return withConfig(this._factoryConfig.withAdditionalKeyDeserializers(additional));
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public final DeserializerFactory withDeserializerModifier(BeanDeserializerModifier modifier) {
        return withConfig(this._factoryConfig.withDeserializerModifier(modifier));
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public final DeserializerFactory withAbstractTypeResolver(AbstractTypeResolver resolver) {
        return withConfig(this._factoryConfig.withAbstractTypeResolver(resolver));
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public final DeserializerFactory withValueInstantiators(ValueInstantiators instantiators) {
        return withConfig(this._factoryConfig.withValueInstantiators(instantiators));
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public JavaType mapAbstractType(DeserializationConfig config, JavaType type) throws JsonMappingException {
        JavaType next;
        while (true) {
            next = _mapAbstractType2(config, type);
            if (next == null) {
                return type;
            }
            Class<?> prevCls = type.getRawClass();
            Class<?> nextCls = next.getRawClass();
            if (prevCls == nextCls || !prevCls.isAssignableFrom(nextCls)) {
                break;
            }
            type = next;
        }
        throw new IllegalArgumentException("Invalid abstract type resolution from " + type + " to " + next + ": latter is not a subtype of former");
    }

    private JavaType _mapAbstractType2(DeserializationConfig config, JavaType type) throws JsonMappingException {
        Class<?> currClass = type.getRawClass();
        if (this._factoryConfig.hasAbstractTypeResolvers()) {
            for (AbstractTypeResolver resolver : this._factoryConfig.abstractTypeResolvers()) {
                JavaType concrete = resolver.findTypeMapping(config, type);
                if (concrete != null && concrete.getRawClass() != currClass) {
                    return concrete;
                }
            }
            return null;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public ValueInstantiator findValueInstantiator(DeserializationContext ctxt, BeanDescription beanDesc) throws JsonMappingException {
        DeserializationConfig config = ctxt.getConfig();
        ValueInstantiator instantiator = null;
        AnnotatedClass ac = beanDesc.getClassInfo();
        Object instDef = ctxt.getAnnotationIntrospector().findValueInstantiator(ac);
        if (instDef != null) {
            instantiator = _valueInstantiatorInstance(config, ac, instDef);
        }
        if (instantiator == null) {
            instantiator = _findStdValueInstantiator(config, beanDesc);
            if (instantiator == null) {
                instantiator = _constructDefaultValueInstantiator(ctxt, beanDesc);
            }
        }
        if (this._factoryConfig.hasValueInstantiators()) {
            for (ValueInstantiators insts : this._factoryConfig.valueInstantiators()) {
                instantiator = insts.findValueInstantiator(config, beanDesc, instantiator);
                if (instantiator == null) {
                    throw new JsonMappingException("Broken registered ValueInstantiators (of type " + insts.getClass().getName() + "): returned null ValueInstantiator");
                }
            }
        }
        if (instantiator.getIncompleteParameter() != null) {
            AnnotatedParameter nonAnnotatedParam = instantiator.getIncompleteParameter();
            AnnotatedWithParams ctor = nonAnnotatedParam.getOwner();
            throw new IllegalArgumentException("Argument #" + nonAnnotatedParam.getIndex() + " of constructor " + ctor + " has no property name annotation; must have name when multiple-parameter constructor annotated as Creator");
        }
        return instantiator;
    }

    private ValueInstantiator _findStdValueInstantiator(DeserializationConfig config, BeanDescription beanDesc) throws JsonMappingException {
        if (beanDesc.getBeanClass() == JsonLocation.class) {
            return new JsonLocationInstantiator();
        }
        return null;
    }

    protected ValueInstantiator _constructDefaultValueInstantiator(DeserializationContext ctxt, BeanDescription beanDesc) throws JsonMappingException {
        boolean fixAccess = ctxt.canOverrideAccessModifiers();
        CreatorCollector creators = new CreatorCollector(beanDesc, fixAccess);
        AnnotationIntrospector intr = ctxt.getAnnotationIntrospector();
        DeserializationConfig config = ctxt.getConfig();
        VisibilityChecker<?> vchecker = intr.findAutoDetectVisibility(beanDesc.getClassInfo(), config.getDefaultVisibilityChecker());
        _addDeserializerFactoryMethods(ctxt, beanDesc, vchecker, intr, creators);
        if (beanDesc.getType().isConcrete()) {
            _addDeserializerConstructors(ctxt, beanDesc, vchecker, intr, creators);
        }
        return creators.constructValueInstantiator(config);
    }

    public ValueInstantiator _valueInstantiatorInstance(DeserializationConfig config, Annotated annotated, Object instDef) throws JsonMappingException {
        ValueInstantiator inst;
        if (instDef == null) {
            return null;
        }
        if (instDef instanceof ValueInstantiator) {
            return (ValueInstantiator) instDef;
        }
        if (!(instDef instanceof Class)) {
            throw new IllegalStateException("AnnotationIntrospector returned key deserializer definition of type " + instDef.getClass().getName() + "; expected type KeyDeserializer or Class<KeyDeserializer> instead");
        }
        Class<?> instClass = (Class) instDef;
        if (ClassUtil.isBogusClass(instClass)) {
            return null;
        }
        if (!ValueInstantiator.class.isAssignableFrom(instClass)) {
            throw new IllegalStateException("AnnotationIntrospector returned Class " + instClass.getName() + "; expected Class<ValueInstantiator>");
        }
        HandlerInstantiator hi = config.getHandlerInstantiator();
        if (hi != null && (inst = hi.valueInstantiatorInstance(config, annotated, instClass)) != null) {
            return inst;
        }
        return (ValueInstantiator) ClassUtil.createInstance(instClass, config.canOverrideAccessModifiers());
    }

    protected void _addDeserializerConstructors(DeserializationContext ctxt, BeanDescription beanDesc, VisibilityChecker<?> vchecker, AnnotationIntrospector intr, CreatorCollector creators) throws JsonMappingException {
        AnnotatedConstructor defaultCtor = beanDesc.findDefaultConstructor();
        if (defaultCtor != null && (!creators.hasDefaultCreator() || intr.hasCreatorAnnotation(defaultCtor))) {
            creators.setDefaultCreator(defaultCtor);
        }
        PropertyName[] ctorPropNames = null;
        AnnotatedConstructor propertyCtor = null;
        for (BeanPropertyDefinition propDef : beanDesc.findProperties()) {
            if (propDef.getConstructorParameter() != null) {
                AnnotatedParameter param = propDef.getConstructorParameter();
                AnnotatedWithParams owner = param.getOwner();
                if (owner instanceof AnnotatedConstructor) {
                    if (propertyCtor == null) {
                        propertyCtor = (AnnotatedConstructor) owner;
                        ctorPropNames = new PropertyName[propertyCtor.getParameterCount()];
                    }
                    ctorPropNames[param.getIndex()] = propDef.getFullName();
                }
            }
        }
        Iterator i$ = beanDesc.getConstructors().iterator();
        while (i$.hasNext()) {
            AnnotatedConstructor ctor = i$.next();
            int argCount = ctor.getParameterCount();
            boolean isCreator = intr.hasCreatorAnnotation(ctor) || ctor == propertyCtor;
            boolean isVisible = vchecker.isCreatorVisible(ctor);
            if (argCount == 1) {
                PropertyName name = ctor == propertyCtor ? ctorPropNames[0] : null;
                _handleSingleArgumentConstructor(ctxt, beanDesc, vchecker, intr, creators, ctor, isCreator, isVisible, name);
            } else if (isCreator || isVisible) {
                AnnotatedParameter nonAnnotatedParam = null;
                int namedCount = 0;
                int injectCount = 0;
                CreatorProperty[] properties = new CreatorProperty[argCount];
                for (int i = 0; i < argCount; i++) {
                    AnnotatedParameter param2 = ctor.getParameter(i);
                    PropertyName name2 = null;
                    if (ctor == propertyCtor) {
                        name2 = ctorPropNames[i];
                    }
                    if (name2 == null) {
                        name2 = _findParamName(param2, intr);
                    }
                    Object injectId = intr.findInjectableValueId(param2);
                    if (name2 != null && name2.hasSimpleName()) {
                        namedCount++;
                        properties[i] = constructCreatorProperty(ctxt, beanDesc, name2, i, param2, injectId);
                    } else if (injectId != null) {
                        injectCount++;
                        properties[i] = constructCreatorProperty(ctxt, beanDesc, name2, i, param2, injectId);
                    } else {
                        NameTransformer unwrapper = intr.findUnwrappingNameTransformer(param2);
                        if (unwrapper != null) {
                            properties[i] = constructCreatorProperty(ctxt, beanDesc, UNWRAPPED_CREATOR_PARAM_NAME, i, param2, null);
                            namedCount++;
                        } else if (nonAnnotatedParam == null) {
                            nonAnnotatedParam = param2;
                        }
                    }
                }
                if (isCreator || namedCount > 0 || injectCount > 0) {
                    if (namedCount + injectCount == argCount) {
                        creators.addPropertyCreator(ctor, properties);
                    } else if (namedCount == 0 && injectCount + 1 == argCount) {
                        creators.addDelegatingCreator(ctor, properties);
                    } else {
                        creators.addIncompeteParameter(nonAnnotatedParam);
                    }
                }
            }
        }
    }

    protected boolean _handleSingleArgumentConstructor(DeserializationContext ctxt, BeanDescription beanDesc, VisibilityChecker<?> vchecker, AnnotationIntrospector intr, CreatorCollector creators, AnnotatedConstructor ctor, boolean isCreator, boolean isVisible, PropertyName name) throws JsonMappingException {
        AnnotatedParameter param = ctor.getParameter(0);
        if (name == null) {
            name = _findParamName(param, intr);
        }
        Object injectId = intr.findInjectableValueId(param);
        if (injectId != null || (name != null && name.hasSimpleName())) {
            CreatorProperty[] properties = {constructCreatorProperty(ctxt, beanDesc, name, 0, param, injectId)};
            creators.addPropertyCreator(ctor, properties);
            return true;
        }
        Class<?> type = ctor.getRawParameterType(0);
        if (type == String.class) {
            if (isCreator || isVisible) {
                creators.addStringCreator(ctor);
                return true;
            }
            return true;
        }
        if (type == Integer.TYPE || type == Integer.class) {
            if (isCreator || isVisible) {
                creators.addIntCreator(ctor);
                return true;
            }
            return true;
        }
        if (type == Long.TYPE || type == Long.class) {
            if (isCreator || isVisible) {
                creators.addLongCreator(ctor);
                return true;
            }
            return true;
        }
        if (type == Double.TYPE || type == Double.class) {
            if (isCreator || isVisible) {
                creators.addDoubleCreator(ctor);
                return true;
            }
            return true;
        }
        if (type == Boolean.TYPE || type == Boolean.class) {
            if (isCreator || isVisible) {
                creators.addBooleanCreator(ctor);
                return true;
            }
            return true;
        }
        if (isCreator) {
            creators.addDelegatingCreator(ctor, null);
            return true;
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0187 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x017b A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void _addDeserializerFactoryMethods(com.fasterxml.jackson.databind.DeserializationContext r11, com.fasterxml.jackson.databind.BeanDescription r12, com.fasterxml.jackson.databind.introspect.VisibilityChecker<?> r13, com.fasterxml.jackson.databind.AnnotationIntrospector r14, com.fasterxml.jackson.databind.deser.impl.CreatorCollector r15) throws com.fasterxml.jackson.databind.JsonMappingException {
        /*
            Method dump skipped, instructions count: 467
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BasicDeserializerFactory._addDeserializerFactoryMethods(com.fasterxml.jackson.databind.DeserializationContext, com.fasterxml.jackson.databind.BeanDescription, com.fasterxml.jackson.databind.introspect.VisibilityChecker, com.fasterxml.jackson.databind.AnnotationIntrospector, com.fasterxml.jackson.databind.deser.impl.CreatorCollector):void");
    }

    protected boolean _handleSingleArgumentFactory(DeserializationConfig config, BeanDescription beanDesc, VisibilityChecker<?> vchecker, AnnotationIntrospector intr, CreatorCollector creators, AnnotatedMethod factory, boolean isCreator) throws JsonMappingException {
        Class<?> type = factory.getRawParameterType(0);
        if (type == String.class) {
            if (isCreator || vchecker.isCreatorVisible(factory)) {
                creators.addStringCreator(factory);
                return true;
            }
            return true;
        }
        if (type == Integer.TYPE || type == Integer.class) {
            if (isCreator || vchecker.isCreatorVisible(factory)) {
                creators.addIntCreator(factory);
                return true;
            }
            return true;
        }
        if (type == Long.TYPE || type == Long.class) {
            if (isCreator || vchecker.isCreatorVisible(factory)) {
                creators.addLongCreator(factory);
                return true;
            }
            return true;
        }
        if (type == Double.TYPE || type == Double.class) {
            if (isCreator || vchecker.isCreatorVisible(factory)) {
                creators.addDoubleCreator(factory);
                return true;
            }
            return true;
        }
        if (type == Boolean.TYPE || type == Boolean.class) {
            if (isCreator || vchecker.isCreatorVisible(factory)) {
                creators.addBooleanCreator(factory);
                return true;
            }
            return true;
        }
        if (intr.hasCreatorAnnotation(factory)) {
            creators.addDelegatingCreator(factory, null);
            return true;
        }
        return false;
    }

    protected CreatorProperty constructCreatorProperty(DeserializationContext ctxt, BeanDescription beanDesc, PropertyName name, int index, AnnotatedParameter param, Object injectableValueId) throws JsonMappingException {
        DeserializationConfig config = ctxt.getConfig();
        AnnotationIntrospector intr = ctxt.getAnnotationIntrospector();
        Boolean b = intr == null ? null : intr.hasRequiredMarker(param);
        boolean req = b != null && b.booleanValue();
        String desc = intr == null ? null : intr.findPropertyDescription(param);
        Integer idx = intr == null ? null : intr.findPropertyIndex(param);
        PropertyMetadata metadata = PropertyMetadata.construct(req, desc, idx);
        JavaType t0 = config.getTypeFactory().constructType(param.getParameterType(), beanDesc.bindingsForBeanType());
        BeanProperty.Std property = new BeanProperty.Std(name, t0, intr.findWrapperName(param), beanDesc.getClassAnnotations(), param, metadata);
        JavaType type = resolveType(ctxt, beanDesc, t0, param);
        if (type != t0) {
            property = property.withType(type);
        }
        JsonDeserializer<?> deser = findDeserializerFromAnnotation(ctxt, param);
        JavaType type2 = modifyTypeByAnnotation(ctxt, param, type);
        TypeDeserializer typeDeser = (TypeDeserializer) type2.getTypeHandler();
        if (typeDeser == null) {
            typeDeser = findTypeDeserializer(config, type2);
        }
        CreatorProperty prop = new CreatorProperty(name, type2, property.getWrapperName(), typeDeser, beanDesc.getClassAnnotations(), param, index, injectableValueId, metadata);
        if (deser != null) {
            prop = prop.withValueDeserializer(ctxt.handlePrimaryContextualization(deser, prop));
        }
        return prop;
    }

    protected PropertyName _findParamName(AnnotatedParameter param, AnnotationIntrospector intr) {
        if (param != null && intr != null) {
            PropertyName name = intr.findNameForDeserialization(param);
            if (name != null) {
                return name;
            }
            String str = intr.findImplicitPropertyName(param);
            if (str != null && !str.isEmpty()) {
                return new PropertyName(str);
            }
            return null;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public JsonDeserializer<?> createArrayDeserializer(DeserializationContext ctxt, ArrayType type, BeanDescription beanDesc) throws JsonMappingException {
        DeserializationConfig config = ctxt.getConfig();
        JavaType elemType = type.mo3getContentType();
        JsonDeserializer<Object> contentDeser = (JsonDeserializer) elemType.getValueHandler();
        TypeDeserializer elemTypeDeser = (TypeDeserializer) elemType.getTypeHandler();
        if (elemTypeDeser == null) {
            elemTypeDeser = findTypeDeserializer(config, elemType);
        }
        JsonDeserializer<?> deser = _findCustomArrayDeserializer(type, config, beanDesc, elemTypeDeser, contentDeser);
        if (deser == null) {
            if (contentDeser == null) {
                Class<?> raw = elemType.getRawClass();
                if (elemType.isPrimitive()) {
                    return PrimitiveArrayDeserializers.forType(raw);
                }
                if (raw == String.class) {
                    return StringArrayDeserializer.instance;
                }
            }
            deser = new ObjectArrayDeserializer(type, contentDeser, elemTypeDeser);
        }
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                deser = mod.modifyArrayDeserializer(config, type, beanDesc, deser);
            }
        }
        return deser;
    }

    protected JsonDeserializer<?> _findCustomArrayDeserializer(ArrayType type, DeserializationConfig config, BeanDescription beanDesc, TypeDeserializer elementTypeDeserializer, JsonDeserializer<?> elementDeserializer) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findArrayDeserializer(type, config, beanDesc, elementTypeDeserializer, elementDeserializer);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public JsonDeserializer<?> createCollectionDeserializer(DeserializationContext ctxt, CollectionType type, BeanDescription beanDesc) throws JsonMappingException {
        JavaType contentType = type.mo3getContentType();
        JsonDeserializer<Object> contentDeser = (JsonDeserializer) contentType.getValueHandler();
        DeserializationConfig config = ctxt.getConfig();
        TypeDeserializer contentTypeDeser = (TypeDeserializer) contentType.getTypeHandler();
        if (contentTypeDeser == null) {
            contentTypeDeser = findTypeDeserializer(config, contentType);
        }
        JsonDeserializer<?> deser = _findCustomCollectionDeserializer(type, config, beanDesc, contentTypeDeser, contentDeser);
        if (deser == null) {
            Class<?> collectionClass = type.getRawClass();
            if (contentDeser == null && EnumSet.class.isAssignableFrom(collectionClass)) {
                deser = new EnumSetDeserializer(contentType, null);
            }
        }
        if (deser == null) {
            if (type.isInterface() || type.isAbstract()) {
                CollectionType implType = _mapAbstractCollectionType(type, config);
                if (implType == null) {
                    if (type.getTypeHandler() == null) {
                        throw new IllegalArgumentException("Can not find a deserializer for non-concrete Collection type " + type);
                    }
                    deser = AbstractDeserializer.constructForNonPOJO(beanDesc);
                } else {
                    type = implType;
                    beanDesc = config.introspectForCreation(type);
                }
            }
            if (deser == null) {
                ValueInstantiator inst = findValueInstantiator(ctxt, beanDesc);
                if (!inst.canCreateUsingDefault() && type.getRawClass() == ArrayBlockingQueue.class) {
                    return new ArrayBlockingQueueDeserializer(type, contentDeser, contentTypeDeser, inst, null);
                }
                if (contentType.getRawClass() == String.class) {
                    deser = new StringCollectionDeserializer(type, contentDeser, inst);
                } else {
                    deser = new CollectionDeserializer(type, contentDeser, contentTypeDeser, inst);
                }
            }
        }
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                deser = mod.modifyCollectionDeserializer(config, type, beanDesc, deser);
            }
        }
        return deser;
    }

    protected CollectionType _mapAbstractCollectionType(JavaType type, DeserializationConfig config) {
        Class<?> collectionClass = _collectionFallbacks.get(type.getRawClass().getName());
        if (collectionClass == null) {
            return null;
        }
        return (CollectionType) config.constructSpecializedType(type, collectionClass);
    }

    protected JsonDeserializer<?> _findCustomCollectionDeserializer(CollectionType type, DeserializationConfig config, BeanDescription beanDesc, TypeDeserializer elementTypeDeserializer, JsonDeserializer<?> elementDeserializer) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findCollectionDeserializer(type, config, beanDesc, elementTypeDeserializer, elementDeserializer);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public JsonDeserializer<?> createCollectionLikeDeserializer(DeserializationContext ctxt, CollectionLikeType type, BeanDescription beanDesc) throws JsonMappingException {
        JavaType contentType = type.mo3getContentType();
        JsonDeserializer<Object> contentDeser = (JsonDeserializer) contentType.getValueHandler();
        DeserializationConfig config = ctxt.getConfig();
        TypeDeserializer contentTypeDeser = (TypeDeserializer) contentType.getTypeHandler();
        if (contentTypeDeser == null) {
            contentTypeDeser = findTypeDeserializer(config, contentType);
        }
        JsonDeserializer<?> deser = _findCustomCollectionLikeDeserializer(type, config, beanDesc, contentTypeDeser, contentDeser);
        if (deser != null && this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                deser = mod.modifyCollectionLikeDeserializer(config, type, beanDesc, deser);
            }
        }
        return deser;
    }

    protected JsonDeserializer<?> _findCustomCollectionLikeDeserializer(CollectionLikeType type, DeserializationConfig config, BeanDescription beanDesc, TypeDeserializer elementTypeDeserializer, JsonDeserializer<?> elementDeserializer) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findCollectionLikeDeserializer(type, config, beanDesc, elementTypeDeserializer, elementDeserializer);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public JsonDeserializer<?> createMapDeserializer(DeserializationContext ctxt, MapType type, BeanDescription beanDesc) throws JsonMappingException {
        DeserializationConfig config = ctxt.getConfig();
        JavaType keyType = type.mo4getKeyType();
        JavaType contentType = type.mo3getContentType();
        JsonDeserializer<Object> contentDeser = (JsonDeserializer) contentType.getValueHandler();
        KeyDeserializer keyDes = (KeyDeserializer) keyType.getValueHandler();
        TypeDeserializer contentTypeDeser = (TypeDeserializer) contentType.getTypeHandler();
        if (contentTypeDeser == null) {
            contentTypeDeser = findTypeDeserializer(config, contentType);
        }
        JsonDeserializer<?> deser = _findCustomMapDeserializer(type, config, beanDesc, keyDes, contentTypeDeser, contentDeser);
        if (deser == null) {
            Class<?> mapClass = type.getRawClass();
            if (EnumMap.class.isAssignableFrom(mapClass)) {
                Class<?> kt = keyType.getRawClass();
                if (kt == null || !kt.isEnum()) {
                    throw new IllegalArgumentException("Can not construct EnumMap; generic (key) type not available");
                }
                deser = new EnumMapDeserializer(type, null, contentDeser, contentTypeDeser);
            }
            if (deser == null) {
                if (type.isInterface() || type.isAbstract()) {
                    Class<? extends Map> fallback = _mapFallbacks.get(mapClass.getName());
                    if (fallback != null) {
                        type = (MapType) config.constructSpecializedType(type, fallback);
                        beanDesc = config.introspectForCreation(type);
                    } else {
                        if (type.getTypeHandler() == null) {
                            throw new IllegalArgumentException("Can not find a deserializer for non-concrete Map type " + type);
                        }
                        deser = AbstractDeserializer.constructForNonPOJO(beanDesc);
                    }
                }
                if (deser == null) {
                    ValueInstantiator inst = findValueInstantiator(ctxt, beanDesc);
                    MapDeserializer md = new MapDeserializer(type, inst, keyDes, contentDeser, contentTypeDeser);
                    md.setIgnorableProperties(config.getAnnotationIntrospector().findPropertiesToIgnore(beanDesc.getClassInfo()));
                    deser = md;
                }
            }
        }
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                deser = mod.modifyMapDeserializer(config, type, beanDesc, deser);
            }
        }
        return deser;
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public JsonDeserializer<?> createMapLikeDeserializer(DeserializationContext ctxt, MapLikeType type, BeanDescription beanDesc) throws JsonMappingException {
        JavaType keyType = type.mo4getKeyType();
        JavaType contentType = type.mo3getContentType();
        DeserializationConfig config = ctxt.getConfig();
        JsonDeserializer<Object> contentDeser = (JsonDeserializer) contentType.getValueHandler();
        KeyDeserializer keyDes = (KeyDeserializer) keyType.getValueHandler();
        TypeDeserializer contentTypeDeser = (TypeDeserializer) contentType.getTypeHandler();
        if (contentTypeDeser == null) {
            contentTypeDeser = findTypeDeserializer(config, contentType);
        }
        JsonDeserializer<?> deser = _findCustomMapLikeDeserializer(type, config, beanDesc, keyDes, contentTypeDeser, contentDeser);
        if (deser != null && this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                deser = mod.modifyMapLikeDeserializer(config, type, beanDesc, deser);
            }
        }
        return deser;
    }

    protected JsonDeserializer<?> _findCustomMapDeserializer(MapType type, DeserializationConfig config, BeanDescription beanDesc, KeyDeserializer keyDeserializer, TypeDeserializer elementTypeDeserializer, JsonDeserializer<?> elementDeserializer) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findMapDeserializer(type, config, beanDesc, keyDeserializer, elementTypeDeserializer, elementDeserializer);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    protected JsonDeserializer<?> _findCustomMapLikeDeserializer(MapLikeType type, DeserializationConfig config, BeanDescription beanDesc, KeyDeserializer keyDeserializer, TypeDeserializer elementTypeDeserializer, JsonDeserializer<?> elementDeserializer) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findMapLikeDeserializer(type, config, beanDesc, keyDeserializer, elementTypeDeserializer, elementDeserializer);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x00a8, code lost:
    
        if (r13 != null) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x00ab, code lost:
    
        r13 = new com.fasterxml.jackson.databind.deser.std.EnumDeserializer(constructEnumResolver(r0, r0, r10.findJsonValueMethod()));
     */
    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.fasterxml.jackson.databind.JsonDeserializer<?> createEnumDeserializer(com.fasterxml.jackson.databind.DeserializationContext r8, com.fasterxml.jackson.databind.JavaType r9, com.fasterxml.jackson.databind.BeanDescription r10) throws com.fasterxml.jackson.databind.JsonMappingException {
        /*
            Method dump skipped, instructions count: 257
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BasicDeserializerFactory.createEnumDeserializer(com.fasterxml.jackson.databind.DeserializationContext, com.fasterxml.jackson.databind.JavaType, com.fasterxml.jackson.databind.BeanDescription):com.fasterxml.jackson.databind.JsonDeserializer");
    }

    protected JsonDeserializer<?> _findCustomEnumDeserializer(Class<?> type, DeserializationConfig config, BeanDescription beanDesc) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findEnumDeserializer(type, config, beanDesc);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public JsonDeserializer<?> createTreeDeserializer(DeserializationConfig config, JavaType nodeType, BeanDescription beanDesc) throws JsonMappingException {
        Class<?> rawClass = nodeType.getRawClass();
        JsonDeserializer<?> custom = _findCustomTreeNodeDeserializer(rawClass, config, beanDesc);
        if (custom != null) {
            return custom;
        }
        return JsonNodeDeserializer.getDeserializer(rawClass);
    }

    protected JsonDeserializer<?> _findCustomTreeNodeDeserializer(Class<? extends JsonNode> type, DeserializationConfig config, BeanDescription beanDesc) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findTreeNodeDeserializer(type, config, beanDesc);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public TypeDeserializer findTypeDeserializer(DeserializationConfig config, JavaType baseType) throws JsonMappingException {
        JavaType defaultType;
        BeanDescription bean = config.introspectClassAnnotations(baseType.getRawClass());
        AnnotatedClass ac = bean.getClassInfo();
        AnnotationIntrospector ai = config.getAnnotationIntrospector();
        TypeResolverBuilder<?> b = ai.findTypeResolver(config, ac, baseType);
        Collection<NamedType> subtypes = null;
        if (b == null) {
            b = config.getDefaultTyper(baseType);
            if (b == null) {
                return null;
            }
        } else {
            subtypes = config.getSubtypeResolver().collectAndResolveSubtypes(ac, config, ai);
        }
        if (b.getDefaultImpl() == null && baseType.isAbstract() && (defaultType = mapAbstractType(config, baseType)) != null && defaultType.getRawClass() != baseType.getRawClass()) {
            b = b.defaultImpl(defaultType.getRawClass());
        }
        return b.buildTypeDeserializer(config, baseType, subtypes);
    }

    @Override // com.fasterxml.jackson.databind.deser.DeserializerFactory
    public KeyDeserializer createKeyDeserializer(DeserializationContext ctxt, JavaType type) throws JsonMappingException {
        DeserializationConfig config = ctxt.getConfig();
        KeyDeserializer deser = null;
        if (this._factoryConfig.hasKeyDeserializers()) {
            BeanDescription beanDesc = config.introspectClassAnnotations(type.getRawClass());
            for (KeyDeserializers d : this._factoryConfig.keyDeserializers()) {
                deser = d.findKeyDeserializer(type, config, beanDesc);
                if (deser != null) {
                    break;
                }
            }
        }
        if (deser == null) {
            if (type.isEnumType()) {
                return _createEnumKeyDeserializer(ctxt, type);
            }
            deser = StdKeyDeserializers.findStringBasedKeyDeserializer(config, type);
        }
        if (deser != null && this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                deser = mod.modifyKeyDeserializer(config, type, deser);
            }
        }
        return deser;
    }

    private KeyDeserializer _createEnumKeyDeserializer(DeserializationContext ctxt, JavaType type) throws JsonMappingException {
        DeserializationConfig config = ctxt.getConfig();
        BeanDescription beanDesc = config.introspect(type);
        JsonDeserializer<?> des = findDeserializerFromAnnotation(ctxt, beanDesc.getClassInfo());
        if (des != null) {
            return StdKeyDeserializers.constructDelegatingKeyDeserializer(config, type, des);
        }
        Class<?> enumClass = type.getRawClass();
        JsonDeserializer<?> custom = _findCustomEnumDeserializer(enumClass, config, beanDesc);
        if (custom != null) {
            return StdKeyDeserializers.constructDelegatingKeyDeserializer(config, type, custom);
        }
        EnumResolver<?> enumRes = constructEnumResolver(enumClass, config, beanDesc.findJsonValueMethod());
        for (AnnotatedMethod factory : beanDesc.getFactoryMethods()) {
            if (config.getAnnotationIntrospector().hasCreatorAnnotation(factory)) {
                int argCount = factory.getParameterCount();
                if (argCount == 1) {
                    Class<?> returnType = factory.getRawReturnType();
                    if (returnType.isAssignableFrom(enumClass)) {
                        if (factory.getGenericParameterType(0) != String.class) {
                            throw new IllegalArgumentException("Parameter #0 type for factory method (" + factory + ") not suitable, must be java.lang.String");
                        }
                        if (config.canOverrideAccessModifiers()) {
                            ClassUtil.checkAndFixAccess(factory.getMember());
                        }
                        return StdKeyDeserializers.constructEnumKeyDeserializer(enumRes, factory);
                    }
                }
                throw new IllegalArgumentException("Unsuitable method (" + factory + ") decorated with @JsonCreator (for Enum type " + enumClass.getName() + ")");
            }
        }
        return StdKeyDeserializers.constructEnumKeyDeserializer(enumRes);
    }

    public TypeDeserializer findPropertyTypeDeserializer(DeserializationConfig config, JavaType baseType, AnnotatedMember annotated) throws JsonMappingException {
        AnnotationIntrospector ai = config.getAnnotationIntrospector();
        TypeResolverBuilder<?> b = ai.findPropertyTypeResolver(config, annotated, baseType);
        if (b == null) {
            return findTypeDeserializer(config, baseType);
        }
        Collection<NamedType> subtypes = config.getSubtypeResolver().collectAndResolveSubtypes(annotated, config, ai, baseType);
        return b.buildTypeDeserializer(config, baseType, subtypes);
    }

    public TypeDeserializer findPropertyContentTypeDeserializer(DeserializationConfig config, JavaType containerType, AnnotatedMember propertyEntity) throws JsonMappingException {
        AnnotationIntrospector ai = config.getAnnotationIntrospector();
        TypeResolverBuilder<?> b = ai.findPropertyContentTypeResolver(config, propertyEntity, containerType);
        JavaType contentType = containerType.mo3getContentType();
        if (b == null) {
            return findTypeDeserializer(config, contentType);
        }
        Collection<NamedType> subtypes = config.getSubtypeResolver().collectAndResolveSubtypes(propertyEntity, config, ai, contentType);
        return b.buildTypeDeserializer(config, contentType, subtypes);
    }

    public JsonDeserializer<?> findDefaultDeserializer(DeserializationContext ctxt, JavaType type, BeanDescription beanDesc) throws JsonMappingException {
        Class<?> rawType = type.getRawClass();
        if (rawType == CLASS_OBJECT) {
            return new UntypedObjectDeserializer();
        }
        if (rawType == CLASS_STRING || rawType == CLASS_CHAR_BUFFER) {
            return StringDeserializer.instance;
        }
        if (rawType == CLASS_ITERABLE) {
            TypeFactory tf = ctxt.getTypeFactory();
            JavaType elemType = type.containedTypeCount() > 0 ? type.mo2containedType(0) : TypeFactory.unknownType();
            CollectionType ct = tf.constructCollectionType(Collection.class, elemType);
            return createCollectionDeserializer(ctxt, ct, beanDesc);
        }
        String clsName = rawType.getName();
        if (rawType.isPrimitive() || clsName.startsWith("java.")) {
            JsonDeserializer<?> deser = NumberDeserializers.find(rawType, clsName);
            if (deser == null) {
                deser = DateDeserializers.find(rawType, clsName);
            }
            if (deser != null) {
                return deser;
            }
        }
        if (rawType == TokenBuffer.class) {
            return new TokenBufferDeserializer();
        }
        return JdkDeserializers.find(rawType, clsName);
    }

    protected JsonDeserializer<Object> findDeserializerFromAnnotation(DeserializationContext ctxt, Annotated ann) throws JsonMappingException {
        Object deserDef = ctxt.getAnnotationIntrospector().findDeserializer(ann);
        if (deserDef == null) {
            return null;
        }
        return ctxt.deserializerInstance(ann, deserDef);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v51, types: [com.fasterxml.jackson.databind.JavaType] */
    protected <T extends JavaType> T modifyTypeByAnnotation(DeserializationContext deserializationContext, Annotated annotated, T t) throws JsonMappingException {
        KeyDeserializer keyDeserializerInstance;
        AnnotationIntrospector annotationIntrospector = deserializationContext.getAnnotationIntrospector();
        Class<?> findDeserializationType = annotationIntrospector.findDeserializationType(annotated, t);
        if (findDeserializationType != null) {
            try {
                t = t.narrowBy(findDeserializationType);
            } catch (IllegalArgumentException e) {
                throw new JsonMappingException("Failed to narrow type " + t + " with concrete-type annotation (value " + findDeserializationType.getName() + "), method '" + annotated.getName() + "': " + e.getMessage(), null, e);
            }
        }
        boolean isContainerType = t.isContainerType();
        T t2 = t;
        if (isContainerType) {
            Class<?> findDeserializationKeyType = annotationIntrospector.findDeserializationKeyType(annotated, t.mo4getKeyType());
            if (findDeserializationKeyType != null) {
                if (!(t instanceof MapLikeType)) {
                    throw new JsonMappingException("Illegal key-type annotation: type " + t + " is not a Map(-like) type");
                }
                try {
                    t = ((MapLikeType) t).narrowKey(findDeserializationKeyType);
                } catch (IllegalArgumentException e2) {
                    throw new JsonMappingException("Failed to narrow key type " + t + " with key-type annotation (" + findDeserializationKeyType.getName() + "): " + e2.getMessage(), null, e2);
                }
            }
            JavaType mo4getKeyType = t.mo4getKeyType();
            if (mo4getKeyType != null && mo4getKeyType.getValueHandler() == null && (keyDeserializerInstance = deserializationContext.keyDeserializerInstance(annotated, annotationIntrospector.findKeyDeserializer(annotated))) != null) {
                t = ((MapLikeType) t).withKeyValueHandler(keyDeserializerInstance);
                t.mo4getKeyType();
            }
            Class<?> findDeserializationContentType = annotationIntrospector.findDeserializationContentType(annotated, t.mo3getContentType());
            if (findDeserializationContentType != null) {
                try {
                    t = t.narrowContentsBy(findDeserializationContentType);
                } catch (IllegalArgumentException e3) {
                    throw new JsonMappingException("Failed to narrow content type " + t + " with content-type annotation (" + findDeserializationContentType.getName() + "): " + e3.getMessage(), null, e3);
                }
            }
            Object valueHandler = t.mo3getContentType().getValueHandler();
            t2 = t;
            if (valueHandler == null) {
                JsonDeserializer<Object> deserializerInstance = deserializationContext.deserializerInstance(annotated, annotationIntrospector.findContentDeserializer(annotated));
                t2 = t;
                if (deserializerInstance != null) {
                    t2 = t.withContentValueHandler(deserializerInstance);
                }
            }
        }
        return t2;
    }

    protected JavaType resolveType(DeserializationContext ctxt, BeanDescription beanDesc, JavaType type, AnnotatedMember member) throws JsonMappingException {
        TypeDeserializer valueTypeDeser;
        TypeDeserializer contentTypeDeser;
        if (type.isContainerType()) {
            AnnotationIntrospector intr = ctxt.getAnnotationIntrospector();
            JavaType keyType = type.mo4getKeyType();
            if (keyType != null) {
                Object kdDef = intr.findKeyDeserializer(member);
                KeyDeserializer kd = ctxt.keyDeserializerInstance(member, kdDef);
                if (kd != null) {
                    type = ((MapLikeType) type).withKeyValueHandler(kd);
                    type.mo4getKeyType();
                }
            }
            Object cdDef = intr.findContentDeserializer(member);
            JsonDeserializer<?> cd = ctxt.deserializerInstance(member, cdDef);
            if (cd != null) {
                type = type.withContentValueHandler(cd);
            }
            if ((member instanceof AnnotatedMember) && (contentTypeDeser = findPropertyContentTypeDeserializer(ctxt.getConfig(), type, member)) != null) {
                type = type.withContentTypeHandler(contentTypeDeser);
            }
        }
        if (member instanceof AnnotatedMember) {
            valueTypeDeser = findPropertyTypeDeserializer(ctxt.getConfig(), type, member);
        } else {
            valueTypeDeser = findTypeDeserializer(ctxt.getConfig(), type);
        }
        if (valueTypeDeser != null) {
            type = type.withTypeHandler(valueTypeDeser);
        }
        return type;
    }

    protected EnumResolver<?> constructEnumResolver(Class<?> enumClass, DeserializationConfig config, AnnotatedMethod jsonValueMethod) {
        if (jsonValueMethod != null) {
            Method accessor = jsonValueMethod.getAnnotated();
            if (config.canOverrideAccessModifiers()) {
                ClassUtil.checkAndFixAccess(accessor);
            }
            return EnumResolver.constructUnsafeUsingMethod(enumClass, accessor);
        }
        if (config.isEnabled(DeserializationFeature.READ_ENUMS_USING_TO_STRING)) {
            return EnumResolver.constructUnsafeUsingToString(enumClass);
        }
        return EnumResolver.constructUnsafe(enumClass, config.getAnnotationIntrospector());
    }

    protected AnnotatedMethod _findJsonValueFor(DeserializationConfig config, JavaType enumType) {
        if (enumType == null) {
            return null;
        }
        BeanDescription beanDesc = config.introspect(enumType);
        return beanDesc.findJsonValueMethod();
    }
}
