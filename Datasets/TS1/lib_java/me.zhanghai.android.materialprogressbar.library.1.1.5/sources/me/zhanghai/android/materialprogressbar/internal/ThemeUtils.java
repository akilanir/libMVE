package me.zhanghai.android.materialprogressbar.internal;

import android.content.Context;
import android.content.res.TypedArray;

/* loaded from: me.zhanghai.android.materialprogressbar.library.1.1.5.jar:me/zhanghai/android/materialprogressbar/internal/ThemeUtils.class */
public class ThemeUtils {
    private ThemeUtils() {
    }

    public static int getColorFromAttrRes(int attr, Context context) {
        TypedArray a = context.obtainStyledAttributes(new int[]{attr});
        try {
            int color = a.getColor(0, 0);
            a.recycle();
            return color;
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    public static float getFloatFromAttrRes(int attrRes, Context context) {
        TypedArray a = context.obtainStyledAttributes(new int[]{attrRes});
        try {
            float f = a.getFloat(0, 0.0f);
            a.recycle();
            return f;
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }
}
