package com.squareup.okhttp.internal;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/internal/OptionalMethod.class */
class OptionalMethod<T> {
    private final Class<?> returnType;
    private final String methodName;
    private final Class[] methodParams;

    public OptionalMethod(Class<?> returnType, String methodName, Class... methodParams) {
        this.returnType = returnType;
        this.methodName = methodName;
        this.methodParams = methodParams;
    }

    public boolean isSupported(T target) {
        return getMethod(target.getClass()) != null;
    }

    public Object invokeOptional(T target, Object... args) throws InvocationTargetException {
        Method m = getMethod(target.getClass());
        if (m == null) {
            return null;
        }
        try {
            return m.invoke(target, args);
        } catch (IllegalAccessException e) {
            return null;
        }
    }

    public Object invokeOptionalWithoutCheckedException(T target, Object... args) {
        try {
            return invokeOptional(target, args);
        } catch (InvocationTargetException e) {
            Throwable targetException = e.getTargetException();
            if (targetException instanceof RuntimeException) {
                throw ((RuntimeException) targetException);
            }
            AssertionError error = new AssertionError("Unexpected exception");
            error.initCause(targetException);
            throw error;
        }
    }

    public Object invoke(T target, Object... args) throws InvocationTargetException {
        Method m = getMethod(target.getClass());
        if (m == null) {
            throw new AssertionError("Method " + this.methodName + " not supported for object " + target);
        }
        try {
            return m.invoke(target, args);
        } catch (IllegalAccessException e) {
            AssertionError error = new AssertionError("Unexpectedly could not call: " + m);
            error.initCause(e);
            throw error;
        }
    }

    public Object invokeWithoutCheckedException(T target, Object... args) {
        try {
            return invoke(target, args);
        } catch (InvocationTargetException e) {
            Throwable targetException = e.getTargetException();
            if (targetException instanceof RuntimeException) {
                throw ((RuntimeException) targetException);
            }
            AssertionError error = new AssertionError("Unexpected exception");
            error.initCause(targetException);
            throw error;
        }
    }

    private Method getMethod(Class<?> clazz) {
        Method method = null;
        if (this.methodName != null) {
            method = getPublicMethod(clazz, this.methodName, this.methodParams);
            if (method != null && this.returnType != null && !this.returnType.isAssignableFrom(method.getReturnType())) {
                method = null;
            }
        }
        return method;
    }

    private static Method getPublicMethod(Class<?> clazz, String methodName, Class[] parameterTypes) {
        Method method = null;
        try {
            method = clazz.getMethod(methodName, parameterTypes);
            if ((method.getModifiers() & 1) == 0) {
                method = null;
            }
        } catch (NoSuchMethodException e) {
        }
        return method;
    }
}
