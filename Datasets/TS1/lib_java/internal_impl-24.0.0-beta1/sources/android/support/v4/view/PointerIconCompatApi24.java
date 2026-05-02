package android.support.v4.view;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.view.PointerIcon;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/view/PointerIconCompatApi24.class */
class PointerIconCompatApi24 {
    PointerIconCompatApi24() {
    }

    public static Object getSystemIcon(Context context, int style) {
        return PointerIcon.getSystemIcon(context, style);
    }

    public static Object createCustomIcon(Bitmap bitmap, float hotSpotX, float hotSpotY) {
        return PointerIcon.createCustomIcon(bitmap, hotSpotX, hotSpotY);
    }

    public static Object loadCustomIcon(Resources resources, int resourceId) {
        return PointerIcon.loadCustomIcon(resources, resourceId);
    }
}
