package org.apache.commons.lang3.reflect;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.ClassUtils;
import org.apache.commons.lang3.Validate;

/* loaded from: commons-lang3-3.4.jar:org/apache/commons/lang3/reflect/ConstructorUtils.class */
public class ConstructorUtils {
    public static <T> T invokeConstructor(Class<T> cls, Object... objArr) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        Object[] nullToEmpty = ArrayUtils.nullToEmpty(objArr);
        return (T) invokeConstructor(cls, nullToEmpty, ClassUtils.toClass(nullToEmpty));
    }

    public static <T> T invokeConstructor(Class<T> cls, Object[] args, Class<?>[] parameterTypes) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        Object[] args2 = ArrayUtils.nullToEmpty(args);
        Constructor<T> ctor = getMatchingAccessibleConstructor(cls, ArrayUtils.nullToEmpty(parameterTypes));
        if (ctor == null) {
            throw new NoSuchMethodException("No such accessible constructor on object: " + cls.getName());
        }
        return ctor.newInstance(args2);
    }

    public static <T> T invokeExactConstructor(Class<T> cls, Object... objArr) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        Object[] nullToEmpty = ArrayUtils.nullToEmpty(objArr);
        return (T) invokeExactConstructor(cls, nullToEmpty, ClassUtils.toClass(nullToEmpty));
    }

    public static <T> T invokeExactConstructor(Class<T> cls, Object[] args, Class<?>[] parameterTypes) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        Object[] args2 = ArrayUtils.nullToEmpty(args);
        Constructor<T> ctor = getAccessibleConstructor(cls, ArrayUtils.nullToEmpty(parameterTypes));
        if (ctor == null) {
            throw new NoSuchMethodException("No such accessible constructor on object: " + cls.getName());
        }
        return ctor.newInstance(args2);
    }

    public static <T> Constructor<T> getAccessibleConstructor(Class<T> cls, Class<?>... parameterTypes) {
        Validate.notNull(cls, "class cannot be null", new Object[0]);
        try {
            return getAccessibleConstructor(cls.getConstructor(parameterTypes));
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    public static <T> Constructor<T> getAccessibleConstructor(Constructor<T> ctor) {
        Validate.notNull(ctor, "constructor cannot be null", new Object[0]);
        if (MemberUtils.isAccessible(ctor) && isAccessible(ctor.getDeclaringClass())) {
            return ctor;
        }
        return null;
    }

    public static <T> Constructor<T> getMatchingAccessibleConstructor(Class<T> cls, Class<?>... parameterTypes) {
        Constructor<T> accessibleConstructor;
        Validate.notNull(cls, "class cannot be null", new Object[0]);
        try {
            Constructor<T> ctor = cls.getConstructor(parameterTypes);
            MemberUtils.setAccessibleWorkaround(ctor);
            return ctor;
        } catch (NoSuchMethodException e) {
            Constructor<T> result = null;
            Constructor<?>[] ctors = cls.getConstructors();
            for (Constructor<?> ctor2 : ctors) {
                if (ClassUtils.isAssignable(parameterTypes, ctor2.getParameterTypes(), true) && (accessibleConstructor = getAccessibleConstructor(ctor2)) != null) {
                    MemberUtils.setAccessibleWorkaround(accessibleConstructor);
                    if (result == null || MemberUtils.compareParameterTypes(accessibleConstructor.getParameterTypes(), result.getParameterTypes(), parameterTypes) < 0) {
                        result = accessibleConstructor;
                    }
                }
            }
            return result;
        }
    }

    private static boolean isAccessible(Class<?> type) {
        Class<?> cls = type;
        while (true) {
            Class<?> cls2 = cls;
            if (cls2 != null) {
                if (!Modifier.isPublic(cls2.getModifiers())) {
                    return false;
                }
                cls = cls2.getEnclosingClass();
            } else {
                return true;
            }
        }
    }
}
