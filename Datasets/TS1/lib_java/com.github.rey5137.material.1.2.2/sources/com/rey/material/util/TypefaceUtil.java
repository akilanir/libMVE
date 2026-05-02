package com.rey.material.util;

import android.content.Context;
import android.graphics.Typeface;
import java.util.HashMap;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/util/TypefaceUtil.class */
public class TypefaceUtil {
    private static final HashMap<String, Typeface> sCachedFonts = new HashMap<>();
    private static final String PREFIX_ASSET = "asset:";

    private TypefaceUtil() {
    }

    public static Typeface load(Context context, String familyName, int style) {
        if (familyName != null && familyName.startsWith(PREFIX_ASSET)) {
            synchronized (sCachedFonts) {
                try {
                    if (!sCachedFonts.containsKey(familyName)) {
                        Typeface typeface = Typeface.createFromAsset(context.getAssets(), familyName.substring(PREFIX_ASSET.length()));
                        sCachedFonts.put(familyName, typeface);
                        return typeface;
                    }
                    return sCachedFonts.get(familyName);
                } catch (Exception e) {
                    return Typeface.DEFAULT;
                }
            }
        }
        return Typeface.create(familyName, style);
    }
}
