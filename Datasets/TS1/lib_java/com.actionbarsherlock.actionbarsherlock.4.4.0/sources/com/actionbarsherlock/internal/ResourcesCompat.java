package com.actionbarsherlock.internal;

import android.app.Activity;
import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.XmlResourceParser;
import android.os.Build;
import android.util.DisplayMetrics;
import com.actionbarsherlock.R;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/ResourcesCompat.class */
public final class ResourcesCompat {
    private static final String TAG = "ResourcesCompat";

    private ResourcesCompat() {
    }

    public static boolean getResources_getBoolean(Context context, int id) {
        if (Build.VERSION.SDK_INT >= 14) {
            return context.getResources().getBoolean(id);
        }
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        float widthDp = metrics.widthPixels / metrics.density;
        float heightDp = metrics.heightPixels / metrics.density;
        float smallestWidthDp = widthDp < heightDp ? widthDp : heightDp;
        if (id == R.bool.abs__action_bar_embed_tabs) {
            if (widthDp >= 480.0f) {
                return true;
            }
            return false;
        }
        if (id == R.bool.abs__split_action_bar_is_narrow) {
            if (widthDp >= 480.0f) {
                return false;
            }
            return true;
        }
        if (id == R.bool.abs__action_bar_expanded_action_views_exclusive) {
            if (smallestWidthDp >= 600.0f) {
                return false;
            }
            return true;
        }
        if (id != R.bool.abs__config_allowActionMenuItemTextWithIcon) {
            throw new IllegalArgumentException("Unknown boolean resource ID " + id);
        }
        if (widthDp >= 480.0f) {
            return true;
        }
        return false;
    }

    public static int getResources_getInteger(Context context, int id) {
        if (Build.VERSION.SDK_INT >= 13) {
            return context.getResources().getInteger(id);
        }
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        float widthDp = metrics.widthPixels / metrics.density;
        if (id != R.integer.abs__max_action_buttons) {
            throw new IllegalArgumentException("Unknown integer resource ID " + id);
        }
        if (widthDp >= 600.0f) {
            return 5;
        }
        if (widthDp >= 500.0f) {
            return 4;
        }
        if (widthDp >= 360.0f) {
            return 3;
        }
        return 2;
    }

    public static int loadLogoFromManifest(Activity activity) {
        int logo = 0;
        try {
            String thisPackage = activity.getClass().getName();
            String packageName = activity.getApplicationInfo().packageName;
            AssetManager am = activity.createPackageContext(packageName, 0).getAssets();
            XmlResourceParser xml = am.openXmlResourceParser("AndroidManifest.xml");
            for (int eventType = xml.getEventType(); eventType != 1; eventType = xml.nextToken()) {
                if (eventType == 2) {
                    String name = xml.getName();
                    if ("application".equals(name)) {
                        int i = xml.getAttributeCount() - 1;
                        while (true) {
                            if (i < 0) {
                                break;
                            }
                            if ("logo".equals(xml.getAttributeName(i))) {
                                logo = xml.getAttributeResourceValue(i, 0);
                                break;
                            }
                            i--;
                        }
                    } else if ("activity".equals(name)) {
                        Integer activityLogo = null;
                        String activityPackage = null;
                        boolean isOurActivity = false;
                        for (int i2 = xml.getAttributeCount() - 1; i2 >= 0; i2--) {
                            String attrName = xml.getAttributeName(i2);
                            if ("logo".equals(attrName)) {
                                activityLogo = Integer.valueOf(xml.getAttributeResourceValue(i2, 0));
                            } else if ("name".equals(attrName)) {
                                activityPackage = ActionBarSherlockCompat.cleanActivityName(packageName, xml.getAttributeValue(i2));
                                if (!thisPackage.equals(activityPackage)) {
                                    break;
                                }
                                isOurActivity = true;
                            }
                            if (activityLogo != null && activityPackage != null) {
                                logo = activityLogo.intValue();
                            }
                        }
                        if (isOurActivity) {
                            break;
                        }
                    } else {
                        continue;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return logo;
    }
}
