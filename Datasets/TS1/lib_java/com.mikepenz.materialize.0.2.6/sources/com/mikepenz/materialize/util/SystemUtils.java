package com.mikepenz.materialize.util;

import android.content.res.Resources;

/* loaded from: com.mikepenz.materialize.0.2.6.jar:com/mikepenz/materialize/util/SystemUtils.class */
public class SystemUtils {
    public static int getScreenOrientation() {
        return Resources.getSystem().getConfiguration().orientation;
    }
}
