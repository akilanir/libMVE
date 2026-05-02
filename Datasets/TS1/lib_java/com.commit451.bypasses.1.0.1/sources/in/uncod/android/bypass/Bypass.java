package in.uncod.android.bypass;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ImageSpan;
import android.text.style.LeadingMarginSpan;
import android.text.style.QuoteSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.text.style.URLSpan;
import android.util.DisplayMetrics;
import android.util.Patterns;
import android.util.TypedValue;
import in.uncod.android.bypass.Element;
import in.uncod.android.bypass.style.HorizontalLineSpan;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: com.commit451.bypasses.1.0.1.jar:in/uncod/android/bypass/Bypass.class */
public class Bypass {
    private final Options mOptions;
    private final int mListItemIndent;
    private final int mBlockQuoteIndent;
    private final int mCodeBlockIndent;
    private final int mHruleSize;
    private final int mHruleTopBottomPadding;
    private final Map<Element, Integer> mOrderedListNumber;

    /* loaded from: com.commit451.bypasses.1.0.1.jar:in/uncod/android/bypass/Bypass$ImageGetter.class */
    public interface ImageGetter {
        Drawable getDrawable(String str);
    }

    private native Document processMarkdown(String str);

    static {
        System.loadLibrary("bypass");
    }

    @Deprecated
    public Bypass() {
        this.mOrderedListNumber = new ConcurrentHashMap();
        this.mOptions = new Options();
        this.mListItemIndent = 20;
        this.mBlockQuoteIndent = 10;
        this.mCodeBlockIndent = 10;
        this.mHruleSize = 2;
        this.mHruleTopBottomPadding = 20;
    }

    public Bypass(Context context) {
        this(context, new Options());
    }

    public Bypass(Context context, Options options) {
        this.mOrderedListNumber = new ConcurrentHashMap();
        this.mOptions = options;
        DisplayMetrics dm = context.getResources().getDisplayMetrics();
        this.mListItemIndent = (int) TypedValue.applyDimension(this.mOptions.mListItemIndentUnit, this.mOptions.mListItemIndentSize, dm);
        this.mBlockQuoteIndent = (int) TypedValue.applyDimension(this.mOptions.mBlockQuoteIndentUnit, this.mOptions.mBlockQuoteIndentSize, dm);
        this.mCodeBlockIndent = (int) TypedValue.applyDimension(this.mOptions.mCodeBlockIndentUnit, this.mOptions.mCodeBlockIndentSize, dm);
        this.mHruleSize = (int) TypedValue.applyDimension(this.mOptions.mHruleUnit, this.mOptions.mHruleSize, dm);
        this.mHruleTopBottomPadding = ((int) dm.density) * 10;
    }

    public CharSequence markdownToSpannable(String markdown) {
        return markdownToSpannable(markdown, null);
    }

    public CharSequence markdownToSpannable(String markdown, ImageGetter imageGetter) {
        Document document = processMarkdown(markdown);
        int size = document.getElementCount();
        CharSequence[] spans = new CharSequence[size];
        for (int i = 0; i < size; i++) {
            spans[i] = recurseElement(document.getElement(i), i, size, imageGetter);
        }
        return TextUtils.concat(spans);
    }

    private CharSequence recurseElement(Element element, int indexWithinParent, int numberOfSiblings, ImageGetter imageGetter) {
        String flagsStr;
        Element.Type type = element.getType();
        boolean isOrderedList = false;
        if (type == Element.Type.LIST && (flagsStr = element.getAttribute("flags")) != null) {
            int flags = Integer.parseInt(flagsStr);
            isOrderedList = (flags & 1) != 0;
            if (isOrderedList) {
                this.mOrderedListNumber.put(element, 1);
            }
        }
        int size = element.size();
        CharSequence[] spans = new CharSequence[size];
        for (int i = 0; i < size; i++) {
            spans[i] = recurseElement(element.children[i], i, size, imageGetter);
        }
        if (isOrderedList) {
            this.mOrderedListNumber.remove(this);
        }
        CharSequence concat = TextUtils.concat(spans);
        SpannableStringBuilder builder = new ReverseSpannableStringBuilder();
        String text = element.getText();
        if (element.size() == 0 && element.getParent() != null && element.getParent().getType() != Element.Type.BLOCK_CODE) {
            text = text.replace('\n', ' ');
        }
        Drawable imageDrawable = null;
        if (type == Element.Type.IMAGE && imageGetter != null && !TextUtils.isEmpty(element.getAttribute("link"))) {
            imageDrawable = imageGetter.getDrawable(element.getAttribute("link"));
        }
        switch (AnonymousClass1.$SwitchMap$in$uncod$android$bypass$Element$Type[type.ordinal()]) {
            case Element.F_LIST_ORDERED /* 1 */:
                if (element.getParent() != null && element.getParent().getType() == Element.Type.LIST_ITEM) {
                    builder.append("\n");
                    break;
                }
                break;
            case 2:
                builder.append("\n");
                break;
            case 3:
                builder.append(" ");
                if (this.mOrderedListNumber.containsKey(element.getParent())) {
                    int number = this.mOrderedListNumber.get(element.getParent()).intValue();
                    builder.append(Integer.toString(number) + ".");
                    this.mOrderedListNumber.put(element.getParent(), Integer.valueOf(number + 1));
                } else {
                    builder.append(this.mOptions.mUnorderedListItem);
                }
                builder.append("  ");
                break;
            case 4:
                builder.append(element.getAttribute("link"));
                break;
            case 5:
                builder.append("-");
                break;
            case 6:
                if (imageDrawable == null) {
                    String show = element.getAttribute("alt");
                    if (TextUtils.isEmpty(show)) {
                        show = element.getAttribute("title");
                    }
                    if (!TextUtils.isEmpty(show)) {
                        builder.append((CharSequence) ("[" + show + "]"));
                        break;
                    }
                } else {
                    builder.append("￼");
                    break;
                }
                break;
        }
        builder.append((CharSequence) text);
        builder.append(concat);
        if (element.getParent() != null || indexWithinParent < numberOfSiblings - 1) {
            if (type == Element.Type.LIST_ITEM) {
                if (element.size() == 0 || !element.children[element.size() - 1].isBlockElement()) {
                    builder.append("\n");
                }
            } else if (element.isBlockElement() && type != Element.Type.BLOCK_QUOTE) {
                if (type == Element.Type.LIST) {
                    if (element.getParent() == null || element.getParent().getType() != Element.Type.LIST_ITEM) {
                        builder.append("\n");
                    }
                } else if (element.getParent() != null && element.getParent().getType() == Element.Type.LIST_ITEM) {
                    builder.append("\n");
                } else {
                    builder.append("\n\n");
                }
            }
        }
        switch (AnonymousClass1.$SwitchMap$in$uncod$android$bypass$Element$Type[type.ordinal()]) {
            case Element.F_LIST_ORDERED /* 1 */:
                setBlockSpan(builder, new LeadingMarginSpan.Standard(this.mListItemIndent));
                break;
            case 4:
            case 13:
                String link = element.getAttribute("link");
                if (!TextUtils.isEmpty(link) && Patterns.EMAIL_ADDRESS.matcher(link).matches()) {
                    link = "mailto:" + link;
                }
                setSpan(builder, new URLSpan(link));
                break;
            case 5:
                setSpan(builder, new HorizontalLineSpan(this.mOptions.mHruleColor, this.mHruleSize, this.mHruleTopBottomPadding));
                break;
            case 6:
                if (imageDrawable != null) {
                    setSpan(builder, new ImageSpan(imageDrawable));
                    break;
                }
                break;
            case 7:
                String levelStr = element.getAttribute("level");
                int level = Integer.parseInt(levelStr);
                setSpan(builder, new RelativeSizeSpan(this.mOptions.mHeaderSizes[level - 1]));
                setSpan(builder, new StyleSpan(1));
                break;
            case 8:
                setSpan(builder, new StyleSpan(2));
                break;
            case 9:
                setSpan(builder, new StyleSpan(1));
                break;
            case 10:
                setSpan(builder, new StyleSpan(3));
                break;
            case 11:
                setSpan(builder, new LeadingMarginSpan.Standard(this.mCodeBlockIndent));
                setSpan(builder, new TypefaceSpan("monospace"));
                break;
            case 12:
                setSpan(builder, new TypefaceSpan("monospace"));
                break;
            case 14:
                setBlockSpan(builder, new LeadingMarginSpan.Standard(this.mBlockQuoteIndent));
                setBlockSpan(builder, new QuoteSpan(this.mOptions.mBlockQuoteColor));
                setBlockSpan(builder, new LeadingMarginSpan.Standard(this.mBlockQuoteIndent));
                setBlockSpan(builder, new StyleSpan(2));
                break;
            case 15:
                setSpan(builder, new StrikethroughSpan());
                break;
        }
        return builder;
    }

    /* renamed from: in.uncod.android.bypass.Bypass$1, reason: invalid class name */
    /* loaded from: com.commit451.bypasses.1.0.1.jar:in/uncod/android/bypass/Bypass$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$in$uncod$android$bypass$Element$Type = new int[Element.Type.values().length];

        static {
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.LIST.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.LINEBREAK.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.LIST_ITEM.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.AUTOLINK.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.HRULE.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.IMAGE.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.HEADER.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.EMPHASIS.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.DOUBLE_EMPHASIS.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.TRIPLE_EMPHASIS.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.BLOCK_CODE.ordinal()] = 11;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.CODE_SPAN.ordinal()] = 12;
            } catch (NoSuchFieldError e12) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.LINK.ordinal()] = 13;
            } catch (NoSuchFieldError e13) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.BLOCK_QUOTE.ordinal()] = 14;
            } catch (NoSuchFieldError e14) {
            }
            try {
                $SwitchMap$in$uncod$android$bypass$Element$Type[Element.Type.STRIKETHROUGH.ordinal()] = 15;
            } catch (NoSuchFieldError e15) {
            }
        }
    }

    private static void setSpan(SpannableStringBuilder builder, Object what) {
        builder.setSpan(what, 0, builder.length(), 33);
    }

    private static void setBlockSpan(SpannableStringBuilder builder, Object what) {
        int length = Math.max(0, builder.length() - 1);
        builder.setSpan(what, 0, length, 33);
    }

    /* loaded from: com.commit451.bypasses.1.0.1.jar:in/uncod/android/bypass/Bypass$Options.class */
    public static final class Options {
        private float[] mHeaderSizes = {1.5f, 1.4f, 1.3f, 1.2f, 1.1f, 1.0f};
        private String mUnorderedListItem = "•";
        private int mListItemIndentUnit = 1;
        private float mListItemIndentSize = 10.0f;
        private int mBlockQuoteColor = -16776961;
        private int mBlockQuoteIndentUnit = 1;
        private float mBlockQuoteIndentSize = 10.0f;
        private int mCodeBlockIndentUnit = 1;
        private float mCodeBlockIndentSize = 10.0f;
        private int mHruleColor = -7829368;
        private int mHruleUnit = 1;
        private float mHruleSize = 1.0f;

        public Options setHeaderSizes(float[] headerSizes) {
            if (headerSizes == null) {
                throw new IllegalArgumentException("headerSizes must not be null");
            }
            if (headerSizes.length != 6) {
                throw new IllegalArgumentException("headerSizes must have 6 elements (h1 through h6)");
            }
            this.mHeaderSizes = headerSizes;
            return this;
        }

        public Options setUnorderedListItem(String unorderedListItem) {
            this.mUnorderedListItem = unorderedListItem;
            return this;
        }

        public Options setListItemIndentSize(int unit, float size) {
            this.mListItemIndentUnit = unit;
            this.mListItemIndentSize = size;
            return this;
        }

        public Options setBlockQuoteColor(int color) {
            this.mBlockQuoteColor = color;
            return this;
        }

        public Options setBlockQuoteIndentSize(int unit, float size) {
            this.mBlockQuoteIndentUnit = unit;
            this.mBlockQuoteIndentSize = size;
            return this;
        }

        public Options setCodeBlockIndentSize(int unit, float size) {
            this.mCodeBlockIndentUnit = unit;
            this.mCodeBlockIndentSize = size;
            return this;
        }

        public Options setHruleColor(int color) {
            this.mHruleColor = color;
            return this;
        }

        public Options setHruleSize(int unit, float size) {
            this.mHruleUnit = unit;
            this.mHruleSize = size;
            return this;
        }
    }
}
