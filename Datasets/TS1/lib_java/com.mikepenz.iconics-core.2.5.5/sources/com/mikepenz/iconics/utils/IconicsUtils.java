package com.mikepenz.iconics.utils;

import android.content.Context;
import android.text.Editable;
import android.text.ParcelableSpan;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.CharacterStyle;
import android.util.Log;
import com.mikepenz.iconics.Iconics;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.iconics.typeface.ITypeface;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* loaded from: com.mikepenz.iconics-core.2.5.5.jar:com/mikepenz/iconics/utils/IconicsUtils.class */
public class IconicsUtils {
    public static LinkedList<StyleContainer> findIconsFromEditable(Editable editable, HashMap<String, ITypeface> fonts) {
        StyleContainer styleContainer;
        LinkedList<StyleContainer> styleContainers = new LinkedList<>();
        LinkedList<StyleContainer> existingStyleContainers = new LinkedList<>();
        for (ParcelableSpan span : (ParcelableSpan[]) editable.getSpans(0, editable.length(), ParcelableSpan.class)) {
            existingStyleContainers.add(new StyleContainer(editable.getSpanStart(span), editable.getSpanEnd(span), span));
        }
        editable.clearSpans();
        int iconStart = -1;
        int i = 0;
        while (i < editable.length()) {
            Character c = Character.valueOf(editable.charAt(i));
            if (c.charValue() == '{') {
                iconStart = i;
            } else if (c.charValue() == '}') {
                if (iconStart > -1 && (styleContainer = placeFontIcon(editable, iconStart, i, fonts)) != null) {
                    styleContainers.add(styleContainer);
                    Iterator<StyleContainer> it = existingStyleContainers.iterator();
                    while (it.hasNext()) {
                        StyleContainer existingStyleContainer = it.next();
                        if (existingStyleContainer.startIndex > i) {
                            existingStyleContainer.startIndex -= i - iconStart;
                            existingStyleContainer.endIndex -= i - iconStart;
                        } else if (existingStyleContainer.endIndex > i) {
                            existingStyleContainer.endIndex -= i - iconStart;
                        }
                    }
                    i -= iconStart;
                }
                iconStart = -1;
            }
            i++;
        }
        styleContainers.addAll(existingStyleContainers);
        return styleContainers;
    }

    private static StyleContainer placeFontIcon(Editable editable, int iconStart, int iconEnd, HashMap<String, ITypeface> fonts) {
        if (iconEnd - iconStart >= 6) {
            String iconString = editable.subSequence(iconStart + 1, iconEnd).toString().replace("-", "_");
            String fontKey = editable.subSequence(iconStart + 1, iconStart + 4).toString();
            try {
                ITypeface typeface = fonts.get(fontKey);
                if (typeface != null) {
                    IIcon icon = typeface.getIcon(iconString);
                    if (icon != null) {
                        char fontChar = icon.getCharacter();
                        editable.replace(iconStart, iconEnd + 1, String.valueOf(fontChar));
                        return new StyleContainer(iconStart, iconStart + 1, iconString, fonts.get(fontKey));
                    }
                    Log.e(Iconics.TAG, "Wrong icon name: " + iconString);
                } else {
                    Log.e(Iconics.TAG, "Wrong fontId: " + iconString);
                }
                return null;
            } catch (IllegalArgumentException e) {
                Log.e(Iconics.TAG, "Wrong icon name: " + iconString);
                return null;
            }
        }
        return null;
    }

    public static TextStyleContainer findIcons(Spanned spannable, HashMap<String, ITypeface> fonts) {
        LinkedList<StyleContainer> styleContainers = new LinkedList<>();
        LinkedList<StyleContainer> existingStyleContainers = new LinkedList<>();
        for (ParcelableSpan span : (ParcelableSpan[]) spannable.getSpans(0, spannable.length(), ParcelableSpan.class)) {
            existingStyleContainers.add(new StyleContainer(spannable.getSpanStart(span), spannable.getSpanEnd(span), span));
        }
        SpannableStringBuilder spannedString = new SpannableStringBuilder();
        SpannableStringBuilder tempIconString = new SpannableStringBuilder();
        for (int i = 0; i < spannable.length(); i++) {
            Character c = Character.valueOf(spannable.charAt(i));
            if (c.charValue() == '{') {
                spannedString.append((CharSequence) tempIconString);
                tempIconString = new SpannableStringBuilder();
                tempIconString.append(c.charValue());
            } else if (c.charValue() == '}') {
                tempIconString.append(c.charValue());
                if (tempIconString.length() > 5) {
                    StyleContainer styleContainer = placeFontIcon(spannedString, tempIconString, fonts);
                    if (styleContainer != null) {
                        styleContainers.add(styleContainer);
                        Iterator<StyleContainer> it = existingStyleContainers.iterator();
                        while (it.hasNext()) {
                            StyleContainer existingStyleContainer = it.next();
                            if (existingStyleContainer.startIndex > i) {
                                existingStyleContainer.startIndex = (existingStyleContainer.startIndex - tempIconString.length()) + 1;
                            }
                            if (existingStyleContainer.endIndex > i) {
                                existingStyleContainer.endIndex = (existingStyleContainer.endIndex - tempIconString.length()) + 1;
                            }
                        }
                    }
                } else {
                    spannedString.append((CharSequence) tempIconString);
                }
                tempIconString = new SpannableStringBuilder();
            } else if (tempIconString.length() == 0) {
                spannedString.append(c.charValue());
            } else {
                tempIconString.append(c.charValue());
            }
        }
        spannedString.append((CharSequence) tempIconString);
        styleContainers.addAll(existingStyleContainers);
        return new TextStyleContainer(spannedString, styleContainers);
    }

    private static StyleContainer placeFontIcon(SpannableStringBuilder spannedString, SpannableStringBuilder tempIconString, HashMap<String, ITypeface> fonts) {
        if (tempIconString.length() >= 6) {
            String iconString = tempIconString.subSequence(1, tempIconString.length() - 1).toString().replace("-", "_");
            String fontKey = tempIconString.subSequence(1, 4).toString();
            try {
                ITypeface typeface = fonts.get(fontKey);
                if (typeface != null) {
                    IIcon icon = typeface.getIcon(iconString);
                    if (icon != null) {
                        char fontChar = icon.getCharacter();
                        spannedString.append(fontChar);
                        return new StyleContainer(spannedString.length() - 1, spannedString.length(), iconString, fonts.get(fontKey));
                    }
                    Log.e(Iconics.TAG, "Wrong icon name: " + iconString);
                } else {
                    Log.e(Iconics.TAG, "Wrong fontId: " + iconString);
                }
            } catch (IllegalArgumentException e) {
                Log.e(Iconics.TAG, "Wrong icon name: " + iconString);
            }
        }
        spannedString.append((CharSequence) tempIconString);
        return null;
    }

    public static void applyStyles(Context ctx, Spannable text, List<StyleContainer> styleContainers, List<CharacterStyle> styles, HashMap<String, List<CharacterStyle>> stylesFor) {
        for (StyleContainer styleContainer : styleContainers) {
            if (styleContainer.styleSpan != null) {
                text.setSpan(styleContainer.styleSpan, styleContainer.startIndex, styleContainer.endIndex, 33);
            } else {
                text.setSpan(new IconicsTypefaceSpan("sans-serif", styleContainer.font.getTypeface(ctx)), styleContainer.startIndex, styleContainer.endIndex, 33);
            }
            if (stylesFor != null && stylesFor.containsKey(styleContainer.icon)) {
                for (CharacterStyle style : stylesFor.get(styleContainer.icon)) {
                    text.setSpan(CharacterStyle.wrap(style), styleContainer.startIndex, styleContainer.endIndex, 33);
                }
            } else if (styles != null) {
                for (CharacterStyle style2 : styles) {
                    text.setSpan(CharacterStyle.wrap(style2), styleContainer.startIndex, styleContainer.endIndex, 33);
                }
            }
        }
    }
}
