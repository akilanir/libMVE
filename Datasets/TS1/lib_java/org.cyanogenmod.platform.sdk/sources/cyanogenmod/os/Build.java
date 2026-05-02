package cyanogenmod.os;

import android.os.SystemProperties;
import android.util.SparseArray;

/* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/os/Build.class */
public class Build {
    public static final String UNKNOWN = "unknown";
    public static final int PARCELABLE_VERSION = 1;
    private static final SparseArray<String> sdkMap = new SparseArray<>();

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/os/Build$CM_VERSION.class */
    public static class CM_VERSION {
        public static final int SDK_INT = SystemProperties.getInt("ro.cm.build.version.plat.sdk", 0);
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/os/Build$CM_VERSION_CODES.class */
    public static class CM_VERSION_CODES {
        public static final int APRICOT = 1;
    }

    static {
        sdkMap.put(1, "Apricot");
    }

    public static String getNameForSDKInt(int sdkInt) {
        return sdkMap.get(sdkInt);
    }
}
