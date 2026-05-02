package pl.droidsonroids.gif;

import android.content.Context;
import android.os.Build;
import android.support.annotation.NonNull;
import java.lang.reflect.Method;

/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/LibraryLoader.class */
public class LibraryLoader {
    static final String SURFACE_LIBRARY_NAME = "pl_droidsonroids_gif_surface";
    static final String BASE_LIBRARY_NAME = "pl_droidsonroids_gif";
    private static Context sAppContext;

    public static void initialize(@NonNull Context context) {
        sAppContext = context.getApplicationContext();
    }

    private static Context getContext() {
        if (sAppContext == null) {
            try {
                Class<?> activityThread = Class.forName("android.app.ActivityThread");
                Method currentApplicationMethod = activityThread.getDeclaredMethod("currentApplication", new Class[0]);
                sAppContext = (Context) currentApplicationMethod.invoke(null, new Object[0]);
            } catch (Exception e) {
                throw new RuntimeException("LibraryLoader not initialized. Call LibraryLoader.initialize() before using library classes.", e);
            }
        }
        return sAppContext;
    }

    static void loadLibrary(Context context, String library) {
        try {
            System.loadLibrary(library);
        } catch (UnsatisfiedLinkError e) {
            if (Build.VERSION.SDK_INT < 9) {
                throw e;
            }
            if (SURFACE_LIBRARY_NAME.equals(library)) {
                loadLibrary(context, BASE_LIBRARY_NAME);
            }
            if (context == null) {
                context = getContext();
            }
            ReLinker.loadLibrary(context, library);
        }
    }
}
