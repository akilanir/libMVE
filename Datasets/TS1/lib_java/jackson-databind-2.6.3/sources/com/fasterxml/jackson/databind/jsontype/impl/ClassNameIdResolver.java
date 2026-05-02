package com.fasterxml.jackson.databind.jsontype.impl;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.DatabindContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.ClassUtil;
import java.util.EnumMap;
import java.util.EnumSet;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/jsontype/impl/ClassNameIdResolver.class */
public class ClassNameIdResolver extends TypeIdResolverBase {
    public ClassNameIdResolver(JavaType baseType, TypeFactory typeFactory) {
        super(baseType, typeFactory);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeIdResolver
    public JsonTypeInfo.Id getMechanism() {
        return JsonTypeInfo.Id.CLASS;
    }

    public void registerSubtype(Class<?> type, String name) {
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeIdResolver
    public String idFromValue(Object value) {
        return _idFrom(value, value.getClass());
    }

    @Override // com.fasterxml.jackson.databind.jsontype.TypeIdResolver
    public String idFromValueAndType(Object value, Class<?> type) {
        return _idFrom(value, type);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.TypeIdResolverBase, com.fasterxml.jackson.databind.jsontype.TypeIdResolver
    @Deprecated
    public JavaType typeFromId(String id) {
        return _typeFromId(id, this._typeFactory);
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.TypeIdResolverBase, com.fasterxml.jackson.databind.jsontype.TypeIdResolver
    public JavaType typeFromId(DatabindContext context, String id) {
        return _typeFromId(id, context.getTypeFactory());
    }

    protected JavaType _typeFromId(String id, TypeFactory typeFactory) {
        if (id.indexOf(60) > 0) {
            JavaType t = typeFactory.constructFromCanonical(id);
            return t;
        }
        try {
            Class<?> cls = typeFactory.findClass(id);
            return typeFactory.constructSpecializedType(this._baseType, cls);
        } catch (ClassNotFoundException e) {
            throw new IllegalArgumentException("Invalid type id '" + id + "' (for id type 'Id.class'): no such class found");
        } catch (Exception e2) {
            throw new IllegalArgumentException("Invalid type id '" + id + "' (for id type 'Id.class'): " + e2.getMessage(), e2);
        }
    }

    protected final String _idFrom(Object value, Class<?> cls) {
        if (Enum.class.isAssignableFrom(cls) && !cls.isEnum()) {
            cls = cls.getSuperclass();
        }
        String str = cls.getName();
        if (str.startsWith("java.util")) {
            if (value instanceof EnumSet) {
                Class<?> enumClass = ClassUtil.findEnumType((EnumSet<?>) value);
                str = TypeFactory.defaultInstance().constructCollectionType(EnumSet.class, enumClass).toCanonical();
            } else if (value instanceof EnumMap) {
                Class<?> enumClass2 = ClassUtil.findEnumType((EnumMap<?, ?>) value);
                str = TypeFactory.defaultInstance().constructMapType(EnumMap.class, enumClass2, Object.class).toCanonical();
            } else {
                String end = str.substring(9);
                if ((end.startsWith(".Arrays$") || end.startsWith(".Collections$")) && str.indexOf("List") >= 0) {
                    str = "java.util.ArrayList";
                }
            }
        } else if (str.indexOf(36) >= 0) {
            Class<?> outer = ClassUtil.getOuterClass(cls);
            if (outer != null) {
                Class<?> staticType = this._baseType.getRawClass();
                if (ClassUtil.getOuterClass(staticType) == null) {
                    str = this._baseType.getRawClass().getName();
                }
            }
        }
        return str;
    }

    @Override // com.fasterxml.jackson.databind.jsontype.impl.TypeIdResolverBase
    public String getDescForKnownTypeIds() {
        return "class name used as type id";
    }
}
