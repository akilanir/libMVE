package com.alibaba.fastjson.util;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.annotation.JSONCreator;
import com.alibaba.fastjson.annotation.JSONType;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.List;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/util/JavaBeanInfo.class */
public class JavaBeanInfo {
    public final Class<?> clazz;
    public final Class<?> builderClass;
    public final Constructor<?> defaultConstructor;
    public final Constructor<?> creatorConstructor;
    public final Method factoryMethod;
    public final Method buildMethod;
    public final int defaultConstructorParameterSize;
    public final FieldInfo[] fields;
    public final FieldInfo[] sortedFields;
    public final int parserFeatures;
    public final JSONType jsonType;
    public final String typeName;

    public JavaBeanInfo(Class<?> clazz, Class<?> builderClass, Constructor<?> defaultConstructor, Constructor<?> creatorConstructor, Method factoryMethod, Method buildMethod, JSONType jsonType, List<FieldInfo> fieldList) {
        this.clazz = clazz;
        this.builderClass = builderClass;
        this.defaultConstructor = defaultConstructor;
        this.creatorConstructor = creatorConstructor;
        this.factoryMethod = factoryMethod;
        this.parserFeatures = TypeUtils.getParserFeatures(clazz);
        this.buildMethod = buildMethod;
        this.jsonType = jsonType;
        if (jsonType != null) {
            String typeName = jsonType.typeName();
            if (typeName.length() != 0) {
                this.typeName = typeName;
            } else {
                this.typeName = clazz.getName();
            }
        } else {
            this.typeName = clazz.getName();
        }
        this.fields = new FieldInfo[fieldList.size()];
        fieldList.toArray(this.fields);
        FieldInfo[] sortedFields = new FieldInfo[this.fields.length];
        System.arraycopy(this.fields, 0, sortedFields, 0, this.fields.length);
        Arrays.sort(sortedFields);
        this.sortedFields = Arrays.equals(this.fields, sortedFields) ? this.fields : sortedFields;
        this.defaultConstructorParameterSize = defaultConstructor != null ? defaultConstructor.getParameterTypes().length : 0;
    }

    private static FieldInfo getField(List<FieldInfo> fieldList, String propertyName) {
        for (FieldInfo item : fieldList) {
            if (item.name.equals(propertyName)) {
                return item;
            }
        }
        return null;
    }

    static boolean add(List<FieldInfo> fieldList, FieldInfo field) {
        for (int i = fieldList.size() - 1; i >= 0; i--) {
            FieldInfo item = fieldList.get(i);
            if (item.name.equals(field.name) && (!item.getOnly || field.getOnly)) {
                if (item.fieldClass.isAssignableFrom(field.fieldClass)) {
                    fieldList.remove(i);
                } else {
                    int result = item.compareTo(field);
                    if (result < 0) {
                        fieldList.remove(i);
                    } else {
                        return false;
                    }
                }
                fieldList.add(field);
                return true;
            }
        }
        fieldList.add(field);
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:153:0x050a A[PHI: r28 r29
      0x050a: PHI (r28v5 'ordinal' int) = (r28v4 'ordinal' int), (r28v8 'ordinal' int) binds: [B:146:0x04b0, B:151:0x04df] A[DONT_GENERATE, DONT_INLINE]
      0x050a: PHI (r29v8 'serialzeFeatures' int) = (r29v7 'serialzeFeatures' int), (r29v11 'serialzeFeatures' int) binds: [B:146:0x04b0, B:151:0x04df] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:187:0x0659 A[PHI: r28 r29 r36
      0x0659: PHI (r28v6 'ordinal' int) = (r28v5 'ordinal' int), (r28v5 'ordinal' int), (r28v7 'ordinal' int) binds: [B:181:0x05f9, B:183:0x060a, B:185:0x062c] A[DONT_GENERATE, DONT_INLINE]
      0x0659: PHI (r29v9 'serialzeFeatures' int) = (r29v8 'serialzeFeatures' int), (r29v8 'serialzeFeatures' int), (r29v10 'serialzeFeatures' int) binds: [B:181:0x05f9, B:183:0x060a, B:185:0x062c] A[DONT_GENERATE, DONT_INLINE]
      0x0659: PHI (r36v1 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField) = 
      (r36v0 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
      (r36v2 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
      (r36v2 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
     binds: [B:181:0x05f9, B:183:0x060a, B:185:0x062c] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x032e A[PHI: r30 r31
      0x032e: PHI (r30v7 'ordinal' int) = (r30v6 'ordinal' int), (r30v8 'ordinal' int) binds: [B:82:0x02d4, B:87:0x0303] A[DONT_GENERATE, DONT_INLINE]
      0x032e: PHI (r31v6 'serialzeFeatures' int) = (r31v5 'serialzeFeatures' int), (r31v7 'serialzeFeatures' int) binds: [B:82:0x02d4, B:87:0x0303] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.alibaba.fastjson.util.JavaBeanInfo build(java.lang.Class<?> r14, java.lang.reflect.Type r15) {
        /*
            Method dump skipped, instructions count: 2171
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.alibaba.fastjson.util.JavaBeanInfo.build(java.lang.Class, java.lang.reflect.Type):com.alibaba.fastjson.util.JavaBeanInfo");
    }

    static Constructor<?> getDefaultConstructor(Class<?> clazz) {
        if (Modifier.isAbstract(clazz.getModifiers())) {
            return null;
        }
        Constructor<?> defaultConstructor = null;
        Constructor<?>[] constructors = clazz.getDeclaredConstructors();
        int length = constructors.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            Constructor<?> constructor = constructors[i];
            if (constructor.getParameterTypes().length != 0) {
                i++;
            } else {
                defaultConstructor = constructor;
                break;
            }
        }
        if (defaultConstructor == null && clazz.isMemberClass() && !Modifier.isStatic(clazz.getModifiers())) {
            int length2 = constructors.length;
            int i2 = 0;
            while (true) {
                if (i2 >= length2) {
                    break;
                }
                Constructor<?> constructor2 = constructors[i2];
                Class<?>[] types = constructor2.getParameterTypes();
                if (types.length != 1 || !types[0].equals(clazz.getDeclaringClass())) {
                    i2++;
                } else {
                    defaultConstructor = constructor2;
                    break;
                }
            }
        }
        return defaultConstructor;
    }

    public static Constructor<?> getCreatorConstructor(Class<?> clazz) {
        Constructor<?> creatorConstructor = null;
        for (Constructor<?> constructor : clazz.getDeclaredConstructors()) {
            JSONCreator annotation = (JSONCreator) constructor.getAnnotation(JSONCreator.class);
            if (annotation != null) {
                if (creatorConstructor != null) {
                    throw new JSONException("multi-JSONCreator");
                }
                creatorConstructor = constructor;
            }
        }
        return creatorConstructor;
    }

    private static Method getFactoryMethod(Class<?> clazz, Method[] methods) {
        Method factoryMethod = null;
        for (Method method : methods) {
            if (Modifier.isStatic(method.getModifiers()) && clazz.isAssignableFrom(method.getReturnType())) {
                JSONCreator annotation = (JSONCreator) method.getAnnotation(JSONCreator.class);
                if (annotation == null) {
                    continue;
                } else {
                    if (factoryMethod != null) {
                        throw new JSONException("multi-JSONCreator");
                    }
                    factoryMethod = method;
                }
            }
        }
        return factoryMethod;
    }

    public static Class<?> getBuilderClass(JSONType type) {
        Class<?> builderClass;
        if (type == null || (builderClass = type.builder()) == Void.class) {
            return null;
        }
        return builderClass;
    }
}
