package android.support.v4.content.res;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Build;

/* loaded from: com.android.support.support-v4.21.0.2.jar:android/support/v4/content/res/ResourcesCompat.class */
public class ResourcesCompat {
    public static Drawable getDrawable(Resources res, int id, Resources.Theme theme) throws Resources.NotFoundException {
        int version = Build.VERSION.SDK_INT;
        if (version >= 21) {
            return ResourcesCompatApi21.getDrawable(res, id, theme);
        }
        return res.getDrawable(id);
    }
}
