package uk.co.chrisjenx.calligraphy;

import android.R;
import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.text.Editable;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.widget.TextView;

/* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/CalligraphyUtils.class */
public final class CalligraphyUtils {
    private static Boolean sToolbarCheck = null;

    public static CharSequence applyTypefaceSpan(CharSequence s, Typeface typeface) {
        if (s != null && s.length() > 0) {
            if (!(s instanceof Spannable)) {
                s = new SpannableString(s);
            }
            ((Spannable) s).setSpan(TypefaceUtils.getSpan(typeface), 0, s.length(), 33);
        }
        return s;
    }

    public static boolean applyFontToTextView(TextView textView, Typeface typeface) {
        return applyFontToTextView(textView, typeface, false);
    }

    public static boolean applyFontToTextView(TextView textView, final Typeface typeface, boolean deferred) {
        if (textView == null || typeface == null) {
            return false;
        }
        textView.setPaintFlags(textView.getPaintFlags() | 128 | 1);
        textView.setTypeface(typeface);
        if (deferred) {
            textView.setText(applyTypefaceSpan(textView.getText(), typeface), TextView.BufferType.SPANNABLE);
            textView.addTextChangedListener(new TextWatcher() { // from class: uk.co.chrisjenx.calligraphy.CalligraphyUtils.1
                @Override // android.text.TextWatcher
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                }

                @Override // android.text.TextWatcher
                public void onTextChanged(CharSequence s, int start, int before, int count) {
                }

                @Override // android.text.TextWatcher
                public void afterTextChanged(Editable s) {
                    CalligraphyUtils.applyTypefaceSpan(s, typeface);
                }
            });
            return true;
        }
        return true;
    }

    public static boolean applyFontToTextView(Context context, TextView textView, String filePath) {
        return applyFontToTextView(context, textView, filePath, false);
    }

    static boolean applyFontToTextView(Context context, TextView textView, String filePath, boolean deferred) {
        if (textView == null || context == null) {
            return false;
        }
        AssetManager assetManager = context.getAssets();
        Typeface typeface = TypefaceUtils.load(assetManager, filePath);
        return applyFontToTextView(textView, typeface, deferred);
    }

    static void applyFontToTextView(Context context, TextView textView, CalligraphyConfig config) {
        applyFontToTextView(context, textView, config, false);
    }

    static void applyFontToTextView(Context context, TextView textView, CalligraphyConfig config, boolean deferred) {
        if (context == null || textView == null || config == null || !config.isFontSet()) {
            return;
        }
        applyFontToTextView(context, textView, config.getFontPath(), deferred);
    }

    public static void applyFontToTextView(Context context, TextView textView, CalligraphyConfig config, String textViewFont) {
        applyFontToTextView(context, textView, config, textViewFont, false);
    }

    static void applyFontToTextView(Context context, TextView textView, CalligraphyConfig config, String textViewFont, boolean deferred) {
        if (context == null || textView == null || config == null) {
            return;
        }
        if (!TextUtils.isEmpty(textViewFont) && applyFontToTextView(context, textView, textViewFont, deferred)) {
            return;
        }
        applyFontToTextView(context, textView, config, deferred);
    }

    static String pullFontPathFromView(Context context, AttributeSet attrs, int attributeId) {
        if (attributeId == -1 || attrs == null) {
            return null;
        }
        try {
            String attributeName = context.getResources().getResourceEntryName(attributeId);
            int stringResourceId = attrs.getAttributeResourceValue(null, attributeName, -1);
            if (stringResourceId > 0) {
                return context.getString(stringResourceId);
            }
            return attrs.getAttributeValue(null, attributeName);
        } catch (Resources.NotFoundException e) {
            return null;
        }
    }

    static String pullFontPathFromStyle(Context context, AttributeSet attrs, int attributeId) {
        TypedArray typedArray;
        if (attributeId != -1 && attrs != null && (typedArray = context.obtainStyledAttributes(attrs, new int[]{attributeId})) != null) {
            try {
                String fontFromAttribute = typedArray.getString(0);
                if (!TextUtils.isEmpty(fontFromAttribute)) {
                    typedArray.recycle();
                    return fontFromAttribute;
                }
                typedArray.recycle();
                return null;
            } catch (Exception e) {
                typedArray.recycle();
                return null;
            } catch (Throwable th) {
                typedArray.recycle();
                throw th;
            }
        }
        return null;
    }

    static String pullFontPathFromTextAppearance(Context context, AttributeSet attrs, int attributeId) {
        if (attributeId == -1 || attrs == null) {
            return null;
        }
        int textAppearanceId = -1;
        TypedArray typedArrayAttr = context.obtainStyledAttributes(attrs, new int[]{R.attr.textAppearance});
        if (typedArrayAttr != null) {
            try {
                textAppearanceId = typedArrayAttr.getResourceId(0, -1);
                typedArrayAttr.recycle();
            } catch (Exception e) {
                typedArrayAttr.recycle();
                return null;
            } catch (Throwable th) {
                typedArrayAttr.recycle();
                throw th;
            }
        }
        TypedArray textAppearanceAttrs = context.obtainStyledAttributes(textAppearanceId, new int[]{attributeId});
        if (textAppearanceAttrs != null) {
            try {
                String string = textAppearanceAttrs.getString(0);
                textAppearanceAttrs.recycle();
                return string;
            } catch (Exception e2) {
                textAppearanceAttrs.recycle();
                return null;
            } catch (Throwable th2) {
                textAppearanceAttrs.recycle();
                throw th2;
            }
        }
        return null;
    }

    static String pullFontPathFromTheme(Context context, int styleAttrId, int attributeId) {
        if (styleAttrId == -1 || attributeId == -1) {
            return null;
        }
        Resources.Theme theme = context.getTheme();
        TypedValue value = new TypedValue();
        theme.resolveAttribute(styleAttrId, value, true);
        TypedArray typedArray = theme.obtainStyledAttributes(value.resourceId, new int[]{attributeId});
        try {
            String font = typedArray.getString(0);
            typedArray.recycle();
            return font;
        } catch (Exception e) {
            typedArray.recycle();
            return null;
        } catch (Throwable th) {
            typedArray.recycle();
            throw th;
        }
    }

    static String pullFontPathFromTheme(Context context, int styleAttrId, int subStyleAttrId, int attributeId) {
        TypedArray subTypedArray;
        if (styleAttrId == -1 || attributeId == -1) {
            return null;
        }
        Resources.Theme theme = context.getTheme();
        TypedValue value = new TypedValue();
        theme.resolveAttribute(styleAttrId, value, true);
        TypedArray parentTypedArray = theme.obtainStyledAttributes(value.resourceId, new int[]{subStyleAttrId});
        try {
            int subStyleResId = parentTypedArray.getResourceId(0, -1);
            parentTypedArray.recycle();
            if (subStyleResId != -1 && (subTypedArray = context.obtainStyledAttributes(subStyleResId, new int[]{attributeId})) != null) {
                try {
                    String string = subTypedArray.getString(0);
                    subTypedArray.recycle();
                    return string;
                } catch (Exception e) {
                    subTypedArray.recycle();
                    return null;
                } catch (Throwable th) {
                    subTypedArray.recycle();
                    throw th;
                }
            }
            return null;
        } catch (Exception e2) {
            parentTypedArray.recycle();
            return null;
        } catch (Throwable th2) {
            parentTypedArray.recycle();
            throw th2;
        }
    }

    static boolean canCheckForV7Toolbar() {
        if (sToolbarCheck == null) {
            try {
                Class.forName("android.support.v7.widget.Toolbar");
                sToolbarCheck = Boolean.TRUE;
            } catch (ClassNotFoundException e) {
                sToolbarCheck = Boolean.FALSE;
            }
        }
        return sToolbarCheck.booleanValue();
    }

    private CalligraphyUtils() {
    }
}
