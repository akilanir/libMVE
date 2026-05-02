package com.joanzapata.iconify.internal;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.support.v4.view.ViewCompat;
import android.text.SpannableStringBuilder;
import android.util.TypedValue;
import android.widget.TextView;
import com.joanzapata.iconify.Icon;
import com.joanzapata.iconify.internal.HasOnViewAttachListener;
import java.util.List;

/* loaded from: com.joanzapata.iconify.android-iconify.2.2.1.jar:com/joanzapata/iconify/internal/ParsingUtil.class */
public final class ParsingUtil {
    private static final String ANDROID_PACKAGE_NAME = "android";

    private ParsingUtil() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static CharSequence parse(Context context, List<IconFontDescriptorWrapper> iconFontDescriptors, CharSequence text, TextView textView) {
        Context context2 = context.getApplicationContext();
        if (text == null) {
            return text;
        }
        SpannableStringBuilder spannableBuilder = new SpannableStringBuilder(text);
        recursivePrepareSpannableIndexes(context2, text.toString(), spannableBuilder, iconFontDescriptors, 0);
        boolean isAnimated = hasAnimatedSpans(spannableBuilder);
        if (isAnimated) {
            if (textView == 0) {
                throw new IllegalArgumentException("You can't use \"spin\" without providing the target TextView.");
            }
            if (!(textView instanceof HasOnViewAttachListener)) {
                throw new IllegalArgumentException(textView.getClass().getSimpleName() + " does not implement HasOnViewAttachListener. Please use IconTextView, IconButton or IconToggleButton.");
            }
            ((HasOnViewAttachListener) textView).setOnViewAttachListener(new AnonymousClass1(textView));
        } else if (textView instanceof HasOnViewAttachListener) {
            ((HasOnViewAttachListener) textView).setOnViewAttachListener(null);
        }
        return spannableBuilder;
    }

    /* renamed from: com.joanzapata.iconify.internal.ParsingUtil$1, reason: invalid class name */
    /* loaded from: com.joanzapata.iconify.android-iconify.2.2.1.jar:com/joanzapata/iconify/internal/ParsingUtil$1.class */
    static class AnonymousClass1 implements HasOnViewAttachListener.OnViewAttachListener {
        boolean isAttached = false;
        final /* synthetic */ TextView val$target;

        AnonymousClass1(TextView textView) {
            this.val$target = textView;
        }

        @Override // com.joanzapata.iconify.internal.HasOnViewAttachListener.OnViewAttachListener
        public void onAttach() {
            this.isAttached = true;
            ViewCompat.postOnAnimation(this.val$target, new Runnable() { // from class: com.joanzapata.iconify.internal.ParsingUtil.1.1
                @Override // java.lang.Runnable
                public void run() {
                    if (AnonymousClass1.this.isAttached) {
                        AnonymousClass1.this.val$target.invalidate();
                        ViewCompat.postOnAnimation(AnonymousClass1.this.val$target, this);
                    }
                }
            });
        }

        @Override // com.joanzapata.iconify.internal.HasOnViewAttachListener.OnViewAttachListener
        public void onDetach() {
            this.isAttached = false;
        }
    }

    private static boolean hasAnimatedSpans(SpannableStringBuilder spannableBuilder) {
        CustomTypefaceSpan[] spans = (CustomTypefaceSpan[]) spannableBuilder.getSpans(0, spannableBuilder.length(), CustomTypefaceSpan.class);
        for (CustomTypefaceSpan span : spans) {
            if (span.isAnimated()) {
                return true;
            }
        }
        return false;
    }

    private static void recursivePrepareSpannableIndexes(Context context, String fullText, SpannableStringBuilder text, List<IconFontDescriptorWrapper> iconFontDescriptors, int start) {
        int endIndex;
        String stringText = text.toString();
        int startIndex = stringText.indexOf("{", start);
        if (startIndex == -1 || (endIndex = stringText.indexOf("}", startIndex) + 1) == -1) {
            return;
        }
        String expression = stringText.substring(startIndex + 1, endIndex - 1);
        String[] strokes = expression.split(" ");
        String key = strokes[0];
        IconFontDescriptorWrapper iconFontDescriptor = null;
        Icon icon = null;
        for (int i = 0; i < iconFontDescriptors.size(); i++) {
            iconFontDescriptor = iconFontDescriptors.get(i);
            icon = iconFontDescriptor.getIcon(key);
            if (icon != null) {
                break;
            }
        }
        if (icon == null) {
            recursivePrepareSpannableIndexes(context, fullText, text, iconFontDescriptors, endIndex);
            return;
        }
        float iconSizePx = -1.0f;
        int iconColor = Integer.MAX_VALUE;
        float iconSizeRatio = -1.0f;
        boolean spin = false;
        boolean baselineAligned = false;
        for (int i2 = 1; i2 < strokes.length; i2++) {
            String stroke = strokes[i2];
            if (stroke.equalsIgnoreCase("spin")) {
                spin = true;
            } else if (stroke.equalsIgnoreCase("baseline")) {
                baselineAligned = true;
            } else if (stroke.matches("([0-9]*(\\.[0-9]*)?)dp")) {
                iconSizePx = dpToPx(context, Float.valueOf(stroke.substring(0, stroke.length() - 2)).floatValue());
            } else if (stroke.matches("([0-9]*(\\.[0-9]*)?)sp")) {
                iconSizePx = spToPx(context, Float.valueOf(stroke.substring(0, stroke.length() - 2)).floatValue());
            } else if (stroke.matches("([0-9]*)px")) {
                iconSizePx = Integer.valueOf(stroke.substring(0, stroke.length() - 2)).intValue();
            } else if (stroke.matches("@dimen/(.*)")) {
                iconSizePx = getPxFromDimen(context, context.getPackageName(), stroke.substring(7));
                if (iconSizePx < 0.0f) {
                    throw new IllegalArgumentException("Unknown resource " + stroke + " in \"" + fullText + "\"");
                }
            } else if (stroke.matches("@android:dimen/(.*)")) {
                iconSizePx = getPxFromDimen(context, ANDROID_PACKAGE_NAME, stroke.substring(15));
                if (iconSizePx < 0.0f) {
                    throw new IllegalArgumentException("Unknown resource " + stroke + " in \"" + fullText + "\"");
                }
            } else if (stroke.matches("([0-9]*(\\.[0-9]*)?)%")) {
                iconSizeRatio = Float.valueOf(stroke.substring(0, stroke.length() - 1)).floatValue() / 100.0f;
            } else if (stroke.matches("#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})")) {
                iconColor = Color.parseColor(stroke);
            } else if (stroke.matches("@color/(.*)")) {
                iconColor = getColorFromResource(context, context.getPackageName(), stroke.substring(7));
                if (iconColor == Integer.MAX_VALUE) {
                    throw new IllegalArgumentException("Unknown resource " + stroke + " in \"" + fullText + "\"");
                }
            } else if (stroke.matches("@android:color/(.*)")) {
                iconColor = getColorFromResource(context, ANDROID_PACKAGE_NAME, stroke.substring(15));
                if (iconColor == Integer.MAX_VALUE) {
                    throw new IllegalArgumentException("Unknown resource " + stroke + " in \"" + fullText + "\"");
                }
            } else {
                throw new IllegalArgumentException("Unknown expression " + stroke + " in \"" + fullText + "\"");
            }
        }
        SpannableStringBuilder text2 = text.replace(startIndex, endIndex, (CharSequence) ("" + icon.character()));
        text2.setSpan(new CustomTypefaceSpan(icon, iconFontDescriptor.getTypeface(context), iconSizePx, iconSizeRatio, iconColor, spin, baselineAligned), startIndex, startIndex + 1, 17);
        recursivePrepareSpannableIndexes(context, fullText, text2, iconFontDescriptors, startIndex);
    }

    public static float getPxFromDimen(Context context, String packageName, String resName) {
        Resources resources = context.getResources();
        int resId = resources.getIdentifier(resName, "dimen", packageName);
        if (resId <= 0) {
            return -1.0f;
        }
        return resources.getDimension(resId);
    }

    public static int getColorFromResource(Context context, String packageName, String resName) {
        Resources resources = context.getResources();
        int resId = resources.getIdentifier(resName, "color", packageName);
        if (resId <= 0) {
            return Integer.MAX_VALUE;
        }
        return resources.getColor(resId);
    }

    public static float dpToPx(Context context, float dp) {
        return TypedValue.applyDimension(1, dp, context.getResources().getDisplayMetrics());
    }

    public static float spToPx(Context context, float sp) {
        return TypedValue.applyDimension(2, sp, context.getResources().getDisplayMetrics());
    }
}
