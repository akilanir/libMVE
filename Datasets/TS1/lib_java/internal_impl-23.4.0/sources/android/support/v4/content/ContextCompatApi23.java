package android.support.v4.content;

import android.content.Context;
import android.content.res.ColorStateList;

/* loaded from: internal_impl-23.4.0.jar:android/support/v4/content/ContextCompatApi23.class */
class ContextCompatApi23 {
    ContextCompatApi23() {
    }

    public static ColorStateList getColorStateList(Context context, int id) {
        return context.getColorStateList(id);
    }

    public static int getColor(Context context, int id) {
        return context.getColor(id);
    }
}
