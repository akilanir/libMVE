package android.app;

import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.IBinder;
import de.robv.android.xposed.XSharedPreferences;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.XposedHelpers;
import java.lang.ref.WeakReference;
import java.util.Map;

/* loaded from: XposedBridgeApi-54.jar:android/app/AndroidAppHelper.class */
public class AndroidAppHelper {
    private static Class<?> CLASS_RESOURCES_KEY;
    private static boolean HAS_IS_THEMEABLE;

    static {
        Class<?> findClass;
        HAS_IS_THEMEABLE = false;
        if (Build.VERSION.SDK_INT < 19) {
            findClass = XposedHelpers.findClass("android.app.ActivityThread$ResourcesKey", null);
        } else {
            findClass = XposedHelpers.findClass("android.content.res.ResourcesKey", null);
        }
        CLASS_RESOURCES_KEY = findClass;
        try {
            XposedHelpers.findField(CLASS_RESOURCES_KEY, "mIsThemeable");
            HAS_IS_THEMEABLE = true;
        } catch (NoSuchFieldError e) {
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    private static Map<Object, WeakReference<Resources>> getActiveResources(ActivityThread activityThread) {
        if (Build.VERSION.SDK_INT <= 18) {
            return (Map) XposedHelpers.getObjectField(activityThread, "mActiveResources");
        }
        Object resourcesManager = XposedHelpers.getObjectField(activityThread, "mResourcesManager");
        return (Map) XposedHelpers.getObjectField(resourcesManager, "mActiveResources");
    }

    private static Object createResourcesKey(String resDir, float scale, boolean isThemeable) {
        try {
            return HAS_IS_THEMEABLE ? XposedHelpers.newInstance(CLASS_RESOURCES_KEY, resDir, Float.valueOf(scale), Boolean.valueOf(isThemeable)) : XposedHelpers.newInstance(CLASS_RESOURCES_KEY, resDir, Float.valueOf(scale));
        } catch (Throwable t) {
            XposedBridge.log(t);
            return null;
        }
    }

    private static Object createResourcesKey(String resDir, int displayId, Configuration overrideConfiguration, float scale, boolean isThemeable) {
        try {
            return HAS_IS_THEMEABLE ? XposedHelpers.newInstance(CLASS_RESOURCES_KEY, resDir, Integer.valueOf(displayId), overrideConfiguration, Float.valueOf(scale), Boolean.valueOf(isThemeable)) : XposedHelpers.newInstance(CLASS_RESOURCES_KEY, resDir, Integer.valueOf(displayId), overrideConfiguration, Float.valueOf(scale));
        } catch (Throwable t) {
            XposedBridge.log(t);
            return null;
        }
    }

    private static Object createResourcesKey(String resDir, int displayId, Configuration overrideConfiguration, float scale, IBinder token, boolean isThemeable) {
        try {
            return HAS_IS_THEMEABLE ? XposedHelpers.newInstance(CLASS_RESOURCES_KEY, resDir, Integer.valueOf(displayId), overrideConfiguration, Float.valueOf(scale), Boolean.valueOf(isThemeable), token) : XposedHelpers.newInstance(CLASS_RESOURCES_KEY, resDir, Integer.valueOf(displayId), overrideConfiguration, Float.valueOf(scale), token);
        } catch (Throwable t) {
            XposedBridge.log(t);
            return null;
        }
    }

    public static void addActiveResource(String resDir, float scale, boolean isThemeable, Resources resources) {
        Object resourcesKey;
        ActivityThread thread = ActivityThread.currentActivityThread();
        if (thread == null) {
            return;
        }
        if (Build.VERSION.SDK_INT <= 16) {
            resourcesKey = createResourcesKey(resDir, scale, isThemeable);
        } else if (Build.VERSION.SDK_INT <= 18) {
            resourcesKey = createResourcesKey(resDir, 0, null, scale, isThemeable);
        } else {
            resourcesKey = createResourcesKey(resDir, 0, null, scale, null, isThemeable);
        }
        if (resourcesKey != null) {
            getActiveResources(thread).put(resourcesKey, new WeakReference<>(resources));
        }
    }

    public static String currentProcessName() {
        String processName = ActivityThread.currentPackageName();
        if (processName == null) {
            return "android";
        }
        return processName;
    }

    public static ApplicationInfo currentApplicationInfo() {
        Object boundApplication;
        ActivityThread am = ActivityThread.currentActivityThread();
        if (am == null || (boundApplication = XposedHelpers.getObjectField(am, "mBoundApplication")) == null) {
            return null;
        }
        return (ApplicationInfo) XposedHelpers.getObjectField(boundApplication, "appInfo");
    }

    public static String currentPackageName() {
        ApplicationInfo ai = currentApplicationInfo();
        return ai != null ? ai.packageName : "android";
    }

    public static Application currentApplication() {
        return ActivityThread.currentApplication();
    }

    @Deprecated
    public static SharedPreferences getSharedPreferencesForPackage(String packageName, String prefFileName, int mode) {
        return new XSharedPreferences(packageName, prefFileName);
    }

    @Deprecated
    public static SharedPreferences getDefaultSharedPreferencesForPackage(String packageName) {
        return new XSharedPreferences(packageName);
    }

    @Deprecated
    public static void reloadSharedPreferencesIfNeeded(SharedPreferences pref) {
        if (pref instanceof XSharedPreferences) {
            ((XSharedPreferences) pref).reload();
        }
    }
}
