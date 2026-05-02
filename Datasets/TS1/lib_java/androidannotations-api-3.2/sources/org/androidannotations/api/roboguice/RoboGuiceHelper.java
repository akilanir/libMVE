package org.androidannotations.api.roboguice;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/roboguice/RoboGuiceHelper.class */
public class RoboGuiceHelper {
    public static void callInjectViews(Object activity) {
        try {
            Class<?> viewMembersInjectorClass = Class.forName("roboguice.inject.ViewListener$ViewMembersInjector");
            Method injectViewsMethod = viewMembersInjectorClass.getDeclaredMethod("injectViews", Object.class);
            injectViewsMethod.setAccessible(true);
            injectViewsMethod.invoke(null, activity);
        } catch (ClassNotFoundException e) {
            propagateRuntimeException(e);
        } catch (IllegalAccessException e2) {
            propagateRuntimeException(e2);
        } catch (IllegalArgumentException e3) {
            propagateRuntimeException(e3);
        } catch (NoSuchMethodException e4) {
            propagateRuntimeException(e4);
        } catch (SecurityException e5) {
            propagateRuntimeException(e5);
        } catch (InvocationTargetException e6) {
            propagateRuntimeException(e6);
        }
    }

    private static void propagateRuntimeException(Throwable t) {
        throw new RuntimeException("Could not invoke RoboGuice method!", t);
    }
}
