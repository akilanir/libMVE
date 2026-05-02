package android.support.v4.content.res;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;

/* loaded from: internal_impl-23.0.1.jar:android/support/v4/content/res/ResourcesCompatIcsMr1.class */
class ResourcesCompatIcsMr1 {
    ResourcesCompatIcsMr1() {
    }

    public static Drawable getDrawableForDensity(Resources res, int id, int density) throws Resources.NotFoundException {
        return res.getDrawableForDensity(id, density);
    }
}
