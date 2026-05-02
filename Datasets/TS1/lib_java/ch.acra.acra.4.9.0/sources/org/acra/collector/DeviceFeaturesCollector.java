package org.acra.collector;

import android.content.Context;
import android.content.pm.FeatureInfo;
import android.content.pm.PackageManager;
import android.support.annotation.NonNull;
import org.acra.ACRA;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collector/DeviceFeaturesCollector.class */
final class DeviceFeaturesCollector {
    private DeviceFeaturesCollector() {
    }

    @NonNull
    public static String getFeatures(@NonNull Context ctx) {
        StringBuilder result = new StringBuilder();
        try {
            PackageManager pm = ctx.getPackageManager();
            FeatureInfo[] features = pm.getSystemAvailableFeatures();
            for (FeatureInfo feature : features) {
                String featureName = feature.name;
                if (featureName != null) {
                    result.append(featureName);
                } else {
                    result.append("glEsVersion = ").append(feature.getGlEsVersion());
                }
                result.append('\n');
            }
        } catch (Throwable e) {
            ACRA.log.w(ACRA.LOG_TAG, "Couldn't retrieve DeviceFeatures for " + ctx.getPackageName(), e);
            result.append("Could not retrieve data: ");
            result.append(e.getMessage());
        }
        return result.toString();
    }
}
