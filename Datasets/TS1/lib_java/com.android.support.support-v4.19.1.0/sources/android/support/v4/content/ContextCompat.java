package android.support.v4.content;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import java.io.File;

/* loaded from: support-v4-19.1.0.jar:android/support/v4/content/ContextCompat.class */
public class ContextCompat {
    private static final String DIR_ANDROID = "Android";
    private static final String DIR_DATA = "data";
    private static final String DIR_OBB = "obb";
    private static final String DIR_FILES = "files";
    private static final String DIR_CACHE = "cache";

    public static boolean startActivities(Context context, Intent[] intents) {
        return startActivities(context, intents, null);
    }

    public static boolean startActivities(Context context, Intent[] intents, Bundle options) {
        int version = Build.VERSION.SDK_INT;
        if (version >= 16) {
            ContextCompatJellybean.startActivities(context, intents, options);
            return true;
        }
        if (version >= 11) {
            ContextCompatHoneycomb.startActivities(context, intents);
            return true;
        }
        return false;
    }

    public static File[] getObbDirs(Context context) {
        File single;
        int version = Build.VERSION.SDK_INT;
        if (version >= 19) {
            return ContextCompatKitKat.getObbDirs(context);
        }
        if (version >= 11) {
            single = ContextCompatHoneycomb.getObbDir(context);
        } else {
            single = buildPath(Environment.getExternalStorageDirectory(), DIR_ANDROID, DIR_OBB, context.getPackageName());
        }
        return new File[]{single};
    }

    public static File[] getExternalFilesDirs(Context context, String type) {
        File single;
        int version = Build.VERSION.SDK_INT;
        if (version >= 19) {
            return ContextCompatKitKat.getExternalFilesDirs(context, type);
        }
        if (version >= 8) {
            single = ContextCompatFroyo.getExternalFilesDir(context, type);
        } else {
            single = buildPath(Environment.getExternalStorageDirectory(), DIR_ANDROID, DIR_DATA, context.getPackageName(), DIR_FILES, type);
        }
        return new File[]{single};
    }

    public static File[] getExternalCacheDirs(Context context) {
        File single;
        int version = Build.VERSION.SDK_INT;
        if (version >= 19) {
            return ContextCompatKitKat.getExternalCacheDirs(context);
        }
        if (version >= 8) {
            single = ContextCompatFroyo.getExternalCacheDir(context);
        } else {
            single = buildPath(Environment.getExternalStorageDirectory(), DIR_ANDROID, DIR_DATA, context.getPackageName(), DIR_CACHE);
        }
        return new File[]{single};
    }

    private static File buildPath(File base, String... segments) {
        File cur = base;
        for (String segment : segments) {
            if (cur == null) {
                cur = new File(segment);
            } else if (segment != null) {
                cur = new File(cur, segment);
            }
        }
        return cur;
    }
}
