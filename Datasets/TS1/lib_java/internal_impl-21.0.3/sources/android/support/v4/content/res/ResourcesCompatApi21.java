package android.support.v4.content.res;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;

/* loaded from: internal_impl-21.0.3.jar:android/support/v4/content/res/ResourcesCompatApi21.class */
class ResourcesCompatApi21 {
    ResourcesCompatApi21() {
    }

    public static Drawable getDrawable(Resources res, int id, Resources.Theme theme) {
        return res.getDrawable(id, theme);
    }
}
