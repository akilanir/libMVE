package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.annotation.ObjectIdResolver;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.deser.impl.BeanPropertyMap;
import com.fasterxml.jackson.databind.deser.impl.ExternalTypeHandler;
import com.fasterxml.jackson.databind.deser.impl.InnerClassProperty;
import com.fasterxml.jackson.databind.deser.impl.ManagedReferenceProperty;
import com.fasterxml.jackson.databind.deser.impl.ObjectIdReader;
import com.fasterxml.jackson.databind.deser.impl.ObjectIdReferenceProperty;
import com.fasterxml.jackson.databind.deser.impl.ObjectIdValueProperty;
import com.fasterxml.jackson.databind.deser.impl.PropertyBasedCreator;
import com.fasterxml.jackson.databind.deser.impl.PropertyBasedObjectIdGenerator;
import com.fasterxml.jackson.databind.deser.impl.ReadableObjectId;
import com.fasterxml.jackson.databind.deser.impl.TypeWrappedDeserializer;
import com.fasterxml.jackson.databind.deser.impl.UnwrappedPropertyHandler;
import com.fasterxml.jackson.databind.deser.impl.ValueInjector;
import com.fasterxml.jackson.databind.deser.std.StdDelegatingDeserializer;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;
import com.fasterxml.jackson.databind.exc.IgnoredPropertyException;
import com.fasterxml.jackson.databind.introspect.AnnotatedClass;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.AnnotatedWithParams;
import com.fasterxml.jackson.databind.introspect.ObjectIdInfo;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.type.ClassKey;
import com.fasterxml.jackson.databind.util.Annotations;
import com.fasterxml.jackson.databind.util.ArrayBuilders;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.Converter;
import com.fasterxml.jackson.databind.util.NameTransformer;
import com.fasterxml.jackson.databind.util.TokenBuffer;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/BeanDeserializerBase.class */
public abstract class BeanDeserializerBase extends StdDeserializer<Object> implements ContextualDeserializer, ResolvableDeserializer, Serializable {
    private static final long serialVersionUID = 1;
    protected static final PropertyName TEMP_PROPERTY_NAME = new PropertyName("#temporary-name");
    private final transient Annotations _classAnnotations;
    protected final JavaType _beanType;
    protected final JsonFormat.Shape _serializationShape;
    protected final ValueInstantiator _valueInstantiator;
    protected JsonDeserializer<Object> _delegateDeserializer;
    protected PropertyBasedCreator _propertyBasedCreator;
    protected boolean _nonStandardCreation;
    protected boolean _vanillaProcessing;
    protected final BeanPropertyMap _beanProperties;
    protected final ValueInjector[] _injectables;
    protected SettableAnyProperty _anySetter;
    protected final HashSet<String> _ignorableProps;
    protected final boolean _ignoreAllUnknown;
    protected final boolean _needViewProcesing;
    protected final Map<String, SettableBeanProperty> _backRefs;
    protected transient HashMap<ClassKey, JsonDeserializer<Object>> _subDeserializers;
    protected UnwrappedPropertyHandler _unwrappedPropertyHandler;
    protected ExternalTypeHandler _externalTypeIdHandler;
    protected final ObjectIdReader _objectIdReader;

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public abstract JsonDeserializer<Object> unwrappingDeserializer(NameTransformer nameTransformer);

    public abstract BeanDeserializerBase withObjectIdReader(ObjectIdReader objectIdReader);

    public abstract BeanDeserializerBase withIgnorableProperties(HashSet<String> hashSet);

    protected abstract BeanDeserializerBase asArrayDeserializer();

    public abstract Object deserializeFromObject(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException;

    protected abstract Object _deserializeUsingPropertyBased(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException;

    protected BeanDeserializerBase(BeanDeserializerBuilder builder, BeanDescription beanDesc, BeanPropertyMap properties, Map<String, SettableBeanProperty> backRefs, HashSet<String> ignorableProps, boolean ignoreAllUnknown, boolean hasViews) {
        super(beanDesc.getType());
        AnnotatedClass ac = beanDesc.getClassInfo();
        this._classAnnotations = ac.getAnnotations();
        this._beanType = beanDesc.getType();
        this._valueInstantiator = builder.getValueInstantiator();
        this._beanProperties = properties;
        this._backRefs = backRefs;
        this._ignorableProps = ignorableProps;
        this._ignoreAllUnknown = ignoreAllUnknown;
        this._anySetter = builder.getAnySetter();
        List<ValueInjector> injectables = builder.getInjectables();
        this._injectables = (injectables == null || injectables.isEmpty()) ? null : (ValueInjector[]) injectables.toArray(new ValueInjector[injectables.size()]);
        this._objectIdReader = builder.getObjectIdReader();
        this._nonStandardCreation = this._unwrappedPropertyHandler != null || this._valueInstantiator.canCreateUsingDelegate() || this._valueInstantiator.canCreateFromObjectWith() || !this._valueInstantiator.canCreateUsingDefault();
        JsonFormat.Value format = beanDesc.findExpectedFormat(null);
        this._serializationShape = format == null ? null : format.getShape();
        this._needViewProcesing = hasViews;
        this._vanillaProcessing = !this._nonStandardCreation && this._injectables == null && !this._needViewProcesing && this._objectIdReader == null;
    }

    protected BeanDeserializerBase(BeanDeserializerBase src) {
        this(src, src._ignoreAllUnknown);
    }

    protected BeanDeserializerBase(BeanDeserializerBase src, boolean ignoreAllUnknown) {
        super(src._beanType);
        this._classAnnotations = src._classAnnotations;
        this._beanType = src._beanType;
        this._valueInstantiator = src._valueInstantiator;
        this._delegateDeserializer = src._delegateDeserializer;
        this._propertyBasedCreator = src._propertyBasedCreator;
        this._beanProperties = src._beanProperties;
        this._backRefs = src._backRefs;
        this._ignorableProps = src._ignorableProps;
        this._ignoreAllUnknown = ignoreAllUnknown;
        this._anySetter = src._anySetter;
        this._injectables = src._injectables;
        this._objectIdReader = src._objectIdReader;
        this._nonStandardCreation = src._nonStandardCreation;
        this._unwrappedPropertyHandler = src._unwrappedPropertyHandler;
        this._needViewProcesing = src._needViewProcesing;
        this._serializationShape = src._serializationShape;
        this._vanillaProcessing = src._vanillaProcessing;
    }

    protected BeanDeserializerBase(BeanDeserializerBase src, NameTransformer unwrapper) {
        super(src._beanType);
        this._classAnnotations = src._classAnnotations;
        this._beanType = src._beanType;
        this._valueInstantiator = src._valueInstantiator;
        this._delegateDeserializer = src._delegateDeserializer;
        this._propertyBasedCreator = src._propertyBasedCreator;
        this._backRefs = src._backRefs;
        this._ignorableProps = src._ignorableProps;
        this._ignoreAllUnknown = unwrapper != null || src._ignoreAllUnknown;
        this._anySetter = src._anySetter;
        this._injectables = src._injectables;
        this._objectIdReader = src._objectIdReader;
        this._nonStandardCreation = src._nonStandardCreation;
        UnwrappedPropertyHandler uph = src._unwrappedPropertyHandler;
        if (unwrapper != null) {
            uph = uph != null ? uph.renameAll(unwrapper) : uph;
            this._beanProperties = src._beanProperties.renameAll(unwrapper);
        } else {
            this._beanProperties = src._beanProperties;
        }
        this._unwrappedPropertyHandler = uph;
        this._needViewProcesing = src._needViewProcesing;
        this._serializationShape = src._serializationShape;
        this._vanillaProcessing = false;
    }

    public BeanDeserializerBase(BeanDeserializerBase src, ObjectIdReader oir) {
        super(src._beanType);
        this._classAnnotations = src._classAnnotations;
        this._beanType = src._beanType;
        this._valueInstantiator = src._valueInstantiator;
        this._delegateDeserializer = src._delegateDeserializer;
        this._propertyBasedCreator = src._propertyBasedCreator;
        this._backRefs = src._backRefs;
        this._ignorableProps = src._ignorableProps;
        this._ignoreAllUnknown = src._ignoreAllUnknown;
        this._anySetter = src._anySetter;
        this._injectables = src._injectables;
        this._nonStandardCreation = src._nonStandardCreation;
        this._unwrappedPropertyHandler = src._unwrappedPropertyHandler;
        this._needViewProcesing = src._needViewProcesing;
        this._serializationShape = src._serializationShape;
        this._objectIdReader = oir;
        if (oir == null) {
            this._beanProperties = src._beanProperties;
            this._vanillaProcessing = src._vanillaProcessing;
        } else {
            ObjectIdValueProperty idProp = new ObjectIdValueProperty(oir, PropertyMetadata.STD_REQUIRED);
            this._beanProperties = src._beanProperties.withProperty(idProp);
            this._vanillaProcessing = false;
        }
    }

    public BeanDeserializerBase(BeanDeserializerBase src, HashSet<String> ignorableProps) {
        super(src._beanType);
        this._classAnnotations = src._classAnnotations;
        this._beanType = src._beanType;
        this._valueInstantiator = src._valueInstantiator;
        this._delegateDeserializer = src._delegateDeserializer;
        this._propertyBasedCreator = src._propertyBasedCreator;
        this._backRefs = src._backRefs;
        this._ignorableProps = ignorableProps;
        this._ignoreAllUnknown = src._ignoreAllUnknown;
        this._anySetter = src._anySetter;
        this._injectables = src._injectables;
        this._nonStandardCreation = src._nonStandardCreation;
        this._unwrappedPropertyHandler = src._unwrappedPropertyHandler;
        this._needViewProcesing = src._needViewProcesing;
        this._serializationShape = src._serializationShape;
        this._vanillaProcessing = src._vanillaProcessing;
        this._objectIdReader = src._objectIdReader;
        this._beanProperties = src._beanProperties;
    }

    @Override // com.fasterxml.jackson.databind.deser.ResolvableDeserializer
    public void resolve(DeserializationContext ctxt) throws JsonMappingException {
        SettableBeanProperty[] creatorProps;
        ExternalTypeHandler.Builder extTypes = null;
        if (this._valueInstantiator.canCreateFromObjectWith()) {
            creatorProps = this._valueInstantiator.getFromObjectArguments(ctxt.getConfig());
            for (SettableBeanProperty prop : creatorProps) {
                if (prop.hasValueTypeDeserializer()) {
                    TypeDeserializer typeDeser = prop.getValueTypeDeserializer();
                    if (typeDeser.getTypeInclusion() == JsonTypeInfo.As.EXTERNAL_PROPERTY) {
                        if (extTypes == null) {
                            extTypes = new ExternalTypeHandler.Builder();
                        }
                        extTypes.addExternal(prop, typeDeser);
                    }
                }
            }
        } else {
            creatorProps = null;
        }
        UnwrappedPropertyHandler unwrapped = null;
        Iterator i$ = this._beanProperties.iterator();
        while (i$.hasNext()) {
            SettableBeanProperty origProp = i$.next();
            SettableBeanProperty prop2 = origProp;
            if (!prop2.hasValueDeserializer()) {
                JsonDeserializer<?> deser = findConvertingDeserializer(ctxt, prop2);
                if (deser == null) {
                    deser = findDeserializer(ctxt, prop2.getType(), prop2);
                }
                prop2 = prop2.withValueDeserializer(deser);
            } else {
                JsonDeserializer<?> deser2 = prop2.getValueDeserializer();
                JsonDeserializer<?> cd = ctxt.handlePrimaryContextualization(deser2, prop2, prop2.getType());
                if (cd != deser2) {
                    prop2 = prop2.withValueDeserializer(cd);
                }
            }
            SettableBeanProperty prop3 = _resolveManagedReferenceProperty(ctxt, prop2);
            if (!(prop3 instanceof ManagedReferenceProperty)) {
                prop3 = _resolvedObjectIdProperty(ctxt, prop3);
            }
            SettableBeanProperty u = _resolveUnwrappedProperty(ctxt, prop3);
            if (u != null) {
                if (unwrapped == null) {
                    unwrapped = new UnwrappedPropertyHandler();
                }
                unwrapped.addProperty(u);
                this._beanProperties.remove(u);
            } else {
                SettableBeanProperty prop4 = _resolveInnerClassValuedProperty(ctxt, prop3);
                if (prop4 != origProp) {
                    this._beanProperties.replace(prop4);
                    if (creatorProps != null) {
                        int i = 0;
                        int len = creatorProps.length;
                        while (true) {
                            if (i >= len) {
                                break;
                            }
                            if (creatorProps[i] != origProp) {
                                i++;
                            } else {
                                creatorProps[i] = prop4;
                                break;
                            }
                        }
                    }
                }
                if (prop4.hasValueTypeDeserializer()) {
                    TypeDeserializer typeDeser2 = prop4.getValueTypeDeserializer();
                    if (typeDeser2.getTypeInclusion() == JsonTypeInfo.As.EXTERNAL_PROPERTY) {
                        if (extTypes == null) {
                            extTypes = new ExternalTypeHandler.Builder();
                        }
                        extTypes.addExternal(prop4, typeDeser2);
                        this._beanProperties.remove(prop4);
                    }
                }
            }
        }
        if (this._anySetter != null && !this._anySetter.hasValueDeserializer()) {
            this._anySetter = this._anySetter.withValueDeserializer(findDeserializer(ctxt, this._anySetter.getType(), this._anySetter.getProperty()));
        }
        if (this._valueInstantiator.canCreateUsingDelegate()) {
            JavaType delegateType = this._valueInstantiator.getDelegateType(ctxt.getConfig());
            if (delegateType == null) {
                throw new IllegalArgumentException("Invalid delegate-creator definition for " + this._beanType + ": value instantiator (" + this._valueInstantiator.getClass().getName() + ") returned true for 'canCreateUsingDelegate()', but null for 'getDelegateType()'");
            }
            AnnotatedWithParams delegateCreator = this._valueInstantiator.getDelegateCreator();
            BeanProperty.Std property = new BeanProperty.Std(TEMP_PROPERTY_NAME, delegateType, (PropertyName) null, this._classAnnotations, delegateCreator, PropertyMetadata.STD_OPTIONAL);
            TypeDeserializer td = (TypeDeserializer) delegateType.getTypeHandler();
            if (td == null) {
                td = ctxt.getConfig().findTypeDeserializer(delegateType);
            }
            JsonDeserializer<Object> dd = findDeserializer(ctxt, delegateType, property);
            if (td != null) {
                dd = new TypeWrappedDeserializer(td.forProperty(property), dd);
            }
            this._delegateDeserializer = dd;
        }
        if (creatorProps != null) {
            this._propertyBasedCreator = PropertyBasedCreator.construct(ctxt, this._valueInstantiator, creatorProps);
        }
        if (extTypes != null) {
            this._externalTypeIdHandler = extTypes.build();
            this._nonStandardCreation = true;
        }
        this._unwrappedPropertyHandler = unwrapped;
        if (unwrapped != null) {
            this._nonStandardCreation = true;
        }
        this._vanillaProcessing = this._vanillaProcessing && !this._nonStandardCreation;
    }

    protected JsonDeserializer<Object> findConvertingDeserializer(DeserializationContext ctxt, SettableBeanProperty prop) throws JsonMappingException {
        Object convDef;
        AnnotationIntrospector intr = ctxt.getAnnotationIntrospector();
        if (intr != null && (convDef = intr.findDeserializationConverter(prop.getMember())) != null) {
            Converter<Object, Object> conv = ctxt.converterInstance(prop.getMember(), convDef);
            JavaType delegateType = conv.getInputType(ctxt.getTypeFactory());
            JsonDeserializer<?> ser = ctxt.findContextualValueDeserializer(delegateType, prop);
            return new StdDelegatingDeserializer(conv, delegateType, ser);
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.deser.ContextualDeserializer
    public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
        JsonFormat.Value format;
        String[] ignorals;
        ObjectIdInfo objectIdInfo;
        JavaType idType;
        SettableBeanProperty idProp;
        PropertyBasedObjectIdGenerator objectIdGeneratorInstance;
        ObjectIdReader oir = this._objectIdReader;
        AnnotationIntrospector intr = ctxt.getAnnotationIntrospector();
        AnnotatedMember accessor = (property == null || intr == null) ? null : property.getMember();
        if (accessor != null && intr != null && (objectIdInfo = intr.findObjectIdInfo(accessor)) != null) {
            ObjectIdInfo objectIdInfo2 = intr.findObjectReferenceInfo(accessor, objectIdInfo);
            Class<?> implClass = objectIdInfo2.getGeneratorType();
            ObjectIdResolver resolver = ctxt.objectIdResolverInstance(accessor, objectIdInfo2);
            if (implClass == ObjectIdGenerators.PropertyGenerator.class) {
                PropertyName propName = objectIdInfo2.getPropertyName();
                idProp = findProperty(propName);
                if (idProp == null) {
                    throw new IllegalArgumentException("Invalid Object Id definition for " + handledType().getName() + ": can not find property with name '" + propName + "'");
                }
                idType = idProp.getType();
                objectIdGeneratorInstance = new PropertyBasedObjectIdGenerator(objectIdInfo2.getScope());
            } else {
                JavaType type = ctxt.constructType(implClass);
                idType = ctxt.getTypeFactory().findTypeParameters(type, ObjectIdGenerator.class)[0];
                idProp = null;
                objectIdGeneratorInstance = ctxt.objectIdGeneratorInstance(accessor, objectIdInfo2);
            }
            JsonDeserializer<?> deser = ctxt.findRootValueDeserializer(idType);
            oir = ObjectIdReader.construct(idType, objectIdInfo2.getPropertyName(), objectIdGeneratorInstance, deser, idProp, resolver);
        }
        BeanDeserializerBase contextual = this;
        if (oir != null && oir != this._objectIdReader) {
            contextual = contextual.withObjectIdReader(oir);
        }
        if (accessor != null && (ignorals = intr.findPropertiesToIgnore(accessor, false)) != null && ignorals.length != 0) {
            HashSet<String> newIgnored = ArrayBuilders.setAndArray(contextual._ignorableProps, ignorals);
            contextual = contextual.withIgnorableProperties(newIgnored);
        }
        JsonFormat.Shape shape = null;
        if (accessor != null && (format = intr.findFormat(accessor)) != null) {
            shape = format.getShape();
        }
        if (shape == null) {
            shape = this._serializationShape;
        }
        if (shape == JsonFormat.Shape.ARRAY) {
            contextual = contextual.asArrayDeserializer();
        }
        return contextual;
    }

    protected SettableBeanProperty _resolveManagedReferenceProperty(DeserializationContext ctxt, SettableBeanProperty prop) {
        String refName = prop.getManagedReferenceName();
        if (refName == null) {
            return prop;
        }
        JsonDeserializer<?> valueDeser = prop.getValueDeserializer();
        SettableBeanProperty backProp = valueDeser.findBackReference(refName);
        if (backProp == null) {
            throw new IllegalArgumentException("Can not handle managed/back reference '" + refName + "': no back reference property found from type " + prop.getType());
        }
        JavaType referredType = this._beanType;
        JavaType backRefType = backProp.getType();
        boolean isContainer = prop.getType().isContainerType();
        if (!backRefType.getRawClass().isAssignableFrom(referredType.getRawClass())) {
            throw new IllegalArgumentException("Can not handle managed/back reference '" + refName + "': back reference type (" + backRefType.getRawClass().getName() + ") not compatible with managed type (" + referredType.getRawClass().getName() + ")");
        }
        return new ManagedReferenceProperty(prop, refName, backProp, this._classAnnotations, isContainer);
    }

    protected SettableBeanProperty _resolvedObjectIdProperty(DeserializationContext ctxt, SettableBeanProperty prop) {
        ObjectIdInfo objectIdInfo = prop.getObjectIdInfo();
        JsonDeserializer<Object> valueDeser = prop.getValueDeserializer();
        ObjectIdReader objectIdReader = valueDeser.getObjectIdReader();
        if (objectIdInfo == null && objectIdReader == null) {
            return prop;
        }
        return new ObjectIdReferenceProperty(prop, objectIdInfo);
    }

    protected SettableBeanProperty _resolveUnwrappedProperty(DeserializationContext ctxt, SettableBeanProperty prop) {
        NameTransformer unwrapper;
        JsonDeserializer<Object> orig;
        JsonDeserializer<Object> unwrapping;
        AnnotatedMember am = prop.getMember();
        if (am != null && (unwrapper = ctxt.getAnnotationIntrospector().findUnwrappingNameTransformer(am)) != null && (unwrapping = (orig = prop.getValueDeserializer()).unwrappingDeserializer(unwrapper)) != orig && unwrapping != null) {
            return prop.withValueDeserializer(unwrapping);
        }
        return null;
    }

    protected SettableBeanProperty _resolveInnerClassValuedProperty(DeserializationContext ctxt, SettableBeanProperty prop) {
        Class<?> valueClass;
        Class<?> enclosing;
        JsonDeserializer<Object> deser = prop.getValueDeserializer();
        if (deser instanceof BeanDeserializerBase) {
            BeanDeserializerBase bd = (BeanDeserializerBase) deser;
            ValueInstantiator vi = bd.getValueInstantiator();
            if (!vi.canCreateUsingDefault() && (enclosing = ClassUtil.getOuterClass((valueClass = prop.getType().getRawClass()))) != null && enclosing == this._beanType.getRawClass()) {
                Constructor<?>[] arr$ = valueClass.getConstructors();
                for (Constructor<?> ctor : arr$) {
                    Class<?>[] paramTypes = ctor.getParameterTypes();
                    if (paramTypes.length == 1 && paramTypes[0] == enclosing) {
                        if (ctxt.getConfig().canOverrideAccessModifiers()) {
                            ClassUtil.checkAndFixAccess(ctor);
                        }
                        return new InnerClassProperty(prop, ctor);
                    }
                }
            }
        }
        return prop;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public boolean isCachable() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Class<?> handledType() {
        return this._beanType.getRawClass();
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public ObjectIdReader getObjectIdReader() {
        return this._objectIdReader;
    }

    public boolean hasProperty(String propertyName) {
        return this._beanProperties.find(propertyName) != null;
    }

    public boolean hasViews() {
        return this._needViewProcesing;
    }

    public int getPropertyCount() {
        return this._beanProperties.size();
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Collection<Object> getKnownPropertyNames() {
        ArrayList<Object> names = new ArrayList<>();
        Iterator i$ = this._beanProperties.iterator();
        while (i$.hasNext()) {
            SettableBeanProperty prop = i$.next();
            names.add(prop.getName());
        }
        return names;
    }

    @Deprecated
    public final Class<?> getBeanClass() {
        return this._beanType.getRawClass();
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer
    public JavaType getValueType() {
        return this._beanType;
    }

    public Iterator<SettableBeanProperty> properties() {
        if (this._beanProperties == null) {
            throw new IllegalStateException("Can only call after BeanDeserializer has been resolved");
        }
        return this._beanProperties.iterator();
    }

    public Iterator<SettableBeanProperty> creatorProperties() {
        if (this._propertyBasedCreator == null) {
            return Collections.emptyList().iterator();
        }
        return this._propertyBasedCreator.properties().iterator();
    }

    public SettableBeanProperty findProperty(PropertyName propertyName) {
        return findProperty(propertyName.getSimpleName());
    }

    public SettableBeanProperty findProperty(String propertyName) {
        SettableBeanProperty prop = this._beanProperties == null ? null : this._beanProperties.find(propertyName);
        if (prop == null && this._propertyBasedCreator != null) {
            prop = this._propertyBasedCreator.findCreatorProperty(propertyName);
        }
        return prop;
    }

    public SettableBeanProperty findProperty(int propertyIndex) {
        SettableBeanProperty prop = this._beanProperties == null ? null : this._beanProperties.find(propertyIndex);
        if (prop == null && this._propertyBasedCreator != null) {
            prop = this._propertyBasedCreator.findCreatorProperty(propertyIndex);
        }
        return prop;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public SettableBeanProperty findBackReference(String logicalName) {
        if (this._backRefs == null) {
            return null;
        }
        return this._backRefs.get(logicalName);
    }

    public ValueInstantiator getValueInstantiator() {
        return this._valueInstantiator;
    }

    public void replaceProperty(SettableBeanProperty original, SettableBeanProperty replacement) {
        this._beanProperties.replace(replacement);
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser p, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
        Object id;
        if (this._objectIdReader != null) {
            if (p.canReadObjectId() && (id = p.getObjectId()) != null) {
                Object ob = typeDeserializer.deserializeTypedFromObject(p, ctxt);
                return _handleTypedObjectId(p, ctxt, ob, id);
            }
            JsonToken t = p.getCurrentToken();
            if (t != null) {
                if (t.isScalarValue()) {
                    return deserializeFromObjectId(p, ctxt);
                }
                if (t == JsonToken.START_OBJECT) {
                    t = p.nextToken();
                }
                if (t == JsonToken.FIELD_NAME && this._objectIdReader.maySerializeAsObject() && this._objectIdReader.isValidReferencePropertyName(p.getCurrentName(), p)) {
                    return deserializeFromObjectId(p, ctxt);
                }
            }
        }
        return typeDeserializer.deserializeTypedFromObject(p, ctxt);
    }

    protected Object _handleTypedObjectId(JsonParser jp, DeserializationContext ctxt, Object pojo, Object rawId) throws IOException {
        Object id;
        JsonDeserializer<Object> idDeser = this._objectIdReader.getDeserializer();
        if (idDeser.handledType() == rawId.getClass()) {
            id = rawId;
        } else {
            id = _convertObjectId(jp, ctxt, rawId, idDeser);
        }
        ReadableObjectId roid = ctxt.findObjectId(id, this._objectIdReader.generator, this._objectIdReader.resolver);
        roid.bindItem(pojo);
        SettableBeanProperty idProp = this._objectIdReader.idProperty;
        if (idProp != null) {
            return idProp.setAndReturn(pojo, id);
        }
        return pojo;
    }

    protected Object _convertObjectId(JsonParser jp, DeserializationContext ctxt, Object rawId, JsonDeserializer<Object> idDeser) throws IOException {
        TokenBuffer buf = new TokenBuffer(jp);
        if (rawId instanceof String) {
            buf.writeString((String) rawId);
        } else if (rawId instanceof Long) {
            buf.writeNumber(((Long) rawId).longValue());
        } else if (rawId instanceof Integer) {
            buf.writeNumber(((Integer) rawId).intValue());
        } else {
            buf.writeObject(rawId);
        }
        JsonParser bufParser = buf.asParser();
        bufParser.nextToken();
        return idDeser.deserialize(bufParser, ctxt);
    }

    protected Object deserializeWithObjectId(JsonParser jp, DeserializationContext ctxt) throws IOException {
        return deserializeFromObject(jp, ctxt);
    }

    protected Object deserializeFromObjectId(JsonParser jp, DeserializationContext ctxt) throws IOException {
        Object id = this._objectIdReader.readObjectReference(jp, ctxt);
        ReadableObjectId roid = ctxt.findObjectId(id, this._objectIdReader.generator, this._objectIdReader.resolver);
        Object pojo = roid.resolve();
        if (pojo == null) {
            throw new UnresolvedForwardReference("Could not resolve Object Id [" + id + "] (for " + this._beanType + ").", jp.getCurrentLocation(), roid);
        }
        return pojo;
    }

    protected Object deserializeFromObjectUsingNonDefault(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (this._delegateDeserializer != null) {
            return this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(jp, ctxt));
        }
        if (this._propertyBasedCreator != null) {
            return _deserializeUsingPropertyBased(jp, ctxt);
        }
        if (this._beanType.isAbstract()) {
            throw JsonMappingException.from(jp, "Can not instantiate abstract type " + this._beanType + " (need to add/enable type information?)");
        }
        throw JsonMappingException.from(jp, "No suitable constructor found for type " + this._beanType + ": can not instantiate from JSON object (missing default constructor or creator, or perhaps need to add/enable type information?)");
    }

    public Object deserializeFromNumber(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (this._objectIdReader != null) {
            return deserializeFromObjectId(jp, ctxt);
        }
        switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[jp.getNumberType().ordinal()]) {
            case 1:
                if (this._delegateDeserializer != null && !this._valueInstantiator.canCreateFromInt()) {
                    Object bean = this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(jp, ctxt));
                    if (this._injectables != null) {
                        injectValues(ctxt, bean);
                    }
                    return bean;
                }
                return this._valueInstantiator.createFromInt(ctxt, jp.getIntValue());
            case 2:
                if (this._delegateDeserializer != null && !this._valueInstantiator.canCreateFromInt()) {
                    Object bean2 = this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(jp, ctxt));
                    if (this._injectables != null) {
                        injectValues(ctxt, bean2);
                    }
                    return bean2;
                }
                return this._valueInstantiator.createFromLong(ctxt, jp.getLongValue());
            default:
                if (this._delegateDeserializer != null) {
                    Object bean3 = this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(jp, ctxt));
                    if (this._injectables != null) {
                        injectValues(ctxt, bean3);
                    }
                    return bean3;
                }
                throw ctxt.instantiationException(handledType(), "no suitable creator method found to deserialize from JSON integer number");
        }
    }

    /* renamed from: com.fasterxml.jackson.databind.deser.BeanDeserializerBase$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/BeanDeserializerBase$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType = new int[JsonParser.NumberType.values().length];

        static {
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[JsonParser.NumberType.INT.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[JsonParser.NumberType.LONG.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[JsonParser.NumberType.FLOAT.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[JsonParser.NumberType.DOUBLE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    public Object deserializeFromString(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (this._objectIdReader != null) {
            return deserializeFromObjectId(p, ctxt);
        }
        if (this._delegateDeserializer != null && !this._valueInstantiator.canCreateFromString()) {
            Object bean = this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(p, ctxt));
            if (this._injectables != null) {
                injectValues(ctxt, bean);
            }
            return bean;
        }
        return this._valueInstantiator.createFromString(ctxt, p.getText());
    }

    public Object deserializeFromDouble(JsonParser p, DeserializationContext ctxt) throws IOException {
        switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[p.getNumberType().ordinal()]) {
            case 3:
            case 4:
                if (this._delegateDeserializer != null && !this._valueInstantiator.canCreateFromDouble()) {
                    Object bean = this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(p, ctxt));
                    if (this._injectables != null) {
                        injectValues(ctxt, bean);
                    }
                    return bean;
                }
                return this._valueInstantiator.createFromDouble(ctxt, p.getDoubleValue());
            default:
                if (this._delegateDeserializer != null) {
                    return this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(p, ctxt));
                }
                throw ctxt.instantiationException(handledType(), "no suitable creator method found to deserialize from JSON floating-point number");
        }
    }

    public Object deserializeFromBoolean(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (this._delegateDeserializer != null && !this._valueInstantiator.canCreateFromBoolean()) {
            Object bean = this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(p, ctxt));
            if (this._injectables != null) {
                injectValues(ctxt, bean);
            }
            return bean;
        }
        boolean value = p.getCurrentToken() == JsonToken.VALUE_TRUE;
        return this._valueInstantiator.createFromBoolean(ctxt, value);
    }

    public Object deserializeFromArray(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (this._delegateDeserializer != null) {
            try {
                Object bean = this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(p, ctxt));
                if (this._injectables != null) {
                    injectValues(ctxt, bean);
                }
                return bean;
            } catch (Exception e) {
                wrapInstantiationProblem(e, ctxt);
            }
        }
        if (ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            JsonToken t = p.nextToken();
            if (t == JsonToken.END_ARRAY && ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_ARRAY_AS_NULL_OBJECT)) {
                return null;
            }
            Object value = deserialize(p, ctxt);
            if (p.nextToken() != JsonToken.END_ARRAY) {
                throw ctxt.wrongTokenException(p, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single '" + this._valueClass.getName() + "' value but there was more than a single value in the array");
            }
            return value;
        }
        if (ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_ARRAY_AS_NULL_OBJECT)) {
            JsonToken t2 = p.nextToken();
            if (t2 == JsonToken.END_ARRAY) {
                return null;
            }
            throw ctxt.mappingException(handledType(), JsonToken.START_ARRAY);
        }
        throw ctxt.mappingException(handledType());
    }

    public Object deserializeFromEmbedded(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (this._objectIdReader != null) {
            return deserializeFromObjectId(jp, ctxt);
        }
        return jp.getEmbeddedObject();
    }

    protected void injectValues(DeserializationContext ctxt, Object bean) throws IOException, JsonProcessingException {
        ValueInjector[] arr$ = this._injectables;
        for (ValueInjector injector : arr$) {
            injector.inject(ctxt, bean);
        }
    }

    protected Object handleUnknownProperties(DeserializationContext ctxt, Object bean, TokenBuffer unknownTokens) throws IOException, JsonProcessingException {
        unknownTokens.writeEndObject();
        JsonParser bufferParser = unknownTokens.asParser();
        while (bufferParser.nextToken() != JsonToken.END_OBJECT) {
            String propName = bufferParser.getCurrentName();
            bufferParser.nextToken();
            handleUnknownProperty(bufferParser, ctxt, bean, propName);
        }
        return bean;
    }

    protected void handleUnknownVanilla(JsonParser jp, DeserializationContext ctxt, Object bean, String propName) throws IOException, JsonProcessingException {
        if (this._ignorableProps != null && this._ignorableProps.contains(propName)) {
            handleIgnoredProperty(jp, ctxt, bean, propName);
            return;
        }
        if (this._anySetter != null) {
            try {
                this._anySetter.deserializeAndSet(jp, ctxt, bean, propName);
                return;
            } catch (Exception e) {
                wrapAndThrow(e, bean, propName, ctxt);
                return;
            }
        }
        handleUnknownProperty(jp, ctxt, bean, propName);
    }

    @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer
    protected void handleUnknownProperty(JsonParser jp, DeserializationContext ctxt, Object beanOrClass, String propName) throws IOException, JsonProcessingException {
        if (this._ignoreAllUnknown) {
            jp.skipChildren();
            return;
        }
        if (this._ignorableProps != null && this._ignorableProps.contains(propName)) {
            handleIgnoredProperty(jp, ctxt, beanOrClass, propName);
        }
        super.handleUnknownProperty(jp, ctxt, beanOrClass, propName);
    }

    protected void handleIgnoredProperty(JsonParser jp, DeserializationContext ctxt, Object beanOrClass, String propName) throws IOException, JsonProcessingException {
        if (ctxt.isEnabled(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES)) {
            throw IgnoredPropertyException.from(jp, beanOrClass, propName, getKnownPropertyNames());
        }
        jp.skipChildren();
    }

    protected Object handlePolymorphic(JsonParser jp, DeserializationContext ctxt, Object bean, TokenBuffer unknownTokens) throws IOException, JsonProcessingException {
        JsonDeserializer<Object> subDeser = _findSubclassDeserializer(ctxt, bean, unknownTokens);
        if (subDeser != null) {
            if (unknownTokens != null) {
                unknownTokens.writeEndObject();
                JsonParser p2 = unknownTokens.asParser();
                p2.nextToken();
                bean = subDeser.deserialize(p2, ctxt, bean);
            }
            if (jp != null) {
                bean = subDeser.deserialize(jp, ctxt, bean);
            }
            return bean;
        }
        if (unknownTokens != null) {
            bean = handleUnknownProperties(ctxt, bean, unknownTokens);
        }
        if (jp != null) {
            bean = deserialize(jp, ctxt, bean);
        }
        return bean;
    }

    protected JsonDeserializer<Object> _findSubclassDeserializer(DeserializationContext ctxt, Object bean, TokenBuffer unknownTokens) throws IOException, JsonProcessingException {
        JsonDeserializer<Object> subDeser;
        synchronized (this) {
            subDeser = this._subDeserializers == null ? null : this._subDeserializers.get(new ClassKey(bean.getClass()));
        }
        if (subDeser != null) {
            return subDeser;
        }
        JavaType type = ctxt.constructType(bean.getClass());
        JsonDeserializer<Object> subDeser2 = ctxt.findRootValueDeserializer(type);
        if (subDeser2 != null) {
            synchronized (this) {
                if (this._subDeserializers == null) {
                    this._subDeserializers = new HashMap<>();
                }
                this._subDeserializers.put(new ClassKey(bean.getClass()), subDeser2);
            }
        }
        return subDeser2;
    }

    public void wrapAndThrow(Throwable t, Object bean, String fieldName, DeserializationContext ctxt) throws IOException {
        throw JsonMappingException.wrapWithPath(throwOrReturnThrowable(t, ctxt), bean, fieldName);
    }

    @Deprecated
    public void wrapAndThrow(Throwable t, Object bean, int index, DeserializationContext ctxt) throws IOException {
        throw JsonMappingException.wrapWithPath(throwOrReturnThrowable(t, ctxt), bean, index);
    }

    private Throwable throwOrReturnThrowable(Throwable t, DeserializationContext ctxt) throws IOException {
        while ((t instanceof InvocationTargetException) && t.getCause() != null) {
            t = t.getCause();
        }
        if (t instanceof Error) {
            throw ((Error) t);
        }
        boolean wrap = ctxt == null || ctxt.isEnabled(DeserializationFeature.WRAP_EXCEPTIONS);
        if (t instanceof IOException) {
            if (!wrap || !(t instanceof JsonProcessingException)) {
                throw ((IOException) t);
            }
        } else if (!wrap && (t instanceof RuntimeException)) {
            throw ((RuntimeException) t);
        }
        return t;
    }

    protected void wrapInstantiationProblem(Throwable t, DeserializationContext ctxt) throws IOException {
        while ((t instanceof InvocationTargetException) && t.getCause() != null) {
            t = t.getCause();
        }
        if (t instanceof Error) {
            throw ((Error) t);
        }
        boolean wrap = ctxt == null || ctxt.isEnabled(DeserializationFeature.WRAP_EXCEPTIONS);
        if (t instanceof IOException) {
            throw ((IOException) t);
        }
        if (!wrap && (t instanceof RuntimeException)) {
            throw ((RuntimeException) t);
        }
        throw ctxt.instantiationException(this._beanType.getRawClass(), t);
    }
}
