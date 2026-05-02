package com.fasterxml.jackson.databind.jsontype.impl;

import com.fasterxml.jackson.databind.DatabindContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.jsontype.TypeIdResolver;
import com.fasterxml.jackson.databind.type.TypeFactory;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/jsontype/impl/TypeIdResolverBase.class */
public abstract class TypeIdResolverBase implements TypeIdResolver {
    protected final TypeFactory _typeFactory;
    protected final JavaType _baseType;

    protected TypeIdResolverBase() {
        this(null, null);
    }

    protected TypeIdResolverBase(JavaType baseType, TypeFactory typeFactory) {
        this._baseType = baseType;
        this._typeFactory = typeFactory;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeIdResolver
    public void init(JavaType bt) {
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeIdResolver
    public String idFromBaseType() {
        return idFromValueAndType(null, this._baseType.getRawClass());
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeIdResolver
    @Deprecated
    public JavaType typeFromId(String id) {
        return typeFromId(null, id);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeIdResolver
    public JavaType typeFromId(DatabindContext context, String id) {
        return typeFromId(id);
    }

    public String getDescForKnownTypeIds() {
        return null;
    }
}
