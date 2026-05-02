package com.cocosw.bottomsheet;

import android.R;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.ViewConfiguration;
import android.view.Window;
import android.view.WindowManager;
import java.lang.reflect.Method;

@TargetApi(19)
/* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/TranslucentHelper.class */
class TranslucentHelper {
    private static final String STATUS_BAR_HEIGHT_RES_NAME = "status_bar_height";
    private static final String NAV_BAR_HEIGHT_RES_NAME = "navigation_bar_height";
    private static final String NAV_BAR_HEIGHT_LANDSCAPE_RES_NAME = "navigation_bar_height_landscape";
    private static final String SHOW_NAV_BAR_RES_NAME = "config_showNavigationBar";
    private final Dialog dialog;
    boolean mNavBarAvailable;
    int mStatusBarHeight;
    private boolean mInPortrait;
    private String sNavBarOverride;
    private float mSmallestWidthDp;

    TranslucentHelper(Dialog dialog, Context context) {
        this.dialog = dialog;
        WindowManager wm = (WindowManager) context.getSystemService("window");
        this.mInPortrait = context.getResources().getConfiguration().orientation == 1;
        try {
            Class c = Class.forName("android.os.SystemProperties");
            Method m = c.getDeclaredMethod("get", String.class);
            m.setAccessible(true);
            this.sNavBarOverride = (String) m.invoke(null, "qemu.hw.mainkeys");
        } catch (Throwable th) {
            this.sNavBarOverride = null;
        }
        int[] as = {R.attr.windowTranslucentNavigation};
        TypedArray a = context.obtainStyledAttributes(as);
        try {
            this.mNavBarAvailable = a.getBoolean(0, false);
            a.recycle();
            WindowManager.LayoutParams winParams = ((Activity) context).getWindow().getAttributes();
            if ((winParams.flags & 134217728) != 0) {
                this.mNavBarAvailable = true;
            }
            this.mSmallestWidthDp = getSmallestWidthDp(wm);
            if (this.mNavBarAvailable) {
                setTranslucentStatus(true);
            }
            this.mStatusBarHeight = getInternalDimensionSize(context.getResources(), STATUS_BAR_HEIGHT_RES_NAME);
        } catch (Throwable th2) {
            a.recycle();
            throw th2;
        }
    }

    private void setTranslucentStatus(boolean on) {
        Window win = this.dialog.getWindow();
        WindowManager.LayoutParams winParams = win.getAttributes();
        if (on) {
            winParams.flags |= 67108864;
        } else {
            winParams.flags &= -67108865;
        }
        win.setAttributes(winParams);
        win.setFlags(134217728, 134217728);
    }

    private float getSmallestWidthDp(WindowManager wm) {
        DisplayMetrics metrics = new DisplayMetrics();
        if (Build.VERSION.SDK_INT >= 16) {
            wm.getDefaultDisplay().getRealMetrics(metrics);
        } else {
            wm.getDefaultDisplay().getMetrics(metrics);
        }
        float widthDp = metrics.widthPixels / metrics.density;
        float heightDp = metrics.heightPixels / metrics.density;
        return Math.min(widthDp, heightDp);
    }

    int getNavigationBarHeight(Context context) {
        String key;
        Resources res = context.getResources();
        if (Build.VERSION.SDK_INT < 14 || !hasNavBar(context)) {
            return 0;
        }
        if (this.mInPortrait) {
            key = NAV_BAR_HEIGHT_RES_NAME;
        } else {
            if (!isNavigationAtBottom()) {
                return 0;
            }
            key = NAV_BAR_HEIGHT_LANDSCAPE_RES_NAME;
        }
        return getInternalDimensionSize(res, key);
    }

    private boolean hasNavBar(Context context) {
        Resources res = context.getResources();
        int resourceId = res.getIdentifier(SHOW_NAV_BAR_RES_NAME, "bool", "android");
        if (resourceId == 0) {
            return !ViewConfiguration.get(context).hasPermanentMenuKey();
        }
        boolean hasNav = res.getBoolean(resourceId);
        if ("1".equals(this.sNavBarOverride)) {
            hasNav = false;
        } else if ("0".equals(this.sNavBarOverride)) {
            hasNav = true;
        }
        return hasNav;
    }

    private int getInternalDimensionSize(Resources res, String key) {
        int result = 0;
        int resourceId = res.getIdentifier(key, "dimen", "android");
        if (resourceId > 0) {
            result = res.getDimensionPixelSize(resourceId);
        }
        return result;
    }

    private boolean isNavigationAtBottom() {
        return this.mSmallestWidthDp >= 600.0f || this.mInPortrait;
    }
}
