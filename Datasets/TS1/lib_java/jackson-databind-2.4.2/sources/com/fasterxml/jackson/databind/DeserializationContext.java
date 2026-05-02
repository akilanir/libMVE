package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdResolver;
import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.cfg.ContextAttributes;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.fasterxml.jackson.databind.deser.ContextualKeyDeserializer;
import com.fasterxml.jackson.databind.deser.DeserializationProblemHandler;
import com.fasterxml.jackson.databind.deser.DeserializerCache;
import com.fasterxml.jackson.databind.deser.DeserializerFactory;
import com.fasterxml.jackson.databind.deser.UnresolvedForwardReference;
import com.fasterxml.jackson.databind.deser.impl.ReadableObjectId;
import com.fasterxml.jackson.databind.deser.impl.TypeWrappedDeserializer;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException;
import com.fasterxml.jackson.databind.introspect.Annotated;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.ArrayBuilders;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.LinkedNode;
import com.fasterxml.jackson.databind.util.ObjectBuffer;
import java.io.IOException;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/DeserializationContext.class */
public abstract class DeserializationContext extends DatabindContext implements Serializable {
    private static final long serialVersionUID = -4290063686213707727L;
    private static final int MAX_ERROR_STR_LEN = 500;
    protected final DeserializerCache _cache;
    protected final DeserializerFactory _factory;
    protected final DeserializationConfig _config;
    protected final int _featureFlags;
    protected final Class<?> _view;
    protected transient JsonParser _parser;
    protected final InjectableValues _injectableValues;
    protected transient ArrayBuilders _arrayBuilders;
    protected transient ObjectBuffer _objectBuffer;
    protected transient DateFormat _dateFormat;
    protected transient ContextAttributes _attributes;

    public abstract ReadableObjectId findObjectId(Object obj, ObjectIdGenerator<?> objectIdGenerator, ObjectIdResolver objectIdResolver);

    @Deprecated
    public abstract ReadableObjectId findObjectId(Object obj, ObjectIdGenerator<?> objectIdGenerator);

    public abstract void checkUnresolvedObjectId() throws UnresolvedForwardReference;

    public abstract JsonDeserializer<Object> deserializerInstance(Annotated annotated, Object obj) throws JsonMappingException;

    public abstract KeyDeserializer keyDeserializerInstance(Annotated annotated, Object obj) throws JsonMappingException;

    protected DeserializationContext(DeserializerFactory df) {
        this(df, (DeserializerCache) null);
    }

    protected DeserializationContext(DeserializerFactory df, DeserializerCache cache) {
        if (df == null) {
            throw new IllegalArgumentException("Can not pass null DeserializerFactory");
        }
        this._factory = df;
        this._cache = cache == null ? new DeserializerCache() : cache;
        this._featureFlags = 0;
        this._config = null;
        this._injectableValues = null;
        this._view = null;
        this._attributes = null;
    }

    protected DeserializationContext(DeserializationContext src, DeserializerFactory factory) {
        this._cache = src._cache;
        this._factory = factory;
        this._config = src._config;
        this._featureFlags = src._featureFlags;
        this._view = src._view;
        this._parser = src._parser;
        this._injectableValues = src._injectableValues;
        this._attributes = src._attributes;
    }

    protected DeserializationContext(DeserializationContext src, DeserializationConfig config, JsonParser p, InjectableValues injectableValues) {
        this._cache = src._cache;
        this._factory = src._factory;
        this._config = config;
        this._featureFlags = config.getDeserializationFeatures();
        this._view = config.getActiveView();
        this._parser = p;
        this._injectableValues = injectableValues;
        this._attributes = config.getAttributes();
    }

    @Override // com.fasterxml.jackson.databind.DatabindContext
    public DeserializationConfig getConfig() {
        return this._config;
    }

    @Override // com.fasterxml.jackson.databind.DatabindContext
    public final Class<?> getActiveView() {
        return this._view;
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
    public Object getAttribute(Object key) {
        return this._attributes.getAttribute(key);
    }

    @Override // com.fasterxml.jackson.databind.DatabindContext
    public DeserializationContext setAttribute(Object key, Object value) {
        this._attributes = this._attributes.withPerCallAttribute(key, value);
        return this;
    }

    public DeserializerFactory getFactory() {
        return this._factory;
    }

    public final boolean isEnabled(DeserializationFeature feat) {
        return (this._featureFlags & feat.getMask()) != 0;
    }

    public final boolean hasDeserializationFeatures(int featureMask) {
        return this._config.hasDeserializationFeatures(featureMask);
    }

    public final JsonParser getParser() {
        return this._parser;
    }

    public final Object findInjectableValue(Object valueId, BeanProperty forProperty, Object beanInstance) {
        if (this._injectableValues == null) {
            throw new IllegalStateException("No 'injectableValues' configured, can not inject value with id [" + valueId + "]");
        }
        return this._injectableValues.findInjectableValue(valueId, this, forProperty, beanInstance);
    }

    public final Base64Variant getBase64Variant() {
        return this._config.getBase64Variant();
    }

    public final JsonNodeFactory getNodeFactory() {
        return this._config.getNodeFactory();
    }

    public Locale getLocale() {
        return this._config.getLocale();
    }

    public TimeZone getTimeZone() {
        return this._config.getTimeZone();
    }

    @Deprecated
    public boolean hasValueDeserializerFor(JavaType type) {
        return hasValueDeserializerFor(type, null);
    }

    public boolean hasValueDeserializerFor(JavaType type, AtomicReference<Throwable> cause) {
        try {
            return this._cache.hasValueDeserializerFor(this, this._factory, type);
        } catch (JsonMappingException e) {
            if (cause != null) {
                cause.set(e);
                return false;
            }
            return false;
        } catch (RuntimeException e2) {
            if (cause == null) {
                throw e2;
            }
            cause.set(e2);
            return false;
        }
    }

    public final JsonDeserializer<Object> findContextualValueDeserializer(JavaType type, BeanProperty prop) throws JsonMappingException {
        JsonDeserializer<Object> deser = this._cache.findValueDeserializer(this, this._factory, type);
        if (deser != null) {
            deser = handleSecondaryContextualization(deser, prop);
        }
        return deser;
    }

    public final JsonDeserializer<Object> findRootValueDeserializer(JavaType type) throws JsonMappingException {
        JsonDeserializer<Object> deser = this._cache.findValueDeserializer(this, this._factory, type);
        if (deser == null) {
            return null;
        }
        JsonDeserializer<Object> deser2 = handleSecondaryContextualization(deser, null);
        TypeDeserializer typeDeser = this._factory.findTypeDeserializer(this._config, type);
        if (typeDeser != null) {
            return new TypeWrappedDeserializer(typeDeser.forProperty(null), deser2);
        }
        return deser2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r8v0 */
    public final KeyDeserializer findKeyDeserializer(JavaType javaType, BeanProperty beanProperty) throws JsonMappingException {
        ?? findKeyDeserializer = this._cache.findKeyDeserializer(this, this._factory, javaType);
        boolean z = findKeyDeserializer instanceof ContextualKeyDeserializer;
        KeyDeserializer keyDeserializer = findKeyDeserializer;
        if (z) {
            keyDeserializer = ((ContextualKeyDeserializer) findKeyDeserializer).createContextual(this, beanProperty);
        }
        return keyDeserializer;
    }

    public final JavaType constructType(Class<?> cls) {
        return this._config.constructType(cls);
    }

    public Class<?> findClass(String className) throws ClassNotFoundException {
        return ClassUtil.findClass(className);
    }

    public final ObjectBuffer leaseObjectBuffer() {
        ObjectBuffer buf = this._objectBuffer;
        if (buf == null) {
            buf = new ObjectBuffer();
        } else {
            this._objectBuffer = null;
        }
        return buf;
    }

    public final void returnObjectBuffer(ObjectBuffer buf) {
        if (this._objectBuffer == null || buf.initialCapacity() >= this._objectBuffer.initialCapacity()) {
            this._objectBuffer = buf;
        }
    }

    public final ArrayBuilders getArrayBuilders() {
        if (this._arrayBuilders == null) {
            this._arrayBuilders = new ArrayBuilders();
        }
        return this._arrayBuilders;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public JsonDeserializer<?> handlePrimaryContextualization(JsonDeserializer<?> jsonDeserializer, BeanProperty beanProperty) throws JsonMappingException {
        JsonDeserializer<?> jsonDeserializer2 = jsonDeserializer;
        if (jsonDeserializer != 0) {
            boolean z = jsonDeserializer instanceof ContextualDeserializer;
            jsonDeserializer2 = jsonDeserializer;
            if (z) {
                jsonDeserializer2 = ((ContextualDeserializer) jsonDeserializer).createContextual(this, beanProperty);
            }
        }
        return jsonDeserializer2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public JsonDeserializer<?> handleSecondaryContextualization(JsonDeserializer<?> jsonDeserializer, BeanProperty beanProperty) throws JsonMappingException {
        JsonDeserializer<?> jsonDeserializer2 = jsonDeserializer;
        if (jsonDeserializer != 0) {
            boolean z = jsonDeserializer instanceof ContextualDeserializer;
            jsonDeserializer2 = jsonDeserializer;
            if (z) {
                jsonDeserializer2 = ((ContextualDeserializer) jsonDeserializer).createContextual(this, beanProperty);
            }
        }
        return jsonDeserializer2;
    }

    public Date parseDate(String dateStr) throws IllegalArgumentException {
        try {
            DateFormat df = getDateFormat();
            return df.parse(dateStr);
        } catch (ParseException e) {
            throw new IllegalArgumentException("Failed to parse Date value '" + dateStr + "': " + e.getMessage());
        }
    }

    public Calendar constructCalendar(Date d) {
        Calendar c = Calendar.getInstance(getTimeZone());
        c.setTime(d);
        return c;
    }

    public <T> T readValue(JsonParser jsonParser, Class<T> cls) throws IOException {
        return (T) readValue(jsonParser, getTypeFactory().constructType(cls));
    }

    public <T> T readValue(JsonParser jsonParser, JavaType javaType) throws IOException {
        JsonDeserializer<Object> findRootValueDeserializer = findRootValueDeserializer(javaType);
        if (findRootValueDeserializer == null) {
        }
        return (T) findRootValueDeserializer.deserialize(jsonParser, this);
    }

    public <T> T readPropertyValue(JsonParser jsonParser, BeanProperty beanProperty, Class<T> cls) throws IOException {
        return (T) readPropertyValue(jsonParser, beanProperty, getTypeFactory().constructType(cls));
    }

    public <T> T readPropertyValue(JsonParser jsonParser, BeanProperty beanProperty, JavaType javaType) throws IOException {
        JsonDeserializer<Object> findContextualValueDeserializer = findContextualValueDeserializer(javaType, beanProperty);
        if (findContextualValueDeserializer == null) {
        }
        return (T) findContextualValueDeserializer.deserialize(jsonParser, this);
    }

    public boolean handleUnknownProperty(JsonParser p, JsonDeserializer<?> deser, Object instanceOrClass, String propName) throws IOException, JsonProcessingException {
        LinkedNode<DeserializationProblemHandler> h = this._config.getProblemHandlers();
        if (h != null) {
            while (h != null) {
                if (h.value().handleUnknownProperty(this, p, deser, instanceOrClass, propName)) {
                    return true;
                }
                h = h.next();
            }
            return false;
        }
        return false;
    }

    public void reportUnknownProperty(Object instanceOrClass, String fieldName, JsonDeserializer<?> deser) throws JsonMappingException {
        if (!isEnabled(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)) {
            return;
        }
        Collection<Object> propIds = deser == null ? null : deser.getKnownPropertyNames();
        throw UnrecognizedPropertyException.from(this._parser, instanceOrClass, fieldName, propIds);
    }

    public JsonMappingException mappingException(Class<?> targetClass) {
        return mappingException(targetClass, this._parser.getCurrentToken());
    }

    public JsonMappingException mappingException(Class<?> targetClass, JsonToken token) {
        return JsonMappingException.from(this._parser, "Can not deserialize instance of " + _calcName(targetClass) + " out of " + token + " token");
    }

    public JsonMappingException mappingException(String message) {
        return JsonMappingException.from(getParser(), message);
    }

    public JsonMappingException instantiationException(Class<?> instClass, Throwable t) {
        return JsonMappingException.from(this._parser, "Can not construct instance of " + instClass.getName() + ", problem: " + t.getMessage(), t);
    }

    public JsonMappingException instantiationException(Class<?> instClass, String msg) {
        return JsonMappingException.from(this._parser, "Can not construct instance of " + instClass.getName() + ", problem: " + msg);
    }

    @Deprecated
    public JsonMappingException weirdStringException(Class<?> instClass, String msg) {
        return weirdStringException(null, instClass, msg);
    }

    public JsonMappingException weirdStringException(String value, Class<?> instClass, String msg) {
        return InvalidFormatException.from(this._parser, "Can not construct instance of " + instClass.getName() + " from String value '" + _valueDesc() + "': " + msg, value, instClass);
    }

    @Deprecated
    public JsonMappingException weirdNumberException(Class<?> instClass, String msg) {
        return weirdStringException(null, instClass, msg);
    }

    public JsonMappingException weirdNumberException(Number value, Class<?> instClass, String msg) {
        return InvalidFormatException.from(this._parser, "Can not construct instance of " + instClass.getName() + " from number value (" + _valueDesc() + "): " + msg, null, instClass);
    }

    public JsonMappingException weirdKeyException(Class<?> keyClass, String keyValue, String msg) {
        return InvalidFormatException.from(this._parser, "Can not construct Map key of type " + keyClass.getName() + " from String \"" + _desc(keyValue) + "\": " + msg, keyValue, keyClass);
    }

    public JsonMappingException wrongTokenException(JsonParser p, JsonToken expToken, String msg0) {
        String msg = "Unexpected token (" + p.getCurrentToken() + "), expected " + expToken;
        if (msg0 != null) {
            msg = msg + ": " + msg0;
        }
        return JsonMappingException.from(p, msg);
    }

    public JsonMappingException unknownTypeException(JavaType type, String id) {
        return JsonMappingException.from(this._parser, "Could not resolve type id '" + id + "' into a subtype of " + type);
    }

    public JsonMappingException endOfInputException(Class<?> instClass) {
        return JsonMappingException.from(this._parser, "Unexpected end-of-input when trying to deserialize a " + instClass.getName());
    }

    protected DateFormat getDateFormat() {
        if (this._dateFormat != null) {
            return this._dateFormat;
        }
        DateFormat df = (DateFormat) this._config.getDateFormat().clone();
        this._dateFormat = df;
        return df;
    }

    protected String determineClassName(Object instance) {
        return ClassUtil.getClassDescription(instance);
    }

    protected String _calcName(Class<?> cls) {
        if (cls.isArray()) {
            return _calcName(cls.getComponentType()) + "[]";
        }
        return cls.getName();
    }

    protected String _valueDesc() {
        try {
            return _desc(this._parser.getText());
        } catch (Exception e) {
            return "[N/A]";
        }
    }

    protected String _desc(String desc) {
        if (desc.length() > MAX_ERROR_STR_LEN) {
            desc = desc.substring(0, MAX_ERROR_STR_LEN) + "]...[" + desc.substring(desc.length() - MAX_ERROR_STR_LEN);
        }
        return desc;
    }
}
