package com.gc.materialdesign.utils;

import android.content.res.Resources;
import android.util.TypedValue;
import android.view.View;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/utils/Utils.class */
public class Utils {
    public static int dpToPx(float dp, Resources resources) {
        float px = TypedValue.applyDimension(1, dp, resources.getDisplayMetrics());
        return (int) px;
    }

    public static int getRelativeTop(View myView) {
        if (myView.getId() == 16908290) {
            return myView.getTop();
        }
        return myView.getTop() + getRelativeTop((View) myView.getParent());
    }

    public static int getRelativeLeft(View myView) {
        if (myView.getId() == 16908290) {
            return myView.getLeft();
        }
        return myView.getLeft() + getRelativeLeft((View) myView.getParent());
    }
}
