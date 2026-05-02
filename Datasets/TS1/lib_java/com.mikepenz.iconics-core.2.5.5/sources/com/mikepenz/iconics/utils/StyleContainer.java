package com.mikepenz.iconics.utils;

import android.text.ParcelableSpan;
import com.mikepenz.iconics.typeface.ITypeface;

/* loaded from: com.mikepenz.iconics-core.2.5.5.jar:com/mikepenz/iconics/utils/StyleContainer.class */
public class StyleContainer {
    public int startIndex;
    public int endIndex;
    public String icon;
    public ITypeface font;
    public ParcelableSpan styleSpan;

    public StyleContainer(int startIndex, int endIndex, String icon, ITypeface font) {
        this.startIndex = startIndex;
        this.endIndex = endIndex;
        this.icon = icon;
        this.font = font;
    }

    public StyleContainer(int startIndex, int endIndex, ParcelableSpan styleSpan) {
        this.startIndex = startIndex;
        this.endIndex = endIndex;
        this.styleSpan = styleSpan;
    }
}
