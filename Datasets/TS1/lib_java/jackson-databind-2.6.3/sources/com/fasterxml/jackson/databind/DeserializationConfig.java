package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.cfg.BaseSettings;
import com.fasterxml.jackson.databind.cfg.ContextAttributes;
import com.fasterxml.jackson.databind.cfg.HandlerInstantiator;
import com.fasterxml.jackson.databind.cfg.MapperConfigBase;
import com.fasterxml.jackson.databind.deser.DeserializationProblemHandler;
import com.fasterxml.jackson.databind.introspect.AnnotatedClass;
import com.fasterxml.jackson.databind.introspect.ClassIntrospector;
import com.fasterxml.jackson.databind.introspect.NopAnnotationIntrospector;
import com.fasterxml.jackson.databind.introspect.SimpleMixInResolver;
import com.fasterxml.jackson.databind.introspect.VisibilityChecker;
import com.fasterxml.jackson.databind.jsontype.NamedType;
import com.fasterxml.jackson.databind.jsontype.SubtypeResolver;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.LinkedNode;
import com.fasterxml.jackson.databind.util.RootNameLookup;
import java.io.Serializable;
import java.text.DateFormat;
import java.util.Collection;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/DeserializationConfig.class */
public final class DeserializationConfig extends MapperConfigBase<DeserializationFeature, DeserializationConfig> implements Serializable {
    private static final long serialVersionUID = 1;
    protected final int _deserFeatures;
    protected final LinkedNode<DeserializationProblemHandler> _problemHandlers;
    protected final JsonNodeFactory _nodeFactory;
    protected final int _parserFeatures;
    protected final int _parserFeaturesToChange;

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public /* bridge */ /* synthetic */ MapperConfigBase with(VisibilityChecker x0) {
        return with((VisibilityChecker<?>) x0);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public /* bridge */ /* synthetic */ MapperConfigBase withView(Class x0) {
        return withView((Class<?>) x0);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public /* bridge */ /* synthetic */ MapperConfigBase with(TypeResolverBuilder x0) {
        return with((TypeResolverBuilder<?>) x0);
    }

    public DeserializationConfig(BaseSettings base, SubtypeResolver str, SimpleMixInResolver mixins, RootNameLookup rootNames) {
        super(base, str, mixins, rootNames);
        this._deserFeatures = collectFeatureDefaults(DeserializationFeature.class);
        this._nodeFactory = JsonNodeFactory.instance;
        this._problemHandlers = null;
        this._parserFeatures = 0;
        this._parserFeaturesToChange = 0;
    }

    private DeserializationConfig(DeserializationConfig src, int mapperFeatures, int deserFeatures, int parserFeatures, int parserFeatureMask) {
        super(src, mapperFeatures);
        this._deserFeatures = deserFeatures;
        this._nodeFactory = src._nodeFactory;
        this._problemHandlers = src._problemHandlers;
        this._parserFeatures = parserFeatures;
        this._parserFeaturesToChange = parserFeatureMask;
    }

    private DeserializationConfig(DeserializationConfig src, SubtypeResolver str) {
        super(src, str);
        this._deserFeatures = src._deserFeatures;
        this._nodeFactory = src._nodeFactory;
        this._problemHandlers = src._problemHandlers;
        this._parserFeatures = src._parserFeatures;
        this._parserFeaturesToChange = src._parserFeaturesToChange;
    }

    private DeserializationConfig(DeserializationConfig src, BaseSettings base) {
        super(src, base);
        this._deserFeatures = src._deserFeatures;
        this._nodeFactory = src._nodeFactory;
        this._problemHandlers = src._problemHandlers;
        this._parserFeatures = src._parserFeatures;
        this._parserFeaturesToChange = src._parserFeaturesToChange;
    }

    private DeserializationConfig(DeserializationConfig src, JsonNodeFactory f) {
        super(src);
        this._deserFeatures = src._deserFeatures;
        this._problemHandlers = src._problemHandlers;
        this._nodeFactory = f;
        this._parserFeatures = src._parserFeatures;
        this._parserFeaturesToChange = src._parserFeaturesToChange;
    }

    private DeserializationConfig(DeserializationConfig src, LinkedNode<DeserializationProblemHandler> problemHandlers) {
        super(src);
        this._deserFeatures = src._deserFeatures;
        this._problemHandlers = problemHandlers;
        this._nodeFactory = src._nodeFactory;
        this._parserFeatures = src._parserFeatures;
        this._parserFeaturesToChange = src._parserFeaturesToChange;
    }

    private DeserializationConfig(DeserializationConfig src, PropertyName rootName) {
        super(src, rootName);
        this._deserFeatures = src._deserFeatures;
        this._problemHandlers = src._problemHandlers;
        this._nodeFactory = src._nodeFactory;
        this._parserFeatures = src._parserFeatures;
        this._parserFeaturesToChange = src._parserFeaturesToChange;
    }

    private DeserializationConfig(DeserializationConfig src, Class<?> view) {
        super(src, view);
        this._deserFeatures = src._deserFeatures;
        this._problemHandlers = src._problemHandlers;
        this._nodeFactory = src._nodeFactory;
        this._parserFeatures = src._parserFeatures;
        this._parserFeaturesToChange = src._parserFeaturesToChange;
    }

    protected DeserializationConfig(DeserializationConfig src, ContextAttributes attrs) {
        super(src, attrs);
        this._deserFeatures = src._deserFeatures;
        this._problemHandlers = src._problemHandlers;
        this._nodeFactory = src._nodeFactory;
        this._parserFeatures = src._parserFeatures;
        this._parserFeaturesToChange = src._parserFeaturesToChange;
    }

    protected DeserializationConfig(DeserializationConfig src, SimpleMixInResolver mixins) {
        super(src, mixins);
        this._deserFeatures = src._deserFeatures;
        this._problemHandlers = src._problemHandlers;
        this._nodeFactory = src._nodeFactory;
        this._parserFeatures = src._parserFeatures;
        this._parserFeaturesToChange = src._parserFeaturesToChange;
    }

    protected DeserializationConfig(DeserializationConfig src, SimpleMixInResolver mixins, RootNameLookup rootNames) {
        super(src, mixins, rootNames);
        this._deserFeatures = src._deserFeatures;
        this._problemHandlers = src._problemHandlers;
        this._nodeFactory = src._nodeFactory;
        this._parserFeatures = src._parserFeatures;
        this._parserFeaturesToChange = src._parserFeaturesToChange;
    }

    protected BaseSettings getBaseSettings() {
        return this._base;
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public DeserializationConfig with(MapperFeature... features) {
        int newMapperFlags = this._mapperFeatures;
        for (MapperFeature f : features) {
            newMapperFlags |= f.getMask();
        }
        return newMapperFlags == this._mapperFeatures ? this : new DeserializationConfig(this, newMapperFlags, this._deserFeatures, this._parserFeatures, this._parserFeaturesToChange);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public DeserializationConfig without(MapperFeature... features) {
        int newMapperFlags = this._mapperFeatures;
        for (MapperFeature f : features) {
            newMapperFlags &= f.getMask() ^ (-1);
        }
        return newMapperFlags == this._mapperFeatures ? this : new DeserializationConfig(this, newMapperFlags, this._deserFeatures, this._parserFeatures, this._parserFeaturesToChange);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public DeserializationConfig with(MapperFeature feature, boolean state) {
        int newMapperFlags;
        if (state) {
            newMapperFlags = this._mapperFeatures | feature.getMask();
        } else {
            newMapperFlags = this._mapperFeatures & (feature.getMask() ^ (-1));
        }
        return newMapperFlags == this._mapperFeatures ? this : new DeserializationConfig(this, newMapperFlags, this._deserFeatures, this._parserFeatures, this._parserFeaturesToChange);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(ClassIntrospector ci) {
        return _withBase(this._base.withClassIntrospector(ci));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(AnnotationIntrospector ai) {
        return _withBase(this._base.withAnnotationIntrospector(ai));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(VisibilityChecker<?> vc) {
        return _withBase(this._base.withVisibilityChecker(vc));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig withVisibility(PropertyAccessor forMethod, JsonAutoDetect.Visibility visibility) {
        return _withBase(this._base.withVisibility(forMethod, visibility));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(TypeResolverBuilder<?> trb) {
        return _withBase(this._base.withTypeResolverBuilder(trb));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(SubtypeResolver str) {
        return this._subtypeResolver == str ? this : new DeserializationConfig(this, str);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(PropertyNamingStrategy pns) {
        return _withBase(this._base.withPropertyNamingStrategy(pns));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig withRootName(PropertyName rootName) {
        if (rootName == null) {
            if (this._rootName == null) {
                return this;
            }
        } else if (rootName.equals(this._rootName)) {
            return this;
        }
        return new DeserializationConfig(this, rootName);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(TypeFactory tf) {
        return _withBase(this._base.withTypeFactory(tf));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(DateFormat df) {
        return _withBase(this._base.withDateFormat(df));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(HandlerInstantiator hi) {
        return _withBase(this._base.withHandlerInstantiator(hi));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig withInsertedAnnotationIntrospector(AnnotationIntrospector ai) {
        return _withBase(this._base.withInsertedAnnotationIntrospector(ai));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig withAppendedAnnotationIntrospector(AnnotationIntrospector ai) {
        return _withBase(this._base.withAppendedAnnotationIntrospector(ai));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig withView(Class<?> view) {
        return this._view == view ? this : new DeserializationConfig(this, view);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(Locale l) {
        return _withBase(this._base.with(l));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(TimeZone tz) {
        return _withBase(this._base.with(tz));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(Base64Variant base64) {
        return _withBase(this._base.with(base64));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfigBase
    public DeserializationConfig with(ContextAttributes attrs) {
        return attrs == this._attributes ? this : new DeserializationConfig(this, attrs);
    }

    private final DeserializationConfig _withBase(BaseSettings newBase) {
        return this._base == newBase ? this : new DeserializationConfig(this, newBase);
    }

    public DeserializationConfig with(DeserializationFeature feature) {
        int newDeserFeatures = this._deserFeatures | feature.getMask();
        return newDeserFeatures == this._deserFeatures ? this : new DeserializationConfig(this, this._mapperFeatures, newDeserFeatures, this._parserFeatures, this._parserFeaturesToChange);
    }

    public DeserializationConfig with(DeserializationFeature first, DeserializationFeature... features) {
        int newDeserFeatures = this._deserFeatures | first.getMask();
        for (DeserializationFeature f : features) {
            newDeserFeatures |= f.getMask();
        }
        return newDeserFeatures == this._deserFeatures ? this : new DeserializationConfig(this, this._mapperFeatures, newDeserFeatures, this._parserFeatures, this._parserFeaturesToChange);
    }

    public DeserializationConfig withFeatures(DeserializationFeature... features) {
        int newDeserFeatures = this._deserFeatures;
        for (DeserializationFeature f : features) {
            newDeserFeatures |= f.getMask();
        }
        return newDeserFeatures == this._deserFeatures ? this : new DeserializationConfig(this, this._mapperFeatures, newDeserFeatures, this._parserFeatures, this._parserFeaturesToChange);
    }

    public DeserializationConfig without(DeserializationFeature feature) {
        int newDeserFeatures = this._deserFeatures & (feature.getMask() ^ (-1));
        return newDeserFeatures == this._deserFeatures ? this : new DeserializationConfig(this, this._mapperFeatures, newDeserFeatures, this._parserFeatures, this._parserFeaturesToChange);
    }

    public DeserializationConfig without(DeserializationFeature first, DeserializationFeature... features) {
        int newDeserFeatures = this._deserFeatures & (first.getMask() ^ (-1));
        for (DeserializationFeature f : features) {
            newDeserFeatures &= f.getMask() ^ (-1);
        }
        return newDeserFeatures == this._deserFeatures ? this : new DeserializationConfig(this, this._mapperFeatures, newDeserFeatures, this._parserFeatures, this._parserFeaturesToChange);
    }

    public DeserializationConfig withoutFeatures(DeserializationFeature... features) {
        int newDeserFeatures = this._deserFeatures;
        for (DeserializationFeature f : features) {
            newDeserFeatures &= f.getMask() ^ (-1);
        }
        return newDeserFeatures == this._deserFeatures ? this : new DeserializationConfig(this, this._mapperFeatures, newDeserFeatures, this._parserFeatures, this._parserFeaturesToChange);
    }

    public DeserializationConfig with(JsonParser.Feature feature) {
        int newSet = this._parserFeatures | feature.getMask();
        int newMask = this._parserFeaturesToChange | feature.getMask();
        return (this._parserFeatures == newSet && this._parserFeaturesToChange == newMask) ? this : new DeserializationConfig(this, this._mapperFeatures, this._deserFeatures, newSet, newMask);
    }

    public DeserializationConfig withFeatures(JsonParser.Feature... features) {
        int newSet = this._parserFeatures;
        int newMask = this._parserFeaturesToChange;
        for (JsonParser.Feature f : features) {
            int mask = f.getMask();
            newSet |= mask;
            newMask |= mask;
        }
        return (this._parserFeatures == newSet && this._parserFeaturesToChange == newMask) ? this : new DeserializationConfig(this, this._mapperFeatures, this._deserFeatures, newSet, newMask);
    }

    public DeserializationConfig without(JsonParser.Feature feature) {
        int newSet = this._parserFeatures & (feature.getMask() ^ (-1));
        int newMask = this._parserFeaturesToChange | feature.getMask();
        return (this._parserFeatures == newSet && this._parserFeaturesToChange == newMask) ? this : new DeserializationConfig(this, this._mapperFeatures, this._deserFeatures, newSet, newMask);
    }

    public DeserializationConfig withoutFeatures(JsonParser.Feature... features) {
        int newSet = this._parserFeatures;
        int newMask = this._parserFeaturesToChange;
        for (JsonParser.Feature f : features) {
            int mask = f.getMask();
            newSet &= mask ^ (-1);
            newMask |= mask;
        }
        return (this._parserFeatures == newSet && this._parserFeaturesToChange == newMask) ? this : new DeserializationConfig(this, this._mapperFeatures, this._deserFeatures, newSet, newMask);
    }

    public DeserializationConfig with(JsonNodeFactory f) {
        if (this._nodeFactory == f) {
            return this;
        }
        return new DeserializationConfig(this, f);
    }

    public DeserializationConfig withHandler(DeserializationProblemHandler h) {
        if (LinkedNode.contains(this._problemHandlers, h)) {
            return this;
        }
        return new DeserializationConfig(this, (LinkedNode<DeserializationProblemHandler>) new LinkedNode(h, this._problemHandlers));
    }

    public DeserializationConfig withNoProblemHandlers() {
        if (this._problemHandlers == null) {
            return this;
        }
        return new DeserializationConfig(this, (LinkedNode<DeserializationProblemHandler>) null);
    }

    public void initialize(JsonParser p) {
        if (this._parserFeaturesToChange != 0) {
            int orig = p.getFeatureMask();
            int newFlags = (orig & (this._parserFeaturesToChange ^ (-1))) | this._parserFeatures;
            if (orig != newFlags) {
                p.setFeatureMask(newFlags);
            }
        }
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public AnnotationIntrospector getAnnotationIntrospector() {
        if (isEnabled(MapperFeature.USE_ANNOTATIONS)) {
            return super.getAnnotationIntrospector();
        }
        return NopAnnotationIntrospector.instance;
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public boolean useRootWrapping() {
        if (this._rootName != null) {
            return !this._rootName.isEmpty();
        }
        return isEnabled(DeserializationFeature.UNWRAP_ROOT_VALUE);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public BeanDescription introspectClassAnnotations(JavaType type) {
        return getClassIntrospector().forClassAnnotations(this, type, this);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public BeanDescription introspectDirectClassAnnotations(JavaType type) {
        return getClassIntrospector().forDirectClassAnnotations(this, type, this);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public VisibilityChecker<?> getDefaultVisibilityChecker() {
        VisibilityChecker<?> vchecker = super.getDefaultVisibilityChecker();
        if (!isEnabled(MapperFeature.AUTO_DETECT_SETTERS)) {
            vchecker = vchecker.withSetterVisibility(JsonAutoDetect.Visibility.NONE);
        }
        if (!isEnabled(MapperFeature.AUTO_DETECT_CREATORS)) {
            vchecker = vchecker.withCreatorVisibility(JsonAutoDetect.Visibility.NONE);
        }
        if (!isEnabled(MapperFeature.AUTO_DETECT_FIELDS)) {
            vchecker = vchecker.withFieldVisibility(JsonAutoDetect.Visibility.NONE);
        }
        return vchecker;
    }

    public final boolean isEnabled(DeserializationFeature f) {
        return (this._deserFeatures & f.getMask()) != 0;
    }

    public final boolean isEnabled(JsonParser.Feature f, JsonFactory factory) {
        int mask = f.getMask();
        if ((this._parserFeaturesToChange & mask) != 0) {
            return (this._parserFeatures & f.getMask()) != 0;
        }
        return factory.isEnabled(f);
    }

    public final boolean hasDeserializationFeatures(int featureMask) {
        return (this._deserFeatures & featureMask) == featureMask;
    }

    public final boolean hasSomeOfFeatures(int featureMask) {
        return (this._deserFeatures & featureMask) != 0;
    }

    public final int getDeserializationFeatures() {
        return this._deserFeatures;
    }

    public LinkedNode<DeserializationProblemHandler> getProblemHandlers() {
        return this._problemHandlers;
    }

    public final JsonNodeFactory getNodeFactory() {
        return this._nodeFactory;
    }

    public <T extends BeanDescription> T introspect(JavaType javaType) {
        return (T) getClassIntrospector().forDeserialization(this, javaType, this);
    }

    public <T extends BeanDescription> T introspectForCreation(JavaType javaType) {
        return (T) getClassIntrospector().forCreation(this, javaType, this);
    }

    public <T extends BeanDescription> T introspectForBuilder(JavaType javaType) {
        return (T) getClassIntrospector().forDeserializationWithBuilder(this, javaType, this);
    }

    public TypeDeserializer findTypeDeserializer(JavaType baseType) throws JsonMappingException {
        BeanDescription bean = introspectClassAnnotations(baseType.getRawClass());
        AnnotatedClass ac = bean.getClassInfo();
        TypeResolverBuilder<?> b = getAnnotationIntrospector().findTypeResolver(this, ac, baseType);
        Collection<NamedType> subtypes = null;
        if (b == null) {
            b = getDefaultTyper(baseType);
            if (b == null) {
                return null;
            }
        } else {
            subtypes = getSubtypeResolver().collectAndResolveSubtypesByTypeId(this, ac);
        }
        return b.buildTypeDeserializer(this, baseType, subtypes);
    }
}
