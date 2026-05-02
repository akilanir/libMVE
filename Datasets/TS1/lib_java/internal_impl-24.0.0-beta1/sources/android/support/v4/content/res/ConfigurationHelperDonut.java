package android.support.v4.content.res;

import android.content.res.Resources;
import android.support.annotation.NonNull;
import android.util.DisplayMetrics;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/content/res/ConfigurationHelperDonut.class */
class ConfigurationHelperDonut {
    ConfigurationHelperDonut() {
    }

    static int getScreenHeightDp(@NonNull Resources resources) {
        DisplayMetrics metrics = resources.getDisplayMetrics();
        return (int) (metrics.heightPixels / metrics.density);
    }

    static int getScreenWidthDp(@NonNull Resources resources) {
        DisplayMetrics metrics = resources.getDisplayMetrics();
        return (int) (metrics.widthPixels / metrics.density);
    }

    static int getSmallestScreenWidthDp(@NonNull Resources resources) {
        return Math.min(getScreenWidthDp(resources), getScreenHeightDp(resources));
    }

    static int getDensityDpi(@NonNull Resources resources) {
        return resources.getDisplayMetrics().densityDpi;
    }
}
