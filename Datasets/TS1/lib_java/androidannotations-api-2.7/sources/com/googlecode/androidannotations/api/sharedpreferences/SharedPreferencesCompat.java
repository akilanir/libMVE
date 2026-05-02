package com.googlecode.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/sharedpreferences/SharedPreferencesCompat.class */
abstract class SharedPreferencesCompat {
    private static final Method sApplyMethod = findApplyMethod();

    private SharedPreferencesCompat() {
    }

    private static Method findApplyMethod() {
        try {
            return SharedPreferences.Editor.class.getMethod("apply", new Class[0]);
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    public static void apply(SharedPreferences.Editor editor) {
        if (sApplyMethod != null) {
            try {
                sApplyMethod.invoke(editor, new Object[0]);
                return;
            } catch (IllegalAccessException e) {
            } catch (InvocationTargetException e2) {
            }
        }
        editor.commit();
    }
}
