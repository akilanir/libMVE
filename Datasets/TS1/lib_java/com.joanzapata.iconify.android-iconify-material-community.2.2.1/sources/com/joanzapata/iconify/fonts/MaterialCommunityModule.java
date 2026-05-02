package com.joanzapata.iconify.fonts;

import com.joanzapata.iconify.Icon;
import com.joanzapata.iconify.IconFontDescriptor;

/* loaded from: com.joanzapata.iconify.android-iconify-material-community.2.2.1.jar:com/joanzapata/iconify/fonts/MaterialCommunityModule.class */
public class MaterialCommunityModule implements IconFontDescriptor {
    public String ttfFileName() {
        return "iconify/android-iconify-material-community.ttf";
    }

    public Icon[] characters() {
        return MaterialCommunityIcons.values();
    }
}
