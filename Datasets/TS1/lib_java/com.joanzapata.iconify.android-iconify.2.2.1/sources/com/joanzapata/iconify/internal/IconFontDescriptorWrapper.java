package com.joanzapata.iconify.internal;

import android.content.Context;
import android.graphics.Typeface;
import com.joanzapata.iconify.Icon;
import com.joanzapata.iconify.IconFontDescriptor;
import java.util.HashMap;
import java.util.Map;

/* loaded from: com.joanzapata.iconify.android-iconify.2.2.1.jar:com/joanzapata/iconify/internal/IconFontDescriptorWrapper.class */
public class IconFontDescriptorWrapper {
    private final IconFontDescriptor iconFontDescriptor;
    private final Map<String, Icon> iconsByKey = new HashMap();
    private Typeface cachedTypeface;

    public IconFontDescriptorWrapper(IconFontDescriptor iconFontDescriptor) {
        this.iconFontDescriptor = iconFontDescriptor;
        Icon[] characters = iconFontDescriptor.characters();
        for (Icon icon : characters) {
            this.iconsByKey.put(icon.key(), icon);
        }
    }

    public Icon getIcon(String key) {
        return this.iconsByKey.get(key);
    }

    public IconFontDescriptor getIconFontDescriptor() {
        return this.iconFontDescriptor;
    }

    public Typeface getTypeface(Context context) {
        if (this.cachedTypeface != null) {
            return this.cachedTypeface;
        }
        synchronized (this) {
            if (this.cachedTypeface != null) {
                return this.cachedTypeface;
            }
            this.cachedTypeface = Typeface.createFromAsset(context.getAssets(), this.iconFontDescriptor.ttfFileName());
            return this.cachedTypeface;
        }
    }

    public boolean hasIcon(Icon icon) {
        return this.iconsByKey.values().contains(icon);
    }
}
