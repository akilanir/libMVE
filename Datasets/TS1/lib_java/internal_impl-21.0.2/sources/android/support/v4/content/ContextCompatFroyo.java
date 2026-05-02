package android.support.v4.content;

import android.content.Context;
import java.io.File;

/* loaded from: internal_impl-21.0.2.jar:android/support/v4/content/ContextCompatFroyo.class */
class ContextCompatFroyo {
    ContextCompatFroyo() {
    }

    public static File getExternalCacheDir(Context context) {
        return context.getExternalCacheDir();
    }

    public static File getExternalFilesDir(Context context, String type) {
        return context.getExternalFilesDir(type);
    }
}
