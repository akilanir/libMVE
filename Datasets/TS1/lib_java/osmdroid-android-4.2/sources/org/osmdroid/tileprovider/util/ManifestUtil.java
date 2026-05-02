package org.osmdroid.tileprovider.util;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/util/ManifestUtil.class */
public class ManifestUtil {
    private static final Logger logger = LoggerFactory.getLogger(ManifestUtil.class);

    public static String retrieveKey(Context aContext, String aKey) {
        PackageManager pm = aContext.getPackageManager();
        try {
            ApplicationInfo info = pm.getApplicationInfo(aContext.getPackageName(), 128);
            if (info.metaData == null) {
                logger.info("Key %s not found in manifest", aKey);
                return "";
            }
            String value = info.metaData.getString(aKey);
            if (value == null) {
                logger.info("Key %s not found in manifest", aKey);
                return "";
            }
            return value.trim();
        } catch (PackageManager.NameNotFoundException e) {
            logger.info("Key %s not found in manifest", aKey);
            return "";
        }
    }
}
