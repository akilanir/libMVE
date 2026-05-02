package com.mikepenz.iconics.utils;

import android.content.Context;
import android.text.TextUtils;
import com.mikepenz.iconics.core.BuildConfig;
import java.lang.reflect.Field;
import java.util.ArrayList;

/* loaded from: com.mikepenz.iconics-core.1.7.8.jar:com/mikepenz/iconics/utils/GenericsUtil.class */
public class GenericsUtil {
    public static String[] getFields(Context ctx) {
        Class rStringClass = resolveRClass(ctx.getPackageName());
        if (rStringClass != null) {
            return getDefinedFonts(ctx, rStringClass.getFields());
        }
        return new String[0];
    }

    private static Class resolveRClass(String packageName) {
        do {
            try {
                return Class.forName(packageName + ".R$string");
            } catch (ClassNotFoundException e) {
                packageName = packageName.contains(".") ? packageName.substring(0, packageName.lastIndexOf(46)) : BuildConfig.FLAVOR;
            }
        } while (!TextUtils.isEmpty(packageName));
        return null;
    }

    private static String[] getDefinedFonts(Context ctx, Field[] fields) {
        ArrayList<String> fieldArray = new ArrayList<>();
        for (Field field : fields) {
            if (field.getName().contains("define_font_")) {
                fieldArray.add(getStringResourceByName(ctx, field.getName()));
            }
        }
        return (String[]) fieldArray.toArray(new String[fieldArray.size()]);
    }

    private static String getStringResourceByName(Context ctx, String resourceName) {
        String packageName = ctx.getPackageName();
        int resId = ctx.getResources().getIdentifier(resourceName, "string", packageName);
        if (resId == 0) {
            return BuildConfig.FLAVOR;
        }
        return ctx.getString(resId);
    }
}
