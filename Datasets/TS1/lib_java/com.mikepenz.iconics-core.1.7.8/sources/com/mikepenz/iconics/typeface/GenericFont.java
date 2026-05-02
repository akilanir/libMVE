package com.mikepenz.iconics.typeface;

import android.content.Context;
import android.graphics.Typeface;
import com.mikepenz.iconics.core.BuildConfig;
import java.util.Collection;
import java.util.HashMap;

/* loaded from: com.mikepenz.iconics-core.1.7.8.jar:com/mikepenz/iconics/typeface/GenericFont.class */
public class GenericFont implements ITypeface {
    private String mMappingPrefix;
    private String mFontFile;
    private Typeface typeface = null;
    private HashMap<String, Character> mChars = new HashMap<>();

    protected GenericFont() {
    }

    public GenericFont(String mappingPrefix, String fontFile) {
        this.mMappingPrefix = mappingPrefix;
        this.mFontFile = fontFile;
    }

    public void registerIcon(String name, char aChar) {
        this.mChars.put(this.mMappingPrefix + "_" + name, Character.valueOf(aChar));
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public IIcon getIcon(String key) {
        return new Icon(this.mChars.get(key).charValue()).withTypeface(this);
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public HashMap<String, Character> getCharacters() {
        return new HashMap<>();
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public String getMappingPrefix() {
        return this.mMappingPrefix;
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public String getFontName() {
        return "GenericFont";
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public String getVersion() {
        return "1.0.0";
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public int getIconCount() {
        return this.mChars.size();
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public Collection<String> getIcons() {
        return this.mChars.keySet();
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public String getAuthor() {
        return BuildConfig.FLAVOR;
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public String getUrl() {
        return BuildConfig.FLAVOR;
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public String getDescription() {
        return BuildConfig.FLAVOR;
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public String getLicense() {
        return BuildConfig.FLAVOR;
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public String getLicenseUrl() {
        return BuildConfig.FLAVOR;
    }

    @Override // com.mikepenz.iconics.typeface.ITypeface
    public Typeface getTypeface(Context context) {
        if (this.typeface == null) {
            try {
                this.typeface = Typeface.createFromAsset(context.getAssets(), this.mFontFile);
            } catch (Exception e) {
                return null;
            }
        }
        return this.typeface;
    }

    /* loaded from: com.mikepenz.iconics-core.1.7.8.jar:com/mikepenz/iconics/typeface/GenericFont$Icon.class */
    public class Icon implements IIcon {
        private String mName;
        private char aChar;
        private ITypeface mTypeface;

        public Icon(char c) {
            this.aChar = c;
        }

        public Icon(String name, char c) {
            this.mName = name;
            this.aChar = c;
        }

        public Icon withTypeface(ITypeface typeface) {
            this.mTypeface = typeface;
            return this;
        }

        @Override // com.mikepenz.iconics.typeface.IIcon
        public String getFormattedName() {
            return "{" + getName() + "}";
        }

        @Override // com.mikepenz.iconics.typeface.IIcon
        public String getName() {
            if (this.mName != null) {
                return this.mName;
            }
            return String.valueOf(this.aChar);
        }

        @Override // com.mikepenz.iconics.typeface.IIcon
        public char getCharacter() {
            return this.aChar;
        }

        @Override // com.mikepenz.iconics.typeface.IIcon
        public ITypeface getTypeface() {
            if (this.mTypeface != null) {
                return this.mTypeface;
            }
            return GenericFont.this;
        }
    }
}
