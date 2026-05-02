package org.apache.commons.beanutils;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/ConstructorUtils.class */
public class ConstructorUtils {
    private static final Class[] EMPTY_CLASS_PARAMETERS = new Class[0];
    private static final Object[] EMPTY_OBJECT_ARRAY = new Object[0];

    public static Object invokeConstructor(Class klass, Object arg) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        Object[] args = {arg};
        return invokeConstructor(klass, args);
    }

    public static Object invokeConstructor(Class klass, Object[] args) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        if (null == args) {
            args = EMPTY_OBJECT_ARRAY;
        }
        int arguments = args.length;
        Class[] parameterTypes = new Class[arguments];
        for (int i = 0; i < arguments; i++) {
            parameterTypes[i] = args[i].getClass();
        }
        return invokeConstructor(klass, args, parameterTypes);
    }

    public static Object invokeConstructor(Class klass, Object[] args, Class[] parameterTypes) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        if (parameterTypes == null) {
            parameterTypes = EMPTY_CLASS_PARAMETERS;
        }
        if (args == null) {
            args = EMPTY_OBJECT_ARRAY;
        }
        Constructor ctor = getMatchingAccessibleConstructor(klass, parameterTypes);
        if (null == ctor) {
            throw new NoSuchMethodException(new StringBuffer().append("No such accessible constructor on object: ").append(klass.getName()).toString());
        }
        return ctor.newInstance(args);
    }

    public static Object invokeExactConstructor(Class klass, Object arg) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        Object[] args = {arg};
        return invokeExactConstructor(klass, args);
    }

    public static Object invokeExactConstructor(Class klass, Object[] args) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        if (null == args) {
            args = EMPTY_OBJECT_ARRAY;
        }
        int arguments = args.length;
        Class[] parameterTypes = new Class[arguments];
        for (int i = 0; i < arguments; i++) {
            parameterTypes[i] = args[i].getClass();
        }
        return invokeExactConstructor(klass, args, parameterTypes);
    }

    public static Object invokeExactConstructor(Class klass, Object[] args, Class[] parameterTypes) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        if (args == null) {
            args = EMPTY_OBJECT_ARRAY;
        }
        if (parameterTypes == null) {
            parameterTypes = EMPTY_CLASS_PARAMETERS;
        }
        Constructor ctor = getAccessibleConstructor(klass, parameterTypes);
        if (null == ctor) {
            throw new NoSuchMethodException(new StringBuffer().append("No such accessible constructor on object: ").append(klass.getName()).toString());
        }
        return ctor.newInstance(args);
    }

    public static Constructor getAccessibleConstructor(Class klass, Class parameterType) {
        Class[] parameterTypes = {parameterType};
        return getAccessibleConstructor(klass, parameterTypes);
    }

    public static Constructor getAccessibleConstructor(Class klass, Class[] parameterTypes) {
        try {
            return getAccessibleConstructor(klass.getConstructor(parameterTypes));
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    public static Constructor getAccessibleConstructor(Constructor ctor) {
        if (ctor == null || !Modifier.isPublic(ctor.getModifiers())) {
            return null;
        }
        Class clazz = ctor.getDeclaringClass();
        if (Modifier.isPublic(clazz.getModifiers())) {
            return ctor;
        }
        return null;
    }

    private static Constructor getMatchingAccessibleConstructor(Class clazz, Class[] parameterTypes) {
        Constructor ctor;
        try {
            Constructor ctor2 = clazz.getConstructor(parameterTypes);
            try {
                ctor2.setAccessible(true);
            } catch (SecurityException e) {
            }
            return ctor2;
        } catch (NoSuchMethodException e2) {
            int paramSize = parameterTypes.length;
            Constructor[] ctors = clazz.getConstructors();
            int size = ctors.length;
            for (int i = 0; i < size; i++) {
                Class[] ctorParams = ctors[i].getParameterTypes();
                int ctorParamSize = ctorParams.length;
                if (ctorParamSize == paramSize) {
                    boolean match = true;
                    int n = 0;
                    while (true) {
                        if (n >= ctorParamSize) {
                            break;
                        }
                        if (MethodUtils.isAssignmentCompatible(ctorParams[n], parameterTypes[n])) {
                            n++;
                        } else {
                            match = false;
                            break;
                        }
                    }
                    if (match && (ctor = getAccessibleConstructor(ctors[i])) != null) {
                        try {
                            ctor.setAccessible(true);
                        } catch (SecurityException e3) {
                        }
                        return ctor;
                    }
                }
            }
            return null;
        }
    }
}
