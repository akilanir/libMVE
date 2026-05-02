package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.cfg.ContextAttributes;
import com.fasterxml.jackson.databind.introspect.Annotated;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.fasterxml.jackson.databind.ser.ResolvableSerializer;
import com.fasterxml.jackson.databind.ser.SerializerCache;
import com.fasterxml.jackson.databind.ser.SerializerFactory;
import com.fasterxml.jackson.databind.ser.impl.FailingSerializer;
import com.fasterxml.jackson.databind.ser.impl.ReadOnlyClassToSerializerMap;
import com.fasterxml.jackson.databind.ser.impl.TypeWrappedSerializer;
import com.fasterxml.jackson.databind.ser.impl.UnknownSerializer;
import com.fasterxml.jackson.databind.ser.impl.WritableObjectId;
import com.fasterxml.jackson.databind.ser.std.NullSerializer;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.RootNameLookup;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/SerializerProvider.class */
public abstract class SerializerProvider extends DatabindContext {
    protected static final boolean CACHE_UNKNOWN_MAPPINGS = false;
    public static final JsonSerializer<Object> DEFAULT_NULL_KEY_SERIALIZER = new FailingSerializer("Null key for a Map not allowed in JSON (use a converting NullKeySerializer?)");
    protected static final JsonSerializer<Object> DEFAULT_UNKNOWN_SERIALIZER = new UnknownSerializer();
    protected final SerializationConfig _config;
    protected final Class<?> _serializationView;
    protected final SerializerFactory _serializerFactory;
    protected final SerializerCache _serializerCache;
    protected final RootNameLookup _rootNames;
    protected transient ContextAttributes _attributes;
    protected JsonSerializer<Object> _unknownTypeSerializer;
    protected JsonSerializer<Object> _keySerializer;
    protected JsonSerializer<Object> _nullValueSerializer;
    protected JsonSerializer<Object> _nullKeySerializer;
    protected final ReadOnlyClassToSerializerMap _knownSerializers;
    protected DateFormat _dateFormat;
    protected final boolean _stdNullValueSerializer;

    public abstract WritableObjectId findObjectId(Object obj, ObjectIdGenerator<?> objectIdGenerator);

    public abstract JsonSerializer<Object> serializerInstance(Annotated annotated, Object obj) throws JsonMappingException;

    public SerializerProvider() {
        this._unknownTypeSerializer = DEFAULT_UNKNOWN_SERIALIZER;
        this._nullValueSerializer = NullSerializer.instance;
        this._nullKeySerializer = DEFAULT_NULL_KEY_SERIALIZER;
        this._config = null;
        this._serializerFactory = null;
        this._serializerCache = new SerializerCache();
        this._knownSerializers = null;
        this._rootNames = new RootNameLookup();
        this._serializationView = null;
        this._attributes = null;
        this._stdNullValueSerializer = true;
    }

    protected SerializerProvider(SerializerProvider src, SerializationConfig config, SerializerFactory f) {
        this._unknownTypeSerializer = DEFAULT_UNKNOWN_SERIALIZER;
        this._nullValueSerializer = NullSerializer.instance;
        this._nullKeySerializer = DEFAULT_NULL_KEY_SERIALIZER;
        if (config == null) {
            throw new NullPointerException();
        }
        this._serializerFactory = f;
        this._config = config;
        this._serializerCache = src._serializerCache;
        this._unknownTypeSerializer = src._unknownTypeSerializer;
        this._keySerializer = src._keySerializer;
        this._nullValueSerializer = src._nullValueSerializer;
        this._nullKeySerializer = src._nullKeySerializer;
        this._stdNullValueSerializer = this._nullValueSerializer == DEFAULT_NULL_KEY_SERIALIZER;
        this._rootNames = src._rootNames;
        this._knownSerializers = this._serializerCache.getReadOnlyLookupMap();
        this._serializationView = config.getActiveView();
        this._attributes = config.getAttributes();
    }

    protected SerializerProvider(SerializerProvider src) {
        this._unknownTypeSerializer = DEFAULT_UNKNOWN_SERIALIZER;
        this._nullValueSerializer = NullSerializer.instance;
        this._nullKeySerializer = DEFAULT_NULL_KEY_SERIALIZER;
        this._config = null;
        this._serializationView = null;
        this._serializerFactory = null;
        this._knownSerializers = null;
        this._serializerCache = new SerializerCache();
        this._rootNames = new RootNameLookup();
        this._unknownTypeSerializer = src._unknownTypeSerializer;
        this._keySerializer = src._keySerializer;
        this._nullValueSerializer = src._nullValueSerializer;
        this._nullKeySerializer = src._nullKeySerializer;
        this._stdNullValueSerializer = src._stdNullValueSerializer;
    }

    public void setDefaultKeySerializer(JsonSerializer<Object> ks) {
        if (ks == null) {
            throw new IllegalArgumentException("Can not pass null JsonSerializer");
        }
        this._keySerializer = ks;
    }

    public void setNullValueSerializer(JsonSerializer<Object> nvs) {
        if (nvs == null) {
            throw new IllegalArgumentException("Can not pass null JsonSerializer");
        }
        this._nullValueSerializer = nvs;
    }

    public void setNullKeySerializer(JsonSerializer<Object> nks) {
        if (nks == null) {
            throw new IllegalArgumentException("Can not pass null JsonSerializer");
        }
        this._nullKeySerializer = nks;
    }

    @Override // com.fasterxml.jackson.databind.DatabindContext
    public final SerializationConfig getConfig() {
        return this._config;
    }

    @Override // com.fasterxml.jackson.databind.DatabindContext
    public final AnnotationIntrospector getAnnotationIntrospector() {
        return this._config.getAnnotationIntrospector();
    }

    @Override // com.fasterxml.jackson.databind.DatabindContext
    public final TypeFactory getTypeFactory() {
        return this._config.getTypeFactory();
    }

    @Override // com.fasterxml.jackson.databind.DatabindContext
    public final Class<?> getActiveView() {
        return this._serializationView;
    }

    @Deprecated
    public final Class<?> getSerializationView() {
        return this._serializationView;
    }

    @Override // com.fasterxml.jackson.databind.DatabindContext
    public Object getAttribute(Object key) {
        return this._attributes.getAttribute(key);
    }

    @Override // com.fasterxml.jackson.databind.DatabindContext
    public SerializerProvider setAttribute(Object key, Object value) {
        this._attributes = this._attributes.withPerCallAttribute(key, value);
        return this;
    }

    public final boolean isEnabled(SerializationFeature feature) {
        return this._config.isEnabled(feature);
    }

    public final boolean hasSerializationFeatures(int featureMask) {
        return this._config.hasSerializationFeatures(featureMask);
    }

    public final FilterProvider getFilterProvider() {
        return this._config.getFilterProvider();
    }

    public Locale getLocale() {
        return this._config.getLocale();
    }

    public TimeZone getTimeZone() {
        return this._config.getTimeZone();
    }

    public JsonSerializer<Object> findValueSerializer(Class<?> valueType, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> ser = this._knownSerializers.untypedValueSerializer(valueType);
        if (ser == null) {
            ser = this._serializerCache.untypedValueSerializer(valueType);
            if (ser == null) {
                ser = this._serializerCache.untypedValueSerializer(this._config.constructType(valueType));
                if (ser == null) {
                    ser = _createAndCacheUntypedSerializer(valueType);
                    if (ser == null) {
                        return getUnknownTypeSerializer(valueType);
                    }
                }
            }
        }
        return handleSecondaryContextualization(ser, property);
    }

    public JsonSerializer<Object> findValueSerializer(JavaType valueType, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> ser = this._knownSerializers.untypedValueSerializer(valueType);
        if (ser == null) {
            ser = this._serializerCache.untypedValueSerializer(valueType);
            if (ser == null) {
                ser = _createAndCacheUntypedSerializer(valueType);
                if (ser == null) {
                    return getUnknownTypeSerializer(valueType.getRawClass());
                }
            }
        }
        return handleSecondaryContextualization(ser, property);
    }

    public JsonSerializer<Object> findValueSerializer(Class<?> valueType) throws JsonMappingException {
        JsonSerializer<Object> ser = this._knownSerializers.untypedValueSerializer(valueType);
        if (ser == null) {
            ser = this._serializerCache.untypedValueSerializer(valueType);
            if (ser == null) {
                ser = this._serializerCache.untypedValueSerializer(this._config.constructType(valueType));
                if (ser == null) {
                    ser = _createAndCacheUntypedSerializer(valueType);
                    if (ser == null) {
                        ser = getUnknownTypeSerializer(valueType);
                    }
                }
            }
        }
        return ser;
    }

    public JsonSerializer<Object> findValueSerializer(JavaType valueType) throws JsonMappingException {
        JsonSerializer<Object> ser = this._knownSerializers.untypedValueSerializer(valueType);
        if (ser == null) {
            ser = this._serializerCache.untypedValueSerializer(valueType);
            if (ser == null) {
                ser = _createAndCacheUntypedSerializer(valueType);
                if (ser == null) {
                    ser = getUnknownTypeSerializer(valueType.getRawClass());
                }
            }
        }
        return ser;
    }

    public JsonSerializer<Object> findPrimaryPropertySerializer(JavaType valueType, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> ser = this._knownSerializers.untypedValueSerializer(valueType);
        if (ser == null) {
            ser = this._serializerCache.untypedValueSerializer(valueType);
            if (ser == null) {
                ser = _createAndCacheUntypedSerializer(valueType);
                if (ser == null) {
                    return getUnknownTypeSerializer(valueType.getRawClass());
                }
            }
        }
        return handlePrimaryContextualization(ser, property);
    }

    public JsonSerializer<Object> findPrimaryPropertySerializer(Class<?> valueType, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> ser = this._knownSerializers.untypedValueSerializer(valueType);
        if (ser == null) {
            ser = this._serializerCache.untypedValueSerializer(valueType);
            if (ser == null) {
                ser = this._serializerCache.untypedValueSerializer(this._config.constructType(valueType));
                if (ser == null) {
                    ser = _createAndCacheUntypedSerializer(valueType);
                    if (ser == null) {
                        return getUnknownTypeSerializer(valueType);
                    }
                }
            }
        }
        return handlePrimaryContextualization(ser, property);
    }

    public JsonSerializer<Object> findTypedValueSerializer(Class<?> valueType, boolean cache, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> ser = this._knownSerializers.typedValueSerializer(valueType);
        if (ser != null) {
            return ser;
        }
        JsonSerializer<Object> ser2 = this._serializerCache.typedValueSerializer(valueType);
        if (ser2 != null) {
            return ser2;
        }
        JsonSerializer<Object> ser3 = findValueSerializer(valueType, property);
        TypeSerializer typeSer = this._serializerFactory.createTypeSerializer(this._config, this._config.constructType(valueType));
        if (typeSer != null) {
            ser3 = new TypeWrappedSerializer(typeSer.forProperty(property), ser3);
        }
        if (cache) {
            this._serializerCache.addTypedSerializer(valueType, ser3);
        }
        return ser3;
    }

    public JsonSerializer<Object> findTypedValueSerializer(JavaType valueType, boolean cache, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> ser = this._knownSerializers.typedValueSerializer(valueType);
        if (ser != null) {
            return ser;
        }
        JsonSerializer<Object> ser2 = this._serializerCache.typedValueSerializer(valueType);
        if (ser2 != null) {
            return ser2;
        }
        JsonSerializer<Object> ser3 = findValueSerializer(valueType, property);
        TypeSerializer typeSer = this._serializerFactory.createTypeSerializer(this._config, valueType);
        if (typeSer != null) {
            ser3 = new TypeWrappedSerializer(typeSer.forProperty(property), ser3);
        }
        if (cache) {
            this._serializerCache.addTypedSerializer(valueType, ser3);
        }
        return ser3;
    }

    public JsonSerializer<Object> findKeySerializer(JavaType keyType, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> ser = this._serializerFactory.createKeySerializer(this._config, keyType, this._keySerializer);
        return _handleContextualResolvable(ser, property);
    }

    public JsonSerializer<Object> getDefaultNullKeySerializer() {
        return this._nullKeySerializer;
    }

    public JsonSerializer<Object> getDefaultNullValueSerializer() {
        return this._nullValueSerializer;
    }

    public JsonSerializer<Object> findNullKeySerializer(JavaType serializationType, BeanProperty property) throws JsonMappingException {
        return this._nullKeySerializer;
    }

    public JsonSerializer<Object> findNullValueSerializer(BeanProperty property) throws JsonMappingException {
        return this._nullValueSerializer;
    }

    public JsonSerializer<Object> getUnknownTypeSerializer(Class<?> unknownType) {
        return this._unknownTypeSerializer;
    }

    public boolean isUnknownTypeSerializer(JsonSerializer<?> ser) {
        return ser == this._unknownTypeSerializer || ser == null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public JsonSerializer<?> handlePrimaryContextualization(JsonSerializer<?> jsonSerializer, BeanProperty beanProperty) throws JsonMappingException {
        JsonSerializer<?> jsonSerializer2 = jsonSerializer;
        if (jsonSerializer != 0) {
            boolean z = jsonSerializer instanceof ContextualSerializer;
            jsonSerializer2 = jsonSerializer;
            if (z) {
                jsonSerializer2 = ((ContextualSerializer) jsonSerializer).createContextual(this, beanProperty);
            }
        }
        return jsonSerializer2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public JsonSerializer<?> handleSecondaryContextualization(JsonSerializer<?> jsonSerializer, BeanProperty beanProperty) throws JsonMappingException {
        JsonSerializer<?> jsonSerializer2 = jsonSerializer;
        if (jsonSerializer != 0) {
            boolean z = jsonSerializer instanceof ContextualSerializer;
            jsonSerializer2 = jsonSerializer;
            if (z) {
                jsonSerializer2 = ((ContextualSerializer) jsonSerializer).createContextual(this, beanProperty);
            }
        }
        return jsonSerializer2;
    }

    public final void defaultSerializeValue(Object value, JsonGenerator jgen) throws IOException, JsonProcessingException {
        if (value == null) {
            if (this._stdNullValueSerializer) {
                jgen.writeNull();
                return;
            } else {
                this._nullValueSerializer.serialize(null, jgen, this);
                return;
            }
        }
        Class<?> cls = value.getClass();
        findTypedValueSerializer(cls, true, (BeanProperty) null).serialize(value, jgen, this);
    }

    public final void defaultSerializeField(String fieldName, Object value, JsonGenerator jgen) throws IOException, JsonProcessingException {
        jgen.writeFieldName(fieldName);
        if (value == null) {
            if (this._stdNullValueSerializer) {
                jgen.writeNull();
                return;
            } else {
                this._nullValueSerializer.serialize(null, jgen, this);
                return;
            }
        }
        Class<?> cls = value.getClass();
        findTypedValueSerializer(cls, true, (BeanProperty) null).serialize(value, jgen, this);
    }

    public final void defaultSerializeDateValue(long timestamp, JsonGenerator jgen) throws IOException, JsonProcessingException {
        if (isEnabled(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)) {
            jgen.writeNumber(timestamp);
        } else {
            jgen.writeString(_dateFormat().format(new Date(timestamp)));
        }
    }

    public final void defaultSerializeDateValue(Date date, JsonGenerator jgen) throws IOException, JsonProcessingException {
        if (isEnabled(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)) {
            jgen.writeNumber(date.getTime());
        } else {
            jgen.writeString(_dateFormat().format(date));
        }
    }

    public void defaultSerializeDateKey(long timestamp, JsonGenerator jgen) throws IOException, JsonProcessingException {
        if (isEnabled(SerializationFeature.WRITE_DATE_KEYS_AS_TIMESTAMPS)) {
            jgen.writeFieldName(String.valueOf(timestamp));
        } else {
            jgen.writeFieldName(_dateFormat().format(new Date(timestamp)));
        }
    }

    public void defaultSerializeDateKey(Date date, JsonGenerator jgen) throws IOException, JsonProcessingException {
        if (isEnabled(SerializationFeature.WRITE_DATE_KEYS_AS_TIMESTAMPS)) {
            jgen.writeFieldName(String.valueOf(date.getTime()));
        } else {
            jgen.writeFieldName(_dateFormat().format(date));
        }
    }

    public final void defaultSerializeNull(JsonGenerator jgen) throws IOException, JsonProcessingException {
        if (this._stdNullValueSerializer) {
            jgen.writeNull();
        } else {
            this._nullValueSerializer.serialize(null, jgen, this);
        }
    }

    protected void _reportIncompatibleRootType(Object value, JavaType rootType) throws IOException, JsonProcessingException {
        if (rootType.isPrimitive()) {
            Class<?> wrapperType = ClassUtil.wrapperType(rootType.getRawClass());
            if (wrapperType.isAssignableFrom(value.getClass())) {
                return;
            }
        }
        throw new JsonMappingException("Incompatible types: declared root type (" + rootType + ") vs " + value.getClass().getName());
    }

    protected JsonSerializer<Object> _findExplicitUntypedSerializer(Class<?> runtimeType) throws JsonMappingException {
        JsonSerializer<Object> ser = this._knownSerializers.untypedValueSerializer(runtimeType);
        if (ser == null) {
            ser = this._serializerCache.untypedValueSerializer(runtimeType);
            if (ser == null) {
                ser = _createAndCacheUntypedSerializer(runtimeType);
                if (isUnknownTypeSerializer(ser)) {
                    return null;
                }
            }
        }
        return ser;
    }

    protected JsonSerializer<Object> _createAndCacheUntypedSerializer(Class<?> type) throws JsonMappingException {
        try {
            JsonSerializer<Object> ser = _createUntypedSerializer(this._config.constructType(type));
            if (ser != null) {
                this._serializerCache.addAndResolveNonTypedSerializer(type, ser, this);
            }
            return ser;
        } catch (IllegalArgumentException iae) {
            throw new JsonMappingException(iae.getMessage(), null, iae);
        }
    }

    protected JsonSerializer<Object> _createAndCacheUntypedSerializer(JavaType type) throws JsonMappingException {
        try {
            JsonSerializer<Object> ser = _createUntypedSerializer(type);
            if (ser != null) {
                this._serializerCache.addAndResolveNonTypedSerializer(type, ser, this);
            }
            return ser;
        } catch (IllegalArgumentException iae) {
            throw new JsonMappingException(iae.getMessage(), null, iae);
        }
    }

    protected JsonSerializer<Object> _createUntypedSerializer(JavaType type) throws JsonMappingException {
        return this._serializerFactory.createSerializer(this, type);
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected JsonSerializer<Object> _handleContextualResolvable(JsonSerializer<?> jsonSerializer, BeanProperty property) throws JsonMappingException {
        if (jsonSerializer instanceof ResolvableSerializer) {
            ((ResolvableSerializer) jsonSerializer).resolve(this);
        }
        return handleSecondaryContextualization(jsonSerializer, property);
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected JsonSerializer<Object> _handleResolvable(JsonSerializer<?> jsonSerializer) throws JsonMappingException {
        if (jsonSerializer instanceof ResolvableSerializer) {
            ((ResolvableSerializer) jsonSerializer).resolve(this);
        }
        return jsonSerializer;
    }

    protected final DateFormat _dateFormat() {
        if (this._dateFormat != null) {
            return this._dateFormat;
        }
        DateFormat df = (DateFormat) this._config.getDateFormat().clone();
        this._dateFormat = df;
        return df;
    }
}
