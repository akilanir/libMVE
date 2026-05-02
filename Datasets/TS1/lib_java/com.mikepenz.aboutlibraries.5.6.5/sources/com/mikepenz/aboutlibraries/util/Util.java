package com.mikepenz.aboutlibraries.util;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;

/* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/util/Util.class */
public class Util {
    public static PackageInfo getPackageInfo(Context ctx) {
        PackageManager pm = ctx.getPackageManager();
        String packageName = ctx.getPackageName();
        PackageInfo packageInfo = null;
        try {
            packageInfo = pm.getPackageInfo(packageName, 0);
        } catch (Exception e) {
        }
        return packageInfo;
    }

    public static ApplicationInfo getApplicationInfo(Context ctx) {
        PackageManager pm = ctx.getPackageManager();
        String packageName = ctx.getPackageName();
        ApplicationInfo appInfo = null;
        try {
            appInfo = pm.getApplicationInfo(packageName, 0);
        } catch (Exception e) {
        }
        return appInfo;
    }
}
