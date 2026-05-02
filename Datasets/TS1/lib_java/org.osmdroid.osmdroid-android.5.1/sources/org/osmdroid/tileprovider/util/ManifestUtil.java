package org.osmdroid.tileprovider.util;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.util.Log;
import org.osmdroid.api.IMapView;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/util/ManifestUtil.class */
public class ManifestUtil {
    public static String retrieveKey(Context aContext, String aKey) {
        PackageManager pm = aContext.getPackageManager();
        try {
            ApplicationInfo info = pm.getApplicationInfo(aContext.getPackageName(), 128);
            if (info.metaData == null) {
                Log.i(IMapView.LOGTAG, "Key %s not found in manifest" + aKey);
                return "";
            }
            String value = info.metaData.getString(aKey);
            if (value == null) {
                Log.i(IMapView.LOGTAG, "Key %s not found in manifest" + aKey);
                return "";
            }
            return value.trim();
        } catch (PackageManager.NameNotFoundException e) {
            Log.i(IMapView.LOGTAG, "Key %s not found in manifest" + aKey);
            return "";
        }
    }
}
