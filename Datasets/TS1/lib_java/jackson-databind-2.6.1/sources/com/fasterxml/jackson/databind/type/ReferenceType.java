package com.fasterxml.jackson.databind.type;

import com.fasterxml.jackson.databind.JavaType;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/type/ReferenceType.class */
public class ReferenceType extends SimpleType {
    private static final long serialVersionUID = 1;
    protected final JavaType _referencedType;

    protected ReferenceType(Class<?> cls, JavaType refType, Object valueHandler, Object typeHandler, boolean asStatic) {
        super(cls, refType.hashCode(), valueHandler, typeHandler, asStatic);
        this._referencedType = refType;
    }

    public static ReferenceType construct(Class<?> cls, JavaType refType, Object valueHandler, Object typeHandler) {
        return new ReferenceType(cls, refType, null, null, false);
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    public ReferenceType withTypeHandler(Object h) {
        if (h == this._typeHandler) {
            return this;
        }
        return new ReferenceType(this._class, this._referencedType, this._valueHandler, h, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    public ReferenceType withContentTypeHandler(Object h) {
        if (h == this._referencedType.getTypeHandler()) {
            return this;
        }
        return new ReferenceType(this._class, this._referencedType.withTypeHandler(h), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    public ReferenceType withValueHandler(Object h) {
        if (h == this._valueHandler) {
            return this;
        }
        return new ReferenceType(this._class, this._referencedType, h, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    public ReferenceType withContentValueHandler(Object h) {
        if (h == this._referencedType.getValueHandler()) {
            return this;
        }
        return new ReferenceType(this._class, this._referencedType.withValueHandler(h), this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    public ReferenceType withStaticTyping() {
        if (this._asStatic) {
            return this;
        }
        return new ReferenceType(this._class, this._referencedType.withStaticTyping(), this._valueHandler, this._typeHandler, true);
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.type.TypeBase
    protected String buildCanonicalName() {
        return this._class.getName() + '<' + this._referencedType.toCanonical();
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    protected JavaType _narrow(Class<?> subclass) {
        return new ReferenceType(subclass, this._referencedType, this._valueHandler, this._typeHandler, this._asStatic);
    }

    @Override // com.fasterxml.jackson.databind.JavaType
    /* renamed from: getReferencedType */
    public JavaType mo3getReferencedType() {
        return this._referencedType;
    }

    public boolean isReferenceType() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    public int containedTypeCount() {
        return 1;
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    /* renamed from: containedType */
    public JavaType mo2containedType(int index) {
        if (index == 0) {
            return this._referencedType;
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    public String containedTypeName(int index) {
        if (index == 0) {
            return "T";
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    public Class<?> getParameterSource() {
        return this._class;
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.type.TypeBase, com.fasterxml.jackson.databind.JavaType
    public StringBuilder getErasedSignature(StringBuilder sb) {
        return _classSignature(this._class, sb, true);
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.type.TypeBase, com.fasterxml.jackson.databind.JavaType
    public StringBuilder getGenericSignature(StringBuilder sb) {
        _classSignature(this._class, sb, false);
        sb.append('<');
        StringBuilder sb2 = this._referencedType.getGenericSignature(sb);
        sb2.append(';');
        return sb2;
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    public String toString() {
        return new StringBuilder(40).append("[reference type, class ").append(buildCanonicalName()).append('<').append(this._referencedType).append('>').append(']').toString();
    }

    @Override // com.fasterxml.jackson.databind.type.SimpleType, com.fasterxml.jackson.databind.JavaType
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o == null || o.getClass() != getClass()) {
            return false;
        }
        ReferenceType other = (ReferenceType) o;
        if (other._class != this._class) {
            return false;
        }
        return this._referencedType.equals(other._referencedType);
    }
}
