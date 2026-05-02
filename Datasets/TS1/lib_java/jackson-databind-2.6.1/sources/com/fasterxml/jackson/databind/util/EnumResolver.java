package com.fasterxml.jackson.databind.util;

import com.fasterxml.jackson.databind.AnnotationIntrospector;
import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/util/EnumResolver.class */
public class EnumResolver implements Serializable {
    private static final long serialVersionUID = 1;
    protected final Class<Enum<?>> _enumClass;
    protected final Enum<?>[] _enums;
    protected final HashMap<String, Enum<?>> _enumsById;

    protected EnumResolver(Class<Enum<?>> enumClass, Enum<?>[] enums, HashMap<String, Enum<?>> map) {
        this._enumClass = enumClass;
        this._enums = enums;
        this._enumsById = map;
    }

    public static EnumResolver constructFor(Class<Enum<?>> enumCls, AnnotationIntrospector ai) {
        Enum<?>[] enumValues = enumCls.getEnumConstants();
        if (enumValues == null) {
            throw new IllegalArgumentException("No enum constants for class " + enumCls.getName());
        }
        HashMap<String, Enum<?>> map = new HashMap<>();
        for (Enum<?> e : enumValues) {
            map.put(ai.findEnumValue(e), e);
        }
        return new EnumResolver(enumCls, enumValues, map);
    }

    public static EnumResolver constructUsingToString(Class<Enum<?>> enumCls) {
        Enum<?>[] enumValues = enumCls.getEnumConstants();
        HashMap<String, Enum<?>> map = new HashMap<>();
        int i = enumValues.length;
        while (true) {
            i--;
            if (i >= 0) {
                Enum<?> e = enumValues[i];
                map.put(e.toString(), e);
            } else {
                return new EnumResolver(enumCls, enumValues, map);
            }
        }
    }

    public static EnumResolver constructUsingMethod(Class<Enum<?>> enumCls, Method accessor) {
        Enum<?>[] enumValues = enumCls.getEnumConstants();
        HashMap<String, Enum<?>> map = new HashMap<>();
        int i = enumValues.length;
        while (true) {
            i--;
            if (i >= 0) {
                Enum<?> en = enumValues[i];
                try {
                    Object o = accessor.invoke(en, new Object[0]);
                    if (o != null) {
                        map.put(o.toString(), en);
                    }
                } catch (Exception e) {
                    throw new IllegalArgumentException("Failed to access @JsonValue of Enum value " + en + ": " + e.getMessage());
                }
            } else {
                return new EnumResolver(enumCls, enumValues, map);
            }
        }
    }

    public static EnumResolver constructUnsafe(Class<?> rawEnumCls, AnnotationIntrospector ai) {
        return constructFor(rawEnumCls, ai);
    }

    public static EnumResolver constructUnsafeUsingToString(Class<?> rawEnumCls) {
        return constructUsingToString(rawEnumCls);
    }

    public static EnumResolver constructUnsafeUsingMethod(Class<?> rawEnumCls, Method accessor) {
        return constructUsingMethod(rawEnumCls, accessor);
    }

    public CompactStringObjectMap constructLookup() {
        return CompactStringObjectMap.construct(this._enumsById);
    }

    public Enum<?> findEnum(String key) {
        return this._enumsById.get(key);
    }

    public Enum<?> getEnum(int index) {
        if (index < 0 || index >= this._enums.length) {
            return null;
        }
        return this._enums[index];
    }

    public Enum<?>[] getRawEnums() {
        return this._enums;
    }

    public List<Enum<?>> getEnums() {
        ArrayList<Enum<?>> enums = new ArrayList<>(this._enums.length);
        Enum<?>[] arr$ = this._enums;
        for (Enum<?> e : arr$) {
            enums.add(e);
        }
        return enums;
    }

    public Class<Enum<?>> getEnumClass() {
        return this._enumClass;
    }

    public int lastValidIndex() {
        return this._enums.length - 1;
    }
}
