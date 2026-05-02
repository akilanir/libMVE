package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.Base64Variants;
import com.fasterxml.jackson.core.FormatSchema;
import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.PrettyPrinter;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.Versioned;
import com.fasterxml.jackson.core.io.CharacterEscapes;
import com.fasterxml.jackson.core.io.SegmentedStringWriter;
import com.fasterxml.jackson.core.type.ResolvedType;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.databind.Module;
import com.fasterxml.jackson.databind.cfg.BaseSettings;
import com.fasterxml.jackson.databind.cfg.ContextAttributes;
import com.fasterxml.jackson.databind.cfg.HandlerInstantiator;
import com.fasterxml.jackson.databind.cfg.PackageVersion;
import com.fasterxml.jackson.databind.deser.BeanDeserializerFactory;
import com.fasterxml.jackson.databind.deser.BeanDeserializerModifier;
import com.fasterxml.jackson.databind.deser.DefaultDeserializationContext;
import com.fasterxml.jackson.databind.deser.DeserializationProblemHandler;
import com.fasterxml.jackson.databind.deser.DeserializerFactory;
import com.fasterxml.jackson.databind.deser.Deserializers;
import com.fasterxml.jackson.databind.deser.KeyDeserializers;
import com.fasterxml.jackson.databind.deser.ValueInstantiators;
import com.fasterxml.jackson.databind.introspect.BasicClassIntrospector;
import com.fasterxml.jackson.databind.introspect.ClassIntrospector;
import com.fasterxml.jackson.databind.introspect.JacksonAnnotationIntrospector;
import com.fasterxml.jackson.databind.introspect.SimpleMixInResolver;
import com.fasterxml.jackson.databind.introspect.VisibilityChecker;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsonschema.JsonSchema;
import com.fasterxml.jackson.databind.jsontype.NamedType;
import com.fasterxml.jackson.databind.jsontype.SubtypeResolver;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.jsontype.impl.StdSubtypeResolver;
import com.fasterxml.jackson.databind.jsontype.impl.StdTypeResolverBuilder;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.NullNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.TreeTraversingParser;
import com.fasterxml.jackson.databind.ser.BeanSerializerFactory;
import com.fasterxml.jackson.databind.ser.BeanSerializerModifier;
import com.fasterxml.jackson.databind.ser.DefaultSerializerProvider;
import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.fasterxml.jackson.databind.ser.SerializerFactory;
import com.fasterxml.jackson.databind.ser.Serializers;
import com.fasterxml.jackson.databind.type.SimpleType;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.type.TypeModifier;
import com.fasterxml.jackson.databind.util.RootNameLookup;
import com.fasterxml.jackson.databind.util.StdDateFormat;
import com.fasterxml.jackson.databind.util.TokenBuffer;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Serializable;
import java.io.Writer;
import java.lang.reflect.Type;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ServiceLoader;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ObjectMapper.class */
public class ObjectMapper extends ObjectCodec implements Versioned, Serializable {
    private static final long serialVersionUID = 1;
    private static final JavaType JSON_NODE_TYPE = SimpleType.constructUnsafe(JsonNode.class);
    protected static final AnnotationIntrospector DEFAULT_ANNOTATION_INTROSPECTOR = new JacksonAnnotationIntrospector();
    protected static final VisibilityChecker<?> STD_VISIBILITY_CHECKER = VisibilityChecker.Std.defaultInstance();

    @Deprecated
    protected static final PrettyPrinter _defaultPrettyPrinter = new DefaultPrettyPrinter();
    protected static final BaseSettings DEFAULT_BASE = new BaseSettings(null, DEFAULT_ANNOTATION_INTROSPECTOR, STD_VISIBILITY_CHECKER, null, TypeFactory.defaultInstance(), null, StdDateFormat.instance, null, Locale.getDefault(), TimeZone.getTimeZone("GMT"), Base64Variants.getDefaultVariant());
    protected final JsonFactory _jsonFactory;
    protected TypeFactory _typeFactory;
    protected InjectableValues _injectableValues;
    protected SubtypeResolver _subtypeResolver;
    protected SimpleMixInResolver _mixIns;
    protected SerializationConfig _serializationConfig;
    protected DefaultSerializerProvider _serializerProvider;
    protected SerializerFactory _serializerFactory;
    protected DeserializationConfig _deserializationConfig;
    protected DefaultDeserializationContext _deserializationContext;
    protected Set<Object> _registeredModuleTypes;
    protected final ConcurrentHashMap<JavaType, JsonDeserializer<Object>> _rootDeserializers;

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ObjectMapper$DefaultTyping.class */
    public enum DefaultTyping {
        JAVA_LANG_OBJECT,
        OBJECT_AND_NON_CONCRETE,
        NON_CONCRETE_AND_ARRAYS,
        NON_FINAL
    }

    /* renamed from: readValues, reason: collision with other method in class */
    public /* bridge */ /* synthetic */ Iterator m20readValues(JsonParser x0, TypeReference x1) throws IOException, JsonProcessingException {
        return readValues(x0, (TypeReference<?>) x1);
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ObjectMapper$DefaultTypeResolverBuilder.class */
    public static class DefaultTypeResolverBuilder extends StdTypeResolverBuilder implements Serializable {
        private static final long serialVersionUID = 1;
        protected final DefaultTyping _appliesFor;

        public DefaultTypeResolverBuilder(DefaultTyping t) {
            this._appliesFor = t;
        }

        @Override // com.fasterxml.jackson.databind.jsontype.impl.StdTypeResolverBuilder, com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
        public TypeDeserializer buildTypeDeserializer(DeserializationConfig config, JavaType baseType, Collection<NamedType> subtypes) {
            if (useForType(baseType)) {
                return super.buildTypeDeserializer(config, baseType, subtypes);
            }
            return null;
        }

        @Override // com.fasterxml.jackson.databind.jsontype.impl.StdTypeResolverBuilder, com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
        public TypeSerializer buildTypeSerializer(SerializationConfig config, JavaType baseType, Collection<NamedType> subtypes) {
            if (useForType(baseType)) {
                return super.buildTypeSerializer(config, baseType, subtypes);
            }
            return null;
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        public boolean useForType(JavaType t) {
            switch (this._appliesFor) {
                case NON_CONCRETE_AND_ARRAYS:
                    while (t.isArrayType()) {
                        t = t.mo4getContentType();
                    }
                    return (t.isJavaLangObject() && (t.isConcrete() || TreeNode.class.isAssignableFrom(t.getRawClass()))) ? false : true;
                case OBJECT_AND_NON_CONCRETE:
                    if (t.isJavaLangObject()) {
                        break;
                    }
                case NON_FINAL:
                    while (t.isArrayType()) {
                        t = t.mo4getContentType();
                    }
                    return (t.isFinal() || TreeNode.class.isAssignableFrom(t.getRawClass())) ? false : true;
                default:
                    return t.isJavaLangObject();
            }
        }
    }

    public ObjectMapper() {
        this(null, null, null);
    }

    public ObjectMapper(JsonFactory jf) {
        this(jf, null, null);
    }

    protected ObjectMapper(ObjectMapper src) {
        this._rootDeserializers = new ConcurrentHashMap<>(64, 0.6f, 2);
        this._jsonFactory = src._jsonFactory.copy();
        this._jsonFactory.setCodec(this);
        this._subtypeResolver = src._subtypeResolver;
        this._typeFactory = src._typeFactory;
        this._injectableValues = src._injectableValues;
        SimpleMixInResolver mixins = src._mixIns.copy();
        this._mixIns = mixins;
        RootNameLookup rootNames = new RootNameLookup();
        this._serializationConfig = new SerializationConfig(src._serializationConfig, mixins, rootNames);
        this._deserializationConfig = new DeserializationConfig(src._deserializationConfig, mixins, rootNames);
        this._serializerProvider = src._serializerProvider.copy();
        this._deserializationContext = src._deserializationContext.copy();
        this._serializerFactory = src._serializerFactory;
    }

    public ObjectMapper(JsonFactory jf, DefaultSerializerProvider sp, DefaultDeserializationContext dc) {
        this._rootDeserializers = new ConcurrentHashMap<>(64, 0.6f, 2);
        if (jf == null) {
            this._jsonFactory = new MappingJsonFactory(this);
        } else {
            this._jsonFactory = jf;
            if (jf.getCodec() == null) {
                this._jsonFactory.setCodec(this);
            }
        }
        this._subtypeResolver = new StdSubtypeResolver();
        RootNameLookup rootNames = new RootNameLookup();
        this._typeFactory = TypeFactory.defaultInstance();
        SimpleMixInResolver mixins = new SimpleMixInResolver(null);
        this._mixIns = mixins;
        BaseSettings base = DEFAULT_BASE.withClassIntrospector(defaultClassIntrospector());
        this._serializationConfig = new SerializationConfig(base, this._subtypeResolver, mixins, rootNames);
        this._deserializationConfig = new DeserializationConfig(base, this._subtypeResolver, mixins, rootNames);
        boolean needOrder = this._jsonFactory.requiresPropertyOrdering();
        if (needOrder ^ this._serializationConfig.isEnabled(MapperFeature.SORT_PROPERTIES_ALPHABETICALLY)) {
            configure(MapperFeature.SORT_PROPERTIES_ALPHABETICALLY, needOrder);
        }
        this._serializerProvider = sp == null ? new DefaultSerializerProvider.Impl() : sp;
        this._deserializationContext = dc == null ? new DefaultDeserializationContext.Impl(BeanDeserializerFactory.instance) : dc;
        this._serializerFactory = BeanSerializerFactory.instance;
    }

    protected ClassIntrospector defaultClassIntrospector() {
        return new BasicClassIntrospector();
    }

    public ObjectMapper copy() {
        _checkInvalidCopy(ObjectMapper.class);
        return new ObjectMapper(this);
    }

    protected void _checkInvalidCopy(Class<?> exp) {
        if (getClass() != exp) {
            throw new IllegalStateException("Failed copy(): " + getClass().getName() + " (version: " + version() + ") does not override copy(); it has to");
        }
    }

    protected ObjectReader _newReader(DeserializationConfig config) {
        return new ObjectReader(this, config);
    }

    protected ObjectReader _newReader(DeserializationConfig config, JavaType valueType, Object valueToUpdate, FormatSchema schema, InjectableValues injectableValues) {
        return new ObjectReader(this, config, valueType, valueToUpdate, schema, injectableValues);
    }

    protected ObjectWriter _newWriter(SerializationConfig config) {
        return new ObjectWriter(this, config);
    }

    protected ObjectWriter _newWriter(SerializationConfig config, FormatSchema schema) {
        return new ObjectWriter(this, config, schema);
    }

    protected ObjectWriter _newWriter(SerializationConfig config, JavaType rootType, PrettyPrinter pp) {
        return new ObjectWriter(this, config, rootType, pp);
    }

    public Version version() {
        return PackageVersion.VERSION;
    }

    public ObjectMapper registerModule(Module module) {
        Object typeId;
        if (isEnabled(MapperFeature.IGNORE_DUPLICATE_MODULE_REGISTRATIONS) && (typeId = module.getTypeId()) != null) {
            if (this._registeredModuleTypes == null) {
                this._registeredModuleTypes = new HashSet();
            }
            if (!this._registeredModuleTypes.add(typeId)) {
                return this;
            }
        }
        String name = module.getModuleName();
        if (name == null) {
            throw new IllegalArgumentException("Module without defined name");
        }
        Version version = module.version();
        if (version == null) {
            throw new IllegalArgumentException("Module without defined version");
        }
        module.setupModule(new Module.SetupContext() { // from class: com.fasterxml.jackson.databind.ObjectMapper.1
            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public Version getMapperVersion() {
                return ObjectMapper.this.version();
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public <C extends ObjectCodec> C getOwner() {
                return this;
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public TypeFactory getTypeFactory() {
                return ObjectMapper.this._typeFactory;
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public boolean isEnabled(MapperFeature f) {
                return this.isEnabled(f);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public boolean isEnabled(DeserializationFeature f) {
                return this.isEnabled(f);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public boolean isEnabled(SerializationFeature f) {
                return this.isEnabled(f);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public boolean isEnabled(JsonFactory.Feature f) {
                return this.isEnabled(f);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public boolean isEnabled(JsonParser.Feature f) {
                return this.isEnabled(f);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public boolean isEnabled(JsonGenerator.Feature f) {
                return this.isEnabled(f);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void addDeserializers(Deserializers d) {
                DeserializerFactory df = this._deserializationContext._factory.withAdditionalDeserializers(d);
                this._deserializationContext = this._deserializationContext.with(df);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void addKeyDeserializers(KeyDeserializers d) {
                DeserializerFactory df = this._deserializationContext._factory.withAdditionalKeyDeserializers(d);
                this._deserializationContext = this._deserializationContext.with(df);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void addBeanDeserializerModifier(BeanDeserializerModifier modifier) {
                DeserializerFactory df = this._deserializationContext._factory.withDeserializerModifier(modifier);
                this._deserializationContext = this._deserializationContext.with(df);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void addSerializers(Serializers s) {
                this._serializerFactory = this._serializerFactory.withAdditionalSerializers(s);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void addKeySerializers(Serializers s) {
                this._serializerFactory = this._serializerFactory.withAdditionalKeySerializers(s);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void addBeanSerializerModifier(BeanSerializerModifier modifier) {
                this._serializerFactory = this._serializerFactory.withSerializerModifier(modifier);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void addAbstractTypeResolver(AbstractTypeResolver resolver) {
                DeserializerFactory df = this._deserializationContext._factory.withAbstractTypeResolver(resolver);
                this._deserializationContext = this._deserializationContext.with(df);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void addTypeModifier(TypeModifier modifier) {
                TypeFactory f = this._typeFactory;
                this.setTypeFactory(f.withModifier(modifier));
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void addValueInstantiators(ValueInstantiators instantiators) {
                DeserializerFactory df = this._deserializationContext._factory.withValueInstantiators(instantiators);
                this._deserializationContext = this._deserializationContext.with(df);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void setClassIntrospector(ClassIntrospector ci) {
                this._deserializationConfig = this._deserializationConfig.with(ci);
                this._serializationConfig = this._serializationConfig.with(ci);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void insertAnnotationIntrospector(AnnotationIntrospector ai) {
                this._deserializationConfig = this._deserializationConfig.withInsertedAnnotationIntrospector(ai);
                this._serializationConfig = this._serializationConfig.withInsertedAnnotationIntrospector(ai);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void appendAnnotationIntrospector(AnnotationIntrospector ai) {
                this._deserializationConfig = this._deserializationConfig.withAppendedAnnotationIntrospector(ai);
                this._serializationConfig = this._serializationConfig.withAppendedAnnotationIntrospector(ai);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void registerSubtypes(Class<?>... subtypes) {
                this.registerSubtypes(subtypes);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void registerSubtypes(NamedType... subtypes) {
                this.registerSubtypes(subtypes);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void setMixInAnnotations(Class<?> target, Class<?> mixinSource) {
                this.addMixIn(target, mixinSource);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void addDeserializationProblemHandler(DeserializationProblemHandler handler) {
                this.addHandler(handler);
            }

            @Override // com.fasterxml.jackson.databind.Module.SetupContext
            public void setNamingStrategy(PropertyNamingStrategy naming) {
                this.setPropertyNamingStrategy(naming);
            }
        });
        return this;
    }

    public ObjectMapper registerModules(Module... modules) {
        for (Module module : modules) {
            registerModule(module);
        }
        return this;
    }

    public ObjectMapper registerModules(Iterable<Module> modules) {
        for (Module module : modules) {
            registerModule(module);
        }
        return this;
    }

    public static List<Module> findModules() {
        return findModules(null);
    }

    public static List<Module> findModules(ClassLoader classLoader) {
        ArrayList<Module> modules = new ArrayList<>();
        ServiceLoader<Module> loader = classLoader == null ? ServiceLoader.load(Module.class) : ServiceLoader.load(Module.class, classLoader);
        Iterator i$ = loader.iterator();
        while (i$.hasNext()) {
            Module module = i$.next();
            modules.add(module);
        }
        return modules;
    }

    public ObjectMapper findAndRegisterModules() {
        return registerModules(findModules());
    }

    public SerializationConfig getSerializationConfig() {
        return this._serializationConfig;
    }

    public DeserializationConfig getDeserializationConfig() {
        return this._deserializationConfig;
    }

    public DeserializationContext getDeserializationContext() {
        return this._deserializationContext;
    }

    public ObjectMapper setSerializerFactory(SerializerFactory f) {
        this._serializerFactory = f;
        return this;
    }

    public SerializerFactory getSerializerFactory() {
        return this._serializerFactory;
    }

    public ObjectMapper setSerializerProvider(DefaultSerializerProvider p) {
        this._serializerProvider = p;
        return this;
    }

    public SerializerProvider getSerializerProvider() {
        return this._serializerProvider;
    }

    public ObjectMapper setMixIns(Map<Class<?>, Class<?>> sourceMixins) {
        this._mixIns.setLocalDefinitions(sourceMixins);
        return this;
    }

    public ObjectMapper addMixIn(Class<?> target, Class<?> mixinSource) {
        this._mixIns.addLocalDefinition(target, mixinSource);
        return this;
    }

    public ObjectMapper setMixInResolver(ClassIntrospector.MixInResolver resolver) {
        SimpleMixInResolver r = this._mixIns.withOverrides(resolver);
        if (r != this._mixIns) {
            this._mixIns = r;
            this._deserializationConfig = new DeserializationConfig(this._deserializationConfig, r);
            this._serializationConfig = new SerializationConfig(this._serializationConfig, r);
        }
        return this;
    }

    public Class<?> findMixInClassFor(Class<?> cls) {
        return this._mixIns.findMixInClassFor(cls);
    }

    public int mixInCount() {
        return this._mixIns.localSize();
    }

    @Deprecated
    public void setMixInAnnotations(Map<Class<?>, Class<?>> sourceMixins) {
        setMixIns(sourceMixins);
    }

    @Deprecated
    public final void addMixInAnnotations(Class<?> target, Class<?> mixinSource) {
        addMixIn(target, mixinSource);
    }

    public VisibilityChecker<?> getVisibilityChecker() {
        return this._serializationConfig.getDefaultVisibilityChecker();
    }

    @Deprecated
    public void setVisibilityChecker(VisibilityChecker<?> vc) {
        setVisibility(vc);
    }

    public ObjectMapper setVisibility(VisibilityChecker<?> vc) {
        this._deserializationConfig = this._deserializationConfig.with(vc);
        this._serializationConfig = this._serializationConfig.with(vc);
        return this;
    }

    public ObjectMapper setVisibility(PropertyAccessor forMethod, JsonAutoDetect.Visibility visibility) {
        this._deserializationConfig = this._deserializationConfig.withVisibility(forMethod, visibility);
        this._serializationConfig = this._serializationConfig.withVisibility(forMethod, visibility);
        return this;
    }

    public SubtypeResolver getSubtypeResolver() {
        return this._subtypeResolver;
    }

    public ObjectMapper setSubtypeResolver(SubtypeResolver str) {
        this._subtypeResolver = str;
        this._deserializationConfig = this._deserializationConfig.with(str);
        this._serializationConfig = this._serializationConfig.with(str);
        return this;
    }

    public ObjectMapper setAnnotationIntrospector(AnnotationIntrospector ai) {
        this._serializationConfig = this._serializationConfig.with(ai);
        this._deserializationConfig = this._deserializationConfig.with(ai);
        return this;
    }

    public ObjectMapper setAnnotationIntrospectors(AnnotationIntrospector serializerAI, AnnotationIntrospector deserializerAI) {
        this._serializationConfig = this._serializationConfig.with(serializerAI);
        this._deserializationConfig = this._deserializationConfig.with(deserializerAI);
        return this;
    }

    public ObjectMapper setPropertyNamingStrategy(PropertyNamingStrategy s) {
        this._serializationConfig = this._serializationConfig.with(s);
        this._deserializationConfig = this._deserializationConfig.with(s);
        return this;
    }

    public PropertyNamingStrategy getPropertyNamingStrategy() {
        return this._serializationConfig.getPropertyNamingStrategy();
    }

    public ObjectMapper setSerializationInclusion(JsonInclude.Include incl) {
        this._serializationConfig = this._serializationConfig.withSerializationInclusion(incl);
        return this;
    }

    public ObjectMapper setDefaultPrettyPrinter(PrettyPrinter pp) {
        this._serializationConfig = this._serializationConfig.withDefaultPrettyPrinter(pp);
        return this;
    }

    public ObjectMapper enableDefaultTyping() {
        return enableDefaultTyping(DefaultTyping.OBJECT_AND_NON_CONCRETE);
    }

    public ObjectMapper enableDefaultTyping(DefaultTyping dti) {
        return enableDefaultTyping(dti, JsonTypeInfo.As.WRAPPER_ARRAY);
    }

    public ObjectMapper enableDefaultTyping(DefaultTyping applicability, JsonTypeInfo.As includeAs) {
        if (includeAs == JsonTypeInfo.As.EXTERNAL_PROPERTY) {
            throw new IllegalArgumentException("Can not use includeAs of " + includeAs);
        }
        TypeResolverBuilder<?> typer = new DefaultTypeResolverBuilder(applicability);
        return setDefaultTyping(typer.init(JsonTypeInfo.Id.CLASS, null).inclusion(includeAs));
    }

    public ObjectMapper enableDefaultTypingAsProperty(DefaultTyping applicability, String propertyName) {
        TypeResolverBuilder<?> typer = new DefaultTypeResolverBuilder(applicability);
        return setDefaultTyping(typer.init(JsonTypeInfo.Id.CLASS, null).inclusion(JsonTypeInfo.As.PROPERTY).typeProperty(propertyName));
    }

    public ObjectMapper disableDefaultTyping() {
        return setDefaultTyping(null);
    }

    public ObjectMapper setDefaultTyping(TypeResolverBuilder<?> typer) {
        this._deserializationConfig = this._deserializationConfig.with(typer);
        this._serializationConfig = this._serializationConfig.with(typer);
        return this;
    }

    public void registerSubtypes(Class<?>... classes) {
        getSubtypeResolver().registerSubtypes(classes);
    }

    public void registerSubtypes(NamedType... types) {
        getSubtypeResolver().registerSubtypes(types);
    }

    public TypeFactory getTypeFactory() {
        return this._typeFactory;
    }

    public ObjectMapper setTypeFactory(TypeFactory f) {
        this._typeFactory = f;
        this._deserializationConfig = this._deserializationConfig.with(f);
        this._serializationConfig = this._serializationConfig.with(f);
        return this;
    }

    public JavaType constructType(Type t) {
        return this._typeFactory.constructType(t);
    }

    public JsonNodeFactory getNodeFactory() {
        return this._deserializationConfig.getNodeFactory();
    }

    public ObjectMapper setNodeFactory(JsonNodeFactory f) {
        this._deserializationConfig = this._deserializationConfig.with(f);
        return this;
    }

    public ObjectMapper addHandler(DeserializationProblemHandler h) {
        this._deserializationConfig = this._deserializationConfig.withHandler(h);
        return this;
    }

    public ObjectMapper clearProblemHandlers() {
        this._deserializationConfig = this._deserializationConfig.withNoProblemHandlers();
        return this;
    }

    public ObjectMapper setConfig(DeserializationConfig config) {
        this._deserializationConfig = config;
        return this;
    }

    @Deprecated
    public void setFilters(FilterProvider filterProvider) {
        this._serializationConfig = this._serializationConfig.withFilters(filterProvider);
    }

    public ObjectMapper setFilterProvider(FilterProvider filterProvider) {
        this._serializationConfig = this._serializationConfig.withFilters(filterProvider);
        return this;
    }

    public ObjectMapper setBase64Variant(Base64Variant v) {
        this._serializationConfig = this._serializationConfig.with(v);
        this._deserializationConfig = this._deserializationConfig.with(v);
        return this;
    }

    public ObjectMapper setConfig(SerializationConfig config) {
        this._serializationConfig = config;
        return this;
    }

    public JsonFactory getFactory() {
        return this._jsonFactory;
    }

    @Deprecated
    public JsonFactory getJsonFactory() {
        return getFactory();
    }

    public ObjectMapper setDateFormat(DateFormat dateFormat) {
        this._deserializationConfig = this._deserializationConfig.with(dateFormat);
        this._serializationConfig = this._serializationConfig.with(dateFormat);
        return this;
    }

    public DateFormat getDateFormat() {
        return this._serializationConfig.getDateFormat();
    }

    public Object setHandlerInstantiator(HandlerInstantiator hi) {
        this._deserializationConfig = this._deserializationConfig.with(hi);
        this._serializationConfig = this._serializationConfig.with(hi);
        return this;
    }

    public ObjectMapper setInjectableValues(InjectableValues injectableValues) {
        this._injectableValues = injectableValues;
        return this;
    }

    public InjectableValues getInjectableValues() {
        return this._injectableValues;
    }

    public ObjectMapper setLocale(Locale l) {
        this._deserializationConfig = this._deserializationConfig.with(l);
        this._serializationConfig = this._serializationConfig.with(l);
        return this;
    }

    public ObjectMapper setTimeZone(TimeZone tz) {
        this._deserializationConfig = this._deserializationConfig.with(tz);
        this._serializationConfig = this._serializationConfig.with(tz);
        return this;
    }

    public boolean isEnabled(MapperFeature f) {
        return this._serializationConfig.isEnabled(f);
    }

    public ObjectMapper configure(MapperFeature f, boolean state) {
        this._serializationConfig = state ? this._serializationConfig.with(f) : this._serializationConfig.without(f);
        this._deserializationConfig = state ? this._deserializationConfig.with(f) : this._deserializationConfig.without(f);
        return this;
    }

    public ObjectMapper enable(MapperFeature... f) {
        this._deserializationConfig = this._deserializationConfig.with(f);
        this._serializationConfig = this._serializationConfig.with(f);
        return this;
    }

    public ObjectMapper disable(MapperFeature... f) {
        this._deserializationConfig = this._deserializationConfig.without(f);
        this._serializationConfig = this._serializationConfig.without(f);
        return this;
    }

    public boolean isEnabled(SerializationFeature f) {
        return this._serializationConfig.isEnabled(f);
    }

    public ObjectMapper configure(SerializationFeature f, boolean state) {
        this._serializationConfig = state ? this._serializationConfig.with(f) : this._serializationConfig.without(f);
        return this;
    }

    public ObjectMapper enable(SerializationFeature f) {
        this._serializationConfig = this._serializationConfig.with(f);
        return this;
    }

    public ObjectMapper enable(SerializationFeature first, SerializationFeature... f) {
        this._serializationConfig = this._serializationConfig.with(first, f);
        return this;
    }

    public ObjectMapper disable(SerializationFeature f) {
        this._serializationConfig = this._serializationConfig.without(f);
        return this;
    }

    public ObjectMapper disable(SerializationFeature first, SerializationFeature... f) {
        this._serializationConfig = this._serializationConfig.without(first, f);
        return this;
    }

    public boolean isEnabled(DeserializationFeature f) {
        return this._deserializationConfig.isEnabled(f);
    }

    public ObjectMapper configure(DeserializationFeature f, boolean state) {
        this._deserializationConfig = state ? this._deserializationConfig.with(f) : this._deserializationConfig.without(f);
        return this;
    }

    public ObjectMapper enable(DeserializationFeature feature) {
        this._deserializationConfig = this._deserializationConfig.with(feature);
        return this;
    }

    public ObjectMapper enable(DeserializationFeature first, DeserializationFeature... f) {
        this._deserializationConfig = this._deserializationConfig.with(first, f);
        return this;
    }

    public ObjectMapper disable(DeserializationFeature feature) {
        this._deserializationConfig = this._deserializationConfig.without(feature);
        return this;
    }

    public ObjectMapper disable(DeserializationFeature first, DeserializationFeature... f) {
        this._deserializationConfig = this._deserializationConfig.without(first, f);
        return this;
    }

    public boolean isEnabled(JsonParser.Feature f) {
        return this._deserializationConfig.isEnabled(f, this._jsonFactory);
    }

    public ObjectMapper configure(JsonParser.Feature f, boolean state) {
        this._jsonFactory.configure(f, state);
        return this;
    }

    public ObjectMapper enable(JsonParser.Feature... features) {
        for (JsonParser.Feature f : features) {
            this._jsonFactory.enable(f);
        }
        return this;
    }

    public ObjectMapper disable(JsonParser.Feature... features) {
        for (JsonParser.Feature f : features) {
            this._jsonFactory.disable(f);
        }
        return this;
    }

    public boolean isEnabled(JsonGenerator.Feature f) {
        return this._serializationConfig.isEnabled(f, this._jsonFactory);
    }

    public ObjectMapper configure(JsonGenerator.Feature f, boolean state) {
        this._jsonFactory.configure(f, state);
        return this;
    }

    public ObjectMapper enable(JsonGenerator.Feature... features) {
        for (JsonGenerator.Feature f : features) {
            this._jsonFactory.enable(f);
        }
        return this;
    }

    public ObjectMapper disable(JsonGenerator.Feature... features) {
        for (JsonGenerator.Feature f : features) {
            this._jsonFactory.disable(f);
        }
        return this;
    }

    public boolean isEnabled(JsonFactory.Feature f) {
        return this._jsonFactory.isEnabled(f);
    }

    public <T> T readValue(JsonParser jsonParser, Class<T> cls) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readValue(getDeserializationConfig(), jsonParser, this._typeFactory.constructType(cls));
    }

    public <T> T readValue(JsonParser jsonParser, TypeReference<?> typeReference) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readValue(getDeserializationConfig(), jsonParser, this._typeFactory.constructType(typeReference));
    }

    public final <T> T readValue(JsonParser jsonParser, ResolvedType resolvedType) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readValue(getDeserializationConfig(), jsonParser, (JavaType) resolvedType);
    }

    public <T> T readValue(JsonParser jsonParser, JavaType javaType) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readValue(getDeserializationConfig(), jsonParser, javaType);
    }

    public <T extends TreeNode> T readTree(JsonParser jp) throws IOException, JsonProcessingException {
        DeserializationConfig cfg = getDeserializationConfig();
        JsonToken t = jp.getCurrentToken();
        if (t == null) {
            JsonToken t2 = jp.nextToken();
            if (t2 == null) {
                return null;
            }
        }
        JsonNode n = (JsonNode) _readValue(cfg, jp, JSON_NODE_TYPE);
        if (n == null) {
            n = getNodeFactory().nullNode();
        }
        JsonNode result = n;
        return result;
    }

    /* renamed from: readValues, reason: merged with bridge method [inline-methods] */
    public <T> MappingIterator<T> m19readValues(JsonParser jp, ResolvedType valueType) throws IOException, JsonProcessingException {
        return readValues(jp, (JavaType) valueType);
    }

    public <T> MappingIterator<T> readValues(JsonParser jp, JavaType valueType) throws IOException, JsonProcessingException {
        DeserializationConfig config = getDeserializationConfig();
        DeserializationContext ctxt = createDeserializationContext(jp, config);
        JsonDeserializer<?> deser = _findRootDeserializer(ctxt, valueType);
        return new MappingIterator<>(valueType, jp, ctxt, deser, false, null);
    }

    /* renamed from: readValues, reason: merged with bridge method [inline-methods] */
    public <T> MappingIterator<T> m21readValues(JsonParser jp, Class<T> valueType) throws IOException, JsonProcessingException {
        return readValues(jp, this._typeFactory.constructType(valueType));
    }

    public <T> MappingIterator<T> readValues(JsonParser jp, TypeReference<?> valueTypeRef) throws IOException, JsonProcessingException {
        return readValues(jp, this._typeFactory.constructType(valueTypeRef));
    }

    public JsonNode readTree(InputStream in) throws IOException, JsonProcessingException {
        JsonNode n = (JsonNode) _readMapAndClose(this._jsonFactory.createParser(in), JSON_NODE_TYPE);
        return n == null ? NullNode.instance : n;
    }

    public JsonNode readTree(Reader r) throws IOException, JsonProcessingException {
        JsonNode n = (JsonNode) _readMapAndClose(this._jsonFactory.createParser(r), JSON_NODE_TYPE);
        return n == null ? NullNode.instance : n;
    }

    public JsonNode readTree(String content) throws IOException, JsonProcessingException {
        JsonNode n = (JsonNode) _readMapAndClose(this._jsonFactory.createParser(content), JSON_NODE_TYPE);
        return n == null ? NullNode.instance : n;
    }

    public JsonNode readTree(byte[] content) throws IOException, JsonProcessingException {
        JsonNode n = (JsonNode) _readMapAndClose(this._jsonFactory.createParser(content), JSON_NODE_TYPE);
        return n == null ? NullNode.instance : n;
    }

    public JsonNode readTree(File file) throws IOException, JsonProcessingException {
        JsonNode n = (JsonNode) _readMapAndClose(this._jsonFactory.createParser(file), JSON_NODE_TYPE);
        return n == null ? NullNode.instance : n;
    }

    public JsonNode readTree(URL source) throws IOException, JsonProcessingException {
        JsonNode n = (JsonNode) _readMapAndClose(this._jsonFactory.createParser(source), JSON_NODE_TYPE);
        return n == null ? NullNode.instance : n;
    }

    public void writeValue(JsonGenerator g, Object value) throws IOException, JsonGenerationException, JsonMappingException {
        SerializationConfig config = getSerializationConfig();
        if (config.isEnabled(SerializationFeature.INDENT_OUTPUT) && g.getPrettyPrinter() == null) {
            g.setPrettyPrinter(config.constructDefaultPrettyPrinter());
        }
        if (config.isEnabled(SerializationFeature.CLOSE_CLOSEABLE) && (value instanceof Closeable)) {
            _writeCloseableValue(g, value, config);
            return;
        }
        _serializerProvider(config).serializeValue(g, value);
        if (config.isEnabled(SerializationFeature.FLUSH_AFTER_WRITE_VALUE)) {
            g.flush();
        }
    }

    public void writeTree(JsonGenerator jgen, TreeNode rootNode) throws IOException, JsonProcessingException {
        SerializationConfig config = getSerializationConfig();
        _serializerProvider(config).serializeValue(jgen, rootNode);
        if (config.isEnabled(SerializationFeature.FLUSH_AFTER_WRITE_VALUE)) {
            jgen.flush();
        }
    }

    public void writeTree(JsonGenerator jgen, JsonNode rootNode) throws IOException, JsonProcessingException {
        SerializationConfig config = getSerializationConfig();
        _serializerProvider(config).serializeValue(jgen, rootNode);
        if (config.isEnabled(SerializationFeature.FLUSH_AFTER_WRITE_VALUE)) {
            jgen.flush();
        }
    }

    /* renamed from: createObjectNode, reason: merged with bridge method [inline-methods] */
    public ObjectNode m18createObjectNode() {
        return this._deserializationConfig.getNodeFactory().objectNode();
    }

    /* renamed from: createArrayNode, reason: merged with bridge method [inline-methods] */
    public ArrayNode m17createArrayNode() {
        return this._deserializationConfig.getNodeFactory().arrayNode();
    }

    public JsonParser treeAsTokens(TreeNode n) {
        return new TreeTraversingParser((JsonNode) n, this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <T> T treeToValue(TreeNode treeNode, Class<T> cls) throws JsonProcessingException {
        if (cls != Object.class) {
            try {
                if (cls.isAssignableFrom(treeNode.getClass())) {
                    return treeNode;
                }
            } catch (JsonProcessingException e) {
                throw e;
            } catch (IOException e2) {
                throw new IllegalArgumentException(e2.getMessage(), e2);
            }
        }
        return (T) readValue(treeAsTokens(treeNode), cls);
    }

    public <T extends JsonNode> T valueToTree(Object fromValue) throws IllegalArgumentException {
        if (fromValue == null) {
            return null;
        }
        TokenBuffer buf = new TokenBuffer(this, false);
        try {
            writeValue(buf, fromValue);
            JsonParser jp = buf.asParser();
            T t = (T) readTree(jp);
            jp.close();
            return t;
        } catch (IOException e) {
            throw new IllegalArgumentException(e.getMessage(), e);
        }
    }

    public boolean canSerialize(Class<?> type) {
        return _serializerProvider(getSerializationConfig()).hasSerializerFor(type, null);
    }

    public boolean canSerialize(Class<?> type, AtomicReference<Throwable> cause) {
        return _serializerProvider(getSerializationConfig()).hasSerializerFor(type, cause);
    }

    public boolean canDeserialize(JavaType type) {
        return createDeserializationContext(null, getDeserializationConfig()).hasValueDeserializerFor(type, null);
    }

    public boolean canDeserialize(JavaType type, AtomicReference<Throwable> cause) {
        return createDeserializationContext(null, getDeserializationConfig()).hasValueDeserializerFor(type, cause);
    }

    public <T> T readValue(File file, Class<T> cls) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(file), this._typeFactory.constructType(cls));
    }

    public <T> T readValue(File file, TypeReference typeReference) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(file), this._typeFactory.constructType((TypeReference<?>) typeReference));
    }

    public <T> T readValue(File file, JavaType javaType) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(file), javaType);
    }

    public <T> T readValue(URL url, Class<T> cls) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(url), this._typeFactory.constructType(cls));
    }

    public <T> T readValue(URL url, TypeReference typeReference) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(url), this._typeFactory.constructType((TypeReference<?>) typeReference));
    }

    public <T> T readValue(URL url, JavaType javaType) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(url), javaType);
    }

    public <T> T readValue(String str, Class<T> cls) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(str), this._typeFactory.constructType(cls));
    }

    public <T> T readValue(String str, TypeReference typeReference) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(str), this._typeFactory.constructType((TypeReference<?>) typeReference));
    }

    public <T> T readValue(String str, JavaType javaType) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(str), javaType);
    }

    public <T> T readValue(Reader reader, Class<T> cls) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(reader), this._typeFactory.constructType(cls));
    }

    public <T> T readValue(Reader reader, TypeReference typeReference) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(reader), this._typeFactory.constructType((TypeReference<?>) typeReference));
    }

    public <T> T readValue(Reader reader, JavaType javaType) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(reader), javaType);
    }

    public <T> T readValue(InputStream inputStream, Class<T> cls) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(inputStream), this._typeFactory.constructType(cls));
    }

    public <T> T readValue(InputStream inputStream, TypeReference typeReference) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(inputStream), this._typeFactory.constructType((TypeReference<?>) typeReference));
    }

    public <T> T readValue(InputStream inputStream, JavaType javaType) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(inputStream), javaType);
    }

    public <T> T readValue(byte[] bArr, Class<T> cls) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(bArr), this._typeFactory.constructType(cls));
    }

    public <T> T readValue(byte[] bArr, int i, int i2, Class<T> cls) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(bArr, i, i2), this._typeFactory.constructType(cls));
    }

    public <T> T readValue(byte[] bArr, TypeReference typeReference) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(bArr), this._typeFactory.constructType((TypeReference<?>) typeReference));
    }

    public <T> T readValue(byte[] bArr, int i, int i2, TypeReference typeReference) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(bArr, i, i2), this._typeFactory.constructType((TypeReference<?>) typeReference));
    }

    public <T> T readValue(byte[] bArr, JavaType javaType) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(bArr), javaType);
    }

    public <T> T readValue(byte[] bArr, int i, int i2, JavaType javaType) throws IOException, JsonParseException, JsonMappingException {
        return (T) _readMapAndClose(this._jsonFactory.createParser(bArr, i, i2), javaType);
    }

    public void writeValue(File resultFile, Object value) throws IOException, JsonGenerationException, JsonMappingException {
        _configAndWriteValue(this._jsonFactory.createGenerator(resultFile, JsonEncoding.UTF8), value);
    }

    public void writeValue(OutputStream out, Object value) throws IOException, JsonGenerationException, JsonMappingException {
        _configAndWriteValue(this._jsonFactory.createGenerator(out, JsonEncoding.UTF8), value);
    }

    public void writeValue(Writer w, Object value) throws IOException, JsonGenerationException, JsonMappingException {
        _configAndWriteValue(this._jsonFactory.createGenerator(w), value);
    }

    public String writeValueAsString(Object value) throws JsonProcessingException {
        SegmentedStringWriter sw = new SegmentedStringWriter(this._jsonFactory._getBufferRecycler());
        try {
            _configAndWriteValue(this._jsonFactory.createGenerator(sw), value);
            return sw.getAndClear();
        } catch (JsonProcessingException e) {
            throw e;
        } catch (IOException e2) {
            throw JsonMappingException.fromUnexpectedIOE(e2);
        }
    }

    public byte[] writeValueAsBytes(Object value) throws JsonProcessingException {
        ByteArrayBuilder bb = new ByteArrayBuilder(this._jsonFactory._getBufferRecycler());
        try {
            _configAndWriteValue(this._jsonFactory.createGenerator(bb, JsonEncoding.UTF8), value);
            byte[] result = bb.toByteArray();
            bb.release();
            return result;
        } catch (IOException e) {
            throw JsonMappingException.fromUnexpectedIOE(e);
        } catch (JsonProcessingException e2) {
            throw e2;
        }
    }

    public ObjectWriter writer() {
        return _newWriter(getSerializationConfig());
    }

    public ObjectWriter writer(SerializationFeature feature) {
        return _newWriter(getSerializationConfig().with(feature));
    }

    public ObjectWriter writer(SerializationFeature first, SerializationFeature... other) {
        return _newWriter(getSerializationConfig().with(first, other));
    }

    public ObjectWriter writer(DateFormat df) {
        return _newWriter(getSerializationConfig().with(df));
    }

    public ObjectWriter writerWithView(Class<?> serializationView) {
        return _newWriter(getSerializationConfig().withView(serializationView));
    }

    public ObjectWriter writerFor(Class<?> rootType) {
        return _newWriter(getSerializationConfig(), rootType == null ? null : this._typeFactory.constructType(rootType), null);
    }

    public ObjectWriter writerFor(TypeReference<?> rootType) {
        return _newWriter(getSerializationConfig(), rootType == null ? null : this._typeFactory.constructType(rootType), null);
    }

    public ObjectWriter writerFor(JavaType rootType) {
        return _newWriter(getSerializationConfig(), rootType, null);
    }

    public ObjectWriter writer(PrettyPrinter pp) {
        if (pp == null) {
            pp = ObjectWriter.NULL_PRETTY_PRINTER;
        }
        return _newWriter(getSerializationConfig(), null, pp);
    }

    public ObjectWriter writerWithDefaultPrettyPrinter() {
        SerializationConfig config = getSerializationConfig();
        return _newWriter(config, null, config.getDefaultPrettyPrinter());
    }

    public ObjectWriter writer(FilterProvider filterProvider) {
        return _newWriter(getSerializationConfig().withFilters(filterProvider));
    }

    public ObjectWriter writer(FormatSchema schema) {
        _verifySchemaType(schema);
        return _newWriter(getSerializationConfig(), schema);
    }

    public ObjectWriter writer(Base64Variant defaultBase64) {
        return _newWriter(getSerializationConfig().with(defaultBase64));
    }

    public ObjectWriter writer(CharacterEscapes escapes) {
        return _newWriter(getSerializationConfig()).with(escapes);
    }

    public ObjectWriter writer(ContextAttributes attrs) {
        return _newWriter(getSerializationConfig().with(attrs));
    }

    @Deprecated
    public ObjectWriter writerWithType(Class<?> rootType) {
        return _newWriter(getSerializationConfig(), rootType == null ? null : this._typeFactory.constructType(rootType), null);
    }

    @Deprecated
    public ObjectWriter writerWithType(TypeReference<?> rootType) {
        return _newWriter(getSerializationConfig(), rootType == null ? null : this._typeFactory.constructType(rootType), null);
    }

    @Deprecated
    public ObjectWriter writerWithType(JavaType rootType) {
        return _newWriter(getSerializationConfig(), rootType, null);
    }

    public ObjectReader reader() {
        return _newReader(getDeserializationConfig()).with(this._injectableValues);
    }

    public ObjectReader reader(DeserializationFeature feature) {
        return _newReader(getDeserializationConfig().with(feature));
    }

    public ObjectReader reader(DeserializationFeature first, DeserializationFeature... other) {
        return _newReader(getDeserializationConfig().with(first, other));
    }

    public ObjectReader readerForUpdating(Object valueToUpdate) {
        JavaType t = this._typeFactory.constructType(valueToUpdate.getClass());
        return _newReader(getDeserializationConfig(), t, valueToUpdate, null, this._injectableValues);
    }

    public ObjectReader readerFor(JavaType type) {
        return _newReader(getDeserializationConfig(), type, null, null, this._injectableValues);
    }

    public ObjectReader readerFor(Class<?> type) {
        return _newReader(getDeserializationConfig(), this._typeFactory.constructType(type), null, null, this._injectableValues);
    }

    public ObjectReader readerFor(TypeReference<?> type) {
        return _newReader(getDeserializationConfig(), this._typeFactory.constructType(type), null, null, this._injectableValues);
    }

    public ObjectReader reader(JsonNodeFactory f) {
        return _newReader(getDeserializationConfig()).with(f);
    }

    public ObjectReader reader(FormatSchema schema) {
        _verifySchemaType(schema);
        return _newReader(getDeserializationConfig(), null, null, schema, this._injectableValues);
    }

    public ObjectReader reader(InjectableValues injectableValues) {
        return _newReader(getDeserializationConfig(), null, null, null, injectableValues);
    }

    public ObjectReader readerWithView(Class<?> view) {
        return _newReader(getDeserializationConfig().withView(view));
    }

    public ObjectReader reader(Base64Variant defaultBase64) {
        return _newReader(getDeserializationConfig().with(defaultBase64));
    }

    public ObjectReader reader(ContextAttributes attrs) {
        return _newReader(getDeserializationConfig().with(attrs));
    }

    @Deprecated
    public ObjectReader reader(JavaType type) {
        return _newReader(getDeserializationConfig(), type, null, null, this._injectableValues);
    }

    @Deprecated
    public ObjectReader reader(Class<?> type) {
        return _newReader(getDeserializationConfig(), this._typeFactory.constructType(type), null, null, this._injectableValues);
    }

    @Deprecated
    public ObjectReader reader(TypeReference<?> type) {
        return _newReader(getDeserializationConfig(), this._typeFactory.constructType(type), null, null, this._injectableValues);
    }

    public <T> T convertValue(Object obj, Class<T> cls) throws IllegalArgumentException {
        if (obj == null) {
            return null;
        }
        return (T) _convert(obj, this._typeFactory.constructType(cls));
    }

    public <T> T convertValue(Object obj, TypeReference<?> typeReference) throws IllegalArgumentException {
        return (T) convertValue(obj, this._typeFactory.constructType(typeReference));
    }

    public <T> T convertValue(Object obj, JavaType javaType) throws IllegalArgumentException {
        if (obj == null) {
            return null;
        }
        return (T) _convert(obj, javaType);
    }

    protected Object _convert(Object fromValue, JavaType toValueType) throws IllegalArgumentException {
        Object result;
        Class<?> targetType = toValueType.getRawClass();
        if (targetType != Object.class && !toValueType.hasGenericTypes() && targetType.isAssignableFrom(fromValue.getClass())) {
            return fromValue;
        }
        TokenBuffer buf = new TokenBuffer(this, false);
        try {
            SerializationConfig config = getSerializationConfig().without(SerializationFeature.WRAP_ROOT_VALUE);
            _serializerProvider(config).serializeValue(buf, fromValue);
            JsonParser jp = buf.asParser();
            DeserializationConfig deserConfig = getDeserializationConfig();
            JsonToken t = _initForReading(jp);
            if (t == JsonToken.VALUE_NULL) {
                DeserializationContext ctxt = createDeserializationContext(jp, deserConfig);
                result = _findRootDeserializer(ctxt, toValueType).getNullValue(ctxt);
            } else if (t == JsonToken.END_ARRAY || t == JsonToken.END_OBJECT) {
                result = null;
            } else {
                DeserializationContext ctxt2 = createDeserializationContext(jp, deserConfig);
                JsonDeserializer<Object> deser = _findRootDeserializer(ctxt2, toValueType);
                result = deser.deserialize(jp, ctxt2);
            }
            jp.close();
            return result;
        } catch (IOException e) {
            throw new IllegalArgumentException(e.getMessage(), e);
        }
    }

    @Deprecated
    public JsonSchema generateJsonSchema(Class<?> t) throws JsonMappingException {
        return _serializerProvider(getSerializationConfig()).generateJsonSchema(t);
    }

    public void acceptJsonFormatVisitor(Class<?> type, JsonFormatVisitorWrapper visitor) throws JsonMappingException {
        acceptJsonFormatVisitor(this._typeFactory.constructType(type), visitor);
    }

    public void acceptJsonFormatVisitor(JavaType type, JsonFormatVisitorWrapper visitor) throws JsonMappingException {
        if (type == null) {
            throw new IllegalArgumentException("type must be provided");
        }
        _serializerProvider(getSerializationConfig()).acceptJsonFormatVisitor(type, visitor);
    }

    protected DefaultSerializerProvider _serializerProvider(SerializationConfig config) {
        return this._serializerProvider.createInstance(config, this._serializerFactory);
    }

    @Deprecated
    protected PrettyPrinter _defaultPrettyPrinter() {
        return this._serializationConfig.constructDefaultPrettyPrinter();
    }

    protected final void _configAndWriteValue(JsonGenerator g, Object value) throws IOException {
        SerializationConfig cfg = getSerializationConfig();
        cfg.initialize(g);
        if (cfg.isEnabled(SerializationFeature.CLOSE_CLOSEABLE) && (value instanceof Closeable)) {
            _configAndWriteCloseable(g, value, cfg);
            return;
        }
        boolean closed = false;
        try {
            _serializerProvider(cfg).serializeValue(g, value);
            closed = true;
            g.close();
            if (1 == 0) {
                g.disable(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT);
                try {
                    g.close();
                } catch (IOException e) {
                }
            }
        } catch (Throwable th) {
            if (!closed) {
                g.disable(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT);
                try {
                    g.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
    }

    protected final void _configAndWriteValue(JsonGenerator g, Object value, Class<?> viewClass) throws IOException {
        SerializationConfig cfg = getSerializationConfig().withView(viewClass);
        cfg.initialize(g);
        if (cfg.isEnabled(SerializationFeature.CLOSE_CLOSEABLE) && (value instanceof Closeable)) {
            _configAndWriteCloseable(g, value, cfg);
            return;
        }
        boolean closed = false;
        try {
            _serializerProvider(cfg).serializeValue(g, value);
            closed = true;
            g.close();
            if (1 == 0) {
                g.disable(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT);
                try {
                    g.close();
                } catch (IOException e) {
                }
            }
        } catch (Throwable th) {
            if (!closed) {
                g.disable(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT);
                try {
                    g.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
    }

    private final void _configAndWriteCloseable(JsonGenerator g, Object value, SerializationConfig cfg) throws IOException, JsonGenerationException, JsonMappingException {
        Closeable toClose = (Closeable) value;
        try {
            _serializerProvider(cfg).serializeValue(g, value);
            g = null;
            g.close();
            toClose = null;
            toClose.close();
            if (0 != 0) {
                g.disable(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT);
                try {
                    g.close();
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
            if (g != null) {
                g.disable(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT);
                try {
                    g.close();
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

    private final void _writeCloseableValue(JsonGenerator g, Object value, SerializationConfig cfg) throws IOException, JsonGenerationException, JsonMappingException {
        Closeable toClose = (Closeable) value;
        try {
            _serializerProvider(cfg).serializeValue(g, value);
            if (cfg.isEnabled(SerializationFeature.FLUSH_AFTER_WRITE_VALUE)) {
                g.flush();
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

    protected DefaultDeserializationContext createDeserializationContext(JsonParser jp, DeserializationConfig cfg) {
        return this._deserializationContext.createInstance(cfg, jp, this._injectableValues);
    }

    protected Object _readValue(DeserializationConfig cfg, JsonParser jp, JavaType valueType) throws IOException, JsonParseException, JsonMappingException {
        Object result;
        JsonToken t = _initForReading(jp);
        if (t == JsonToken.VALUE_NULL) {
            DeserializationContext ctxt = createDeserializationContext(jp, cfg);
            result = _findRootDeserializer(ctxt, valueType).getNullValue(ctxt);
        } else if (t == JsonToken.END_ARRAY || t == JsonToken.END_OBJECT) {
            result = null;
        } else {
            DeserializationContext ctxt2 = createDeserializationContext(jp, cfg);
            JsonDeserializer<Object> deser = _findRootDeserializer(ctxt2, valueType);
            if (cfg.useRootWrapping()) {
                result = _unwrapAndDeserialize(jp, ctxt2, cfg, valueType, deser);
            } else {
                result = deser.deserialize(jp, ctxt2);
            }
        }
        jp.clearCurrentToken();
        return result;
    }

    protected Object _readMapAndClose(JsonParser jp, JavaType valueType) throws IOException, JsonParseException, JsonMappingException {
        Object result;
        try {
            JsonToken t = _initForReading(jp);
            if (t == JsonToken.VALUE_NULL) {
                DeserializationContext ctxt = createDeserializationContext(jp, getDeserializationConfig());
                result = _findRootDeserializer(ctxt, valueType).getNullValue(ctxt);
            } else if (t == JsonToken.END_ARRAY || t == JsonToken.END_OBJECT) {
                result = null;
            } else {
                DeserializationConfig cfg = getDeserializationConfig();
                DeserializationContext ctxt2 = createDeserializationContext(jp, cfg);
                JsonDeserializer<Object> deser = _findRootDeserializer(ctxt2, valueType);
                if (cfg.useRootWrapping()) {
                    result = _unwrapAndDeserialize(jp, ctxt2, cfg, valueType, deser);
                } else {
                    result = deser.deserialize(jp, ctxt2);
                }
                ctxt2.checkUnresolvedObjectId();
            }
            jp.clearCurrentToken();
            return result;
        } finally {
            try {
                jp.close();
            } catch (IOException e) {
            }
        }
    }

    protected JsonToken _initForReading(JsonParser p) throws IOException {
        this._deserializationConfig.initialize(p);
        JsonToken t = p.getCurrentToken();
        if (t == null) {
            t = p.nextToken();
            if (t == null) {
                throw JsonMappingException.from(p, "No content to map due to end-of-input");
            }
        }
        return t;
    }

    protected Object _unwrapAndDeserialize(JsonParser p, DeserializationContext ctxt, DeserializationConfig config, JavaType rootType, JsonDeserializer<Object> deser) throws IOException {
        PropertyName expRootName = config.findRootName(rootType);
        String expSimpleName = expRootName.getSimpleName();
        if (p.getCurrentToken() != JsonToken.START_OBJECT) {
            throw JsonMappingException.from(p, "Current token not START_OBJECT (needed to unwrap root name '" + expSimpleName + "'), but " + p.getCurrentToken());
        }
        if (p.nextToken() != JsonToken.FIELD_NAME) {
            throw JsonMappingException.from(p, "Current token not FIELD_NAME (to contain expected root name '" + expSimpleName + "'), but " + p.getCurrentToken());
        }
        String actualName = p.getCurrentName();
        if (!expSimpleName.equals(actualName)) {
            throw JsonMappingException.from(p, "Root name '" + actualName + "' does not match expected ('" + expSimpleName + "') for type " + rootType);
        }
        p.nextToken();
        Object result = deser.deserialize(p, ctxt);
        if (p.nextToken() != JsonToken.END_OBJECT) {
            throw JsonMappingException.from(p, "Current token not END_OBJECT (to match wrapper object with root name '" + expSimpleName + "'), but " + p.getCurrentToken());
        }
        return result;
    }

    protected JsonDeserializer<Object> _findRootDeserializer(DeserializationContext ctxt, JavaType valueType) throws JsonMappingException {
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

    protected void _verifySchemaType(FormatSchema schema) {
        if (schema != null && !this._jsonFactory.canUseSchema(schema)) {
            throw new IllegalArgumentException("Can not use FormatSchema of type " + schema.getClass().getName() + " for format " + this._jsonFactory.getFormatName());
        }
    }
}
