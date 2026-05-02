package com.fasterxml.jackson.databind.type;

import com.fasterxml.jackson.databind.JavaType;
import java.util.Collection;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/type/CollectionType.class */
public final class CollectionType extends CollectionLikeType {
    private static final long serialVersionUID = 1;

    private CollectionType(Class<?> collT, JavaType elemT, Object valueHandler, Object typeHandler, boolean asStatic) {
        super(collT, elemT, valueHandler, typeHandler, asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.CollectionLikeType, com.fasterxml.jackson.databind.JavaType
    protected JavaType _narrow(Class<?> subclass) {
        return new CollectionType(subclass, this._elementType, null, null, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.CollectionLikeType, com.fasterxml.jackson.databind.JavaType
    public JavaType narrowContentsBy(Class<?> contentClass) {
        if (contentClass == this._elementType.getRawClass()) {
            return this;
        }
        return new CollectionType(this._class, this._elementType.narrowBy(contentClass), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.CollectionLikeType, com.fasterxml.jackson.databind.JavaType
    public JavaType widenContentsBy(Class<?> contentClass) {
        if (contentClass == this._elementType.getRawClass()) {
            return this;
        }
        return new CollectionType(this._class, this._elementType.widenBy(contentClass), this._valueHandler, this._typeHandler, this._asStatic);
    }

    public static CollectionType construct(Class<?> rawType, JavaType elemT) {
        return new CollectionType(rawType, elemT, null, null, false);
    }

    @Override // com.fasterxml.jackson.databind.type.CollectionLikeType, com.fasterxml.jackson.databind.JavaType
    public CollectionType withTypeHandler(Object h) {
        return new CollectionType(this._class, this._elementType, this._valueHandler, h, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.CollectionLikeType, com.fasterxml.jackson.databind.JavaType
    public CollectionType withContentTypeHandler(Object h) {
        return new CollectionType(this._class, this._elementType.withTypeHandler(h), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.CollectionLikeType, com.fasterxml.jackson.databind.JavaType
    public CollectionType withValueHandler(Object h) {
        return new CollectionType(this._class, this._elementType, h, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.CollectionLikeType, com.fasterxml.jackson.databind.JavaType
    public CollectionType withContentValueHandler(Object h) {
        return new CollectionType(this._class, this._elementType.withValueHandler(h), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.CollectionLikeType, com.fasterxml.jackson.databind.JavaType
    public CollectionType withStaticTyping() {
        if (this._asStatic) {
            return this;
        }
        return new CollectionType(this._class, this._elementType.withStaticTyping(), this._valueHandler, this._typeHandler, true);
    }

    @Override // com.fasterxml.jackson.databind.type.CollectionLikeType, com.fasterxml.jackson.databind.JavaType
    public Class<?> getParameterSource() {
        return Collection.class;
    }

    @Override // com.fasterxml.jackson.databind.type.CollectionLikeType, com.fasterxml.jackson.databind.JavaType
    public String toString() {
        return "[collection type; class " + this._class.getName() + ", contains " + this._elementType + "]";
    }
}
