package com.mikepenz.iconics;

import android.content.Context;
import android.os.Build;
import android.text.Editable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.CharacterStyle;
import android.util.Log;
import android.widget.Button;
import android.widget.TextView;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.iconics.typeface.ITypeface;
import com.mikepenz.iconics.utils.GenericsUtil;
import com.mikepenz.iconics.utils.IconicsUtils;
import com.mikepenz.iconics.utils.StyleContainer;
import com.mikepenz.iconics.utils.TextStyleContainer;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

/* loaded from: com.mikepenz.iconics-core.2.5.5.jar:com/mikepenz/iconics/Iconics.class */
public final class Iconics {
    public static final String TAG = Iconics.class.getSimpleName();
    private static boolean INIT_DONE = false;
    private static HashMap<String, ITypeface> FONTS = new HashMap<>();

    public static void init(Context ctx) {
        if (!INIT_DONE) {
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
    }

    private static HashMap<String, ITypeface> init(Context ctx, HashMap<String, ITypeface> fonts) {
        init(ctx);
        if (fonts == null || fonts.size() == 0) {
            fonts = FONTS;
        }
        return fonts;
    }

    public static boolean registerFont(ITypeface font) {
        FONTS.put(font.getMappingPrefix(), font);
        return true;
    }

    public static Collection<ITypeface> getRegisteredFonts(Context ctx) {
        init(ctx);
        return FONTS.values();
    }

    public static ITypeface findFont(Context ctx, String key) {
        init(ctx);
        return FONTS.get(key);
    }

    public static ITypeface findFont(IIcon icon) {
        return icon.getTypeface();
    }

    private Iconics() {
    }

    public static Spanned style(Context ctx, Spanned textSpanned) {
        return style(ctx, null, textSpanned, null, null);
    }

    public static Spanned style(Context ctx, HashMap<String, ITypeface> fonts, Spanned textSpanned, List<CharacterStyle> styles, HashMap<String, List<CharacterStyle>> stylesFor) {
        TextStyleContainer textStyleContainer = IconicsUtils.findIcons(textSpanned, init(ctx, fonts));
        SpannableString sb = SpannableString.valueOf(textStyleContainer.spannableStringBuilder);
        IconicsUtils.applyStyles(ctx, sb, textStyleContainer.styleContainers, styles, stylesFor);
        return sb;
    }

    public static void styleEditable(Context ctx, Editable editable) {
        styleEditable(ctx, null, editable, null, null);
    }

    public static void styleEditable(Context ctx, HashMap<String, ITypeface> fonts, Editable textSpanned, List<CharacterStyle> styles, HashMap<String, List<CharacterStyle>> stylesFor) {
        List<StyleContainer> styleContainers = IconicsUtils.findIconsFromEditable(textSpanned, init(ctx, fonts));
        IconicsUtils.applyStyles(ctx, textSpanned, styleContainers, styles, stylesFor);
    }

    /* loaded from: com.mikepenz.iconics-core.2.5.5.jar:com/mikepenz/iconics/Iconics$IconicsBuilderString.class */
    public static class IconicsBuilderString {
        private Context ctx;
        private Spanned text;
        private List<CharacterStyle> withStyles;
        private HashMap<String, List<CharacterStyle>> withStylesFor;
        private List<ITypeface> fonts;

        public IconicsBuilderString(Context ctx, List<ITypeface> fonts, Spanned text, List<CharacterStyle> styles, HashMap<String, List<CharacterStyle>> stylesFor) {
            this.ctx = ctx;
            this.fonts = fonts;
            this.text = text;
            this.withStyles = styles;
            this.withStylesFor = stylesFor;
        }

        public Spanned build() {
            HashMap<String, ITypeface> mappedFonts = new HashMap<>();
            for (ITypeface font : this.fonts) {
                mappedFonts.put(font.getMappingPrefix(), font);
            }
            return Iconics.style(this.ctx, mappedFonts, this.text, this.withStyles, this.withStylesFor);
        }
    }

    /* loaded from: com.mikepenz.iconics-core.2.5.5.jar:com/mikepenz/iconics/Iconics$IconicsBuilderView.class */
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
            if (this.view.getText() instanceof Spanned) {
                this.view.setText(Iconics.style(this.ctx, mappedFonts, (Spanned) this.view.getText(), this.withStyles, this.withStylesFor));
            } else {
                this.view.setText(Iconics.style(this.ctx, mappedFonts, new SpannableString(this.view.getText()), this.withStyles, this.withStylesFor));
            }
            if (Build.VERSION.SDK_INT >= 14 && (this.view instanceof Button)) {
                this.view.setAllCaps(false);
            }
        }
    }

    /* loaded from: com.mikepenz.iconics-core.2.5.5.jar:com/mikepenz/iconics/Iconics$IconicsBuilder.class */
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

        public IconicsBuilderString on(Spanned on) {
            return new IconicsBuilderString(this.ctx, this.fonts, on, this.styles, this.stylesFor);
        }

        public IconicsBuilderString on(String on) {
            return on((Spanned) new SpannableString(on));
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
}
