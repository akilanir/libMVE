package org.piwik.sdk.tools;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import java.lang.reflect.Method;
import java.util.Locale;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.2.jar:org/piwik/sdk/tools/DeviceHelper.class */
public class DeviceHelper {
    private static final String LOGGER_TAG = "PIWIK:DeviceHelper";

    public static String getUserLanguage() {
        return Locale.getDefault().getLanguage();
    }

    public static String getUserCountry() {
        return Locale.getDefault().getCountry();
    }

    public static String getUserAgent() {
        return System.getProperty("http.agent");
    }

    @TargetApi(17)
    public static int[] getResolution(Context context) {
        int width = -1;
        int height = -1;
        try {
            WindowManager wm = (WindowManager) context.getSystemService("window");
            Display display = wm.getDefaultDisplay();
            if (Build.VERSION.SDK_INT >= 17) {
                DisplayMetrics dm = new DisplayMetrics();
                display.getRealMetrics(dm);
                width = dm.widthPixels;
                height = dm.heightPixels;
            } else if (Build.VERSION.SDK_INT >= 14) {
                try {
                    Method getRawWidth = Display.class.getMethod("getRawWidth", new Class[0]);
                    Method getRawHeight = Display.class.getMethod("getRawHeight", new Class[0]);
                    width = ((Integer) getRawWidth.invoke(display, new Object[0])).intValue();
                    height = ((Integer) getRawHeight.invoke(display, new Object[0])).intValue();
                } catch (Exception e) {
                    Logy.w(LOGGER_TAG, "Reflection of getRawWidth/getRawHeight failed on API14-16 unexpectedly.");
                }
            }
            if (width == -1 || height == -1) {
                DisplayMetrics dm2 = new DisplayMetrics();
                display.getMetrics(dm2);
                width = dm2.widthPixels;
                height = dm2.heightPixels;
            }
            return new int[]{width, height};
        } catch (NullPointerException e2) {
            Logy.e(LOGGER_TAG, "Window service was not available from this context");
            return null;
        }
    }
}
