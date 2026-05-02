package com.fasterxml.jackson.databind.jsontype.impl;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.cfg.MapperConfig;
import com.fasterxml.jackson.databind.jsontype.NamedType;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeIdResolver;
import com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import java.util.Collection;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder.class */
public class StdTypeResolverBuilder implements TypeResolverBuilder<StdTypeResolverBuilder> {
    protected JsonTypeInfo.Id _idType;
    protected JsonTypeInfo.As _includeAs;
    protected String _typeProperty;
    protected boolean _typeIdVisible = false;
    protected Class<?> _defaultImpl;
    protected TypeIdResolver _customIdResolver;

    @Override // com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
    public /* bridge */ /* synthetic */ TypeResolverBuilder defaultImpl(Class x0) {
        return defaultImpl((Class<?>) x0);
    }

    public static StdTypeResolverBuilder noTypeInfoBuilder() {
        return new StdTypeResolverBuilder().init(JsonTypeInfo.Id.NONE, (TypeIdResolver) null);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
    public StdTypeResolverBuilder init(JsonTypeInfo.Id idType, TypeIdResolver idRes) {
        if (idType == null) {
            throw new IllegalArgumentException("idType can not be null");
        }
        this._idType = idType;
        this._customIdResolver = idRes;
        this._typeProperty = idType.getDefaultPropertyName();
        return this;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
    public TypeSerializer buildTypeSerializer(SerializationConfig config, JavaType baseType, Collection<NamedType> subtypes) {
        if (this._idType == JsonTypeInfo.Id.NONE) {
            return null;
        }
        TypeIdResolver idRes = idResolver(config, baseType, subtypes, true, false);
        switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$As[this._includeAs.ordinal()]) {
            case 1:
                return new AsArrayTypeSerializer(idRes, null);
            case 2:
                return new AsPropertyTypeSerializer(idRes, null, this._typeProperty);
            case 3:
                return new AsWrapperTypeSerializer(idRes, null);
            case 4:
                return new AsExternalTypeSerializer(idRes, null, this._typeProperty);
            case 5:
                return new AsExistingPropertyTypeSerializer(idRes, null, this._typeProperty);
            default:
                throw new IllegalStateException("Do not know how to construct standard type serializer for inclusion type: " + this._includeAs);
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
    public TypeDeserializer buildTypeDeserializer(DeserializationConfig config, JavaType baseType, Collection<NamedType> subtypes) {
        if (this._idType == JsonTypeInfo.Id.NONE) {
            return null;
        }
        TypeIdResolver idRes = idResolver(config, baseType, subtypes, false, true);
        switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$As[this._includeAs.ordinal()]) {
            case 1:
                return new AsArrayTypeDeserializer(baseType, idRes, this._typeProperty, this._typeIdVisible, this._defaultImpl);
            case 2:
            case 5:
                return new AsPropertyTypeDeserializer(baseType, idRes, this._typeProperty, this._typeIdVisible, this._defaultImpl, this._includeAs);
            case 3:
                return new AsWrapperTypeDeserializer(baseType, idRes, this._typeProperty, this._typeIdVisible, this._defaultImpl);
            case 4:
                return new AsExternalTypeDeserializer(baseType, idRes, this._typeProperty, this._typeIdVisible, this._defaultImpl);
            default:
                throw new IllegalStateException("Do not know how to construct standard type serializer for inclusion type: " + this._includeAs);
        }
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
    public StdTypeResolverBuilder inclusion(JsonTypeInfo.As includeAs) {
        if (includeAs == null) {
            throw new IllegalArgumentException("includeAs can not be null");
        }
        this._includeAs = includeAs;
        return this;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
    public StdTypeResolverBuilder typeProperty(String typeIdPropName) {
        if (typeIdPropName == null || typeIdPropName.length() == 0) {
            typeIdPropName = this._idType.getDefaultPropertyName();
        }
        this._typeProperty = typeIdPropName;
        return this;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
    public StdTypeResolverBuilder defaultImpl(Class<?> defaultImpl) {
        this._defaultImpl = defaultImpl;
        return this;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
    public StdTypeResolverBuilder typeIdVisibility(boolean isVisible) {
        this._typeIdVisible = isVisible;
        return this;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeResolverBuilder
    public Class<?> getDefaultImpl() {
        return this._defaultImpl;
    }

    public String getTypeProperty() {
        return this._typeProperty;
    }

    public boolean isTypeIdVisible() {
        return this._typeIdVisible;
    }

    protected TypeIdResolver idResolver(MapperConfig<?> config, JavaType baseType, Collection<NamedType> subtypes, boolean forSer, boolean forDeser) {
        if (this._customIdResolver != null) {
            return this._customIdResolver;
        }
        if (this._idType == null) {
            throw new IllegalStateException("Can not build, 'init()' not yet called");
        }
        switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$Id[this._idType.ordinal()]) {
            case 1:
                return new ClassNameIdResolver(baseType, config.getTypeFactory());
            case 2:
                return new MinimalClassNameIdResolver(baseType, config.getTypeFactory());
            case 3:
                return TypeNameIdResolver.construct(config, baseType, subtypes, forSer, forDeser);
            case 4:
                return null;
            case 5:
            default:
                throw new IllegalStateException("Do not know how to construct standard type id resolver for idType: " + this._idType);
        }
    }

    /* renamed from: com.fasterxml.jackson.databind.jsontype.impl.StdTypeResolverBuilder$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$As;
        static final /* synthetic */ int[] $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$Id = new int[JsonTypeInfo.Id.values().length];

        static {
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$Id[JsonTypeInfo.Id.CLASS.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$Id[JsonTypeInfo.Id.MINIMAL_CLASS.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$Id[JsonTypeInfo.Id.NAME.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$Id[JsonTypeInfo.Id.NONE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$Id[JsonTypeInfo.Id.CUSTOM.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$As = new int[JsonTypeInfo.As.values().length];
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$As[JsonTypeInfo.As.WRAPPER_ARRAY.ordinal()] = 1;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$As[JsonTypeInfo.As.PROPERTY.ordinal()] = 2;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$As[JsonTypeInfo.As.WRAPPER_OBJECT.ordinal()] = 3;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$As[JsonTypeInfo.As.EXTERNAL_PROPERTY.ordinal()] = 4;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonTypeInfo$As[JsonTypeInfo.As.EXISTING_PROPERTY.ordinal()] = 5;
            } catch (NoSuchFieldError e10) {
            }
        }
    }
}
