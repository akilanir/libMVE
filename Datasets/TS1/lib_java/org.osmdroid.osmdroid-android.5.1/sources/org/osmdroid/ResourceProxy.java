package org.osmdroid;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/ResourceProxy.class */
public interface ResourceProxy {

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/ResourceProxy$bitmap.class */
    public enum bitmap {
        unknown,
        center,
        direction_arrow,
        marker_default,
        marker_default_focused_base,
        navto_small,
        next,
        previous,
        person,
        ic_menu_offline,
        ic_menu_mylocation,
        ic_menu_compass,
        ic_menu_mapmode
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/ResourceProxy$string.class */
    public enum string {
        unknown,
        format_distance_meters,
        format_distance_kilometers,
        format_distance_miles,
        format_distance_nautical_miles,
        format_distance_feet,
        online_mode,
        offline_mode,
        my_location,
        compass,
        map_mode
    }

    String getString(string stringVar);

    String getString(string stringVar, Object... objArr);

    Bitmap getBitmap(bitmap bitmapVar);

    Drawable getDrawable(bitmap bitmapVar);

    @Deprecated
    float getDisplayMetricsDensity();

    DisplayMetrics getDisplayMetrics();
}
