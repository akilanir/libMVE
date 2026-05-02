package com.lb.material_preferences_library.custom_preferences;

import android.preference.PreferenceManager;
import java.lang.reflect.Method;

/* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/PreferenceManagerEx.class */
public class PreferenceManagerEx {
    private Method METHOD_UNREGISTER_ON_ACTIVITY_DESTROY_LISTENER;
    private Method METHOD_REGISTER_ON_ACTIVITY_DESTROY_LISTENER;
    private static final PreferenceManagerEx INSTANCE = new PreferenceManagerEx();

    private PreferenceManagerEx() {
    }

    public void unregisterOnActivityDestroyListener(PreferenceManager pm, PreferenceManager.OnActivityDestroyListener listener) {
        Method unregisterMethod = this.METHOD_UNREGISTER_ON_ACTIVITY_DESTROY_LISTENER;
        if (unregisterMethod == null) {
            try {
                unregisterMethod = pm.getClass().getDeclaredMethod("unregisterOnActivityDestroyListener", PreferenceManager.OnActivityDestroyListener.class);
                unregisterMethod.setAccessible(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        unregisterMethod.invoke(pm, listener);
        this.METHOD_UNREGISTER_ON_ACTIVITY_DESTROY_LISTENER = unregisterMethod;
    }

    public void registerOnActivityDestroyListener(PreferenceManager pm, PreferenceManager.OnActivityDestroyListener listener) {
        Method registerMethod = this.METHOD_REGISTER_ON_ACTIVITY_DESTROY_LISTENER;
        if (registerMethod == null) {
            try {
                registerMethod = pm.getClass().getDeclaredMethod("registerOnActivityDestroyListener", PreferenceManager.OnActivityDestroyListener.class);
                registerMethod.setAccessible(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        registerMethod.invoke(pm, listener);
        this.METHOD_REGISTER_ON_ACTIVITY_DESTROY_LISTENER = registerMethod;
    }

    public static PreferenceManagerEx getInstance() {
        return INSTANCE;
    }
}
