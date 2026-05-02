package com.fasterxml.jackson.databind.cfg;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.io.SerializedString;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.cfg.MapperConfig;
import com.fasterxml.jackson.databind.introspect.Annotated;
import com.fasterxml.jackson.databind.introspect.ClassIntrospector;
import com.fasterxml.jackson.databind.introspect.VisibilityChecker;
import com.fasterxml.jackson.databind.jsontype.SubtypeResolver;
import com.fasterxml.jackson.databind.jsontype.TypeIdResolver;
import com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder;
import com.fasterxml.jackson.databind.type.TypeBindings;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.ClassUtil;
import java.io.Serializable;
import java.text.DateFormat;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/cfg/MapperConfig.class */
public abstract class MapperConfig<T extends MapperConfig<T>> implements ClassIntrospector.MixInResolver, Serializable {
    private static final long serialVersionUID = 1;
    protected final int _mapperFeatures;
    protected final BaseSettings _base;

    public abstract T with(MapperFeature... mapperFeatureArr);

    public abstract T without(MapperFeature... mapperFeatureArr);

    public abstract T with(MapperFeature mapperFeature, boolean z);

    public abstract boolean useRootWrapping();

    public abstract SubtypeResolver getSubtypeResolver();

    public abstract BeanDescription introspectClassAnnotations(JavaType javaType);

    public abstract BeanDescription introspectDirectClassAnnotations(JavaType javaType);

    public abstract Class<?> getActiveView();

    public abstract ContextAttributes getAttributes();

    public abstract PropertyName findRootName(JavaType javaType);

    public abstract PropertyName findRootName(Class<?> cls);

    protected MapperConfig(BaseSettings base, int mapperFeatures) {
        this._base = base;
        this._mapperFeatures = mapperFeatures;
    }

    protected MapperConfig(MapperConfig<T> src, int mapperFeatures) {
        this._base = src._base;
        this._mapperFeatures = mapperFeatures;
    }

    protected MapperConfig(MapperConfig<T> src, BaseSettings base) {
        this._base = base;
        this._mapperFeatures = src._mapperFeatures;
    }

    protected MapperConfig(MapperConfig<T> src) {
        this._base = src._base;
        this._mapperFeatures = src._mapperFeatures;
    }

    public static <F extends Enum<F> & ConfigFeature> int collectFeatureDefaults(Class<F> cls) {
        int i = 0;
        for (Object obj : (Enum[]) cls.getEnumConstants()) {
            if (((ConfigFeature) obj).enabledByDefault()) {
                i |= ((ConfigFeature) obj).getMask();
            }
        }
        return i;
    }

    public final boolean isEnabled(MapperFeature f) {
        return (this._mapperFeatures & f.getMask()) != 0;
    }

    public final boolean hasMapperFeatures(int featureMask) {
        return (this._mapperFeatures & featureMask) == featureMask;
    }

    public final boolean isAnnotationProcessingEnabled() {
        return isEnabled(MapperFeature.USE_ANNOTATIONS);
    }

    public final boolean canOverrideAccessModifiers() {
        return isEnabled(MapperFeature.CAN_OVERRIDE_ACCESS_MODIFIERS);
    }

    public final boolean shouldSortPropertiesAlphabetically() {
        return isEnabled(MapperFeature.SORT_PROPERTIES_ALPHABETICALLY);
    }

    public SerializableString compileString(String src) {
        return new SerializedString(src);
    }

    public ClassIntrospector getClassIntrospector() {
        return this._base.getClassIntrospector();
    }

    public AnnotationIntrospector getAnnotationIntrospector() {
        return this._base.getAnnotationIntrospector();
    }

    public VisibilityChecker<?> getDefaultVisibilityChecker() {
        return this._base.getVisibilityChecker();
    }

    public final PropertyNamingStrategy getPropertyNamingStrategy() {
        return this._base.getPropertyNamingStrategy();
    }

    public final HandlerInstantiator getHandlerInstantiator() {
        return this._base.getHandlerInstantiator();
    }

    public final TypeResolverBuilder<?> getDefaultTyper(JavaType baseType) {
        return this._base.getTypeResolverBuilder();
    }

    public final TypeFactory getTypeFactory() {
        return this._base.getTypeFactory();
    }

    public final JavaType constructType(Class<?> cls) {
        return getTypeFactory().constructType(cls, (TypeBindings) null);
    }

    public final JavaType constructType(TypeReference<?> valueTypeRef) {
        return getTypeFactory().constructType(valueTypeRef.getType(), (TypeBindings) null);
    }

    public JavaType constructSpecializedType(JavaType baseType, Class<?> subclass) {
        return getTypeFactory().constructSpecializedType(baseType, subclass);
    }

    public BeanDescription introspectClassAnnotations(Class<?> cls) {
        return introspectClassAnnotations(constructType(cls));
    }

    public BeanDescription introspectDirectClassAnnotations(Class<?> cls) {
        return introspectDirectClassAnnotations(constructType(cls));
    }

    public final DateFormat getDateFormat() {
        return this._base.getDateFormat();
    }

    public final Locale getLocale() {
        return this._base.getLocale();
    }

    public final TimeZone getTimeZone() {
        return this._base.getTimeZone();
    }

    public Base64Variant getBase64Variant() {
        return this._base.getBase64Variant();
    }

    public TypeResolverBuilder<?> typeResolverBuilderInstance(Annotated annotated, Class<? extends TypeResolverBuilder<?>> builderClass) {
        TypeResolverBuilder<?> builder;
        HandlerInstantiator hi = getHandlerInstantiator();
        if (hi != null && (builder = hi.typeResolverBuilderInstance(this, annotated, builderClass)) != null) {
            return builder;
        }
        return (TypeResolverBuilder) ClassUtil.createInstance(builderClass, canOverrideAccessModifiers());
    }

    public TypeIdResolver typeIdResolverInstance(Annotated annotated, Class<? extends TypeIdResolver> resolverClass) {
        TypeIdResolver builder;
        HandlerInstantiator hi = getHandlerInstantiator();
        if (hi != null && (builder = hi.typeIdResolverInstance(this, annotated, resolverClass)) != null) {
            return builder;
        }
        return (TypeIdResolver) ClassUtil.createInstance(resolverClass, canOverrideAccessModifiers());
    }
}
