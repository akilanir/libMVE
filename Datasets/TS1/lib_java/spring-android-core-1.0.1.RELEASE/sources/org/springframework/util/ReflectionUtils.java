package org.springframework.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.UndeclaredThrowableException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/util/ReflectionUtils.class */
public abstract class ReflectionUtils {
    public static FieldFilter COPYABLE_FIELDS = new FieldFilter() { // from class: org.springframework.util.ReflectionUtils.4
        @Override // org.springframework.util.ReflectionUtils.FieldFilter
        public boolean matches(Field field) {
            return (Modifier.isStatic(field.getModifiers()) || Modifier.isFinal(field.getModifiers())) ? false : true;
        }
    };
    public static MethodFilter NON_BRIDGED_METHODS = new MethodFilter() { // from class: org.springframework.util.ReflectionUtils.5
        @Override // org.springframework.util.ReflectionUtils.MethodFilter
        public boolean matches(Method method) {
            return !method.isBridge();
        }
    };
    public static MethodFilter USER_DECLARED_METHODS = new MethodFilter() { // from class: org.springframework.util.ReflectionUtils.6
        @Override // org.springframework.util.ReflectionUtils.MethodFilter
        public boolean matches(Method method) {
            return (method.isBridge() || method.getDeclaringClass() == Object.class) ? false : true;
        }
    };

    /* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/util/ReflectionUtils$FieldCallback.class */
    public interface FieldCallback {
        void doWith(Field field) throws IllegalArgumentException, IllegalAccessException;
    }

    /* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/util/ReflectionUtils$FieldFilter.class */
    public interface FieldFilter {
        boolean matches(Field field);
    }

    /* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/util/ReflectionUtils$MethodCallback.class */
    public interface MethodCallback {
        void doWith(Method method) throws IllegalArgumentException, IllegalAccessException;
    }

    /* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/util/ReflectionUtils$MethodFilter.class */
    public interface MethodFilter {
        boolean matches(Method method);
    }

    public static Field findField(Class<?> clazz, String name) {
        return findField(clazz, name, null);
    }

    public static Field findField(Class<?> clazz, String name, Class<?> type) {
        Field field;
        Assert.notNull(clazz, "Class must not be null");
        Assert.isTrue((name == null && type == null) ? false : true, "Either name or type of the field must be specified");
        Class<?> cls = clazz;
        loop0: while (true) {
            Class<?> searchType = cls;
            if (!Object.class.equals(searchType) && searchType != null) {
                Field[] fields = searchType.getDeclaredFields();
                int len$ = fields.length;
                for (int i$ = 0; i$ < len$; i$++) {
                    field = fields[i$];
                    if ((name == null || name.equals(field.getName())) && (type == null || type.equals(field.getType()))) {
                        break loop0;
                    }
                }
                cls = searchType.getSuperclass();
            } else {
                return null;
            }
        }
        return field;
    }

    public static void setField(Field field, Object target, Object value) {
        try {
            field.set(target, value);
        } catch (IllegalAccessException ex) {
            handleReflectionException(ex);
            throw new IllegalStateException("Unexpected reflection exception - " + ex.getClass().getName() + ": " + ex.getMessage());
        }
    }

    public static Object getField(Field field, Object target) {
        try {
            return field.get(target);
        } catch (IllegalAccessException ex) {
            handleReflectionException(ex);
            throw new IllegalStateException("Unexpected reflection exception - " + ex.getClass().getName() + ": " + ex.getMessage());
        }
    }

    public static Method findMethod(Class<?> clazz, String name) {
        return findMethod(clazz, name, new Class[0]);
    }

    public static Method findMethod(Class<?> clazz, String name, Class<?>... paramTypes) {
        Method method;
        Assert.notNull(clazz, "Class must not be null");
        Assert.notNull(name, "Method name must not be null");
        Class<?> cls = clazz;
        loop0: while (true) {
            Class<?> searchType = cls;
            if (searchType != null) {
                Method[] methods = searchType.isInterface() ? searchType.getMethods() : searchType.getDeclaredMethods();
                int len$ = methods.length;
                for (int i$ = 0; i$ < len$; i$++) {
                    method = methods[i$];
                    if (name.equals(method.getName()) && (paramTypes == null || Arrays.equals(paramTypes, method.getParameterTypes()))) {
                        break loop0;
                    }
                }
                cls = searchType.getSuperclass();
            } else {
                return null;
            }
        }
        return method;
    }

    public static Object invokeMethod(Method method, Object target) {
        return invokeMethod(method, target, new Object[0]);
    }

    public static Object invokeMethod(Method method, Object target, Object... args) {
        try {
            return method.invoke(target, args);
        } catch (Exception ex) {
            handleReflectionException(ex);
            throw new IllegalStateException("Should never get here");
        }
    }

    public static Object invokeJdbcMethod(Method method, Object target) throws SQLException {
        return invokeJdbcMethod(method, target, new Object[0]);
    }

    public static Object invokeJdbcMethod(Method method, Object target, Object... args) throws SQLException {
        try {
            return method.invoke(target, args);
        } catch (IllegalAccessException ex) {
            handleReflectionException(ex);
            throw new IllegalStateException("Should never get here");
        } catch (InvocationTargetException ex2) {
            if (ex2.getTargetException() instanceof SQLException) {
                throw ((SQLException) ex2.getTargetException());
            }
            handleInvocationTargetException(ex2);
            throw new IllegalStateException("Should never get here");
        }
    }

    public static void handleReflectionException(Exception ex) {
        if (ex instanceof NoSuchMethodException) {
            throw new IllegalStateException("Method not found: " + ex.getMessage());
        }
        if (ex instanceof IllegalAccessException) {
            throw new IllegalStateException("Could not access method: " + ex.getMessage());
        }
        if (ex instanceof InvocationTargetException) {
            handleInvocationTargetException((InvocationTargetException) ex);
        }
        if (ex instanceof RuntimeException) {
            throw ((RuntimeException) ex);
        }
        throw new UndeclaredThrowableException(ex);
    }

    public static void handleInvocationTargetException(InvocationTargetException ex) {
        rethrowRuntimeException(ex.getTargetException());
    }

    public static void rethrowRuntimeException(Throwable ex) {
        if (ex instanceof RuntimeException) {
            throw ((RuntimeException) ex);
        }
        if (ex instanceof Error) {
            throw ((Error) ex);
        }
        throw new UndeclaredThrowableException(ex);
    }

    public static void rethrowException(Throwable ex) throws Exception {
        if (ex instanceof Exception) {
            throw ((Exception) ex);
        }
        if (ex instanceof Error) {
            throw ((Error) ex);
        }
        throw new UndeclaredThrowableException(ex);
    }

    public static boolean declaresException(Method method, Class<?> exceptionType) {
        Assert.notNull(method, "Method must not be null");
        Class<?>[] declaredExceptions = method.getExceptionTypes();
        for (Class<?> declaredException : declaredExceptions) {
            if (declaredException.isAssignableFrom(exceptionType)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isPublicStaticFinal(Field field) {
        int modifiers = field.getModifiers();
        return Modifier.isPublic(modifiers) && Modifier.isStatic(modifiers) && Modifier.isFinal(modifiers);
    }

    public static boolean isEqualsMethod(Method method) {
        if (method == null || !method.getName().equals("equals")) {
            return false;
        }
        Class<?>[] paramTypes = method.getParameterTypes();
        return paramTypes.length == 1 && paramTypes[0] == Object.class;
    }

    public static boolean isHashCodeMethod(Method method) {
        return method != null && method.getName().equals("hashCode") && method.getParameterTypes().length == 0;
    }

    public static boolean isToStringMethod(Method method) {
        return method != null && method.getName().equals("toString") && method.getParameterTypes().length == 0;
    }

    public static boolean isObjectMethod(Method method) {
        try {
            Object.class.getDeclaredMethod(method.getName(), method.getParameterTypes());
            return true;
        } catch (NoSuchMethodException e) {
            return false;
        } catch (SecurityException e2) {
            return false;
        }
    }

    public static void makeAccessible(Field field) {
        if ((!Modifier.isPublic(field.getModifiers()) || !Modifier.isPublic(field.getDeclaringClass().getModifiers()) || Modifier.isFinal(field.getModifiers())) && !field.isAccessible()) {
            field.setAccessible(true);
        }
    }

    public static void makeAccessible(Method method) {
        if ((!Modifier.isPublic(method.getModifiers()) || !Modifier.isPublic(method.getDeclaringClass().getModifiers())) && !method.isAccessible()) {
            method.setAccessible(true);
        }
    }

    public static void makeAccessible(Constructor<?> ctor) {
        if ((!Modifier.isPublic(ctor.getModifiers()) || !Modifier.isPublic(ctor.getDeclaringClass().getModifiers())) && !ctor.isAccessible()) {
            ctor.setAccessible(true);
        }
    }

    public static void doWithMethods(Class<?> clazz, MethodCallback mc) throws IllegalArgumentException {
        doWithMethods(clazz, mc, null);
    }

    public static void doWithMethods(Class<?> clazz, MethodCallback mc, MethodFilter mf) throws IllegalArgumentException {
        Method[] methods = clazz.getDeclaredMethods();
        for (Method method : methods) {
            if (mf == null || mf.matches(method)) {
                try {
                    mc.doWith(method);
                } catch (IllegalAccessException ex) {
                    throw new IllegalStateException("Shouldn't be illegal to access method '" + method.getName() + "': " + ex);
                }
            }
        }
        if (clazz.getSuperclass() != null) {
            doWithMethods(clazz.getSuperclass(), mc, mf);
            return;
        }
        if (clazz.isInterface()) {
            Class<?>[] arr$ = clazz.getInterfaces();
            for (Class<?> superIfc : arr$) {
                doWithMethods(superIfc, mc, mf);
            }
        }
    }

    public static Method[] getAllDeclaredMethods(Class<?> leafClass) throws IllegalArgumentException {
        final List<Method> methods = new ArrayList<>(32);
        doWithMethods(leafClass, new MethodCallback() { // from class: org.springframework.util.ReflectionUtils.1
            @Override // org.springframework.util.ReflectionUtils.MethodCallback
            public void doWith(Method method) {
                methods.add(method);
            }
        });
        return (Method[]) methods.toArray(new Method[methods.size()]);
    }

    public static Method[] getUniqueDeclaredMethods(Class<?> leafClass) throws IllegalArgumentException {
        final List<Method> methods = new ArrayList<>(32);
        doWithMethods(leafClass, new MethodCallback() { // from class: org.springframework.util.ReflectionUtils.2
            @Override // org.springframework.util.ReflectionUtils.MethodCallback
            public void doWith(Method method) {
                Method methodBeingOverriddenWithCovariantReturnType = null;
                Iterator i$ = methods.iterator();
                while (true) {
                    if (!i$.hasNext()) {
                        break;
                    }
                    Method existingMethod = (Method) i$.next();
                    if (method.getName().equals(existingMethod.getName()) && Arrays.equals(method.getParameterTypes(), existingMethod.getParameterTypes())) {
                        if (existingMethod.getReturnType() != method.getReturnType() && existingMethod.getReturnType().isAssignableFrom(method.getReturnType())) {
                            methodBeingOverriddenWithCovariantReturnType = existingMethod;
                        }
                    }
                }
                if (methodBeingOverriddenWithCovariantReturnType != null) {
                    methods.remove(methodBeingOverriddenWithCovariantReturnType);
                }
            }
        });
        return (Method[]) methods.toArray(new Method[methods.size()]);
    }

    public static void doWithFields(Class<?> clazz, FieldCallback fc) throws IllegalArgumentException {
        doWithFields(clazz, fc, null);
    }

    public static void doWithFields(Class<?> clazz, FieldCallback fc, FieldFilter ff) throws IllegalArgumentException {
        Class<?> targetClass = clazz;
        do {
            Field[] fields = targetClass.getDeclaredFields();
            for (Field field : fields) {
                if (ff == null || ff.matches(field)) {
                    try {
                        fc.doWith(field);
                    } catch (IllegalAccessException ex) {
                        throw new IllegalStateException("Shouldn't be illegal to access field '" + field.getName() + "': " + ex);
                    }
                }
            }
            targetClass = targetClass.getSuperclass();
            if (targetClass == null) {
                return;
            }
        } while (targetClass != Object.class);
    }

    public static void shallowCopyFieldState(final Object src, final Object dest) throws IllegalArgumentException {
        if (src == null) {
            throw new IllegalArgumentException("Source for field copy cannot be null");
        }
        if (dest == null) {
            throw new IllegalArgumentException("Destination for field copy cannot be null");
        }
        if (!src.getClass().isAssignableFrom(dest.getClass())) {
            throw new IllegalArgumentException("Destination class [" + dest.getClass().getName() + "] must be same or subclass as source class [" + src.getClass().getName() + "]");
        }
        doWithFields(src.getClass(), new FieldCallback() { // from class: org.springframework.util.ReflectionUtils.3
            @Override // org.springframework.util.ReflectionUtils.FieldCallback
            public void doWith(Field field) throws IllegalArgumentException, IllegalAccessException {
                ReflectionUtils.makeAccessible(field);
                Object srcValue = field.get(src);
                field.set(dest, srcValue);
            }
        }, COPYABLE_FIELDS);
    }
}
