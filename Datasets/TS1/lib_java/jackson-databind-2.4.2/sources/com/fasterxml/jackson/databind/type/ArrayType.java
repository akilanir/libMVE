package com.fasterxml.jackson.databind.type;

import com.fasterxml.jackson.databind.JavaType;
import java.lang.reflect.Array;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/type/ArrayType.class */
public final class ArrayType extends TypeBase {
    private static final long serialVersionUID = 9040058063449087477L;
    protected final JavaType _componentType;
    protected final Object _emptyArray;

    private ArrayType(JavaType componentType, Object emptyInstance, Object valueHandler, Object typeHandler, boolean asStatic) {
        super(emptyInstance.getClass(), componentType.hashCode(), valueHandler, typeHandler, asStatic);
        this._componentType = componentType;
        this._emptyArray = emptyInstance;
    }

    public static ArrayType construct(JavaType componentType, Object valueHandler, Object typeHandler) {
        Object emptyInstance = Array.newInstance(componentType.getRawClass(), 0);
        return new ArrayType(componentType, emptyInstance, null, null, false);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public ArrayType withTypeHandler(Object h) {
        if (h == this._typeHandler) {
            return this;
        }
        return new ArrayType(this._componentType, this._emptyArray, this._valueHandler, h, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public ArrayType withContentTypeHandler(Object h) {
        if (h == this._componentType.getTypeHandler()) {
            return this;
        }
        return new ArrayType(this._componentType.withTypeHandler(h), this._emptyArray, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public ArrayType withValueHandler(Object h) {
        if (h == this._valueHandler) {
            return this;
        }
        return new ArrayType(this._componentType, this._emptyArray, h, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public ArrayType withContentValueHandler(Object h) {
        if (h == this._componentType.getValueHandler()) {
            return this;
        }
        return new ArrayType(this._componentType.withValueHandler(h), this._emptyArray, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public ArrayType withStaticTyping() {
        if (this._asStatic) {
            return this;
        }
        return new ArrayType(this._componentType.withStaticTyping(), this._emptyArray, this._valueHandler, this._typeHandler, true);
    }

    @Override // com.fasterxml.jackson.databind.type.TypeBase
    protected String buildCanonicalName() {
        return this._class.getName();
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    protected JavaType _narrow(Class<?> subclass) {
        if (!subclass.isArray()) {
            throw new IllegalArgumentException("Incompatible narrowing operation: trying to narrow " + toString() + " to class " + subclass.getName());
        }
        Class<?> newCompClass = subclass.getComponentType();
        JavaType newCompType = TypeFactory.defaultInstance().constructType(newCompClass);
        return construct(newCompType, this._valueHandler, this._typeHandler);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public JavaType narrowContentsBy(Class<?> contentClass) {
        if (contentClass == this._componentType.getRawClass()) {
            return this;
        }
        return construct(this._componentType.narrowBy(contentClass), this._valueHandler, this._typeHandler);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public JavaType widenContentsBy(Class<?> contentClass) {
        if (contentClass == this._componentType.getRawClass()) {
            return this;
        }
        return construct(this._componentType.widenBy(contentClass), this._valueHandler, this._typeHandler);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean isArrayType() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean isAbstract() {
        return false;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean isConcrete() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean hasGenericTypes() {
        return this._componentType.hasGenericTypes();
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public String containedTypeName(int index) {
        if (index == 0) {
            return "E";
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean isContainerType() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    /* renamed from: getContentType */
    public JavaType mo3getContentType() {
        return this._componentType;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public int containedTypeCount() {
        return 1;
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    /* renamed from: containedType */
    public JavaType mo2containedType(int index) {
        if (index == 0) {
            return this._componentType;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.type.TypeBase, com.fasterxml.jackson.databind.JavaType
    public StringBuilder getGenericSignature(StringBuilder sb) {
        sb.append('[');
        return this._componentType.getGenericSignature(sb);
    }

    @Override // com.fasterxml.jackson.databind.type.TypeBase, com.fasterxml.jackson.databind.JavaType
    public StringBuilder getErasedSignature(StringBuilder sb) {
        sb.append('[');
        return this._componentType.getErasedSignature(sb);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public String toString() {
        return "[array type, component type: " + this._componentType + "]";
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o == null || o.getClass() != getClass()) {
            return false;
        }
        ArrayType other = (ArrayType) o;
        return this._componentType.equals(other._componentType);
    }
}
