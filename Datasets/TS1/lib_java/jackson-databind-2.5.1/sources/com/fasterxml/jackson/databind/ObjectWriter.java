package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.FormatSchema;
import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.PrettyPrinter;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.Versioned;
import com.fasterxml.jackson.core.io.CharacterEscapes;
import com.fasterxml.jackson.core.io.SegmentedStringWriter;
import com.fasterxml.jackson.core.io.SerializedString;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.core.util.Instantiatable;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.fasterxml.jackson.databind.cfg.ContextAttributes;
import com.fasterxml.jackson.databind.cfg.PackageVersion;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.DefaultSerializerProvider;
import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.fasterxml.jackson.databind.ser.SerializerFactory;
import com.fasterxml.jackson.databind.ser.impl.TypeWrappedSerializer;
import com.fasterxml.jackson.databind.type.TypeFactory;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.io.Writer;
import java.text.DateFormat;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ObjectWriter.class */
public class ObjectWriter implements Versioned, Serializable {
    private static final long serialVersionUID = 1;
    protected static final PrettyPrinter NULL_PRETTY_PRINTER = new MinimalPrettyPrinter();
    protected final SerializationConfig _config;
    protected final DefaultSerializerProvider _serializerProvider;
    protected final SerializerFactory _serializerFactory;
    protected final JsonFactory _generatorFactory;
    protected final GeneratorSettings _generatorSettings;
    protected final Prefetch _prefetch;

    protected ObjectWriter(ObjectMapper mapper, SerializationConfig config, JavaType rootType, PrettyPrinter pp) {
        this._config = config;
        this._serializerProvider = mapper._serializerProvider;
        this._serializerFactory = mapper._serializerFactory;
        this._generatorFactory = mapper._jsonFactory;
        this._generatorSettings = pp == null ? GeneratorSettings.empty : new GeneratorSettings(pp, null, null, null);
        if (rootType == null || rootType.hasRawClass(Object.class)) {
            this._prefetch = Prefetch.empty;
        } else {
            this._prefetch = _prefetchRootSerializer(config, rootType.withStaticTyping());
        }
    }

    protected ObjectWriter(ObjectMapper mapper, SerializationConfig config) {
        this._config = config;
        this._serializerProvider = mapper._serializerProvider;
        this._serializerFactory = mapper._serializerFactory;
        this._generatorFactory = mapper._jsonFactory;
        this._prefetch = Prefetch.empty;
        this._generatorSettings = GeneratorSettings.empty;
    }

    protected ObjectWriter(ObjectMapper mapper, SerializationConfig config, FormatSchema s) {
        this._config = config;
        this._serializerProvider = mapper._serializerProvider;
        this._serializerFactory = mapper._serializerFactory;
        this._generatorFactory = mapper._jsonFactory;
        this._prefetch = Prefetch.empty;
        this._generatorSettings = s == null ? GeneratorSettings.empty : new GeneratorSettings(null, s, null, null);
    }

    protected ObjectWriter(ObjectWriter base, SerializationConfig config, GeneratorSettings genSettings, Prefetch prefetch) {
        this._config = config;
        this._serializerProvider = base._serializerProvider;
        this._serializerFactory = base._serializerFactory;
        this._generatorFactory = base._generatorFactory;
        this._generatorSettings = genSettings;
        this._prefetch = prefetch;
    }

    protected ObjectWriter(ObjectWriter base, SerializationConfig config) {
        this._config = config;
        this._serializerProvider = base._serializerProvider;
        this._serializerFactory = base._serializerFactory;
        this._generatorFactory = base._generatorFactory;
        this._generatorSettings = base._generatorSettings;
        this._prefetch = base._prefetch;
    }

    protected ObjectWriter(ObjectWriter base, JsonFactory f) {
        this._config = base._config.with(MapperFeature.SORT_PROPERTIES_ALPHABETICALLY, f.requiresPropertyOrdering());
        this._serializerProvider = base._serializerProvider;
        this._serializerFactory = base._serializerFactory;
        this._generatorFactory = base._generatorFactory;
        this._generatorSettings = base._generatorSettings;
        this._prefetch = base._prefetch;
    }

    public Version version() {
        return PackageVersion.VERSION;
    }

    protected ObjectWriter _new(ObjectWriter base, JsonFactory f) {
        return new ObjectWriter(base, f);
    }

    protected ObjectWriter _new(ObjectWriter base, SerializationConfig config) {
        return new ObjectWriter(base, config);
    }

    protected ObjectWriter _new(GeneratorSettings genSettings, Prefetch prefetch) {
        return new ObjectWriter(this, this._config, genSettings, prefetch);
    }

    protected SequenceWriter _newSequenceWriter(boolean wrapInArray, JsonGenerator gen, boolean managedInput) throws IOException {
        return new SequenceWriter(_serializerProvider(this._config), _configureGenerator(gen), managedInput, this._prefetch).init(wrapInArray);
    }

    public ObjectWriter with(SerializationFeature feature) {
        SerializationConfig newConfig = this._config.with(feature);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter with(SerializationFeature first, SerializationFeature... other) {
        SerializationConfig newConfig = this._config.with(first, other);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter withFeatures(SerializationFeature... features) {
        SerializationConfig newConfig = this._config.withFeatures(features);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter without(SerializationFeature feature) {
        SerializationConfig newConfig = this._config.without(feature);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter without(SerializationFeature first, SerializationFeature... other) {
        SerializationConfig newConfig = this._config.without(first, other);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter withoutFeatures(SerializationFeature... features) {
        SerializationConfig newConfig = this._config.withoutFeatures(features);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter with(JsonGenerator.Feature feature) {
        SerializationConfig newConfig = this._config.with(feature);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter withFeatures(JsonGenerator.Feature... features) {
        SerializationConfig newConfig = this._config.withFeatures(features);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter without(JsonGenerator.Feature feature) {
        SerializationConfig newConfig = this._config.without(feature);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter withoutFeatures(JsonGenerator.Feature... features) {
        SerializationConfig newConfig = this._config.withoutFeatures(features);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter with(DateFormat df) {
        SerializationConfig newConfig = this._config.with(df);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter withDefaultPrettyPrinter() {
        return with((PrettyPrinter) new DefaultPrettyPrinter());
    }

    public ObjectWriter with(FilterProvider filterProvider) {
        return filterProvider == this._config.getFilterProvider() ? this : _new(this, this._config.withFilters(filterProvider));
    }

    public ObjectWriter with(PrettyPrinter pp) {
        GeneratorSettings genSet = this._generatorSettings.with(pp);
        if (genSet == this._generatorSettings) {
            return this;
        }
        return _new(genSet, this._prefetch);
    }

    public ObjectWriter withRootName(String rootName) {
        SerializationConfig newConfig = this._config.withRootName(rootName);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter with(FormatSchema schema) {
        GeneratorSettings genSet = this._generatorSettings.with(schema);
        if (genSet == this._generatorSettings) {
            return this;
        }
        _verifySchemaType(schema);
        return _new(genSet, this._prefetch);
    }

    @Deprecated
    public ObjectWriter withSchema(FormatSchema schema) {
        return with(schema);
    }

    public ObjectWriter forType(JavaType rootType) {
        Prefetch pf;
        if (rootType == null || rootType.hasRawClass(Object.class)) {
            pf = Prefetch.empty;
        } else {
            pf = _prefetchRootSerializer(this._config, rootType.withStaticTyping());
        }
        return pf == this._prefetch ? this : _new(this._generatorSettings, pf);
    }

    public ObjectWriter forType(Class<?> rootType) {
        if (rootType == Object.class) {
            return forType((JavaType) null);
        }
        return forType(this._config.constructType(rootType));
    }

    public ObjectWriter forType(TypeReference<?> rootType) {
        return forType(this._config.getTypeFactory().constructType(rootType.getType()));
    }

    @Deprecated
    public ObjectWriter withType(JavaType rootType) {
        return forType(rootType);
    }

    @Deprecated
    public ObjectWriter withType(Class<?> rootType) {
        return forType(rootType);
    }

    @Deprecated
    public ObjectWriter withType(TypeReference<?> rootType) {
        return forType(rootType);
    }

    public ObjectWriter withView(Class<?> view) {
        SerializationConfig newConfig = this._config.withView(view);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter with(Locale l) {
        SerializationConfig newConfig = this._config.with(l);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter with(TimeZone tz) {
        SerializationConfig newConfig = this._config.with(tz);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter with(Base64Variant b64variant) {
        SerializationConfig newConfig = this._config.with(b64variant);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter with(CharacterEscapes escapes) {
        GeneratorSettings genSet = this._generatorSettings.with(escapes);
        if (genSet == this._generatorSettings) {
            return this;
        }
        return _new(genSet, this._prefetch);
    }

    public ObjectWriter with(JsonFactory f) {
        return f == this._generatorFactory ? this : _new(this, f);
    }

    public ObjectWriter with(ContextAttributes attrs) {
        SerializationConfig newConfig = this._config.with(attrs);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter withAttributes(Map<Object, Object> attrs) {
        SerializationConfig newConfig = this._config.withAttributes(attrs);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter withAttribute(Object key, Object value) {
        SerializationConfig newConfig = this._config.withAttribute(key, value);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter withoutAttribute(Object key) {
        SerializationConfig newConfig = this._config.withoutAttribute(key);
        return newConfig == this._config ? this : _new(this, newConfig);
    }

    public ObjectWriter withRootValueSeparator(String sep) {
        GeneratorSettings genSet = this._generatorSettings.withRootValueSeparator(sep);
        if (genSet == this._generatorSettings) {
            return this;
        }
        return _new(genSet, this._prefetch);
    }

    public ObjectWriter withRootValueSeparator(SerializableString sep) {
        GeneratorSettings genSet = this._generatorSettings.withRootValueSeparator(sep);
        if (genSet == this._generatorSettings) {
            return this;
        }
        return _new(genSet, this._prefetch);
    }

    public SequenceWriter writeValues(File out) throws IOException {
        return _newSequenceWriter(false, this._generatorFactory.createGenerator(out, JsonEncoding.UTF8), true);
    }

    public SequenceWriter writeValues(JsonGenerator gen) throws IOException {
        return _newSequenceWriter(false, _configureGenerator(gen), false);
    }

    public SequenceWriter writeValues(Writer out) throws IOException {
        return _newSequenceWriter(false, this._generatorFactory.createGenerator(out), true);
    }

    public SequenceWriter writeValues(OutputStream out) throws IOException {
        return _newSequenceWriter(false, this._generatorFactory.createGenerator(out, JsonEncoding.UTF8), true);
    }

    public SequenceWriter writeValuesAsArray(File out) throws IOException {
        return _newSequenceWriter(true, this._generatorFactory.createGenerator(out, JsonEncoding.UTF8), true);
    }

    public SequenceWriter writeValuesAsArray(JsonGenerator gen) throws IOException {
        return _newSequenceWriter(true, gen, false);
    }

    public SequenceWriter writeValuesAsArray(Writer out) throws IOException {
        return _newSequenceWriter(true, this._generatorFactory.createGenerator(out), true);
    }

    public SequenceWriter writeValuesAsArray(OutputStream out) throws IOException {
        return _newSequenceWriter(true, this._generatorFactory.createGenerator(out, JsonEncoding.UTF8), true);
    }

    public boolean isEnabled(SerializationFeature f) {
        return this._config.isEnabled(f);
    }

    public boolean isEnabled(MapperFeature f) {
        return this._config.isEnabled(f);
    }

    public boolean isEnabled(JsonParser.Feature f) {
        return this._generatorFactory.isEnabled(f);
    }

    public SerializationConfig getConfig() {
        return this._config;
    }

    @Deprecated
    public JsonFactory getJsonFactory() {
        return this._generatorFactory;
    }

    public JsonFactory getFactory() {
        return this._generatorFactory;
    }

    public TypeFactory getTypeFactory() {
        return this._config.getTypeFactory();
    }

    public boolean hasPrefetchedSerializer() {
        return this._prefetch.hasSerializer();
    }

    public ContextAttributes getAttributes() {
        return this._config.getAttributes();
    }

    public void writeValue(JsonGenerator gen, Object value) throws IOException, JsonGenerationException, JsonMappingException {
        _configureGenerator(gen);
        if (this._config.isEnabled(SerializationFeature.CLOSE_CLOSEABLE) && (value instanceof Closeable)) {
            _writeCloseableValue(gen, value, this._config);
            return;
        }
        if (this._prefetch.valueSerializer != null) {
            _serializerProvider(this._config).serializeValue(gen, value, this._prefetch.rootType, this._prefetch.valueSerializer);
        } else if (this._prefetch.typeSerializer != null) {
            _serializerProvider(this._config).serializePolymorphic(gen, value, this._prefetch.typeSerializer);
        } else {
            _serializerProvider(this._config).serializeValue(gen, value);
        }
        if (this._config.isEnabled(SerializationFeature.FLUSH_AFTER_WRITE_VALUE)) {
            gen.flush();
        }
    }

    public void writeValue(File resultFile, Object value) throws IOException, JsonGenerationException, JsonMappingException {
        _configAndWriteValue(this._generatorFactory.createGenerator(resultFile, JsonEncoding.UTF8), value);
    }

    public void writeValue(OutputStream out, Object value) throws IOException, JsonGenerationException, JsonMappingException {
        _configAndWriteValue(this._generatorFactory.createGenerator(out, JsonEncoding.UTF8), value);
    }

    public void writeValue(Writer w, Object value) throws IOException, JsonGenerationException, JsonMappingException {
        _configAndWriteValue(this._generatorFactory.createGenerator(w), value);
    }

    public String writeValueAsString(Object value) throws JsonProcessingException {
        SegmentedStringWriter sw = new SegmentedStringWriter(this._generatorFactory._getBufferRecycler());
        try {
            _configAndWriteValue(this._generatorFactory.createGenerator(sw), value);
            return sw.getAndClear();
        } catch (JsonProcessingException e) {
            throw e;
        } catch (IOException e2) {
            throw JsonMappingException.fromUnexpectedIOE(e2);
        }
    }

    public byte[] writeValueAsBytes(Object value) throws JsonProcessingException {
        ByteArrayBuilder bb = new ByteArrayBuilder(this._generatorFactory._getBufferRecycler());
        try {
            _configAndWriteValue(this._generatorFactory.createGenerator(bb, JsonEncoding.UTF8), value);
            byte[] result = bb.toByteArray();
            bb.release();
            return result;
        } catch (IOException e) {
            throw JsonMappingException.fromUnexpectedIOE(e);
        } catch (JsonProcessingException e2) {
            throw e2;
        }
    }

    public void acceptJsonFormatVisitor(JavaType type, JsonFormatVisitorWrapper visitor) throws JsonMappingException {
        if (type == null) {
            throw new IllegalArgumentException("type must be provided");
        }
        _serializerProvider(this._config).acceptJsonFormatVisitor(type, visitor);
    }

    public boolean canSerialize(Class<?> type) {
        return _serializerProvider(this._config).hasSerializerFor(type, null);
    }

    public boolean canSerialize(Class<?> type, AtomicReference<Throwable> cause) {
        return _serializerProvider(this._config).hasSerializerFor(type, cause);
    }

    protected DefaultSerializerProvider _serializerProvider(SerializationConfig config) {
        return this._serializerProvider.createInstance(config, this._serializerFactory);
    }

    protected void _verifySchemaType(FormatSchema schema) {
        if (schema != null && !this._generatorFactory.canUseSchema(schema)) {
            throw new IllegalArgumentException("Can not use FormatSchema of type " + schema.getClass().getName() + " for format " + this._generatorFactory.getFormatName());
        }
    }

    protected final void _configAndWriteValue(JsonGenerator gen, Object value) throws IOException {
        _configureGenerator(gen);
        if (this._config.isEnabled(SerializationFeature.CLOSE_CLOSEABLE) && (value instanceof Closeable)) {
            _writeCloseable(gen, value, this._config);
            return;
        }
        boolean closed = false;
        try {
            if (this._prefetch.valueSerializer != null) {
                _serializerProvider(this._config).serializeValue(gen, value, this._prefetch.rootType, this._prefetch.valueSerializer);
            } else if (this._prefetch.typeSerializer != null) {
                _serializerProvider(this._config).serializePolymorphic(gen, value, this._prefetch.typeSerializer);
            } else {
                _serializerProvider(this._config).serializeValue(gen, value);
            }
            closed = true;
            gen.close();
            if (1 == 0) {
                gen.disable(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT);
                try {
                    gen.close();
                } catch (IOException e) {
                }
            }
        } catch (Throwable th) {
            if (!closed) {
                gen.disable(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT);
                try {
                    gen.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
    }

    private final void _writeCloseable(JsonGenerator gen, Object value, SerializationConfig cfg) throws IOException {
        Closeable toClose = (Closeable) value;
        try {
            if (this._prefetch.valueSerializer != null) {
                _serializerProvider(cfg).serializeValue(gen, value, this._prefetch.rootType, this._prefetch.valueSerializer);
            } else if (this._prefetch.typeSerializer != null) {
                _serializerProvider(cfg).serializePolymorphic(gen, value, this._prefetch.typeSerializer);
            } else {
                _serializerProvider(cfg).serializeValue(gen, value);
            }
            gen = null;
            gen.close();
            toClose = null;
            toClose.close();
            if (0 != 0) {
                gen.disable(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT);
                try {
                    gen.close();
                } catch (IOException e) {
                }
            }
            if (0 != 0) {
                try {
                    toClose.close();
                } catch (IOException e2) {
                }
            }
        } catch (Throwable th) {
            if (gen != null) {
                gen.disable(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT);
                try {
                    gen.close();
                } catch (IOException e3) {
                }
            }
            if (toClose != null) {
                try {
                    toClose.close();
                } catch (IOException e4) {
                }
            }
            throw th;
        }
    }

    private final void _writeCloseableValue(JsonGenerator gen, Object value, SerializationConfig cfg) throws IOException {
        Closeable toClose = (Closeable) value;
        try {
            if (this._prefetch.valueSerializer != null) {
                _serializerProvider(cfg).serializeValue(gen, value, this._prefetch.rootType, this._prefetch.valueSerializer);
            } else if (this._prefetch.typeSerializer != null) {
                _serializerProvider(cfg).serializePolymorphic(gen, value, this._prefetch.typeSerializer);
            } else {
                _serializerProvider(cfg).serializeValue(gen, value);
            }
            if (this._config.isEnabled(SerializationFeature.FLUSH_AFTER_WRITE_VALUE)) {
                gen.flush();
            }
            toClose = null;
            toClose.close();
            if (0 != 0) {
                try {
                    toClose.close();
                } catch (IOException e) {
                }
            }
        } catch (Throwable th) {
            if (toClose != null) {
                try {
                    toClose.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
    }

    protected Prefetch _prefetchRootSerializer(SerializationConfig config, JavaType valueType) {
        if (valueType != null && this._config.isEnabled(SerializationFeature.EAGER_SERIALIZER_FETCH)) {
            try {
                JsonSerializer<Object> ser = _serializerProvider(config).findTypedValueSerializer(valueType, true, (BeanProperty) null);
                if (ser instanceof TypeWrappedSerializer) {
                    return Prefetch.construct(valueType, ((TypeWrappedSerializer) ser).typeSerializer());
                }
                return Prefetch.construct(valueType, ser);
            } catch (JsonProcessingException e) {
            }
        }
        return Prefetch.empty;
    }

    @Deprecated
    protected void _configureJsonGenerator(JsonGenerator gen) {
        _configureGenerator(gen);
    }

    protected JsonGenerator _configureGenerator(JsonGenerator gen) {
        GeneratorSettings genSet = this._generatorSettings;
        PrettyPrinter pp = genSet.prettyPrinter;
        if (pp != null) {
            if (pp == NULL_PRETTY_PRINTER) {
                gen.setPrettyPrinter((PrettyPrinter) null);
            } else {
                if (pp instanceof Instantiatable) {
                    pp = (PrettyPrinter) ((Instantiatable) pp).createInstance();
                }
                gen.setPrettyPrinter(pp);
            }
        } else if (this._config.isEnabled(SerializationFeature.INDENT_OUTPUT)) {
            gen.useDefaultPrettyPrinter();
        }
        CharacterEscapes esc = genSet.characterEscapes;
        if (esc != null) {
            gen.setCharacterEscapes(esc);
        }
        FormatSchema sch = genSet.schema;
        if (sch != null) {
            gen.setSchema(sch);
        }
        SerializableString sep = genSet.rootValueSeparator;
        if (sep != null) {
            gen.setRootValueSeparator(sep);
        }
        this._config.initialize(gen);
        return gen;
    }

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings.class */
    public static final class GeneratorSettings implements Serializable {
        private static final long serialVersionUID = 1;
        public static final GeneratorSettings empty = new GeneratorSettings(null, null, null, null);
        public final PrettyPrinter prettyPrinter;
        public final FormatSchema schema;
        public final CharacterEscapes characterEscapes;
        public final SerializableString rootValueSeparator;

        public GeneratorSettings(PrettyPrinter pp, FormatSchema sch, CharacterEscapes esc, SerializableString rootSep) {
            this.prettyPrinter = pp;
            this.schema = sch;
            this.characterEscapes = esc;
            this.rootValueSeparator = rootSep;
        }

        public GeneratorSettings with(PrettyPrinter pp) {
            if (pp == null) {
                pp = ObjectWriter.NULL_PRETTY_PRINTER;
            }
            return pp == this.prettyPrinter ? this : new GeneratorSettings(pp, this.schema, this.characterEscapes, this.rootValueSeparator);
        }

        public GeneratorSettings with(FormatSchema sch) {
            return this.schema == sch ? this : new GeneratorSettings(this.prettyPrinter, sch, this.characterEscapes, this.rootValueSeparator);
        }

        public GeneratorSettings with(CharacterEscapes esc) {
            return this.characterEscapes == esc ? this : new GeneratorSettings(this.prettyPrinter, this.schema, esc, this.rootValueSeparator);
        }

        public GeneratorSettings withRootValueSeparator(String sep) {
            if (sep == null) {
                if (this.rootValueSeparator == null) {
                    return this;
                }
            } else if (sep.equals(this.rootValueSeparator)) {
                return this;
            }
            return new GeneratorSettings(this.prettyPrinter, this.schema, this.characterEscapes, sep == null ? null : new SerializedString(sep));
        }

        public GeneratorSettings withRootValueSeparator(SerializableString sep) {
            if (sep == null) {
                if (this.rootValueSeparator == null) {
                    return this;
                }
            } else if (this.rootValueSeparator != null && sep.getValue().equals(this.rootValueSeparator.getValue())) {
                return this;
            }
            return new GeneratorSettings(this.prettyPrinter, this.schema, this.characterEscapes, sep);
        }
    }

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ObjectWriter$Prefetch.class */
    public static final class Prefetch implements Serializable {
        private static final long serialVersionUID = 1;
        public static final Prefetch empty = new Prefetch(null, null, null);
        public final JavaType rootType;
        public final JsonSerializer<Object> valueSerializer;
        public final TypeSerializer typeSerializer;

        private Prefetch(JavaType type, JsonSerializer<Object> ser, TypeSerializer typeSer) {
            this.rootType = type;
            this.valueSerializer = ser;
            this.typeSerializer = typeSer;
        }

        public static Prefetch construct(JavaType type, JsonSerializer<Object> ser) {
            if (type == null && ser == null) {
                return empty;
            }
            return new Prefetch(type, ser, null);
        }

        public static Prefetch construct(JavaType type, TypeSerializer typeSer) {
            if (type == null && typeSer == null) {
                return empty;
            }
            return new Prefetch(type, null, typeSer);
        }

        public boolean hasSerializer() {
            return (this.valueSerializer == null && this.typeSerializer == null) ? false : true;
        }
    }
}
