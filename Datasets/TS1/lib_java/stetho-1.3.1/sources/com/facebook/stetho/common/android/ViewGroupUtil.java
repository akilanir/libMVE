package com.facebook.stetho.common.android;

import android.view.View;
import android.view.ViewGroup;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/ViewGroupUtil.class */
public final class ViewGroupUtil {
    private ViewGroupUtil() {
    }

    public static int findChildIndex(ViewGroup parent, View child) {
        int count = parent.getChildCount();
        for (int i = 0; i < count; i++) {
            if (parent.getChildAt(i) == child) {
                return i;
            }
        }
        return -1;
    }
}
