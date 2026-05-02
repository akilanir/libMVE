package com.mikepenz.iconics;

import android.content.Context;
import android.os.Build;
import android.text.SpannableString;
import android.text.style.CharacterStyle;
import android.text.style.StyleSpan;
import android.util.Log;
import android.widget.Button;
import android.widget.TextView;
import com.mikepenz.iconics.core.BuildConfig;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.iconics.typeface.ITypeface;
import com.mikepenz.iconics.utils.GenericsUtil;
import com.mikepenz.iconics.utils.IconicsTypefaceSpan;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* loaded from: com.mikepenz.iconics-core.1.7.8.jar:com/mikepenz/iconics/Iconics.class */
public final class Iconics {
    public static final String TAG = Iconics.class.getSimpleName();
    private static boolean INIT_DONE = false;
    private static HashMap<String, ITypeface> FONTS = new HashMap<>();

    public static void init(Context ctx) {
        String[] fonts = GenericsUtil.getFields(ctx);
        for (String fontsClassPath : fonts) {
            try {
                ITypeface typeface = (ITypeface) Class.forName(fontsClassPath).newInstance();
                FONTS.put(typeface.getMappingPrefix(), typeface);
            } catch (Exception e) {
                Log.e("Android-Iconics", "Can't init: " + fontsClassPath);
            }
        }
        INIT_DONE = true;
    }

    public static boolean registerFont(ITypeface font) {
        FONTS.put(font.getMappingPrefix(), font);
        return true;
    }

    public static Collection<ITypeface> getRegisteredFonts(Context ctx) {
        if (!INIT_DONE) {
            init(ctx);
        }
        return FONTS.values();
    }

    public static ITypeface findFont(Context ctx, String key) {
        if (!INIT_DONE) {
            init(ctx);
        }
        return FONTS.get(key);
    }

    public static ITypeface findFont(IIcon icon) {
        return icon.getTypeface();
    }

    private Iconics() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static SpannableString style(Context ctx, HashMap<String, ITypeface> fonts, SpannableString textSpanned, List<CharacterStyle> styles, HashMap<String, List<CharacterStyle>> stylesFor) {
        if (!INIT_DONE) {
            init(ctx);
        }
        if (fonts == null || fonts.size() == 0) {
            fonts = FONTS;
        }
        int startIndex = -1;
        String fontKey = BuildConfig.FLAVOR;
        ArrayList<RemoveInfo> removed = new ArrayList<>();
        StringBuilder text = new StringBuilder(textSpanned);
        while (true) {
            int indexOf = text.indexOf("{", startIndex + 1);
            startIndex = indexOf;
            if (indexOf == -1) {
                break;
            }
            if (text.length() < startIndex + 5) {
                startIndex = -1;
                break;
            }
            if (!text.substring(startIndex + 4, startIndex + 5).equals("-")) {
                break;
            }
            fontKey = text.substring(startIndex + 1, startIndex + 4).toLowerCase();
            if (fonts.containsKey(fontKey)) {
                break;
            }
        }
        if (startIndex == -1) {
            return new SpannableString(text);
        }
        int removedChars = 0;
        LinkedList<StyleContainer> styleContainers = new LinkedList<>();
        do {
            int endIndex = text.substring(startIndex).indexOf("}") + startIndex + 1;
            String iconString = text.substring(startIndex + 1, endIndex - 1).replaceAll("-", "_").toLowerCase();
            try {
                ITypeface typeface = fonts.get(fontKey);
                if (typeface != null) {
                    IIcon icon = typeface.getIcon(iconString);
                    if (icon != null) {
                        char fontChar = icon.getCharacter();
                        String iconValue = String.valueOf(fontChar);
                        text = text.replace(startIndex, endIndex, iconValue);
                        removedChars += endIndex - startIndex;
                        removed.add(new RemoveInfo(startIndex, (endIndex - startIndex) - 1, removedChars));
                        styleContainers.add(new StyleContainer(startIndex, startIndex + 1, iconString, fonts.get(fontKey)));
                    } else {
                        Log.e(TAG, "Wrong icon name: " + iconString);
                    }
                } else {
                    Log.e(TAG, "Wrong fontId: " + iconString);
                }
            } catch (IllegalArgumentException e) {
                Log.e(TAG, "Wrong icon name: " + iconString);
            }
            fontKey = null;
            while (true) {
                int indexOf2 = text.indexOf("{", startIndex + 1);
                startIndex = indexOf2;
                if (indexOf2 == -1) {
                    break;
                }
                if (text.length() < startIndex + 5) {
                    startIndex = -1;
                    break;
                }
                if (text.substring(startIndex + 4, startIndex + 5).equals("-")) {
                    fontKey = text.substring(startIndex + 1, startIndex + 4);
                    if (fonts.containsKey(fontKey)) {
                        break;
                    }
                }
            }
            if (startIndex == -1) {
                break;
            }
        } while (fontKey != null);
        SpannableString sb = new SpannableString(text);
        for (StyleSpan span : (StyleSpan[]) textSpanned.getSpans(0, textSpanned.length(), StyleSpan.class)) {
            int spanStart = newSpanPoint(textSpanned.getSpanStart(span), removed);
            int spanEnd = newSpanPoint(textSpanned.getSpanEnd(span), removed);
            if (spanStart >= 0 && spanEnd > 0) {
                sb.setSpan(span, spanStart, spanEnd, textSpanned.getSpanFlags(span));
            }
        }
        Iterator<StyleContainer> it = styleContainers.iterator();
        while (it.hasNext()) {
            StyleContainer styleContainer = it.next();
            sb.setSpan(new IconicsTypefaceSpan("sans-serif", styleContainer.getFont().getTypeface(ctx)), styleContainer.getStartIndex(), styleContainer.getEndIndex(), 33);
            if (stylesFor.containsKey(styleContainer.getIcon())) {
                for (CharacterStyle style : stylesFor.get(styleContainer.getIcon())) {
                    sb.setSpan(CharacterStyle.wrap(style), styleContainer.getStartIndex(), styleContainer.getEndIndex(), 33);
                }
            } else if (styles != null) {
                for (CharacterStyle style2 : styles) {
                    sb.setSpan(CharacterStyle.wrap(style2), styleContainer.getStartIndex(), styleContainer.getEndIndex(), 33);
                }
            }
        }
        return sb;
    }

    private static int newSpanPoint(int pos, ArrayList<RemoveInfo> removed) {
        Iterator<RemoveInfo> it = removed.iterator();
        while (it.hasNext()) {
            RemoveInfo removeInfo = it.next();
            if (pos < removeInfo.getStart()) {
                return pos;
            }
            pos -= removeInfo.getCount();
        }
        return pos;
    }

    private static int determineNewSpanPoint(int pos, ArrayList<RemoveInfo> removed) {
        Iterator<RemoveInfo> it = removed.iterator();
        while (it.hasNext()) {
            RemoveInfo removeInfo = it.next();
            if (pos <= removeInfo.getStart()) {
                if (pos > removeInfo.getStart() && pos < removeInfo.getStart() + removeInfo.getCount()) {
                    return -1;
                }
                if (pos < removeInfo.getStart()) {
                    return pos;
                }
                return pos - removeInfo.getTotal();
            }
        }
        return -1;
    }

    /* loaded from: com.mikepenz.iconics-core.1.7.8.jar:com/mikepenz/iconics/Iconics$IconicsBuilderString.class */
    public static class IconicsBuilderString {
        private Context ctx;
        private SpannableString text;
        private List<CharacterStyle> withStyles;
        private HashMap<String, List<CharacterStyle>> withStylesFor;
        private List<ITypeface> fonts;

        public IconicsBuilderString(Context ctx, List<ITypeface> fonts, SpannableString text, List<CharacterStyle> styles, HashMap<String, List<CharacterStyle>> stylesFor) {
            this.ctx = ctx;
            this.fonts = fonts;
            this.text = text;
            this.withStyles = styles;
            this.withStylesFor = stylesFor;
        }

        public SpannableString build() {
            HashMap<String, ITypeface> mappedFonts = new HashMap<>();
            for (ITypeface font : this.fonts) {
                mappedFonts.put(font.getMappingPrefix(), font);
            }
            return Iconics.style(this.ctx, mappedFonts, this.text, this.withStyles, this.withStylesFor);
        }
    }

    /* loaded from: com.mikepenz.iconics-core.1.7.8.jar:com/mikepenz/iconics/Iconics$IconicsBuilderView.class */
    public static class IconicsBuilderView {
        private Context ctx;
        private TextView view;
        private List<CharacterStyle> withStyles;
        private HashMap<String, List<CharacterStyle>> withStylesFor;
        private List<ITypeface> fonts;

        public IconicsBuilderView(Context ctx, List<ITypeface> fonts, TextView view, List<CharacterStyle> styles, HashMap<String, List<CharacterStyle>> stylesFor) {
            this.ctx = ctx;
            this.fonts = fonts;
            this.view = view;
            this.withStyles = styles;
            this.withStylesFor = stylesFor;
        }

        public void build() {
            HashMap<String, ITypeface> mappedFonts = new HashMap<>();
            for (ITypeface font : this.fonts) {
                mappedFonts.put(font.getMappingPrefix(), font);
            }
            if (this.view.getText() instanceof SpannableString) {
                this.view.setText(Iconics.style(this.ctx, mappedFonts, (SpannableString) this.view.getText(), this.withStyles, this.withStylesFor));
            } else {
                this.view.setText(Iconics.style(this.ctx, mappedFonts, new SpannableString(this.view.getText()), this.withStyles, this.withStylesFor));
            }
            if (Build.VERSION.SDK_INT >= 14 && (this.view instanceof Button)) {
                this.view.setAllCaps(false);
            }
        }
    }

    /* loaded from: com.mikepenz.iconics-core.1.7.8.jar:com/mikepenz/iconics/Iconics$IconicsBuilder.class */
    public static class IconicsBuilder {
        private List<CharacterStyle> styles = new LinkedList();
        private HashMap<String, List<CharacterStyle>> stylesFor = new HashMap<>();
        private List<ITypeface> fonts = new LinkedList();
        private Context ctx;

        public IconicsBuilder ctx(Context ctx) {
            this.ctx = ctx;
            return this;
        }

        public IconicsBuilder style(CharacterStyle... styles) {
            if (styles != null && styles.length > 0) {
                Collections.addAll(this.styles, styles);
            }
            return this;
        }

        public IconicsBuilder styleFor(IIcon styleFor, CharacterStyle... styles) {
            return styleFor(styleFor.getName(), styles);
        }

        public IconicsBuilder styleFor(String styleFor, CharacterStyle... styles) {
            String styleFor2 = styleFor.replace("-", "_");
            if (!this.stylesFor.containsKey(styleFor2)) {
                this.stylesFor.put(styleFor2, new LinkedList());
            }
            if (styles != null && styles.length > 0) {
                for (CharacterStyle style : styles) {
                    this.stylesFor.get(styleFor2).add(style);
                }
            }
            return this;
        }

        public IconicsBuilder font(ITypeface font) {
            this.fonts.add(font);
            return this;
        }

        public IconicsBuilderString on(SpannableString on) {
            return new IconicsBuilderString(this.ctx, this.fonts, on, this.styles, this.stylesFor);
        }

        public IconicsBuilderString on(String on) {
            return on(new SpannableString(on));
        }

        public IconicsBuilderString on(CharSequence on) {
            return on(on.toString());
        }

        public IconicsBuilderString on(StringBuilder on) {
            return on(on.toString());
        }

        public IconicsBuilderView on(TextView on) {
            return new IconicsBuilderView(this.ctx, this.fonts, on, this.styles, this.stylesFor);
        }

        public IconicsBuilderView on(Button on) {
            return new IconicsBuilderView(this.ctx, this.fonts, on, this.styles, this.stylesFor);
        }
    }

    /* loaded from: com.mikepenz.iconics-core.1.7.8.jar:com/mikepenz/iconics/Iconics$StyleContainer.class */
    private static class StyleContainer {
        private int startIndex;
        private int endIndex;
        private String icon;
        private ITypeface font;

        private StyleContainer(int startIndex, int endIndex, String icon, ITypeface font) {
            this.startIndex = startIndex;
            this.endIndex = endIndex;
            this.icon = icon;
            this.font = font;
        }

        public int getStartIndex() {
            return this.startIndex;
        }

        public int getEndIndex() {
            return this.endIndex;
        }

        public String getIcon() {
            return this.icon;
        }

        public ITypeface getFont() {
            return this.font;
        }
    }

    /* loaded from: com.mikepenz.iconics-core.1.7.8.jar:com/mikepenz/iconics/Iconics$RemoveInfo.class */
    private static class RemoveInfo {
        private int start;
        private int count;
        private int total;

        public RemoveInfo(int start, int count) {
            this.start = start;
            this.count = count;
        }

        public RemoveInfo(int start, int count, int total) {
            this.start = start;
            this.count = count;
            this.total = total;
        }

        public int getStart() {
            return this.start;
        }

        public void setStart(int start) {
            this.start = start;
        }

        public int getCount() {
            return this.count;
        }

        public void setCount(int count) {
            this.count = count;
        }

        public int getTotal() {
            return this.total;
        }

        public void setTotal(int total) {
            this.total = total;
        }
    }
}
