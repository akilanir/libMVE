package android.support.v4.view;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.view.View;

/* loaded from: internal_impl-22.1.1.jar:android/support/v4/view/ViewCompatBase.class */
class ViewCompatBase {
    ViewCompatBase() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    static ColorStateList getBackgroundTintList(View view) {
        if (view instanceof TintableBackgroundView) {
            return ((TintableBackgroundView) view).getSupportBackgroundTintList();
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    static void setBackgroundTintList(View view, ColorStateList tintList) {
        if (view instanceof TintableBackgroundView) {
            ((TintableBackgroundView) view).setSupportBackgroundTintList(tintList);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    static PorterDuff.Mode getBackgroundTintMode(View view) {
        if (view instanceof TintableBackgroundView) {
            return ((TintableBackgroundView) view).getSupportBackgroundTintMode();
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    static void setBackgroundTintMode(View view, PorterDuff.Mode mode) {
        if (view instanceof TintableBackgroundView) {
            ((TintableBackgroundView) view).setSupportBackgroundTintMode(mode);
        }
    }

    static boolean isLaidOut(View view) {
        return view.getWidth() > 0 && view.getHeight() > 0;
    }
}
