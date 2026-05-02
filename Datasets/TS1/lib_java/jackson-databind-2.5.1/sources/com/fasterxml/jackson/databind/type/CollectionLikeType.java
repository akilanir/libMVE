package com.fasterxml.jackson.databind.type;

import com.fasterxml.jackson.databind.JavaType;
import java.util.Collection;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/type/CollectionLikeType.class */
public class CollectionLikeType extends TypeBase {
    private static final long serialVersionUID = 4611641304150899138L;
    protected final JavaType _elementType;

    protected CollectionLikeType(Class<?> collT, JavaType elemT, Object valueHandler, Object typeHandler, boolean asStatic) {
        super(collT, elemT.hashCode(), valueHandler, typeHandler, asStatic);
        this._elementType = elemT;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    protected JavaType _narrow(Class<?> subclass) {
        return new CollectionLikeType(subclass, this._elementType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public JavaType narrowContentsBy(Class<?> contentClass) {
        if (contentClass == this._elementType.getRawClass()) {
            return this;
        }
        return new CollectionLikeType(this._class, this._elementType.narrowBy(contentClass), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public JavaType widenContentsBy(Class<?> contentClass) {
        if (contentClass == this._elementType.getRawClass()) {
            return this;
        }
        return new CollectionLikeType(this._class, this._elementType.widenBy(contentClass), this._valueHandler, this._typeHandler, this._asStatic);
    }

    public static CollectionLikeType construct(Class<?> rawType, JavaType elemT) {
        return new CollectionLikeType(rawType, elemT, null, null, false);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public CollectionLikeType withTypeHandler(Object h) {
        return new CollectionLikeType(this._class, this._elementType, this._valueHandler, h, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public CollectionLikeType withContentTypeHandler(Object h) {
        return new CollectionLikeType(this._class, this._elementType.withTypeHandler(h), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public CollectionLikeType withValueHandler(Object h) {
        return new CollectionLikeType(this._class, this._elementType, h, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public CollectionLikeType withContentValueHandler(Object h) {
        return new CollectionLikeType(this._class, this._elementType.withValueHandler(h), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public CollectionLikeType withStaticTyping() {
        if (this._asStatic) {
            return this;
        }
        return new CollectionLikeType(this._class, this._elementType.withStaticTyping(), this._valueHandler, this._typeHandler, true);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean isContainerType() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean isCollectionLikeType() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    /* renamed from: getContentType */
    public JavaType mo3getContentType() {
        return this._elementType;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public int containedTypeCount() {
        return 1;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    /* renamed from: containedType */
    public JavaType mo2containedType(int index) {
        if (index == 0) {
            return this._elementType;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public String containedTypeName(int index) {
        if (index == 0) {
            return "E";
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public Class<?> getParameterSource() {
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
        this._elementType.getGenericSignature(sb);
        sb.append(">;");
        return sb;
    }

    @Override // com.fasterxml.jackson.databind.type.TypeBase
    protected String buildCanonicalName() {
        StringBuilder sb = new StringBuilder();
        sb.append(this._class.getName());
        if (this._elementType != null) {
            sb.append('<');
            sb.append(this._elementType.toCanonical());
            sb.append('>');
        }
        return sb.toString();
    }

    public boolean isTrueCollectionType() {
        return Collection.class.isAssignableFrom(this._class);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o == null || o.getClass() != getClass()) {
            return false;
        }
        CollectionLikeType other = (CollectionLikeType) o;
        return this._class == other._class && this._elementType.equals(other._elementType);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public String toString() {
        return "[collection-like type; class " + this._class.getName() + ", contains " + this._elementType + "]";
    }
}
