package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Set;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/sharedpreferences/SharedPreferencesCompat.class */
public abstract class SharedPreferencesCompat {
    private static final Method APPLY_METHOD = findMethod(SharedPreferences.Editor.class, "apply", new Class[0]);
    private static final Method GET_STRING_SET_METHOD = findMethod(SharedPreferences.class, "getStringSet", String.class, Set.class);
    private static final Method PUT_STRING_SET_METHOD = findMethod(SharedPreferences.Editor.class, "putStringSet", String.class, Set.class);

    private SharedPreferencesCompat() {
    }

    public static void apply(SharedPreferences.Editor editor) {
        try {
            invoke(APPLY_METHOD, editor, new Object[0]);
        } catch (NoSuchMethodException e) {
            editor.commit();
        }
    }

    public static Set<String> getStringSet(SharedPreferences preferences, String key, Set<String> defValues) {
        try {
            return (Set) invoke(GET_STRING_SET_METHOD, preferences, key, defValues);
        } catch (NoSuchMethodException e) {
            String serializedSet = preferences.getString(key, null);
            if (serializedSet == null) {
                return defValues;
            }
            return SetXmlSerializer.deserialize(serializedSet);
        }
    }

    public static void putStringSet(SharedPreferences.Editor editor, String key, Set<String> values) {
        try {
            invoke(PUT_STRING_SET_METHOD, editor, key, values);
        } catch (NoSuchMethodException e) {
            editor.putString(key, SetXmlSerializer.serialize(values));
        }
    }

    private static Method findMethod(Class<?> clazz, String name, Class<?>... parameterTypes) {
        try {
            return clazz.getMethod(name, parameterTypes);
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    public static <T> T invoke(Method method, Object obj, Object... objArr) throws NoSuchMethodException {
        if (method == null) {
            throw new NoSuchMethodException();
        }
        try {
            return (T) method.invoke(obj, objArr);
        } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
            throw new NoSuchMethodException(method.getName());
        }
    }
}
