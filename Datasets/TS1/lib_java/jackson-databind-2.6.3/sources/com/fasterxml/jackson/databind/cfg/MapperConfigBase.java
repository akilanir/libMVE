package com.fasterxml.jackson.databind.cfg;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.cfg.ConfigFeature;
import com.fasterxml.jackson.databind.cfg.MapperConfigBase;
import com.fasterxml.jackson.databind.introspect.ClassIntrospector;
import com.fasterxml.jackson.databind.introspect.SimpleMixInResolver;
import com.fasterxml.jackson.databind.introspect.VisibilityChecker;
import com.fasterxml.jackson.databind.jsontype.SubtypeResolver;
import com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.RootNameLookup;
import java.io.Serializable;
import java.text.DateFormat;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/cfg/MapperConfigBase.class */
public abstract class MapperConfigBase<CFG extends ConfigFeature, T extends MapperConfigBase<CFG, T>> extends MapperConfig<T> implements Serializable {
    private static final int DEFAULT_MAPPER_FEATURES = collectFeatureDefaults(MapperFeature.class);
    protected final SimpleMixInResolver _mixIns;
    protected final SubtypeResolver _subtypeResolver;
    protected final PropertyName _rootName;
    protected final Class<?> _view;
    protected final ContextAttributes _attributes;
    protected final RootNameLookup _rootNames;

    public abstract T with(AnnotationIntrospector annotationIntrospector);

    public abstract T withAppendedAnnotationIntrospector(AnnotationIntrospector annotationIntrospector);

    public abstract T withInsertedAnnotationIntrospector(AnnotationIntrospector annotationIntrospector);

    public abstract T with(ClassIntrospector classIntrospector);

    public abstract T with(DateFormat dateFormat);

    public abstract T with(HandlerInstantiator handlerInstantiator);

    public abstract T with(PropertyNamingStrategy propertyNamingStrategy);

    public abstract T withRootName(PropertyName propertyName);

    public abstract T with(SubtypeResolver subtypeResolver);

    public abstract T with(TypeFactory typeFactory);

    public abstract T with(TypeResolverBuilder<?> typeResolverBuilder);

    public abstract T withView(Class<?> cls);

    public abstract T with(VisibilityChecker<?> visibilityChecker);

    public abstract T withVisibility(PropertyAccessor propertyAccessor, JsonAutoDetect.Visibility visibility);

    public abstract T with(Locale locale);

    public abstract T with(TimeZone timeZone);

    public abstract T with(Base64Variant base64Variant);

    public abstract T with(ContextAttributes contextAttributes);

    protected MapperConfigBase(BaseSettings base, SubtypeResolver str, SimpleMixInResolver mixins, RootNameLookup rootNames) {
        super(base, DEFAULT_MAPPER_FEATURES);
        this._mixIns = mixins;
        this._subtypeResolver = str;
        this._rootNames = rootNames;
        this._rootName = null;
        this._view = null;
        this._attributes = ContextAttributes.getEmpty();
    }

    protected MapperConfigBase(MapperConfigBase<CFG, T> src) {
        super(src);
        this._mixIns = src._mixIns;
        this._subtypeResolver = src._subtypeResolver;
        this._rootNames = src._rootNames;
        this._rootName = src._rootName;
        this._view = src._view;
        this._attributes = src._attributes;
    }

    protected MapperConfigBase(MapperConfigBase<CFG, T> src, BaseSettings base) {
        super(src, base);
        this._mixIns = src._mixIns;
        this._subtypeResolver = src._subtypeResolver;
        this._rootNames = src._rootNames;
        this._rootName = src._rootName;
        this._view = src._view;
        this._attributes = src._attributes;
    }

    protected MapperConfigBase(MapperConfigBase<CFG, T> src, int mapperFeatures) {
        super(src, mapperFeatures);
        this._mixIns = src._mixIns;
        this._subtypeResolver = src._subtypeResolver;
        this._rootNames = src._rootNames;
        this._rootName = src._rootName;
        this._view = src._view;
        this._attributes = src._attributes;
    }

    protected MapperConfigBase(MapperConfigBase<CFG, T> src, SubtypeResolver str) {
        super(src);
        this._mixIns = src._mixIns;
        this._subtypeResolver = str;
        this._rootNames = src._rootNames;
        this._rootName = src._rootName;
        this._view = src._view;
        this._attributes = src._attributes;
    }

    protected MapperConfigBase(MapperConfigBase<CFG, T> src, PropertyName rootName) {
        super(src);
        this._mixIns = src._mixIns;
        this._subtypeResolver = src._subtypeResolver;
        this._rootNames = src._rootNames;
        this._rootName = rootName;
        this._view = src._view;
        this._attributes = src._attributes;
    }

    protected MapperConfigBase(MapperConfigBase<CFG, T> src, Class<?> view) {
        super(src);
        this._mixIns = src._mixIns;
        this._subtypeResolver = src._subtypeResolver;
        this._rootNames = src._rootNames;
        this._rootName = src._rootName;
        this._view = view;
        this._attributes = src._attributes;
    }

    protected MapperConfigBase(MapperConfigBase<CFG, T> src, SimpleMixInResolver mixins) {
        super(src);
        this._mixIns = mixins;
        this._subtypeResolver = src._subtypeResolver;
        this._rootNames = src._rootNames;
        this._rootName = src._rootName;
        this._view = src._view;
        this._attributes = src._attributes;
    }

    protected MapperConfigBase(MapperConfigBase<CFG, T> src, ContextAttributes attr) {
        super(src);
        this._mixIns = src._mixIns;
        this._subtypeResolver = src._subtypeResolver;
        this._rootNames = src._rootNames;
        this._rootName = src._rootName;
        this._view = src._view;
        this._attributes = attr;
    }

    protected MapperConfigBase(MapperConfigBase<CFG, T> src, SimpleMixInResolver mixins, RootNameLookup rootNames) {
        super(src);
        this._mixIns = mixins;
        this._subtypeResolver = src._subtypeResolver;
        this._rootNames = rootNames;
        this._rootName = src._rootName;
        this._view = src._view;
        this._attributes = src._attributes;
    }

    public T withRootName(String str) {
        if (str == null) {
            return (T) withRootName((PropertyName) null);
        }
        return (T) withRootName(PropertyName.construct(str));
    }

    public T withAttributes(Map<Object, Object> map) {
        return (T) with(getAttributes().withSharedAttributes(map));
    }

    public T withAttribute(Object obj, Object obj2) {
        return (T) with(getAttributes().withSharedAttribute(obj, obj2));
    }

    public T withoutAttribute(Object obj) {
        return (T) with(getAttributes().withoutSharedAttribute(obj));
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public final SubtypeResolver getSubtypeResolver() {
        return this._subtypeResolver;
    }

    @Deprecated
    public final String getRootName() {
        if (this._rootName == null) {
            return null;
        }
        return this._rootName.getSimpleName();
    }

    public final PropertyName getFullRootName() {
        return this._rootName;
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public final Class<?> getActiveView() {
        return this._view;
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public final ContextAttributes getAttributes() {
        return this._attributes;
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public PropertyName findRootName(JavaType rootType) {
        if (this._rootName != null) {
            return this._rootName;
        }
        return this._rootNames.findRootName(rootType, this);
    }

    @Override // com.fasterxml.jackson.databind.cfg.MapperConfig
    public PropertyName findRootName(Class<?> rawRootType) {
        if (this._rootName != null) {
            return this._rootName;
        }
        return this._rootNames.findRootName(rawRootType, this);
    }

    @Override // com.fasterxml.jackson.databind.introspect.ClassIntrospector.MixInResolver
    public final Class<?> findMixInClassFor(Class<?> cls) {
        return this._mixIns.findMixInClassFor(cls);
    }

    @Override // com.fasterxml.jackson.databind.introspect.ClassIntrospector.MixInResolver
    public ClassIntrospector.MixInResolver copy() {
        throw new UnsupportedOperationException();
    }

    public final int mixInCount() {
        return this._mixIns.localSize();
    }
}
