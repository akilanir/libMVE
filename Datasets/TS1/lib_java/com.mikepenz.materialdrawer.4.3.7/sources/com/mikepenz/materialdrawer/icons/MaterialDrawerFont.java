package com.mikepenz.materialdrawer.icons;

import android.content.Context;
import android.graphics.Typeface;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.iconics.typeface.ITypeface;
import com.mikepenz.materialdrawer.BuildConfig;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/icons/MaterialDrawerFont.class */
public class MaterialDrawerFont implements ITypeface {
    private static final String TTF_FILE = "materialdrawerfont.ttf";
    private static Typeface typeface = null;
    private static HashMap<String, Character> mChars;

    public IIcon getIcon(String key) {
        return Icon.valueOf(key);
    }

    public HashMap<String, Character> getCharacters() {
        if (mChars == null) {
            HashMap<String, Character> aChars = new HashMap<>();
            for (Icon v : Icon.values()) {
                aChars.put(v.name(), Character.valueOf(v.character));
            }
            mChars = aChars;
        }
        return mChars;
    }

    public String getMappingPrefix() {
        return "mdf";
    }

    public String getFontName() {
        return "MaterialDrawerFont";
    }

    public String getVersion() {
        return "4.0.0";
    }

    public int getIconCount() {
        return mChars.size();
    }

    public Collection<String> getIcons() {
        Collection<String> icons = new LinkedList<>();
        for (Icon value : Icon.values()) {
            icons.add(value.name());
        }
        return icons;
    }

    public String getAuthor() {
        return BuildConfig.FLAVOR;
    }

    public String getUrl() {
        return BuildConfig.FLAVOR;
    }

    public String getDescription() {
        return BuildConfig.FLAVOR;
    }

    public String getLicense() {
        return BuildConfig.FLAVOR;
    }

    public String getLicenseUrl() {
        return BuildConfig.FLAVOR;
    }

    public Typeface getTypeface(Context context) {
        if (typeface == null) {
            try {
                typeface = Typeface.createFromAsset(context.getAssets(), "fonts/materialdrawerfont.ttf");
            } catch (Exception e) {
                return null;
            }
        }
        return typeface;
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/icons/MaterialDrawerFont$Icon.class */
    public enum Icon implements IIcon {
        mdf_person(59392),
        mdf_arrow_drop_up(59393),
        mdf_arrow_drop_down(59394);

        char character;
        private static ITypeface typeface;

        Icon(char character) {
            this.character = character;
        }

        public String getFormattedName() {
            return "{" + name() + "}";
        }

        public char getCharacter() {
            return this.character;
        }

        public String getName() {
            return name();
        }

        public ITypeface getTypeface() {
            if (typeface == null) {
                typeface = new MaterialDrawerFont();
            }
            return typeface;
        }
    }
}
