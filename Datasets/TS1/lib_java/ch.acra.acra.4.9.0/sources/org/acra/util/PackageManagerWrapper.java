package org.acra.util;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import org.acra.ACRA;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/util/PackageManagerWrapper.class */
public final class PackageManagerWrapper {
    private final Context context;

    public PackageManagerWrapper(@NonNull Context context) {
        this.context = context;
    }

    public boolean hasPermission(@NonNull String permission) {
        PackageManager pm = this.context.getPackageManager();
        if (pm == null) {
            return false;
        }
        try {
            return pm.checkPermission(permission, this.context.getPackageName()) == 0;
        } catch (RuntimeException e) {
            return false;
        }
    }

    @Nullable
    public PackageInfo getPackageInfo() {
        PackageManager pm = this.context.getPackageManager();
        if (pm == null) {
            return null;
        }
        try {
            return pm.getPackageInfo(this.context.getPackageName(), 0);
        } catch (PackageManager.NameNotFoundException e) {
            ACRA.log.w(ACRA.LOG_TAG, "Failed to find PackageInfo for current App : " + this.context.getPackageName());
            return null;
        } catch (RuntimeException e2) {
            return null;
        }
    }
}
