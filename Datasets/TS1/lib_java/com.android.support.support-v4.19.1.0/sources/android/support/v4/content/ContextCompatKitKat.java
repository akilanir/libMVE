package android.support.v4.content;

import android.content.Context;
import java.io.File;

/* loaded from: support-v4-19.1.0.jar:android/support/v4/content/ContextCompatKitKat.class */
class ContextCompatKitKat {
    ContextCompatKitKat() {
    }

    public static File[] getExternalCacheDirs(Context context) {
        return context.getExternalCacheDirs();
    }

    public static File[] getExternalFilesDirs(Context context, String type) {
        return context.getExternalFilesDirs(type);
    }

    public static File[] getObbDirs(Context context) {
        return context.getObbDirs();
    }
}
