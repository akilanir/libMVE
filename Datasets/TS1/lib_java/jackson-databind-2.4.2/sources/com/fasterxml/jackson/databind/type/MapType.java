package com.fasterxml.jackson.databind.type;

import com.fasterxml.jackson.databind.JavaType;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/type/MapType.class */
public final class MapType extends MapLikeType {
    private static final long serialVersionUID = -811146779148281500L;

    private MapType(Class<?> mapType, JavaType keyT, JavaType valueT, Object valueHandler, Object typeHandler, boolean asStatic) {
        super(mapType, keyT, valueT, valueHandler, typeHandler, asStatic);
    }

    public static MapType construct(Class<?> rawType, JavaType keyT, JavaType valueT) {
        return new MapType(rawType, keyT, valueT, null, null, false);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType, com.fasterxml.jackson.databind.JavaType
    protected JavaType _narrow(Class<?> subclass) {
        return new MapType(subclass, this._keyType, this._valueType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType, com.fasterxml.jackson.databind.JavaType
    public JavaType narrowContentsBy(Class<?> contentClass) {
        if (contentClass == this._valueType.getRawClass()) {
            return this;
        }
        return new MapType(this._class, this._keyType, this._valueType.narrowBy(contentClass), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType, com.fasterxml.jackson.databind.JavaType
    public JavaType widenContentsBy(Class<?> contentClass) {
        if (contentClass == this._valueType.getRawClass()) {
            return this;
        }
        return new MapType(this._class, this._keyType, this._valueType.widenBy(contentClass), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType
    public JavaType narrowKey(Class<?> keySubclass) {
        if (keySubclass == this._keyType.getRawClass()) {
            return this;
        }
        return new MapType(this._class, this._keyType.narrowBy(keySubclass), this._valueType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType
    public JavaType widenKey(Class<?> keySubclass) {
        if (keySubclass == this._keyType.getRawClass()) {
            return this;
        }
        return new MapType(this._class, this._keyType.widenBy(keySubclass), this._valueType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType, com.fasterxml.jackson.databind.JavaType
    public MapType withTypeHandler(Object h) {
        return new MapType(this._class, this._keyType, this._valueType, this._valueHandler, h, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType, com.fasterxml.jackson.databind.JavaType
    public MapType withContentTypeHandler(Object h) {
        return new MapType(this._class, this._keyType, this._valueType.withTypeHandler(h), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType, com.fasterxml.jackson.databind.JavaType
    public MapType withValueHandler(Object h) {
        return new MapType(this._class, this._keyType, this._valueType, h, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType, com.fasterxml.jackson.databind.JavaType
    public MapType withContentValueHandler(Object h) {
        return new MapType(this._class, this._keyType, this._valueType.withValueHandler(h), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType, com.fasterxml.jackson.databind.JavaType
    public MapType withStaticTyping() {
        if (this._asStatic) {
            return this;
        }
        return new MapType(this._class, this._keyType.withStaticTyping(), this._valueType.withStaticTyping(), this._valueHandler, this._typeHandler, true);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType
    public MapType withKeyTypeHandler(Object h) {
        return new MapType(this._class, this._keyType.withTypeHandler(h), this._valueType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType
    public MapType withKeyValueHandler(Object h) {
        return new MapType(this._class, this._keyType.withValueHandler(h), this._valueType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.MapLikeType, com.fasterxml.jackson.databind.JavaType
    public String toString() {
        return "[map type; class " + this._class.getName() + ", " + this._keyType + " -> " + this._valueType + "]";
    }
}
