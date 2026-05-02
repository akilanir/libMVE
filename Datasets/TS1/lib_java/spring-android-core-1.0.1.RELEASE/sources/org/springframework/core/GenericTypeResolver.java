package org.springframework.core;

import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;
import org.springframework.util.Assert;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/GenericTypeResolver.class */
public abstract class GenericTypeResolver {
    private static final Map<Class<?>, Reference<Map<TypeVariable<?>, Type>>> typeVariableCache = Collections.synchronizedMap(new WeakHashMap());

    public static Type getTargetType(MethodParameter methodParam) {
        Assert.notNull(methodParam, "MethodParameter must not be null");
        if (methodParam.getConstructor() != null) {
            return methodParam.getConstructor().getGenericParameterTypes()[methodParam.getParameterIndex()];
        }
        if (methodParam.getParameterIndex() >= 0) {
            return methodParam.getMethod().getGenericParameterTypes()[methodParam.getParameterIndex()];
        }
        return methodParam.getMethod().getGenericReturnType();
    }

    public static Class<?> resolveParameterType(MethodParameter methodParam, Class<?> clazz) {
        Type genericType = getTargetType(methodParam);
        Assert.notNull(clazz, "Class must not be null");
        Map<TypeVariable<?>, Type> typeVariableMap = getTypeVariableMap(clazz);
        Type rawType = getRawType(genericType, typeVariableMap);
        Class<?> result = rawType instanceof Class ? (Class) rawType : methodParam.getParameterType();
        methodParam.setParameterType(result);
        methodParam.typeVariableMap = typeVariableMap;
        return result;
    }

    public static Class<?> resolveReturnType(Method method, Class<?> clazz) {
        Assert.notNull(method, "Method must not be null");
        Type genericType = method.getGenericReturnType();
        Assert.notNull(clazz, "Class must not be null");
        Map<TypeVariable<?>, Type> typeVariableMap = getTypeVariableMap(clazz);
        Type rawType = getRawType(genericType, typeVariableMap);
        return rawType instanceof Class ? (Class) rawType : method.getReturnType();
    }

    public static Class<?> resolveReturnTypeArgument(Method method, Class<?> genericIfc) {
        Assert.notNull(method, "method must not be null");
        Type returnType = method.getReturnType();
        Type genericReturnType = method.getGenericReturnType();
        if (returnType.equals(genericIfc)) {
            if (genericReturnType instanceof ParameterizedType) {
                ParameterizedType targetType = (ParameterizedType) genericReturnType;
                Type[] actualTypeArguments = targetType.getActualTypeArguments();
                Type typeArg = actualTypeArguments[0];
                if (!(typeArg instanceof WildcardType)) {
                    return (Class) typeArg;
                }
            } else {
                return null;
            }
        }
        return resolveTypeArgument((Class) returnType, genericIfc);
    }

    public static Class<?> resolveTypeArgument(Class<?> clazz, Class<?> genericIfc) {
        Class<?>[] typeArgs = resolveTypeArguments(clazz, genericIfc);
        if (typeArgs == null) {
            return null;
        }
        if (typeArgs.length != 1) {
            throw new IllegalArgumentException("Expected 1 type argument on generic interface [" + genericIfc.getName() + "] but found " + typeArgs.length);
        }
        return typeArgs[0];
    }

    public static Class<?>[] resolveTypeArguments(Class<?> clazz, Class<?> genericIfc) {
        return doResolveTypeArguments(clazz, clazz, genericIfc);
    }

    private static Class<?>[] doResolveTypeArguments(Class<?> ownerClass, Class<?> classToIntrospect, Class<?> genericIfc) {
        while (classToIntrospect != null) {
            if (genericIfc.isInterface()) {
                Type[] ifcs = classToIntrospect.getGenericInterfaces();
                for (Type ifc : ifcs) {
                    Class<?>[] result = doResolveTypeArguments(ownerClass, ifc, genericIfc);
                    if (result != null) {
                        return result;
                    }
                }
            } else {
                Class<?>[] result2 = doResolveTypeArguments(ownerClass, classToIntrospect.getGenericSuperclass(), genericIfc);
                if (result2 != null) {
                    return result2;
                }
            }
            classToIntrospect = classToIntrospect.getSuperclass();
        }
        return null;
    }

    private static Class<?>[] doResolveTypeArguments(Class<?> ownerClass, Type ifc, Class<?> genericIfc) {
        if (ifc instanceof ParameterizedType) {
            ParameterizedType paramIfc = (ParameterizedType) ifc;
            Type rawType = paramIfc.getRawType();
            if (genericIfc.equals(rawType)) {
                Type[] typeArgs = paramIfc.getActualTypeArguments();
                Class<?>[] result = new Class[typeArgs.length];
                for (int i = 0; i < typeArgs.length; i++) {
                    Type arg = typeArgs[i];
                    result[i] = extractClass(ownerClass, arg);
                }
                return result;
            }
            if (genericIfc.isAssignableFrom((Class) rawType)) {
                return doResolveTypeArguments(ownerClass, (Class<?>) rawType, genericIfc);
            }
            return null;
        }
        if (ifc != null && genericIfc.isAssignableFrom((Class) ifc)) {
            return doResolveTypeArguments(ownerClass, (Class<?>) ifc, genericIfc);
        }
        return null;
    }

    private static Class<?> extractClass(Class<?> ownerClass, Type arg) {
        if (arg instanceof ParameterizedType) {
            return extractClass(ownerClass, ((ParameterizedType) arg).getRawType());
        }
        if (arg instanceof GenericArrayType) {
            GenericArrayType gat = (GenericArrayType) arg;
            Type gt = gat.getGenericComponentType();
            Class<?> componentClass = extractClass(ownerClass, gt);
            return Array.newInstance(componentClass, 0).getClass();
        }
        if (arg instanceof TypeVariable) {
            TypeVariable<?> tv = (TypeVariable) arg;
            Type arg2 = getTypeVariableMap(ownerClass).get(tv);
            if (arg2 == null) {
                arg = extractBoundForTypeVariable(tv);
            } else {
                arg = extractClass(ownerClass, arg2);
            }
        }
        return arg instanceof Class ? (Class) arg : Object.class;
    }

    public static Class<?> resolveType(Type genericType, Map<TypeVariable<?>, Type> typeVariableMap) {
        Type rawType = getRawType(genericType, typeVariableMap);
        return rawType instanceof Class ? (Class) rawType : Object.class;
    }

    static Type getRawType(Type genericType, Map<TypeVariable<?>, Type> typeVariableMap) {
        Type resolvedType = genericType;
        if (genericType instanceof TypeVariable) {
            TypeVariable<?> tv = (TypeVariable) genericType;
            resolvedType = typeVariableMap.get(tv);
            if (resolvedType == null) {
                resolvedType = extractBoundForTypeVariable(tv);
            }
        }
        if (resolvedType instanceof ParameterizedType) {
            return ((ParameterizedType) resolvedType).getRawType();
        }
        return resolvedType;
    }

    public static Map<TypeVariable<?>, Type> getTypeVariableMap(Class<?> clazz) {
        Reference<Map<TypeVariable<?>, Type>> ref = typeVariableCache.get(clazz);
        Map<TypeVariable<?>, Type> typeVariableMap = ref != null ? ref.get() : null;
        if (typeVariableMap == null) {
            typeVariableMap = new HashMap();
            extractTypeVariablesFromGenericInterfaces(clazz.getGenericInterfaces(), typeVariableMap);
            Type genericType = clazz.getGenericSuperclass();
            Class<?> superclass = clazz.getSuperclass();
            while (true) {
                Class<?> type = superclass;
                if (type == null || Object.class.equals(type)) {
                    break;
                }
                if (genericType instanceof ParameterizedType) {
                    ParameterizedType pt = (ParameterizedType) genericType;
                    populateTypeMapFromParameterizedType(pt, typeVariableMap);
                }
                extractTypeVariablesFromGenericInterfaces(type.getGenericInterfaces(), typeVariableMap);
                genericType = type.getGenericSuperclass();
                superclass = type.getSuperclass();
            }
            Class<?> cls = clazz;
            while (true) {
                Class<?> type2 = cls;
                if (!type2.isMemberClass()) {
                    break;
                }
                Type genericType2 = type2.getGenericSuperclass();
                if (genericType2 instanceof ParameterizedType) {
                    ParameterizedType pt2 = (ParameterizedType) genericType2;
                    populateTypeMapFromParameterizedType(pt2, typeVariableMap);
                }
                cls = type2.getEnclosingClass();
            }
            typeVariableCache.put(clazz, new WeakReference(typeVariableMap));
        }
        return typeVariableMap;
    }

    static Type extractBoundForTypeVariable(TypeVariable<?> typeVariable) {
        Type[] bounds = typeVariable.getBounds();
        if (bounds.length == 0) {
            return Object.class;
        }
        Type bound = bounds[0];
        if (bound instanceof TypeVariable) {
            bound = extractBoundForTypeVariable((TypeVariable) bound);
        }
        return bound;
    }

    private static void extractTypeVariablesFromGenericInterfaces(Type[] genericInterfaces, Map<TypeVariable<?>, Type> typeVariableMap) {
        for (Type genericInterface : genericInterfaces) {
            if (genericInterface instanceof ParameterizedType) {
                ParameterizedType pt = (ParameterizedType) genericInterface;
                populateTypeMapFromParameterizedType(pt, typeVariableMap);
                if (pt.getRawType() instanceof Class) {
                    extractTypeVariablesFromGenericInterfaces(((Class) pt.getRawType()).getGenericInterfaces(), typeVariableMap);
                }
            } else if (genericInterface instanceof Class) {
                extractTypeVariablesFromGenericInterfaces(((Class) genericInterface).getGenericInterfaces(), typeVariableMap);
            }
        }
    }

    private static void populateTypeMapFromParameterizedType(ParameterizedType type, Map<TypeVariable<?>, Type> typeVariableMap) {
        if (type.getRawType() instanceof Class) {
            Type[] actualTypeArguments = type.getActualTypeArguments();
            TypeVariable<?>[] typeVariables = ((Class) type.getRawType()).getTypeParameters();
            for (int i = 0; i < actualTypeArguments.length; i++) {
                Type actualTypeArgument = actualTypeArguments[i];
                TypeVariable<?> variable = typeVariables[i];
                if (actualTypeArgument instanceof Class) {
                    typeVariableMap.put(variable, actualTypeArgument);
                } else if (actualTypeArgument instanceof GenericArrayType) {
                    typeVariableMap.put(variable, actualTypeArgument);
                } else if (actualTypeArgument instanceof ParameterizedType) {
                    typeVariableMap.put(variable, actualTypeArgument);
                } else if (actualTypeArgument instanceof TypeVariable) {
                    TypeVariable<?> typeVariableArgument = (TypeVariable) actualTypeArgument;
                    Type resolvedType = typeVariableMap.get(typeVariableArgument);
                    if (resolvedType == null) {
                        resolvedType = extractBoundForTypeVariable(typeVariableArgument);
                    }
                    typeVariableMap.put(variable, resolvedType);
                }
            }
        }
    }
}
