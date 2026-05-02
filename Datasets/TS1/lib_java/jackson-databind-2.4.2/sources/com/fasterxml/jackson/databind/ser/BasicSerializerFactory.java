package com.fasterxml.jackson.databind.ser;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializable;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.cfg.SerializerFactoryConfig;
import com.fasterxml.jackson.databind.ext.OptionalHandlerFactory;
import com.fasterxml.jackson.databind.introspect.Annotated;
import com.fasterxml.jackson.databind.introspect.AnnotatedClass;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.introspect.BasicBeanDescription;
import com.fasterxml.jackson.databind.jsontype.NamedType;
import com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.impl.IndexedListSerializer;
import com.fasterxml.jackson.databind.ser.impl.IndexedStringListSerializer;
import com.fasterxml.jackson.databind.ser.impl.IteratorSerializer;
import com.fasterxml.jackson.databind.ser.impl.StringArraySerializer;
import com.fasterxml.jackson.databind.ser.impl.StringCollectionSerializer;
import com.fasterxml.jackson.databind.ser.std.BooleanSerializer;
import com.fasterxml.jackson.databind.ser.std.ByteBufferSerializer;
import com.fasterxml.jackson.databind.ser.std.CalendarSerializer;
import com.fasterxml.jackson.databind.ser.std.CollectionSerializer;
import com.fasterxml.jackson.databind.ser.std.DateSerializer;
import com.fasterxml.jackson.databind.ser.std.EnumMapSerializer;
import com.fasterxml.jackson.databind.ser.std.EnumSerializer;
import com.fasterxml.jackson.databind.ser.std.EnumSetSerializer;
import com.fasterxml.jackson.databind.ser.std.InetAddressSerializer;
import com.fasterxml.jackson.databind.ser.std.InetSocketAddressSerializer;
import com.fasterxml.jackson.databind.ser.std.IterableSerializer;
import com.fasterxml.jackson.databind.ser.std.JsonValueSerializer;
import com.fasterxml.jackson.databind.ser.std.MapSerializer;
import com.fasterxml.jackson.databind.ser.std.NumberSerializer;
import com.fasterxml.jackson.databind.ser.std.NumberSerializers;
import com.fasterxml.jackson.databind.ser.std.ObjectArraySerializer;
import com.fasterxml.jackson.databind.ser.std.SerializableSerializer;
import com.fasterxml.jackson.databind.ser.std.SqlDateSerializer;
import com.fasterxml.jackson.databind.ser.std.SqlTimeSerializer;
import com.fasterxml.jackson.databind.ser.std.StdArraySerializers;
import com.fasterxml.jackson.databind.ser.std.StdDelegatingSerializer;
import com.fasterxml.jackson.databind.ser.std.StdJdkSerializers;
import com.fasterxml.jackson.databind.ser.std.StdKeySerializers;
import com.fasterxml.jackson.databind.ser.std.StringSerializer;
import com.fasterxml.jackson.databind.ser.std.TimeZoneSerializer;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.fasterxml.jackson.databind.ser.std.TokenBufferSerializer;
import com.fasterxml.jackson.databind.type.ArrayType;
import com.fasterxml.jackson.databind.type.CollectionLikeType;
import com.fasterxml.jackson.databind.type.CollectionType;
import com.fasterxml.jackson.databind.type.MapLikeType;
import com.fasterxml.jackson.databind.type.MapType;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.Converter;
import com.fasterxml.jackson.databind.util.EnumValues;
import com.fasterxml.jackson.databind.util.TokenBuffer;
import java.io.Serializable;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.RandomAccess;
import java.util.TimeZone;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/BasicSerializerFactory.class */
public abstract class BasicSerializerFactory extends SerializerFactory implements Serializable {
    protected static final HashMap<String, JsonSerializer<?>> _concrete = new HashMap<>();
    protected static final HashMap<String, Class<? extends JsonSerializer<?>>> _concreteLazy = new HashMap<>();
    protected final SerializerFactoryConfig _factoryConfig;

    public abstract SerializerFactory withConfig(SerializerFactoryConfig serializerFactoryConfig);

    @Override // com.fasterxml.jackson.databind.ser.SerializerFactory
    public abstract JsonSerializer<Object> createSerializer(SerializerProvider serializerProvider, JavaType javaType) throws JsonMappingException;

    protected abstract Iterable<Serializers> customSerializers();

    static {
        _concrete.put(String.class.getName(), new StringSerializer());
        ToStringSerializer sls = ToStringSerializer.instance;
        _concrete.put(StringBuffer.class.getName(), sls);
        _concrete.put(StringBuilder.class.getName(), sls);
        _concrete.put(Character.class.getName(), sls);
        _concrete.put(Character.TYPE.getName(), sls);
        NumberSerializers.addAll(_concrete);
        _concrete.put(Boolean.TYPE.getName(), new BooleanSerializer(true));
        _concrete.put(Boolean.class.getName(), new BooleanSerializer(false));
        JsonSerializer<?> ns = NumberSerializer.instance;
        _concrete.put(BigInteger.class.getName(), ns);
        _concrete.put(BigDecimal.class.getName(), ns);
        _concrete.put(Calendar.class.getName(), CalendarSerializer.instance);
        DateSerializer dateSer = DateSerializer.instance;
        _concrete.put(Date.class.getName(), dateSer);
        _concrete.put(Timestamp.class.getName(), dateSer);
        _concreteLazy.put(java.sql.Date.class.getName(), SqlDateSerializer.class);
        _concreteLazy.put(Time.class.getName(), SqlTimeSerializer.class);
        for (Map.Entry<Class<?>, Object> en : StdJdkSerializers.all()) {
            Object value = en.getValue();
            if (value instanceof JsonSerializer) {
                _concrete.put(en.getKey().getName(), (JsonSerializer) value);
            } else if (value instanceof Class) {
                Class<? extends JsonSerializer<?>> cls = (Class) value;
                _concreteLazy.put(en.getKey().getName(), cls);
            } else {
                throw new IllegalStateException("Internal error: unrecognized value of type " + en.getClass().getName());
            }
        }
        _concreteLazy.put(TokenBuffer.class.getName(), TokenBufferSerializer.class);
    }

    protected BasicSerializerFactory(SerializerFactoryConfig config) {
        this._factoryConfig = config == null ? new SerializerFactoryConfig() : config;
    }

    public SerializerFactoryConfig getFactoryConfig() {
        return this._factoryConfig;
    }

    @Override // com.fasterxml.jackson.databind.ser.SerializerFactory
    public final SerializerFactory withAdditionalSerializers(Serializers additional) {
        return withConfig(this._factoryConfig.withAdditionalSerializers(additional));
    }

    @Override // com.fasterxml.jackson.databind.ser.SerializerFactory
    public final SerializerFactory withAdditionalKeySerializers(Serializers additional) {
        return withConfig(this._factoryConfig.withAdditionalKeySerializers(additional));
    }

    @Override // com.fasterxml.jackson.databind.ser.SerializerFactory
    public final SerializerFactory withSerializerModifier(BeanSerializerModifier modifier) {
        return withConfig(this._factoryConfig.withSerializerModifier(modifier));
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.fasterxml.jackson.databind.ser.SerializerFactory
    public JsonSerializer<Object> createKeySerializer(SerializationConfig config, JavaType keyType, JsonSerializer<Object> defaultImpl) {
        BeanDescription beanDesc = config.introspectClassAnnotations(keyType.getRawClass());
        JsonSerializer<Object> jsonSerializer = null;
        if (this._factoryConfig.hasKeySerializers()) {
            for (Serializers serializers : this._factoryConfig.keySerializers()) {
                jsonSerializer = serializers.findSerializer(config, keyType, beanDesc);
                if (jsonSerializer != null) {
                    break;
                }
            }
        }
        if (jsonSerializer == null) {
            jsonSerializer = defaultImpl;
            if (jsonSerializer == null) {
                jsonSerializer = StdKeySerializers.getStdKeySerializer(keyType);
            }
        }
        if (this._factoryConfig.hasSerializerModifiers()) {
            Iterator i$ = this._factoryConfig.serializerModifiers().iterator();
            while (i$.hasNext()) {
                jsonSerializer = i$.next().modifyKeySerializer(config, keyType, beanDesc, jsonSerializer);
            }
        }
        return jsonSerializer;
    }

    @Override // com.fasterxml.jackson.databind.ser.SerializerFactory
    public TypeSerializer createTypeSerializer(SerializationConfig config, JavaType baseType) {
        BeanDescription bean = config.introspectClassAnnotations(baseType.getRawClass());
        AnnotatedClass ac = bean.getClassInfo();
        AnnotationIntrospector ai = config.getAnnotationIntrospector();
        TypeResolverBuilder<?> b = ai.findTypeResolver(config, ac, baseType);
        Collection<NamedType> subtypes = null;
        if (b == null) {
            b = config.getDefaultTyper(baseType);
        } else {
            subtypes = config.getSubtypeResolver().collectAndResolveSubtypes(ac, config, ai);
        }
        if (b == null) {
            return null;
        }
        return b.buildTypeSerializer(config, baseType, subtypes);
    }

    protected final JsonSerializer<?> findSerializerByLookup(JavaType type, SerializationConfig config, BeanDescription beanDesc, boolean staticTyping) {
        Class<? extends JsonSerializer<?>> serClass;
        Class<?> raw = type.getRawClass();
        String clsName = raw.getName();
        JsonSerializer<?> ser = _concrete.get(clsName);
        if (ser == null && (serClass = _concreteLazy.get(clsName)) != null) {
            try {
                return serClass.newInstance();
            } catch (Exception e) {
                throw new IllegalStateException("Failed to instantiate standard serializer (of type " + serClass.getName() + "): " + e.getMessage(), e);
            }
        }
        return ser;
    }

    protected final JsonSerializer<?> findSerializerByAnnotations(SerializerProvider prov, JavaType type, BeanDescription beanDesc) throws JsonMappingException {
        Class<?> raw = type.getRawClass();
        if (JsonSerializable.class.isAssignableFrom(raw)) {
            return SerializableSerializer.instance;
        }
        AnnotatedMethod valueMethod = beanDesc.findJsonValueMethod();
        if (valueMethod != null) {
            Method m = valueMethod.getAnnotated();
            if (prov.canOverrideAccessModifiers()) {
                ClassUtil.checkAndFixAccess(m);
            }
            JsonSerializer<Object> ser = findSerializerFromAnnotation(prov, valueMethod);
            return new JsonValueSerializer(m, ser);
        }
        return null;
    }

    protected final JsonSerializer<?> findSerializerByPrimaryType(SerializerProvider prov, JavaType type, BeanDescription beanDesc, boolean staticTyping) throws JsonMappingException {
        Class<?> raw = type.getRawClass();
        JsonSerializer<?> ser = findOptionalStdSerializer(prov, type, beanDesc, staticTyping);
        if (ser != null) {
            return ser;
        }
        if (Calendar.class.isAssignableFrom(raw)) {
            return CalendarSerializer.instance;
        }
        if (Date.class.isAssignableFrom(raw)) {
            return DateSerializer.instance;
        }
        if (ByteBuffer.class.isAssignableFrom(raw)) {
            return new ByteBufferSerializer();
        }
        if (InetAddress.class.isAssignableFrom(raw)) {
            return new InetAddressSerializer();
        }
        if (InetSocketAddress.class.isAssignableFrom(raw)) {
            return new InetSocketAddressSerializer();
        }
        if (TimeZone.class.isAssignableFrom(raw)) {
            return new TimeZoneSerializer();
        }
        if (Charset.class.isAssignableFrom(raw)) {
            return ToStringSerializer.instance;
        }
        if (Number.class.isAssignableFrom(raw)) {
            JsonFormat.Value format = beanDesc.findExpectedFormat(null);
            if (format != null) {
                switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape[format.getShape().ordinal()]) {
                    case 1:
                        return ToStringSerializer.instance;
                    case 2:
                    case 3:
                        return null;
                }
            }
            return NumberSerializer.instance;
        }
        if (Enum.class.isAssignableFrom(raw)) {
            return buildEnumSerializer(prov.getConfig(), type, beanDesc);
        }
        return null;
    }

    /* renamed from: com.fasterxml.jackson.databind.ser.BasicSerializerFactory$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/BasicSerializerFactory$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape = new int[JsonFormat.Shape.values().length];

        static {
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape[JsonFormat.Shape.STRING.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape[JsonFormat.Shape.OBJECT.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape[JsonFormat.Shape.ARRAY.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    protected JsonSerializer<?> findOptionalStdSerializer(SerializerProvider prov, JavaType type, BeanDescription beanDesc, boolean staticTyping) throws JsonMappingException {
        return OptionalHandlerFactory.instance.findSerializer(prov.getConfig(), type, beanDesc);
    }

    protected final JsonSerializer<?> findSerializerByAddonType(SerializationConfig config, JavaType javaType, BeanDescription beanDesc, boolean staticTyping) throws JsonMappingException {
        Class<?> type = javaType.getRawClass();
        if (Iterator.class.isAssignableFrom(type)) {
            return buildIteratorSerializer(config, javaType, beanDesc, staticTyping);
        }
        if (Iterable.class.isAssignableFrom(type)) {
            return buildIterableSerializer(config, javaType, beanDesc, staticTyping);
        }
        if (CharSequence.class.isAssignableFrom(type)) {
            return ToStringSerializer.instance;
        }
        return null;
    }

    protected JsonSerializer<Object> findSerializerFromAnnotation(SerializerProvider prov, Annotated a) throws JsonMappingException {
        Object serDef = prov.getAnnotationIntrospector().findSerializer(a);
        if (serDef == null) {
            return null;
        }
        JsonSerializer<Object> ser = prov.serializerInstance(a, serDef);
        return findConvertingSerializer(prov, a, ser);
    }

    protected JsonSerializer<?> findConvertingSerializer(SerializerProvider prov, Annotated a, JsonSerializer<?> ser) throws JsonMappingException {
        Converter<Object, Object> conv = findConverter(prov, a);
        if (conv == null) {
            return ser;
        }
        JavaType delegateType = conv.getOutputType(prov.getTypeFactory());
        return new StdDelegatingSerializer(conv, delegateType, ser);
    }

    protected Converter<Object, Object> findConverter(SerializerProvider prov, Annotated a) throws JsonMappingException {
        Object convDef = prov.getAnnotationIntrospector().findSerializationConverter(a);
        if (convDef == null) {
            return null;
        }
        return prov.converterInstance(a, convDef);
    }

    protected JsonSerializer<?> buildContainerSerializer(SerializerProvider prov, JavaType type, BeanDescription beanDesc, boolean staticTyping) throws JsonMappingException {
        SerializationConfig config = prov.getConfig();
        if (!staticTyping && type.useStaticType() && (!type.isContainerType() || type.mo3getContentType().getRawClass() != Object.class)) {
            staticTyping = true;
        }
        JavaType elementType = type.mo3getContentType();
        TypeSerializer elementTypeSerializer = createTypeSerializer(config, elementType);
        if (elementTypeSerializer != null) {
            staticTyping = false;
        }
        JsonSerializer<Object> elementValueSerializer = _findContentSerializer(prov, beanDesc.getClassInfo());
        if (type.isMapLikeType()) {
            MapLikeType mlt = (MapLikeType) type;
            JsonSerializer<Object> keySerializer = _findKeySerializer(prov, beanDesc.getClassInfo());
            if (mlt.isTrueMapType()) {
                return buildMapSerializer(config, (MapType) mlt, beanDesc, staticTyping, keySerializer, elementTypeSerializer, elementValueSerializer);
            }
            for (Serializers serializers : customSerializers()) {
                MapLikeType mlType = (MapLikeType) type;
                JsonSerializer<?> ser = serializers.findMapLikeSerializer(config, mlType, beanDesc, keySerializer, elementTypeSerializer, elementValueSerializer);
                if (ser != null) {
                    if (this._factoryConfig.hasSerializerModifiers()) {
                        for (BeanSerializerModifier mod : this._factoryConfig.serializerModifiers()) {
                            ser = mod.modifyMapLikeSerializer(config, mlType, beanDesc, ser);
                        }
                    }
                    return ser;
                }
            }
            return null;
        }
        if (type.isCollectionLikeType()) {
            CollectionLikeType clt = (CollectionLikeType) type;
            if (clt.isTrueCollectionType()) {
                return buildCollectionSerializer(config, (CollectionType) clt, beanDesc, staticTyping, elementTypeSerializer, elementValueSerializer);
            }
            CollectionLikeType clType = (CollectionLikeType) type;
            for (Serializers serializers2 : customSerializers()) {
                JsonSerializer<?> ser2 = serializers2.findCollectionLikeSerializer(config, clType, beanDesc, elementTypeSerializer, elementValueSerializer);
                if (ser2 != null) {
                    if (this._factoryConfig.hasSerializerModifiers()) {
                        for (BeanSerializerModifier mod2 : this._factoryConfig.serializerModifiers()) {
                            ser2 = mod2.modifyCollectionLikeSerializer(config, clType, beanDesc, ser2);
                        }
                    }
                    return ser2;
                }
            }
            return null;
        }
        if (type.isArrayType()) {
            return buildArraySerializer(config, (ArrayType) type, beanDesc, staticTyping, elementTypeSerializer, elementValueSerializer);
        }
        return null;
    }

    protected JsonSerializer<?> buildCollectionSerializer(SerializationConfig config, CollectionType type, BeanDescription beanDesc, boolean staticTyping, TypeSerializer elementTypeSerializer, JsonSerializer<Object> elementValueSerializer) throws JsonMappingException {
        JsonSerializer<?> ser = null;
        for (Serializers serializers : customSerializers()) {
            ser = serializers.findCollectionSerializer(config, type, beanDesc, elementTypeSerializer, elementValueSerializer);
            if (ser != null) {
                break;
            }
        }
        if (ser == null) {
            JsonFormat.Value format = beanDesc.findExpectedFormat(null);
            if (format != null && format.getShape() == JsonFormat.Shape.OBJECT) {
                return null;
            }
            Class<?> raw = type.getRawClass();
            if (EnumSet.class.isAssignableFrom(raw)) {
                JavaType enumType = type.mo3getContentType();
                if (!enumType.isEnumType()) {
                    enumType = null;
                }
                ser = buildEnumSetSerializer(enumType);
            } else {
                Class<?> elementRaw = type.mo3getContentType().getRawClass();
                if (isIndexedList(raw)) {
                    if (elementRaw == String.class) {
                        if (elementValueSerializer == null || ClassUtil.isJacksonStdImpl(elementValueSerializer)) {
                            ser = IndexedStringListSerializer.instance;
                        }
                    } else {
                        ser = buildIndexedListSerializer(type.mo3getContentType(), staticTyping, elementTypeSerializer, elementValueSerializer);
                    }
                } else if (elementRaw == String.class && (elementValueSerializer == null || ClassUtil.isJacksonStdImpl(elementValueSerializer))) {
                    ser = StringCollectionSerializer.instance;
                }
                if (ser == null) {
                    ser = buildCollectionSerializer(type.mo3getContentType(), staticTyping, elementTypeSerializer, elementValueSerializer);
                }
            }
        }
        if (this._factoryConfig.hasSerializerModifiers()) {
            for (BeanSerializerModifier mod : this._factoryConfig.serializerModifiers()) {
                ser = mod.modifyCollectionSerializer(config, type, beanDesc, ser);
            }
        }
        return ser;
    }

    protected boolean isIndexedList(Class<?> cls) {
        return RandomAccess.class.isAssignableFrom(cls);
    }

    public ContainerSerializer<?> buildIndexedListSerializer(JavaType elemType, boolean staticTyping, TypeSerializer vts, JsonSerializer<Object> valueSerializer) {
        return new IndexedListSerializer(elemType, staticTyping, vts, null, valueSerializer);
    }

    public ContainerSerializer<?> buildCollectionSerializer(JavaType elemType, boolean staticTyping, TypeSerializer vts, JsonSerializer<Object> valueSerializer) {
        return new CollectionSerializer(elemType, staticTyping, vts, null, valueSerializer);
    }

    public JsonSerializer<?> buildEnumSetSerializer(JavaType enumType) {
        return new EnumSetSerializer(enumType, null);
    }

    protected JsonSerializer<?> buildMapSerializer(SerializationConfig config, MapType type, BeanDescription beanDesc, boolean staticTyping, JsonSerializer<Object> keySerializer, TypeSerializer elementTypeSerializer, JsonSerializer<Object> elementValueSerializer) throws JsonMappingException {
        JsonSerializer<?> ser = null;
        for (Serializers serializers : customSerializers()) {
            ser = serializers.findMapSerializer(config, type, beanDesc, keySerializer, elementTypeSerializer, elementValueSerializer);
            if (ser != null) {
                break;
            }
        }
        if (ser == null) {
            if (EnumMap.class.isAssignableFrom(type.getRawClass())) {
                JavaType keyType = type.mo4getKeyType();
                EnumValues enums = null;
                if (keyType.isEnumType()) {
                    enums = EnumValues.construct(config, keyType.getRawClass());
                }
                ser = new EnumMapSerializer(type.mo3getContentType(), staticTyping, enums, elementTypeSerializer, elementValueSerializer);
            } else {
                Object filterId = findFilterId(config, beanDesc);
                ser = MapSerializer.construct(config.getAnnotationIntrospector().findPropertiesToIgnore(beanDesc.getClassInfo()), type, staticTyping, elementTypeSerializer, keySerializer, elementValueSerializer, filterId);
            }
        }
        if (this._factoryConfig.hasSerializerModifiers()) {
            for (BeanSerializerModifier mod : this._factoryConfig.serializerModifiers()) {
                ser = mod.modifyMapSerializer(config, type, beanDesc, ser);
            }
        }
        return ser;
    }

    protected JsonSerializer<?> buildArraySerializer(SerializationConfig config, ArrayType type, BeanDescription beanDesc, boolean staticTyping, TypeSerializer elementTypeSerializer, JsonSerializer<Object> elementValueSerializer) throws JsonMappingException {
        JsonSerializer<?> ser = null;
        for (Serializers serializers : customSerializers()) {
            ser = serializers.findArraySerializer(config, type, beanDesc, elementTypeSerializer, elementValueSerializer);
            if (ser != null) {
                break;
            }
        }
        if (ser == null) {
            Class<?> raw = type.getRawClass();
            if (elementValueSerializer == null || ClassUtil.isJacksonStdImpl(elementValueSerializer)) {
                if (String[].class == raw) {
                    ser = StringArraySerializer.instance;
                } else {
                    ser = StdArraySerializers.findStandardImpl(raw);
                }
            }
            if (ser == null) {
                ser = new ObjectArraySerializer(type.mo3getContentType(), staticTyping, elementTypeSerializer, elementValueSerializer);
            }
        }
        if (this._factoryConfig.hasSerializerModifiers()) {
            for (BeanSerializerModifier mod : this._factoryConfig.serializerModifiers()) {
                ser = mod.modifyArraySerializer(config, type, beanDesc, ser);
            }
        }
        return ser;
    }

    protected JsonSerializer<?> buildIteratorSerializer(SerializationConfig config, JavaType type, BeanDescription beanDesc, boolean staticTyping) throws JsonMappingException {
        JavaType valueType = type.mo2containedType(0);
        if (valueType == null) {
            valueType = TypeFactory.unknownType();
        }
        TypeSerializer vts = createTypeSerializer(config, valueType);
        return new IteratorSerializer(valueType, staticTyping, vts, (BeanProperty) null);
    }

    protected JsonSerializer<?> buildIterableSerializer(SerializationConfig config, JavaType type, BeanDescription beanDesc, boolean staticTyping) throws JsonMappingException {
        JavaType valueType = type.mo2containedType(0);
        if (valueType == null) {
            valueType = TypeFactory.unknownType();
        }
        TypeSerializer vts = createTypeSerializer(config, valueType);
        return new IterableSerializer(valueType, staticTyping, vts, (BeanProperty) null);
    }

    protected JsonSerializer<?> buildEnumSerializer(SerializationConfig config, JavaType type, BeanDescription beanDesc) throws JsonMappingException {
        JsonFormat.Value format = beanDesc.findExpectedFormat(null);
        if (format != null && format.getShape() == JsonFormat.Shape.OBJECT) {
            ((BasicBeanDescription) beanDesc).removeProperty("declaringClass");
            return null;
        }
        JsonSerializer<?> ser = EnumSerializer.construct(type.getRawClass(), config, beanDesc, format);
        if (this._factoryConfig.hasSerializerModifiers()) {
            for (BeanSerializerModifier mod : this._factoryConfig.serializerModifiers()) {
                ser = mod.modifyEnumSerializer(config, type, beanDesc, ser);
            }
        }
        return ser;
    }

    protected <T extends JavaType> T modifyTypeByAnnotation(SerializationConfig serializationConfig, Annotated annotated, T t) {
        Class<?> findSerializationType = serializationConfig.getAnnotationIntrospector().findSerializationType(annotated);
        if (findSerializationType != null) {
            try {
                t = t.widenBy(findSerializationType);
            } catch (IllegalArgumentException e) {
                throw new IllegalArgumentException("Failed to widen type " + t + " with concrete-type annotation (value " + findSerializationType.getName() + "), method '" + annotated.getName() + "': " + e.getMessage());
            }
        }
        return (T) modifySecondaryTypesByAnnotation(serializationConfig, annotated, t);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v19, types: [com.fasterxml.jackson.databind.JavaType] */
    protected static <T extends JavaType> T modifySecondaryTypesByAnnotation(SerializationConfig config, Annotated a, T type) {
        AnnotationIntrospector intr = config.getAnnotationIntrospector();
        if (type.isContainerType()) {
            Class<?> keyClass = intr.findSerializationKeyType(a, type.mo4getKeyType());
            if (keyClass != null) {
                if (!(type instanceof MapType)) {
                    throw new IllegalArgumentException("Illegal key-type annotation: type " + type + " is not a Map type");
                }
                try {
                    type = ((MapType) type).widenKey(keyClass);
                } catch (IllegalArgumentException iae) {
                    throw new IllegalArgumentException("Failed to narrow key type " + type + " with key-type annotation (" + keyClass.getName() + "): " + iae.getMessage());
                }
            }
            Class<?> cc = intr.findSerializationContentType(a, type.mo3getContentType());
            if (cc != null) {
                try {
                    type = type.widenContentsBy(cc);
                } catch (IllegalArgumentException iae2) {
                    throw new IllegalArgumentException("Failed to narrow content type " + type + " with content-type annotation (" + cc.getName() + "): " + iae2.getMessage());
                }
            }
        }
        return type;
    }

    protected JsonSerializer<Object> _findKeySerializer(SerializerProvider prov, Annotated a) throws JsonMappingException {
        AnnotationIntrospector intr = prov.getAnnotationIntrospector();
        Object serDef = intr.findKeySerializer(a);
        if (serDef != null) {
            return prov.serializerInstance(a, serDef);
        }
        return null;
    }

    protected JsonSerializer<Object> _findContentSerializer(SerializerProvider prov, Annotated a) throws JsonMappingException {
        AnnotationIntrospector intr = prov.getAnnotationIntrospector();
        Object serDef = intr.findContentSerializer(a);
        if (serDef != null) {
            return prov.serializerInstance(a, serDef);
        }
        return null;
    }

    protected Object findFilterId(SerializationConfig config, BeanDescription beanDesc) {
        return config.getAnnotationIntrospector().findFilterId((Annotated) beanDesc.getClassInfo());
    }

    protected boolean usesStaticTyping(SerializationConfig config, BeanDescription beanDesc, TypeSerializer typeSer) {
        if (typeSer != null) {
            return false;
        }
        AnnotationIntrospector intr = config.getAnnotationIntrospector();
        JsonSerialize.Typing t = intr.findSerializationTyping(beanDesc.getClassInfo());
        if (t == null || t == JsonSerialize.Typing.DEFAULT_TYPING) {
            return config.isEnabled(MapperFeature.USE_STATIC_TYPING);
        }
        return t == JsonSerialize.Typing.STATIC;
    }

    protected Class<?> _verifyAsClass(Object src, String methodName, Class<?> noneClass) {
        if (src == null) {
            return null;
        }
        if (!(src instanceof Class)) {
            throw new IllegalStateException("AnnotationIntrospector." + methodName + "() returned value of type " + src.getClass().getName() + ": expected type JsonSerializer or Class<JsonSerializer> instead");
        }
        Class<?> cls = (Class) src;
        if (cls == noneClass || ClassUtil.isBogusClass(cls)) {
            return null;
        }
        return cls;
    }
}
