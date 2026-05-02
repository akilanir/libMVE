package android.support.v4.content;

import android.content.Context;
import android.graphics.drawable.Drawable;
import java.io.File;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/content/ContextCompatApi21.class */
class ContextCompatApi21 {
    ContextCompatApi21() {
    }

    public static Drawable getDrawable(Context context, int id) {
        return context.getDrawable(id);
    }

    public static File getNoBackupFilesDir(Context context) {
        return context.getNoBackupFilesDir();
    }

    public static File getCodeCacheDir(Context context) {
        return context.getCodeCacheDir();
    }
}
