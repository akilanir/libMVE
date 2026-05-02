package com.mikepenz.iconics.utils;

import android.text.SpannableStringBuilder;
import java.util.LinkedList;

/* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/utils/TextStyleContainer.class */
public class TextStyleContainer {
    public SpannableStringBuilder spannableStringBuilder;
    public LinkedList<StyleContainer> styleContainers;

    public TextStyleContainer(SpannableStringBuilder spannableStringBuilder, LinkedList<StyleContainer> styleContainers) {
        this.spannableStringBuilder = spannableStringBuilder;
        this.styleContainers = styleContainers;
    }
}
