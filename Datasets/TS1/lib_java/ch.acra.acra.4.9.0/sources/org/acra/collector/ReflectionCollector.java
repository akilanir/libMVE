package org.acra.collector;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collector/ReflectionCollector.class */
final class ReflectionCollector {
    private ReflectionCollector() {
    }

    @NonNull
    public static String collectConstants(@NonNull Class<?> someClass, @Nullable String prefix) {
        StringBuilder result = new StringBuilder();
        Field[] fields = someClass.getFields();
        for (Field field : fields) {
            if (prefix != null && !prefix.isEmpty()) {
                result.append(prefix).append('.');
            }
            result.append(field.getName()).append('=');
            try {
                Object value = field.get(null);
                if (value != null) {
                    if (field.getType().isArray()) {
                        result.append(Arrays.toString((Object[]) value));
                    } else {
                        result.append(value.toString());
                    }
                }
            } catch (IllegalAccessException e) {
                result.append("N/A");
            } catch (IllegalArgumentException e2) {
                result.append("N/A");
            }
            result.append('\n');
        }
        return result.toString();
    }

    @NonNull
    public static String collectStaticGettersResults(@NonNull Class<?> someClass) {
        StringBuilder result = new StringBuilder();
        Method[] methods = someClass.getMethods();
        for (Method method : methods) {
            if (method.getParameterTypes().length == 0 && ((method.getName().startsWith("get") || method.getName().startsWith("is")) && !"getClass".equals(method.getName()))) {
                try {
                    result.append(method.getName());
                    result.append('=');
                    result.append(method.invoke(null, (Object[]) null));
                    result.append('\n');
                } catch (IllegalAccessException e) {
                } catch (IllegalArgumentException e2) {
                } catch (InvocationTargetException e3) {
                }
            }
        }
        return result.toString();
    }

    @NonNull
    public static String collectConstants(@NonNull Class<?> someClass) {
        return collectConstants(someClass, "");
    }
}
