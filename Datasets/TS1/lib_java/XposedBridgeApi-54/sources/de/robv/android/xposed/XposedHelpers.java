package de.robv.android.xposed;

import android.content.res.Resources;
import de.robv.android.xposed.XC_MethodHook;
import external.org.apache.commons.lang3.ClassUtils;
import external.org.apache.commons.lang3.reflect.MemberUtils;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.WeakHashMap;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/XposedHelpers.class */
public class XposedHelpers {
    private static final HashMap<String, Field> fieldCache = new HashMap<>();
    private static final HashMap<String, Method> methodCache = new HashMap<>();
    private static final HashMap<String, Constructor<?>> constructorCache = new HashMap<>();
    private static final WeakHashMap<Object, HashMap<String, Object>> additionalFields = new WeakHashMap<>();

    public static Class<?> findClass(String className, ClassLoader classLoader) {
        if (classLoader == null) {
            classLoader = XposedBridge.BOOTCLASSLOADER;
        }
        try {
            return ClassUtils.getClass(classLoader, className, false);
        } catch (ClassNotFoundException e) {
            throw new ClassNotFoundError(e);
        }
    }

    public static Field findField(Class<?> clazz, String fieldName) {
        String fullFieldName = clazz.getName() + '#' + fieldName;
        if (fieldCache.containsKey(fullFieldName)) {
            Field field = fieldCache.get(fullFieldName);
            if (field == null) {
                throw new NoSuchFieldError(fullFieldName);
            }
            return field;
        }
        try {
            Field field2 = findFieldRecursiveImpl(clazz, fieldName);
            field2.setAccessible(true);
            fieldCache.put(fullFieldName, field2);
            return field2;
        } catch (NoSuchFieldException e) {
            fieldCache.put(fullFieldName, null);
            throw new NoSuchFieldError(fullFieldName);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0027, code lost:
    
        throw r5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.lang.reflect.Field findFieldRecursiveImpl(java.lang.Class<?> r3, java.lang.String r4) throws java.lang.NoSuchFieldException {
        /*
            r0 = r3
            r1 = r4
            java.lang.reflect.Field r0 = r0.getDeclaredField(r1)     // Catch: java.lang.NoSuchFieldException -> L6
            return r0
        L6:
            r5 = move-exception
        L7:
            r0 = r3
            java.lang.Class r0 = r0.getSuperclass()
            r3 = r0
            r0 = r3
            if (r0 == 0) goto L26
            r0 = r3
            java.lang.Class<java.lang.Object> r1 = java.lang.Object.class
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L1c
            goto L26
        L1c:
            r0 = r3
            r1 = r4
            java.lang.reflect.Field r0 = r0.getDeclaredField(r1)     // Catch: java.lang.NoSuchFieldException -> L22
            return r0
        L22:
            r6 = move-exception
            goto L7
        L26:
            r0 = r5
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: de.robv.android.xposed.XposedHelpers.findFieldRecursiveImpl(java.lang.Class, java.lang.String):java.lang.reflect.Field");
    }

    public static Field findFirstFieldByExactType(Class<?> clazz, Class<?> type) {
        Class<? super Object> superclass;
        Class<?> clz = clazz;
        do {
            for (Field field : clz.getDeclaredFields()) {
                if (field.getType() == type) {
                    field.setAccessible(true);
                    return field;
                }
            }
            superclass = clz.getSuperclass();
            clz = superclass;
        } while (superclass != null);
        throw new NoSuchFieldError("Field of type " + type.getName() + " in class " + clazz.getName());
    }

    public static XC_MethodHook.Unhook findAndHookMethod(Class<?> clazz, String methodName, Object... parameterTypesAndCallback) {
        if (parameterTypesAndCallback.length == 0 || !(parameterTypesAndCallback[parameterTypesAndCallback.length - 1] instanceof XC_MethodHook)) {
            throw new IllegalArgumentException("no callback defined");
        }
        XC_MethodHook callback = (XC_MethodHook) parameterTypesAndCallback[parameterTypesAndCallback.length - 1];
        Method m = findMethodExact(clazz, methodName, getParameterClasses(clazz.getClassLoader(), parameterTypesAndCallback));
        return XposedBridge.hookMethod(m, callback);
    }

    public static XC_MethodHook.Unhook findAndHookMethod(String className, ClassLoader classLoader, String methodName, Object... parameterTypesAndCallback) {
        return findAndHookMethod(findClass(className, classLoader), methodName, parameterTypesAndCallback);
    }

    public static Method findMethodExact(Class<?> clazz, String methodName, Object... parameterTypes) {
        return findMethodExact(clazz, methodName, getParameterClasses(clazz.getClassLoader(), parameterTypes));
    }

    public static Method findMethodExact(String className, ClassLoader classLoader, String methodName, Object... parameterTypes) {
        return findMethodExact(findClass(className, classLoader), methodName, getParameterClasses(classLoader, parameterTypes));
    }

    public static Method findMethodExact(Class<?> clazz, String methodName, Class<?>... clsArr) {
        String fullMethodName = clazz.getName() + '#' + methodName + getParametersString(clsArr) + "#exact";
        if (methodCache.containsKey(fullMethodName)) {
            Method method = methodCache.get(fullMethodName);
            if (method == null) {
                throw new NoSuchMethodError(fullMethodName);
            }
            return method;
        }
        try {
            Method method2 = clazz.getDeclaredMethod(methodName, clsArr);
            method2.setAccessible(true);
            methodCache.put(fullMethodName, method2);
            return method2;
        } catch (NoSuchMethodException e) {
            methodCache.put(fullMethodName, null);
            throw new NoSuchMethodError(fullMethodName);
        }
    }

    public static Method[] findMethodsByExactParameters(Class<?> clazz, Class<?> returnType, Class<?>... clsArr) {
        List<Method> result = new LinkedList<>();
        for (Method method : clazz.getDeclaredMethods()) {
            if (returnType == null || returnType == method.getReturnType()) {
                Class[] methodParameterTypes = method.getParameterTypes();
                if (clsArr.length == methodParameterTypes.length) {
                    boolean match = true;
                    int i = 0;
                    while (true) {
                        if (i >= clsArr.length) {
                            break;
                        }
                        if (clsArr[i] == methodParameterTypes[i]) {
                            i++;
                        } else {
                            match = false;
                            break;
                        }
                    }
                    if (match) {
                        method.setAccessible(true);
                        result.add(method);
                    }
                }
            }
        }
        return (Method[]) result.toArray(new Method[result.size()]);
    }

    public static Method findMethodBestMatch(Class<?> clazz, String methodName, Class<?>... clsArr) {
        Class<? super Object> superclass;
        String fullMethodName = clazz.getName() + '#' + methodName + getParametersString(clsArr) + "#bestmatch";
        if (methodCache.containsKey(fullMethodName)) {
            Method method = methodCache.get(fullMethodName);
            if (method == null) {
                throw new NoSuchMethodError(fullMethodName);
            }
            return method;
        }
        try {
            Method method2 = findMethodExact(clazz, methodName, clsArr);
            methodCache.put(fullMethodName, method2);
            return method2;
        } catch (NoSuchMethodError e) {
            Method bestMatch = null;
            Class<?> clz = clazz;
            boolean considerPrivateMethods = true;
            do {
                for (Method method3 : clz.getDeclaredMethods()) {
                    if ((considerPrivateMethods || !Modifier.isPrivate(method3.getModifiers())) && method3.getName().equals(methodName) && ClassUtils.isAssignable(clsArr, method3.getParameterTypes(), true) && (bestMatch == null || MemberUtils.compareParameterTypes(method3.getParameterTypes(), bestMatch.getParameterTypes(), clsArr) < 0)) {
                        bestMatch = method3;
                    }
                }
                considerPrivateMethods = false;
                superclass = clz.getSuperclass();
                clz = superclass;
            } while (superclass != null);
            if (bestMatch != null) {
                bestMatch.setAccessible(true);
                methodCache.put(fullMethodName, bestMatch);
                return bestMatch;
            }
            NoSuchMethodError e2 = new NoSuchMethodError(fullMethodName);
            methodCache.put(fullMethodName, null);
            throw e2;
        }
    }

    public static Method findMethodBestMatch(Class<?> clazz, String methodName, Object... args) {
        return findMethodBestMatch(clazz, methodName, getParameterTypes(args));
    }

    public static Method findMethodBestMatch(Class<?> clazz, String methodName, Class<?>[] clsArr, Object[] args) {
        Class[] argsClasses = null;
        for (int i = 0; i < clsArr.length; i++) {
            if (clsArr[i] == null) {
                if (argsClasses == null) {
                    argsClasses = getParameterTypes(args);
                }
                clsArr[i] = argsClasses[i];
            }
        }
        return findMethodBestMatch(clazz, methodName, clsArr);
    }

    public static Class<?>[] getParameterTypes(Object... args) {
        Class[] clazzes = new Class[args.length];
        for (int i = 0; i < args.length; i++) {
            clazzes[i] = args[i] != null ? args[i].getClass() : null;
        }
        return clazzes;
    }

    private static Class<?>[] getParameterClasses(ClassLoader classLoader, Object[] parameterTypesAndCallback) {
        Class[] parameterClasses = null;
        for (int i = parameterTypesAndCallback.length - 1; i >= 0; i--) {
            Object type = parameterTypesAndCallback[i];
            if (type == null) {
                throw new ClassNotFoundError("parameter type must not be null", null);
            }
            if (!(type instanceof XC_MethodHook)) {
                if (parameterClasses == null) {
                    parameterClasses = new Class[i + 1];
                }
                if (type instanceof Class) {
                    parameterClasses[i] = (Class) type;
                } else if (type instanceof String) {
                    parameterClasses[i] = findClass((String) type, classLoader);
                } else {
                    throw new ClassNotFoundError("parameter type must either be specified as Class or String", null);
                }
            }
        }
        if (parameterClasses == null) {
            parameterClasses = new Class[0];
        }
        return parameterClasses;
    }

    public static Class<?>[] getClassesAsArray(Class<?>... clsArr) {
        return clsArr;
    }

    private static String getParametersString(Class<?>... clsArr) {
        StringBuilder sb = new StringBuilder("(");
        boolean first = true;
        for (Class<?> clazz : clsArr) {
            if (first) {
                first = false;
            } else {
                sb.append(",");
            }
            if (clazz != null) {
                sb.append(clazz.getCanonicalName());
            } else {
                sb.append("null");
            }
        }
        sb.append(")");
        return sb.toString();
    }

    public static Constructor<?> findConstructorExact(Class<?> clazz, Object... parameterTypes) {
        return findConstructorExact(clazz, getParameterClasses(clazz.getClassLoader(), parameterTypes));
    }

    public static Constructor<?> findConstructorExact(String className, ClassLoader classLoader, Object... parameterTypes) {
        return findConstructorExact(findClass(className, classLoader), getParameterClasses(classLoader, parameterTypes));
    }

    public static Constructor<?> findConstructorExact(Class<?> clazz, Class<?>... clsArr) {
        String fullConstructorName = clazz.getName() + getParametersString(clsArr) + "#exact";
        if (constructorCache.containsKey(fullConstructorName)) {
            Constructor<?> constructor = constructorCache.get(fullConstructorName);
            if (constructor == null) {
                throw new NoSuchMethodError(fullConstructorName);
            }
            return constructor;
        }
        try {
            Constructor<?> constructor2 = clazz.getDeclaredConstructor(clsArr);
            constructor2.setAccessible(true);
            constructorCache.put(fullConstructorName, constructor2);
            return constructor2;
        } catch (NoSuchMethodException e) {
            constructorCache.put(fullConstructorName, null);
            throw new NoSuchMethodError(fullConstructorName);
        }
    }

    public static XC_MethodHook.Unhook findAndHookConstructor(Class<?> clazz, Object... parameterTypesAndCallback) {
        if (parameterTypesAndCallback.length == 0 || !(parameterTypesAndCallback[parameterTypesAndCallback.length - 1] instanceof XC_MethodHook)) {
            throw new IllegalArgumentException("no callback defined");
        }
        XC_MethodHook callback = (XC_MethodHook) parameterTypesAndCallback[parameterTypesAndCallback.length - 1];
        Constructor<?> m = findConstructorExact(clazz, getParameterClasses(clazz.getClassLoader(), parameterTypesAndCallback));
        return XposedBridge.hookMethod(m, callback);
    }

    public static XC_MethodHook.Unhook findAndHookConstructor(String className, ClassLoader classLoader, Object... parameterTypesAndCallback) {
        return findAndHookConstructor(findClass(className, classLoader), parameterTypesAndCallback);
    }

    public static Constructor<?> findConstructorBestMatch(Class<?> clazz, Class<?>... clsArr) {
        String fullConstructorName = clazz.getName() + getParametersString(clsArr) + "#bestmatch";
        if (constructorCache.containsKey(fullConstructorName)) {
            Constructor<?> constructor = constructorCache.get(fullConstructorName);
            if (constructor == null) {
                throw new NoSuchMethodError(fullConstructorName);
            }
            return constructor;
        }
        try {
            Constructor<?> constructor2 = findConstructorExact(clazz, clsArr);
            constructorCache.put(fullConstructorName, constructor2);
            return constructor2;
        } catch (NoSuchMethodError e) {
            Constructor<?> bestMatch = null;
            Constructor<?>[] constructors = clazz.getDeclaredConstructors();
            for (Constructor<?> constructor3 : constructors) {
                if (ClassUtils.isAssignable(clsArr, constructor3.getParameterTypes(), true) && (bestMatch == null || MemberUtils.compareParameterTypes(constructor3.getParameterTypes(), bestMatch.getParameterTypes(), clsArr) < 0)) {
                    bestMatch = constructor3;
                }
            }
            if (bestMatch != null) {
                bestMatch.setAccessible(true);
                constructorCache.put(fullConstructorName, bestMatch);
                return bestMatch;
            }
            NoSuchMethodError e2 = new NoSuchMethodError(fullConstructorName);
            constructorCache.put(fullConstructorName, null);
            throw e2;
        }
    }

    public static Constructor<?> findConstructorBestMatch(Class<?> clazz, Object... args) {
        return findConstructorBestMatch(clazz, getParameterTypes(args));
    }

    public static Constructor<?> findConstructorBestMatch(Class<?> clazz, Class<?>[] clsArr, Object[] args) {
        Class[] argsClasses = null;
        for (int i = 0; i < clsArr.length; i++) {
            if (clsArr[i] == null) {
                if (argsClasses == null) {
                    argsClasses = getParameterTypes(args);
                }
                clsArr[i] = argsClasses[i];
            }
        }
        return findConstructorBestMatch(clazz, clsArr);
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/XposedHelpers$ClassNotFoundError.class */
    public static class ClassNotFoundError extends Error {
        private static final long serialVersionUID = -1070936889459514628L;

        public ClassNotFoundError(Throwable cause) {
            super(cause);
        }

        public ClassNotFoundError(String detailMessage, Throwable cause) {
            super(detailMessage, cause);
        }
    }

    public static void setObjectField(Object obj, String fieldName, Object value) {
        try {
            findField(obj.getClass(), fieldName).set(obj, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setBooleanField(Object obj, String fieldName, boolean value) {
        try {
            findField(obj.getClass(), fieldName).setBoolean(obj, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setByteField(Object obj, String fieldName, byte value) {
        try {
            findField(obj.getClass(), fieldName).setByte(obj, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setCharField(Object obj, String fieldName, char value) {
        try {
            findField(obj.getClass(), fieldName).setChar(obj, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setDoubleField(Object obj, String fieldName, double value) {
        try {
            findField(obj.getClass(), fieldName).setDouble(obj, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setFloatField(Object obj, String fieldName, float value) {
        try {
            findField(obj.getClass(), fieldName).setFloat(obj, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setIntField(Object obj, String fieldName, int value) {
        try {
            findField(obj.getClass(), fieldName).setInt(obj, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setLongField(Object obj, String fieldName, long value) {
        try {
            findField(obj.getClass(), fieldName).setLong(obj, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setShortField(Object obj, String fieldName, short value) {
        try {
            findField(obj.getClass(), fieldName).setShort(obj, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static Object getObjectField(Object obj, String fieldName) {
        try {
            return findField(obj.getClass(), fieldName).get(obj);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static Object getSurroundingThis(Object obj) {
        return getObjectField(obj, "this$0");
    }

    public static boolean getBooleanField(Object obj, String fieldName) {
        try {
            return findField(obj.getClass(), fieldName).getBoolean(obj);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static byte getByteField(Object obj, String fieldName) {
        try {
            return findField(obj.getClass(), fieldName).getByte(obj);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static char getCharField(Object obj, String fieldName) {
        try {
            return findField(obj.getClass(), fieldName).getChar(obj);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static double getDoubleField(Object obj, String fieldName) {
        try {
            return findField(obj.getClass(), fieldName).getDouble(obj);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static float getFloatField(Object obj, String fieldName) {
        try {
            return findField(obj.getClass(), fieldName).getFloat(obj);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static int getIntField(Object obj, String fieldName) {
        try {
            return findField(obj.getClass(), fieldName).getInt(obj);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static long getLongField(Object obj, String fieldName) {
        try {
            return findField(obj.getClass(), fieldName).getLong(obj);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static short getShortField(Object obj, String fieldName) {
        try {
            return findField(obj.getClass(), fieldName).getShort(obj);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setStaticObjectField(Class<?> clazz, String fieldName, Object value) {
        try {
            findField(clazz, fieldName).set(null, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setStaticBooleanField(Class<?> clazz, String fieldName, boolean value) {
        try {
            findField(clazz, fieldName).setBoolean(null, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setStaticByteField(Class<?> clazz, String fieldName, byte value) {
        try {
            findField(clazz, fieldName).setByte(null, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setStaticCharField(Class<?> clazz, String fieldName, char value) {
        try {
            findField(clazz, fieldName).setChar(null, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setStaticDoubleField(Class<?> clazz, String fieldName, double value) {
        try {
            findField(clazz, fieldName).setDouble(null, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setStaticFloatField(Class<?> clazz, String fieldName, float value) {
        try {
            findField(clazz, fieldName).setFloat(null, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setStaticIntField(Class<?> clazz, String fieldName, int value) {
        try {
            findField(clazz, fieldName).setInt(null, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setStaticLongField(Class<?> clazz, String fieldName, long value) {
        try {
            findField(clazz, fieldName).setLong(null, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static void setStaticShortField(Class<?> clazz, String fieldName, short value) {
        try {
            findField(clazz, fieldName).setShort(null, value);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static Object getStaticObjectField(Class<?> clazz, String fieldName) {
        try {
            return findField(clazz, fieldName).get(null);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static boolean getStaticBooleanField(Class<?> clazz, String fieldName) {
        try {
            return findField(clazz, fieldName).getBoolean(null);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static byte getStaticByteField(Class<?> clazz, String fieldName) {
        try {
            return findField(clazz, fieldName).getByte(null);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static char getStaticCharField(Class<?> clazz, String fieldName) {
        try {
            return findField(clazz, fieldName).getChar(null);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static double getStaticDoubleField(Class<?> clazz, String fieldName) {
        try {
            return findField(clazz, fieldName).getDouble(null);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static float getStaticFloatField(Class<?> clazz, String fieldName) {
        try {
            return findField(clazz, fieldName).getFloat(null);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static int getStaticIntField(Class<?> clazz, String fieldName) {
        try {
            return findField(clazz, fieldName).getInt(null);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static long getStaticLongField(Class<?> clazz, String fieldName) {
        try {
            return findField(clazz, fieldName).getLong(null);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static short getStaticShortField(Class<?> clazz, String fieldName) {
        try {
            return findField(clazz, fieldName).getShort(null);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        }
    }

    public static Object callMethod(Object obj, String methodName, Object... args) {
        try {
            return findMethodBestMatch(obj.getClass(), methodName, args).invoke(obj, args);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        } catch (InvocationTargetException e3) {
            throw new InvocationTargetError(e3.getCause());
        }
    }

    public static Object callMethod(Object obj, String methodName, Class<?>[] clsArr, Object... args) {
        try {
            return findMethodBestMatch(obj.getClass(), methodName, clsArr, args).invoke(obj, args);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        } catch (InvocationTargetException e3) {
            throw new InvocationTargetError(e3.getCause());
        }
    }

    public static Object callStaticMethod(Class<?> clazz, String methodName, Object... args) {
        try {
            return findMethodBestMatch(clazz, methodName, args).invoke(null, args);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        } catch (InvocationTargetException e3) {
            throw new InvocationTargetError(e3.getCause());
        }
    }

    public static Object callStaticMethod(Class<?> clazz, String methodName, Class<?>[] clsArr, Object... args) {
        try {
            return findMethodBestMatch(clazz, methodName, clsArr, args).invoke(null, args);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        } catch (InvocationTargetException e3) {
            throw new InvocationTargetError(e3.getCause());
        }
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/XposedHelpers$InvocationTargetError.class */
    public static class InvocationTargetError extends Error {
        private static final long serialVersionUID = -1070936889459514628L;

        public InvocationTargetError(Throwable cause) {
            super(cause);
        }

        public InvocationTargetError(String detailMessage, Throwable cause) {
            super(detailMessage, cause);
        }
    }

    public static Object newInstance(Class<?> clazz, Object... args) {
        try {
            return findConstructorBestMatch(clazz, args).newInstance(args);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        } catch (InstantiationException e3) {
            throw new InstantiationError(e3.getMessage());
        } catch (InvocationTargetException e4) {
            throw new InvocationTargetError(e4.getCause());
        }
    }

    public static Object newInstance(Class<?> clazz, Class<?>[] clsArr, Object... args) {
        try {
            return findConstructorBestMatch(clazz, clsArr, args).newInstance(args);
        } catch (IllegalAccessException e) {
            XposedBridge.log(e);
            throw new IllegalAccessError(e.getMessage());
        } catch (IllegalArgumentException e2) {
            throw e2;
        } catch (InstantiationException e3) {
            throw new InstantiationError(e3.getMessage());
        } catch (InvocationTargetException e4) {
            throw new InvocationTargetError(e4.getCause());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v10, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v12, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.util.WeakHashMap<java.lang.Object, java.util.HashMap<java.lang.String, java.lang.Object>>] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9 */
    public static Object setAdditionalInstanceField(Object obj, String key, Object value) {
        if (obj == null) {
            throw new NullPointerException("object must not be null");
        }
        if (key == null) {
            throw new NullPointerException("key must not be null");
        }
        ?? r0 = additionalFields;
        synchronized (r0) {
            HashMap<String, Object> objectFields = additionalFields.get(obj);
            if (objectFields == null) {
                objectFields = new HashMap<>();
                additionalFields.put(obj, objectFields);
            }
            r0 = r0;
            ?? r02 = objectFields;
            synchronized (r02) {
                r02 = objectFields.put(key, value);
            }
            return r02;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v11, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Throwable, java.util.WeakHashMap<java.lang.Object, java.util.HashMap<java.lang.String, java.lang.Object>>] */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.lang.Throwable] */
    public static Object getAdditionalInstanceField(Object obj, String key) {
        if (obj == null) {
            throw new NullPointerException("object must not be null");
        }
        if (key == null) {
            throw new NullPointerException("key must not be null");
        }
        synchronized (additionalFields) {
            HashMap<String, Object> objectFields = additionalFields.get(obj);
            if (objectFields == null) {
                return null;
            }
            ?? r0 = objectFields;
            synchronized (r0) {
                r0 = objectFields.get(key);
            }
            return r0;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v11, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Throwable, java.util.WeakHashMap<java.lang.Object, java.util.HashMap<java.lang.String, java.lang.Object>>] */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.lang.Throwable] */
    public static Object removeAdditionalInstanceField(Object obj, String key) {
        if (obj == null) {
            throw new NullPointerException("object must not be null");
        }
        if (key == null) {
            throw new NullPointerException("key must not be null");
        }
        synchronized (additionalFields) {
            HashMap<String, Object> objectFields = additionalFields.get(obj);
            if (objectFields == null) {
                return null;
            }
            ?? r0 = objectFields;
            synchronized (r0) {
                r0 = objectFields.remove(key);
            }
            return r0;
        }
    }

    public static Object setAdditionalStaticField(Object obj, String key, Object value) {
        return setAdditionalInstanceField(obj.getClass(), key, value);
    }

    public static Object getAdditionalStaticField(Object obj, String key) {
        return getAdditionalInstanceField(obj.getClass(), key);
    }

    public static Object removeAdditionalStaticField(Object obj, String key) {
        return removeAdditionalInstanceField(obj.getClass(), key);
    }

    public static Object setAdditionalStaticField(Class<?> clazz, String key, Object value) {
        return setAdditionalInstanceField(clazz, key, value);
    }

    public static Object getAdditionalStaticField(Class<?> clazz, String key) {
        return getAdditionalInstanceField(clazz, key);
    }

    public static Object removeAdditionalStaticField(Class<?> clazz, String key) {
        return removeAdditionalInstanceField(clazz, key);
    }

    public static byte[] assetAsByteArray(Resources res, String path) throws IOException {
        InputStream is = res.getAssets().open(path);
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        byte[] temp = new byte[1024];
        while (true) {
            int read = is.read(temp);
            if (read > 0) {
                buf.write(temp, 0, read);
            } else {
                is.close();
                return buf.toByteArray();
            }
        }
    }

    public static String getMD5Sum(String file) throws IOException {
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            InputStream is = new FileInputStream(file);
            byte[] buffer = new byte[8192];
            while (true) {
                int read = is.read(buffer);
                if (read > 0) {
                    digest.update(buffer, 0, read);
                } else {
                    is.close();
                    byte[] md5sum = digest.digest();
                    BigInteger bigInt = new BigInteger(1, md5sum);
                    return bigInt.toString(16);
                }
            }
        } catch (NoSuchAlgorithmException e) {
            return "";
        }
    }
}
