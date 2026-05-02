package android.support.v4.content.res;

import android.content.res.Resources;
import android.os.Build;
import android.support.annotation.NonNull;

/* loaded from: com.android.support.support-v4.24.0.0.jar:android/support/v4/content/res/ConfigurationHelper.class */
public final class ConfigurationHelper {
    private static final ConfigurationHelperImpl IMPL;

    /* loaded from: com.android.support.support-v4.24.0.0.jar:android/support/v4/content/res/ConfigurationHelper$ConfigurationHelperImpl.class */
    private interface ConfigurationHelperImpl {
        int getScreenHeightDp(@NonNull Resources resources);

        int getScreenWidthDp(@NonNull Resources resources);

        int getSmallestScreenWidthDp(@NonNull Resources resources);

        int getDensityDpi(@NonNull Resources resources);
    }

    static {
        int sdk = Build.VERSION.SDK_INT;
        if (sdk >= 17) {
            IMPL = new JellybeanMr1Impl();
        } else if (sdk >= 13) {
            IMPL = new HoneycombMr2Impl();
        } else {
            IMPL = new DonutImpl();
        }
    }

    private ConfigurationHelper() {
    }

    /* loaded from: com.android.support.support-v4.24.0.0.jar:android/support/v4/content/res/ConfigurationHelper$DonutImpl.class */
    private static class DonutImpl implements ConfigurationHelperImpl {
        private DonutImpl() {
        }

        @Override // android.support.v4.content.res.ConfigurationHelper.ConfigurationHelperImpl
        public int getScreenHeightDp(@NonNull Resources resources) {
            return ConfigurationHelperDonut.getScreenHeightDp(resources);
        }

        @Override // android.support.v4.content.res.ConfigurationHelper.ConfigurationHelperImpl
        public int getScreenWidthDp(@NonNull Resources resources) {
            return ConfigurationHelperDonut.getScreenWidthDp(resources);
        }

        @Override // android.support.v4.content.res.ConfigurationHelper.ConfigurationHelperImpl
        public int getSmallestScreenWidthDp(@NonNull Resources resources) {
            return ConfigurationHelperDonut.getSmallestScreenWidthDp(resources);
        }

        @Override // android.support.v4.content.res.ConfigurationHelper.ConfigurationHelperImpl
        public int getDensityDpi(@NonNull Resources resources) {
            return ConfigurationHelperDonut.getDensityDpi(resources);
        }
    }

    /* loaded from: com.android.support.support-v4.24.0.0.jar:android/support/v4/content/res/ConfigurationHelper$HoneycombMr2Impl.class */
    private static class HoneycombMr2Impl extends DonutImpl {
        private HoneycombMr2Impl() {
            super();
        }

        @Override // android.support.v4.content.res.ConfigurationHelper.DonutImpl, android.support.v4.content.res.ConfigurationHelper.ConfigurationHelperImpl
        public int getScreenHeightDp(@NonNull Resources resources) {
            return ConfigurationHelperHoneycombMr2.getScreenHeightDp(resources);
        }

        @Override // android.support.v4.content.res.ConfigurationHelper.DonutImpl, android.support.v4.content.res.ConfigurationHelper.ConfigurationHelperImpl
        public int getScreenWidthDp(@NonNull Resources resources) {
            return ConfigurationHelperHoneycombMr2.getScreenWidthDp(resources);
        }

        @Override // android.support.v4.content.res.ConfigurationHelper.DonutImpl, android.support.v4.content.res.ConfigurationHelper.ConfigurationHelperImpl
        public int getSmallestScreenWidthDp(@NonNull Resources resources) {
            return ConfigurationHelperHoneycombMr2.getSmallestScreenWidthDp(resources);
        }
    }

    /* loaded from: com.android.support.support-v4.24.0.0.jar:android/support/v4/content/res/ConfigurationHelper$JellybeanMr1Impl.class */
    private static class JellybeanMr1Impl extends HoneycombMr2Impl {
        private JellybeanMr1Impl() {
            super();
        }

        @Override // android.support.v4.content.res.ConfigurationHelper.DonutImpl, android.support.v4.content.res.ConfigurationHelper.ConfigurationHelperImpl
        public int getDensityDpi(@NonNull Resources resources) {
            return ConfigurationHelperJellybeanMr1.getDensityDpi(resources);
        }
    }

    public static int getScreenHeightDp(@NonNull Resources resources) {
        return IMPL.getScreenHeightDp(resources);
    }

    public static int getScreenWidthDp(@NonNull Resources resources) {
        return IMPL.getScreenWidthDp(resources);
    }

    public static int getSmallestScreenWidthDp(@NonNull Resources resources) {
        return IMPL.getSmallestScreenWidthDp(resources);
    }

    public static int getDensityDpi(@NonNull Resources resources) {
        return IMPL.getDensityDpi(resources);
    }
}
