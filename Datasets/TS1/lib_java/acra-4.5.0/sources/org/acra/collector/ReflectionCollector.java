package org.acra.collector;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: acra-4.5.0.jar:org/acra/collector/ReflectionCollector.class */
final class ReflectionCollector {
    ReflectionCollector() {
    }

    public static String collectConstants(Class<?> someClass, String prefix) {
        StringBuilder result = new StringBuilder();
        Field[] fields = someClass.getFields();
        for (Field field : fields) {
            if (prefix != null && prefix.length() > 0) {
                result.append(prefix).append('.');
            }
            result.append(field.getName()).append("=");
            try {
                result.append(field.get(null).toString());
            } catch (IllegalAccessException e) {
                result.append("N/A");
            } catch (IllegalArgumentException e2) {
                result.append("N/A");
            }
            result.append("\n");
        }
        return result.toString();
    }

    public static String collectStaticGettersResults(Class<?> someClass) {
        StringBuilder result = new StringBuilder();
        Method[] methods = someClass.getMethods();
        for (Method method : methods) {
            if (method.getParameterTypes().length == 0 && ((method.getName().startsWith("get") || method.getName().startsWith("is")) && !method.getName().equals("getClass"))) {
                try {
                    result.append(method.getName());
                    result.append('=');
                    result.append(method.invoke(null, (Object[]) null));
                    result.append("\n");
                } catch (IllegalAccessException e) {
                } catch (IllegalArgumentException e2) {
                } catch (InvocationTargetException e3) {
                }
            }
        }
        return result.toString();
    }

    public static String collectConstants(Class<?> someClass) {
        return collectConstants(someClass, "");
    }
}
