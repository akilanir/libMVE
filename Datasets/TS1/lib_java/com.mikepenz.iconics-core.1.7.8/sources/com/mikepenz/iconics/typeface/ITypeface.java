package com.mikepenz.iconics.typeface;

import android.content.Context;
import android.graphics.Typeface;
import java.util.Collection;
import java.util.HashMap;

/* loaded from: com.mikepenz.iconics-core.1.7.8.jar:com/mikepenz/iconics/typeface/ITypeface.class */
public interface ITypeface {
    IIcon getIcon(String str);

    HashMap<String, Character> getCharacters();

    String getMappingPrefix();

    String getFontName();

    String getVersion();

    int getIconCount();

    Collection<String> getIcons();

    String getAuthor();

    String getUrl();

    String getDescription();

    String getLicense();

    String getLicenseUrl();

    Typeface getTypeface(Context context);
}
