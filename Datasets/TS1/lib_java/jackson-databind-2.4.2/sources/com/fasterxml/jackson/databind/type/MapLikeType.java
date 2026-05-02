package com.fasterxml.jackson.databind.type;

import com.fasterxml.jackson.databind.JavaType;
import java.util.Map;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/type/MapLikeType.class */
public class MapLikeType extends TypeBase {
    private static final long serialVersionUID = 416067702302823522L;
    protected final JavaType _keyType;
    protected final JavaType _valueType;

    protected MapLikeType(Class<?> mapType, JavaType keyT, JavaType valueT, Object valueHandler, Object typeHandler, boolean asStatic) {
        super(mapType, keyT.hashCode() ^ valueT.hashCode(), valueHandler, typeHandler, asStatic);
        this._keyType = keyT;
        this._valueType = valueT;
    }

    public static MapLikeType construct(Class<?> rawType, JavaType keyT, JavaType valueT) {
        return new MapLikeType(rawType, keyT, valueT, null, null, false);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    protected JavaType _narrow(Class<?> subclass) {
        return new MapLikeType(subclass, this._keyType, this._valueType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public JavaType narrowContentsBy(Class<?> contentClass) {
        if (contentClass == this._valueType.getRawClass()) {
            return this;
        }
        return new MapLikeType(this._class, this._keyType, this._valueType.narrowBy(contentClass), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public JavaType widenContentsBy(Class<?> contentClass) {
        if (contentClass == this._valueType.getRawClass()) {
            return this;
        }
        return new MapLikeType(this._class, this._keyType, this._valueType.widenBy(contentClass), this._valueHandler, this._typeHandler, this._asStatic);
    }

    public JavaType narrowKey(Class<?> keySubclass) {
        if (keySubclass == this._keyType.getRawClass()) {
            return this;
        }
        return new MapLikeType(this._class, this._keyType.narrowBy(keySubclass), this._valueType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    public JavaType widenKey(Class<?> keySubclass) {
        if (keySubclass == this._keyType.getRawClass()) {
            return this;
        }
        return new MapLikeType(this._class, this._keyType.widenBy(keySubclass), this._valueType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public MapLikeType withTypeHandler(Object h) {
        return new MapLikeType(this._class, this._keyType, this._valueType, this._valueHandler, h, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public MapLikeType withContentTypeHandler(Object h) {
        return new MapLikeType(this._class, this._keyType, this._valueType.withTypeHandler(h), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public MapLikeType withValueHandler(Object h) {
        return new MapLikeType(this._class, this._keyType, this._valueType, h, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public MapLikeType withContentValueHandler(Object h) {
        return new MapLikeType(this._class, this._keyType, this._valueType.withValueHandler(h), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public MapLikeType withStaticTyping() {
        if (this._asStatic) {
            return this;
        }
        return new MapLikeType(this._class, this._keyType, this._valueType.withStaticTyping(), this._valueHandler, this._typeHandler, true);
    }

    @Override // com.fasterxml.jackson.databind.type.TypeBase
    protected String buildCanonicalName() {
        StringBuilder sb = new StringBuilder();
        sb.append(this._class.getName());
        if (this._keyType != null) {
            sb.append('<');
            sb.append(this._keyType.toCanonical());
            sb.append(',');
            sb.append(this._valueType.toCanonical());
            sb.append('>');
        }
        return sb.toString();
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean isContainerType() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean isMapLikeType() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    /* renamed from: getKeyType */
    public JavaType mo4getKeyType() {
        return this._keyType;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    /* renamed from: getContentType */
    public JavaType mo3getContentType() {
        return this._valueType;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public int containedTypeCount() {
        return 2;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    /* renamed from: containedType */
    public JavaType mo2containedType(int index) {
        if (index == 0) {
            return this._keyType;
        }
        if (index == 1) {
            return this._valueType;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public String containedTypeName(int index) {
        if (index == 0) {
            return "K";
        }
        if (index == 1) {
            return "V";
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.type.TypeBase, com.fasterxml.jackson.databind.JavaType
    public StringBuilder getErasedSignature(StringBuilder sb) {
        return _classSignature(this._class, sb, true);
    }

    @Override // com.fasterxml.jackson.databind.type.TypeBase, com.fasterxml.jackson.databind.JavaType
    public StringBuilder getGenericSignature(StringBuilder sb) {
        _classSignature(this._class, sb, false);
        sb.append('<');
        this._keyType.getGenericSignature(sb);
        this._valueType.getGenericSignature(sb);
        sb.append(">;");
        return sb;
    }

    public MapLikeType withKeyTypeHandler(Object h) {
        return new MapLikeType(this._class, this._keyType.withTypeHandler(h), this._valueType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    public MapLikeType withKeyValueHandler(Object h) {
        return new MapLikeType(this._class, this._keyType.withValueHandler(h), this._valueType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    public boolean isTrueMapType() {
        return Map.class.isAssignableFrom(this._class);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public String toString() {
        return "[map-like type; class " + this._class.getName() + ", " + this._keyType + " -> " + this._valueType + "]";
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o == null || o.getClass() != getClass()) {
            return false;
        }
        MapLikeType other = (MapLikeType) o;
        return this._class == other._class && this._keyType.equals(other._keyType) && this._valueType.equals(other._valueType);
    }
}
