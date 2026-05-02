package com.wdullaer.materialdatetimepicker;

import android.content.Context;
import android.graphics.Typeface;
import android.support.v4.util.SimpleArrayMap;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/TypefaceHelper.class */
public class TypefaceHelper {
    private static final SimpleArrayMap<String, Typeface> cache = new SimpleArrayMap<>();

    public static Typeface get(Context c, String name) {
        synchronized (cache) {
            if (!cache.containsKey(name)) {
                Typeface t = Typeface.createFromAsset(c.getAssets(), String.format("fonts/%s.ttf", name));
                cache.put(name, t);
                return t;
            }
            return (Typeface) cache.get(name);
        }
    }
}
