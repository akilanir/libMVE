package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.FormatSchema;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.Versioned;
import com.fasterxml.jackson.core.type.ResolvedType;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.cfg.ContextAttributes;
import com.fasterxml.jackson.databind.cfg.PackageVersion;
import com.fasterxml.jackson.databind.deser.DataFormatReaders;
import com.fasterxml.jackson.databind.deser.DefaultDeserializationContext;
import com.fasterxml.jackson.databind.deser.DeserializationProblemHandler;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.NullNode;
import com.fasterxml.jackson.databind.node.TreeTraversingParser;
import com.fasterxml.jackson.databind.type.SimpleType;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.RootNameLookup;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.Serializable;
import java.lang.reflect.Type;
import java.net.URL;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ObjectReader.class */
public class ObjectReader extends ObjectCodec implements Versioned, Serializable {
    private static final long serialVersionUID = -4251443320039569153L;
    private static final JavaType JSON_NODE_TYPE = SimpleType.constructUnsafe(JsonNode.class);
    protected final DeserializationConfig _config;
    protected final DefaultDeserializationContext _context;
    protected final JsonFactory _parserFactory;
    protected final boolean _unwrapRoot;
    protected final JavaType _valueType;
    protected final JsonDeserializer<Object> _rootDeserializer;
    protected final Object _valueToUpdate;
    protected final FormatSchema _schema;
    protected final InjectableValues _injectableValues;
    protected final DataFormatReaders _dataFormatReaders;
    protected final ConcurrentHashMap<JavaType, JsonDeserializer<Object>> _rootDeserializers;
    protected final RootNameLookup _rootNames;

    protected ObjectReader(ObjectMapper mapper, DeserializationConfig config) {
        this(mapper, config, null, null, null, null);
    }

    protected ObjectReader(ObjectMapper mapper, DeserializationConfig config, JavaType valueType, Object valueToUpdate, FormatSchema schema, InjectableValues injectableValues) {
        this._config = config;
        this._context = mapper._deserializationContext;
        this._rootDeserializers = mapper._rootDeserializers;
        this._parserFactory = mapper._jsonFactory;
        this._rootNames = mapper._rootNames;
        this._valueType = valueType;
        this._valueToUpdate = valueToUpdate;
        if (valueToUpdate != null && valueType.isArrayType()) {
            throw new IllegalArgumentException("Can not update an array value");
        }
        this._schema = schema;
        this._injectableValues = injectableValues;
        this._unwrapRoot = config.useRootWrapping();
        this._rootDeserializer = _prefetchRootDeserializer(config, valueType);
        this._dataFormatReaders = null;
    }

    protected ObjectReader(ObjectReader base, DeserializationConfig config, JavaType valueType, JsonDeserializer<Object> rootDeser, Object valueToUpdate, FormatSchema schema, InjectableValues injectableValues, DataFormatReaders dataFormatReaders) {
        this._config = config;
        this._context = base._context;
        this._rootDeserializers = base._rootDeserializers;
        this._parserFactory = base._parserFactory;
        this._rootNames = base._rootNames;
        this._valueType = valueType;
        this._rootDeserializer = rootDeser;
        this._valueToUpdate = valueToUpdate;
        if (valueToUpdate != null && valueType.isArrayType()) {
            throw new IllegalArgumentException("Can not update an array value");
        }
        this._schema = schema;
        this._injectableValues = injectableValues;
        this._unwrapRoot = config.useRootWrapping();
        this._dataFormatReaders = dataFormatReaders;
    }

    protected ObjectReader(ObjectReader base, DeserializationConfig config) {
        this._config = config;
        this._context = base._context;
        this._rootDeserializers = base._rootDeserializers;
        this._parserFactory = base._parserFactory;
        this._rootNames = base._rootNames;
        this._valueType = base._valueType;
        this._rootDeserializer = base._rootDeserializer;
        this._valueToUpdate = base._valueToUpdate;
        this._schema = base._schema;
        this._injectableValues = base._injectableValues;
        this._unwrapRoot = config.useRootWrapping();
        this._dataFormatReaders = base._dataFormatReaders;
    }

    protected ObjectReader(ObjectReader base, JsonFactory f) {
        this._config = base._config.with(MapperFeature.SORT_PROPERTIES_ALPHABETICALLY, f.requiresPropertyOrdering());
        this._context = base._context;
        this._rootDeserializers = base._rootDeserializers;
        this._parserFactory = f;
        this._rootNames = base._rootNames;
        this._valueType = base._valueType;
        this._rootDeserializer = base._rootDeserializer;
        this._valueToUpdate = base._valueToUpdate;
        this._schema = base._schema;
        this._injectableValues = base._injectableValues;
        this._unwrapRoot = base._unwrapRoot;
        this._dataFormatReaders = base._dataFormatReaders;
    }

    public Version version() {
        return PackageVersion.VERSION;
    }

    public ObjectReader with(DeserializationConfig config) {
        return _with(config);
    }

    public ObjectReader with(DeserializationFeature feature) {
        return _with(this._config.with(feature));
    }

    public ObjectReader with(DeserializationFeature first, DeserializationFeature... other) {
        return _with(this._config.with(first, other));
    }

    public ObjectReader withFeatures(DeserializationFeature... features) {
        return _with(this._config.withFeatures(features));
    }

    public ObjectReader without(DeserializationFeature feature) {
        return _with(this._config.without(feature));
    }

    public ObjectReader without(DeserializationFeature first, DeserializationFeature... other) {
        return _with(this._config.without(first, other));
    }

    public ObjectReader withoutFeatures(DeserializationFeature... features) {
        return _with(this._config.withoutFeatures(features));
    }

    public ObjectReader with(InjectableValues injectableValues) {
        if (this._injectableValues == injectableValues) {
            return this;
        }
        return new ObjectReader(this, this._config, this._valueType, this._rootDeserializer, this._valueToUpdate, this._schema, injectableValues, this._dataFormatReaders);
    }

    public ObjectReader with(JsonNodeFactory f) {
        return _with(this._config.with(f));
    }

    public ObjectReader with(JsonFactory f) {
        if (f == this._parserFactory) {
            return this;
        }
        ObjectReader r = new ObjectReader(this, f);
        if (f.getCodec() == null) {
            f.setCodec(r);
        }
        return r;
    }

    public ObjectReader withRootName(String rootName) {
        return _with(this._config.withRootName(rootName));
    }

    public ObjectReader with(FormatSchema schema) {
        if (this._schema == schema) {
            return this;
        }
        _verifySchemaType(schema);
        return new ObjectReader(this, this._config, this._valueType, this._rootDeserializer, this._valueToUpdate, schema, this._injectableValues, this._dataFormatReaders);
    }

    public ObjectReader withType(JavaType valueType) {
        if (valueType != null && valueType.equals(this._valueType)) {
            return this;
        }
        JsonDeserializer<Object> rootDeser = _prefetchRootDeserializer(this._config, valueType);
        DataFormatReaders det = this._dataFormatReaders;
        if (det != null) {
            det = det.withType(valueType);
        }
        return new ObjectReader(this, this._config, valueType, rootDeser, this._valueToUpdate, this._schema, this._injectableValues, det);
    }

    public ObjectReader withType(Class<?> valueType) {
        return withType(this._config.constructType(valueType));
    }

    public ObjectReader withType(Type valueType) {
        return withType(this._config.getTypeFactory().constructType(valueType));
    }

    public ObjectReader withType(TypeReference<?> valueTypeRef) {
        return withType(this._config.getTypeFactory().constructType(valueTypeRef.getType()));
    }

    public ObjectReader withValueToUpdate(Object value) {
        JavaType t;
        if (value == this._valueToUpdate) {
            return this;
        }
        if (value == null) {
            throw new IllegalArgumentException("cat not update null value");
        }
        if (this._valueType == null) {
            t = this._config.constructType(value.getClass());
        } else {
            t = this._valueType;
        }
        return new ObjectReader(this, this._config, t, this._rootDeserializer, value, this._schema, this._injectableValues, this._dataFormatReaders);
    }

    public ObjectReader withView(Class<?> activeView) {
        return _with(this._config.withView(activeView));
    }

    public ObjectReader with(Locale l) {
        return _with(this._config.with(l));
    }

    public ObjectReader with(TimeZone tz) {
        return _with(this._config.with(tz));
    }

    public ObjectReader withHandler(DeserializationProblemHandler h) {
        return _with(this._config.withHandler(h));
    }

    public ObjectReader with(Base64Variant defaultBase64) {
        return _with(this._config.with(defaultBase64));
    }

    public ObjectReader withFormatDetection(ObjectReader... readers) {
        return withFormatDetection(new DataFormatReaders(readers));
    }

    public ObjectReader withFormatDetection(DataFormatReaders readers) {
        return new ObjectReader(this, this._config, this._valueType, this._rootDeserializer, this._valueToUpdate, this._schema, this._injectableValues, readers);
    }

    public ObjectReader with(ContextAttributes attrs) {
        DeserializationConfig newConfig = this._config.with(attrs);
        return newConfig == this._config ? this : new ObjectReader(this, newConfig);
    }

    public ObjectReader withAttributes(Map<Object, Object> attrs) {
        DeserializationConfig newConfig = this._config.withAttributes(attrs);
        return newConfig == this._config ? this : new ObjectReader(this, newConfig);
    }

    public ObjectReader withAttribute(Object key, Object value) {
        DeserializationConfig newConfig = this._config.withAttribute(key, value);
        return newConfig == this._config ? this : new ObjectReader(this, newConfig);
    }

    public ObjectReader withoutAttribute(Object key) {
        DeserializationConfig newConfig = this._config.withoutAttribute(key);
        return newConfig == this._config ? this : new ObjectReader(this, newConfig);
    }

    public boolean isEnabled(DeserializationFeature f) {
        return this._config.isEnabled(f);
    }

    public boolean isEnabled(MapperFeature f) {
        return this._config.isEnabled(f);
    }

    public boolean isEnabled(JsonParser.Feature f) {
        return this._parserFactory.isEnabled(f);
    }

    public DeserializationConfig getConfig() {
        return this._config;
    }

    public JsonFactory getFactory() {
        return this._parserFactory;
    }

    @Deprecated
    public JsonFactory getJsonFactory() {
        return this._parserFactory;
    }

    public TypeFactory getTypeFactory() {
        return this._config.getTypeFactory();
    }

    public ContextAttributes getAttributes() {
        return this._config.getAttributes();
    }

    public <T> T readValue(JsonParser jsonParser) throws IOException, JsonProcessingException {
        return (T) _bind(jsonParser, this._valueToUpdate);
    }

    public <T> T readValue(JsonParser jsonParser, Class<T> cls) throws IOException, JsonProcessingException {
        return (T) withType((Class<?>) cls).readValue(jsonParser);
    }

    public <T> T readValue(JsonParser jsonParser, TypeReference<?> typeReference) throws IOException, JsonProcessingException {
        return (T) withType(typeReference).readValue(jsonParser);
    }

    public <T> T readValue(JsonParser jsonParser, ResolvedType resolvedType) throws IOException, JsonProcessingException {
        return (T) withType((JavaType) resolvedType).readValue(jsonParser);
    }

    public <T> T readValue(JsonParser jsonParser, JavaType javaType) throws IOException, JsonProcessingException {
        return (T) withType(javaType).readValue(jsonParser);
    }

    public <T> Iterator<T> readValues(JsonParser jp, Class<T> valueType) throws IOException, JsonProcessingException {
        return withType((Class<?>) valueType).readValues(jp);
    }

    public <T> Iterator<T> readValues(JsonParser jp, TypeReference<?> valueTypeRef) throws IOException, JsonProcessingException {
        return withType(valueTypeRef).readValues(jp);
    }

    public <T> Iterator<T> readValues(JsonParser jp, ResolvedType valueType) throws IOException, JsonProcessingException {
        return readValues(jp, (JavaType) valueType);
    }

    public <T> Iterator<T> readValues(JsonParser jp, JavaType valueType) throws IOException, JsonProcessingException {
        return withType(valueType).readValues(jp);
    }

    /* renamed from: createArrayNode, reason: merged with bridge method [inline-methods] */
    public JsonNode m24createArrayNode() {
        return this._config.getNodeFactory().arrayNode();
    }

    /* renamed from: createObjectNode, reason: merged with bridge method [inline-methods] */
    public JsonNode m25createObjectNode() {
        return this._config.getNodeFactory().objectNode();
    }

    public JsonParser treeAsTokens(TreeNode n) {
        return new TreeTraversingParser((JsonNode) n, this);
    }

    public <T extends TreeNode> T readTree(JsonParser jp) throws IOException, JsonProcessingException {
        return _bindAsTree(jp);
    }

    public void writeTree(JsonGenerator jgen, TreeNode rootNode) {
        throw new UnsupportedOperationException();
    }

    public <T> T readValue(InputStream inputStream) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            return (T) _detectBindAndClose(this._dataFormatReaders.findFormat(inputStream), false);
        }
        return (T) _bindAndClose(this._parserFactory.createParser(inputStream), this._valueToUpdate);
    }

    public <T> T readValue(Reader reader) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            _reportUndetectableSource(reader);
        }
        return (T) _bindAndClose(this._parserFactory.createParser(reader), this._valueToUpdate);
    }

    public <T> T readValue(String str) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            _reportUndetectableSource(str);
        }
        return (T) _bindAndClose(this._parserFactory.createParser(str), this._valueToUpdate);
    }

    public <T> T readValue(byte[] bArr) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            return (T) _detectBindAndClose(bArr, 0, bArr.length);
        }
        return (T) _bindAndClose(this._parserFactory.createParser(bArr), this._valueToUpdate);
    }

    public <T> T readValue(byte[] bArr, int i, int i2) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            return (T) _detectBindAndClose(bArr, i, i2);
        }
        return (T) _bindAndClose(this._parserFactory.createParser(bArr, i, i2), this._valueToUpdate);
    }

    public <T> T readValue(File file) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            return (T) _detectBindAndClose(this._dataFormatReaders.findFormat(_inputStream(file)), true);
        }
        return (T) _bindAndClose(this._parserFactory.createParser(file), this._valueToUpdate);
    }

    public <T> T readValue(URL url) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            return (T) _detectBindAndClose(this._dataFormatReaders.findFormat(_inputStream(url)), true);
        }
        return (T) _bindAndClose(this._parserFactory.createParser(url), this._valueToUpdate);
    }

    public <T> T readValue(JsonNode jsonNode) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            _reportUndetectableSource(jsonNode);
        }
        return (T) _bindAndClose(treeAsTokens(jsonNode), this._valueToUpdate);
    }

    public JsonNode readTree(InputStream in) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            return _detectBindAndCloseAsTree(in);
        }
        return _bindAndCloseAsTree(this._parserFactory.createParser(in));
    }

    public JsonNode readTree(Reader r) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            _reportUndetectableSource(r);
        }
        return _bindAndCloseAsTree(this._parserFactory.createParser(r));
    }

    public JsonNode readTree(String json) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            _reportUndetectableSource(json);
        }
        return _bindAndCloseAsTree(this._parserFactory.createParser(json));
    }

    public <T> MappingIterator<T> readValues(JsonParser jp) throws IOException, JsonProcessingException {
        DeserializationContext ctxt = createDeserializationContext(jp, this._config);
        return new MappingIterator<>(this._valueType, jp, ctxt, _findRootDeserializer(ctxt, this._valueType), false, this._valueToUpdate);
    }

    public <T> MappingIterator<T> readValues(InputStream src) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            return _detectBindAndReadValues(this._dataFormatReaders.findFormat(src), false);
        }
        return _bindAndReadValues(this._parserFactory.createParser(src), this._valueToUpdate);
    }

    public <T> MappingIterator<T> readValues(Reader src) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            _reportUndetectableSource(src);
        }
        JsonParser jp = this._parserFactory.createParser(src);
        if (this._schema != null) {
            jp.setSchema(this._schema);
        }
        jp.nextToken();
        DeserializationContext ctxt = createDeserializationContext(jp, this._config);
        return new MappingIterator<>(this._valueType, jp, ctxt, _findRootDeserializer(ctxt, this._valueType), true, this._valueToUpdate);
    }

    public <T> MappingIterator<T> readValues(String json) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            _reportUndetectableSource(json);
        }
        JsonParser jp = this._parserFactory.createParser(json);
        if (this._schema != null) {
            jp.setSchema(this._schema);
        }
        jp.nextToken();
        DeserializationContext ctxt = createDeserializationContext(jp, this._config);
        return new MappingIterator<>(this._valueType, jp, ctxt, _findRootDeserializer(ctxt, this._valueType), true, this._valueToUpdate);
    }

    public <T> MappingIterator<T> readValues(byte[] src, int offset, int length) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            return _detectBindAndReadValues(this._dataFormatReaders.findFormat(src, offset, length), false);
        }
        return _bindAndReadValues(this._parserFactory.createParser(src), this._valueToUpdate);
    }

    public final <T> MappingIterator<T> readValues(byte[] src) throws IOException, JsonProcessingException {
        return readValues(src, 0, src.length);
    }

    public <T> MappingIterator<T> readValues(File src) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            return _detectBindAndReadValues(this._dataFormatReaders.findFormat(_inputStream(src)), false);
        }
        return _bindAndReadValues(this._parserFactory.createParser(src), this._valueToUpdate);
    }

    public <T> MappingIterator<T> readValues(URL src) throws IOException, JsonProcessingException {
        if (this._dataFormatReaders != null) {
            return _detectBindAndReadValues(this._dataFormatReaders.findFormat(_inputStream(src)), true);
        }
        return _bindAndReadValues(this._parserFactory.createParser(src), this._valueToUpdate);
    }

    public <T> T treeToValue(TreeNode treeNode, Class<T> cls) throws JsonProcessingException {
        try {
            return (T) readValue(treeAsTokens(treeNode), cls);
        } catch (JsonProcessingException e) {
            throw e;
        } catch (IOException e2) {
            throw new IllegalArgumentException(e2.getMessage(), e2);
        }
    }

    public void writeValue(JsonGenerator jgen, Object value) throws IOException, JsonProcessingException {
        throw new UnsupportedOperationException("Not implemented for ObjectReader");
    }

    protected Object _bind(JsonParser jp, Object valueToUpdate) throws IOException, JsonParseException, JsonMappingException {
        Object result;
        JsonToken t = _initForReading(jp);
        if (t == JsonToken.VALUE_NULL) {
            if (valueToUpdate == null) {
                result = _findRootDeserializer(createDeserializationContext(jp, this._config), this._valueType).getNullValue();
            } else {
                result = valueToUpdate;
            }
        } else if (t == JsonToken.END_ARRAY || t == JsonToken.END_OBJECT) {
            result = valueToUpdate;
        } else {
            DeserializationContext ctxt = createDeserializationContext(jp, this._config);
            JsonDeserializer<Object> deser = _findRootDeserializer(ctxt, this._valueType);
            if (this._unwrapRoot) {
                result = _unwrapAndDeserialize(jp, ctxt, this._valueType, deser);
            } else if (valueToUpdate == null) {
                result = deser.deserialize(jp, ctxt);
            } else {
                deser.deserialize(jp, ctxt, valueToUpdate);
                result = valueToUpdate;
            }
        }
        jp.clearCurrentToken();
        return result;
    }

    protected Object _bindAndClose(JsonParser jp, Object valueToUpdate) throws IOException, JsonParseException, JsonMappingException {
        Object result;
        if (this._schema != null) {
            jp.setSchema(this._schema);
        }
        try {
            JsonToken t = _initForReading(jp);
            if (t == JsonToken.VALUE_NULL) {
                if (valueToUpdate == null) {
                    result = _findRootDeserializer(createDeserializationContext(jp, this._config), this._valueType).getNullValue();
                } else {
                    result = valueToUpdate;
                }
            } else if (t == JsonToken.END_ARRAY || t == JsonToken.END_OBJECT) {
                result = valueToUpdate;
            } else {
                DeserializationContext ctxt = createDeserializationContext(jp, this._config);
                JsonDeserializer<Object> deser = _findRootDeserializer(ctxt, this._valueType);
                if (this._unwrapRoot) {
                    result = _unwrapAndDeserialize(jp, ctxt, this._valueType, deser);
                } else if (valueToUpdate == null) {
                    result = deser.deserialize(jp, ctxt);
                } else {
                    deser.deserialize(jp, ctxt, valueToUpdate);
                    result = valueToUpdate;
                }
            }
            return result;
        } finally {
            try {
                jp.close();
            } catch (IOException e) {
            }
        }
    }

    protected JsonNode _bindAsTree(JsonParser jp) throws IOException, JsonParseException, JsonMappingException {
        JsonNode result;
        JsonToken t = _initForReading(jp);
        if (t == JsonToken.VALUE_NULL || t == JsonToken.END_ARRAY || t == JsonToken.END_OBJECT) {
            result = NullNode.instance;
        } else {
            DeserializationContext ctxt = createDeserializationContext(jp, this._config);
            JsonDeserializer<Object> deser = _findRootDeserializer(ctxt, JSON_NODE_TYPE);
            if (this._unwrapRoot) {
                result = (JsonNode) _unwrapAndDeserialize(jp, ctxt, JSON_NODE_TYPE, deser);
            } else {
                result = (JsonNode) deser.deserialize(jp, ctxt);
            }
        }
        jp.clearCurrentToken();
        return result;
    }

    protected JsonNode _bindAndCloseAsTree(JsonParser jp) throws IOException, JsonParseException, JsonMappingException {
        if (this._schema != null) {
            jp.setSchema(this._schema);
        }
        try {
            return _bindAsTree(jp);
        } finally {
            try {
                jp.close();
            } catch (IOException e) {
            }
        }
    }

    protected <T> MappingIterator<T> _bindAndReadValues(JsonParser p, Object valueToUpdate) throws IOException, JsonProcessingException {
        if (this._schema != null) {
            p.setSchema(this._schema);
        }
        p.nextToken();
        DeserializationContext ctxt = createDeserializationContext(p, this._config);
        return new MappingIterator<>(this._valueType, p, ctxt, _findRootDeserializer(ctxt, this._valueType), true, this._valueToUpdate);
    }

    protected static JsonToken _initForReading(JsonParser jp) throws IOException, JsonParseException, JsonMappingException {
        JsonToken t = jp.getCurrentToken();
        if (t == null) {
            t = jp.nextToken();
            if (t == null) {
                throw JsonMappingException.from(jp, "No content to map due to end-of-input");
            }
        }
        return t;
    }

    protected JsonDeserializer<Object> _findRootDeserializer(DeserializationContext ctxt, JavaType valueType) throws JsonMappingException {
        if (this._rootDeserializer != null) {
            return this._rootDeserializer;
        }
        if (valueType == null) {
            throw new JsonMappingException("No value type configured for ObjectReader");
        }
        JsonDeserializer<Object> deser = this._rootDeserializers.get(valueType);
        if (deser != null) {
            return deser;
        }
        JsonDeserializer<Object> deser2 = ctxt.findRootValueDeserializer(valueType);
        if (deser2 == null) {
            throw new JsonMappingException("Can not find a deserializer for type " + valueType);
        }
        this._rootDeserializers.put(valueType, deser2);
        return deser2;
    }

    protected JsonDeserializer<Object> _prefetchRootDeserializer(DeserializationConfig config, JavaType valueType) {
        if (valueType == null || !this._config.isEnabled(DeserializationFeature.EAGER_DESERIALIZER_FETCH)) {
            return null;
        }
        JsonDeserializer<Object> deser = this._rootDeserializers.get(valueType);
        if (deser == null) {
            try {
                DeserializationContext ctxt = createDeserializationContext(null, this._config);
                deser = ctxt.findRootValueDeserializer(valueType);
                if (deser != null) {
                    this._rootDeserializers.put(valueType, deser);
                }
                return deser;
            } catch (JsonProcessingException e) {
            }
        }
        return deser;
    }

    protected Object _unwrapAndDeserialize(JsonParser jp, DeserializationContext ctxt, JavaType rootType, JsonDeserializer<Object> deser) throws IOException, JsonParseException, JsonMappingException {
        Object result;
        String expName = this._config.getRootName();
        if (expName == null) {
            PropertyName pname = this._rootNames.findRootName(rootType, this._config);
            expName = pname.getSimpleName();
        }
        if (jp.getCurrentToken() != JsonToken.START_OBJECT) {
            throw JsonMappingException.from(jp, "Current token not START_OBJECT (needed to unwrap root name '" + expName + "'), but " + jp.getCurrentToken());
        }
        if (jp.nextToken() != JsonToken.FIELD_NAME) {
            throw JsonMappingException.from(jp, "Current token not FIELD_NAME (to contain expected root name '" + expName + "'), but " + jp.getCurrentToken());
        }
        String actualName = jp.getCurrentName();
        if (!expName.equals(actualName)) {
            throw JsonMappingException.from(jp, "Root name '" + actualName + "' does not match expected ('" + expName + "') for type " + rootType);
        }
        jp.nextToken();
        if (this._valueToUpdate == null) {
            result = deser.deserialize(jp, ctxt);
        } else {
            deser.deserialize(jp, ctxt, this._valueToUpdate);
            result = this._valueToUpdate;
        }
        if (jp.nextToken() != JsonToken.END_OBJECT) {
            throw JsonMappingException.from(jp, "Current token not END_OBJECT (to match wrapper object with root name '" + expName + "'), but " + jp.getCurrentToken());
        }
        return result;
    }

    protected Object _detectBindAndClose(byte[] src, int offset, int length) throws IOException {
        DataFormatReaders.Match match = this._dataFormatReaders.findFormat(src, offset, length);
        if (!match.hasMatch()) {
            _reportUnkownFormat(this._dataFormatReaders, match);
        }
        JsonParser jp = match.createParserWithMatch();
        return match.getReader()._bindAndClose(jp, this._valueToUpdate);
    }

    protected Object _detectBindAndClose(DataFormatReaders.Match match, boolean forceClosing) throws IOException {
        if (!match.hasMatch()) {
            _reportUnkownFormat(this._dataFormatReaders, match);
        }
        JsonParser p = match.createParserWithMatch();
        if (forceClosing) {
            p.enable(JsonParser.Feature.AUTO_CLOSE_SOURCE);
        }
        return match.getReader()._bindAndClose(p, this._valueToUpdate);
    }

    protected <T> MappingIterator<T> _detectBindAndReadValues(DataFormatReaders.Match match, boolean forceClosing) throws IOException, JsonProcessingException {
        if (!match.hasMatch()) {
            _reportUnkownFormat(this._dataFormatReaders, match);
        }
        JsonParser p = match.createParserWithMatch();
        if (forceClosing) {
            p.enable(JsonParser.Feature.AUTO_CLOSE_SOURCE);
        }
        return match.getReader()._bindAndReadValues(p, this._valueToUpdate);
    }

    protected JsonNode _detectBindAndCloseAsTree(InputStream in) throws IOException {
        DataFormatReaders.Match match = this._dataFormatReaders.findFormat(in);
        if (!match.hasMatch()) {
            _reportUnkownFormat(this._dataFormatReaders, match);
        }
        JsonParser p = match.createParserWithMatch();
        p.enable(JsonParser.Feature.AUTO_CLOSE_SOURCE);
        return match.getReader()._bindAndCloseAsTree(p);
    }

    protected void _reportUnkownFormat(DataFormatReaders detector, DataFormatReaders.Match match) throws JsonProcessingException {
        throw new JsonParseException("Can not detect format from input, does not look like any of detectable formats " + detector.toString(), JsonLocation.NA);
    }

    protected void _verifySchemaType(FormatSchema schema) {
        if (schema != null && !this._parserFactory.canUseSchema(schema)) {
            throw new IllegalArgumentException("Can not use FormatSchema of type " + schema.getClass().getName() + " for format " + this._parserFactory.getFormatName());
        }
    }

    protected DefaultDeserializationContext createDeserializationContext(JsonParser jp, DeserializationConfig cfg) {
        return this._context.createInstance(cfg, jp, this._injectableValues);
    }

    protected ObjectReader _with(DeserializationConfig newConfig) {
        if (newConfig == this._config) {
            return this;
        }
        if (this._dataFormatReaders != null) {
            return new ObjectReader(this, newConfig).withFormatDetection(this._dataFormatReaders.with(newConfig));
        }
        return new ObjectReader(this, newConfig);
    }

    protected void _reportUndetectableSource(Object src) throws JsonProcessingException {
        throw new JsonParseException("Can not use source of type " + src.getClass().getName() + " with format auto-detection: must be byte- not char-based", JsonLocation.NA);
    }

    protected InputStream _inputStream(URL src) throws IOException {
        return src.openStream();
    }

    protected InputStream _inputStream(File f) throws IOException {
        return new FileInputStream(f);
    }
}
