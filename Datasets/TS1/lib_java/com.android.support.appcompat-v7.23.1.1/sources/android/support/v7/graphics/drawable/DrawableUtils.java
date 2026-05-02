package android.support.v7.graphics.drawable;

import android.graphics.PorterDuff;
import android.os.Build;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatDelegate;

/* loaded from: com.android.support.appcompat-v7.23.1.1.jar:android/support/v7/graphics/drawable/DrawableUtils.class */
public class DrawableUtils {
    public static PorterDuff.Mode parseTintMode(int value, PorterDuff.Mode defaultMode) {
        switch (value) {
            case DrawerArrowDrawable.ARROW_DIRECTION_END /* 3 */:
                return PorterDuff.Mode.SRC_OVER;
            case 4:
            case 6:
            case 7:
            case ActionBar.DISPLAY_SHOW_TITLE /* 8 */:
            case AppCompatDelegate.FEATURE_ACTION_MODE_OVERLAY /* 10 */:
            case 11:
            case 12:
            case 13:
            default:
                return defaultMode;
            case 5:
                return PorterDuff.Mode.SRC_IN;
            case 9:
                return PorterDuff.Mode.SRC_ATOP;
            case 14:
                return PorterDuff.Mode.MULTIPLY;
            case 15:
                return PorterDuff.Mode.SCREEN;
            case ActionBar.DISPLAY_SHOW_CUSTOM /* 16 */:
                return Build.VERSION.SDK_INT >= 11 ? PorterDuff.Mode.valueOf("ADD") : defaultMode;
        }
    }
}
