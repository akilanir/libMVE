package uk.co.chrisjenx.calligraphy;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/ReflectionUtils.class */
class ReflectionUtils {
    ReflectionUtils() {
    }

    static Field getField(Class clazz, String fieldName) {
        try {
            Field f = clazz.getDeclaredField(fieldName);
            f.setAccessible(true);
            return f;
        } catch (NoSuchFieldException e) {
            return null;
        }
    }

    static Object getValue(Field field, Object obj) {
        try {
            return field.get(obj);
        } catch (IllegalAccessException e) {
            return null;
        }
    }

    static void setValue(Field field, Object obj, Object value) {
        try {
            field.set(obj, value);
        } catch (IllegalAccessException e) {
        }
    }

    static Method getMethod(Class clazz, String methodName) {
        Method[] methods = clazz.getMethods();
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                method.setAccessible(true);
                return method;
            }
        }
        return null;
    }

    static void invokeMethod(Object object, Method method, Object... args) {
        if (method == null) {
            return;
        }
        try {
            method.invoke(object, args);
        } catch (IllegalAccessException | InvocationTargetException ignored) {
            ignored.printStackTrace();
        }
    }
}
