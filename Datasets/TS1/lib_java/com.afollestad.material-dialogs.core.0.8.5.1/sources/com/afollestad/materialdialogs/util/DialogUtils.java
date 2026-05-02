package com.afollestad.materialdialogs.util;

import android.R;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.ArrayRes;
import android.support.annotation.AttrRes;
import android.support.annotation.ColorRes;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import com.afollestad.materialdialogs.BuildConfig;
import com.afollestad.materialdialogs.GravityEnum;
import com.afollestad.materialdialogs.MaterialDialog;

/* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/util/DialogUtils.class */
public class DialogUtils {
    public static float resolveFloat(Context context, int attr) {
        TypedArray a = context.obtainStyledAttributes((AttributeSet) null, new int[]{attr});
        try {
            float f = a.getFloat(0, 0.0f);
            a.recycle();
            return f;
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    public static int adjustAlpha(int color, float factor) {
        int alpha = Math.round(Color.alpha(color) * factor);
        int red = Color.red(color);
        int green = Color.green(color);
        int blue = Color.blue(color);
        return Color.argb(alpha, red, green, blue);
    }

    public static int resolveColor(Context context, @AttrRes int attr) {
        return resolveColor(context, attr, 0);
    }

    public static int resolveColor(Context context, @AttrRes int attr, int fallback) {
        TypedArray a = context.getTheme().obtainStyledAttributes(new int[]{attr});
        try {
            int color = a.getColor(0, fallback);
            a.recycle();
            return color;
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    public static ColorStateList resolveActionTextColorStateList(Context context, @AttrRes int colorAttr, ColorStateList fallback) {
        TypedArray a = context.getTheme().obtainStyledAttributes(new int[]{colorAttr});
        try {
            TypedValue value = a.peekValue(0);
            if (value == null) {
                return fallback;
            }
            if (value.type >= 28 && value.type <= 31) {
                ColorStateList actionTextStateList = getActionTextStateList(context, value.data);
                a.recycle();
                return actionTextStateList;
            }
            ColorStateList stateList = a.getColorStateList(0);
            if (stateList != null) {
                a.recycle();
                return stateList;
            }
            a.recycle();
            return fallback;
        } finally {
            a.recycle();
        }
    }

    public static ColorStateList getActionTextColorStateList(Context context, @ColorRes int colorId) {
        TypedValue value = new TypedValue();
        context.getResources().getValue(colorId, value, true);
        if (value.type >= 28 && value.type <= 31) {
            return getActionTextStateList(context, value.data);
        }
        if (Build.VERSION.SDK_INT <= 22) {
            return context.getResources().getColorStateList(colorId);
        }
        return context.getColorStateList(colorId);
    }

    public static int getColor(Context context, @ColorRes int colorId) {
        if (Build.VERSION.SDK_INT <= 22) {
            return context.getResources().getColor(colorId);
        }
        return context.getColor(colorId);
    }

    public static String resolveString(Context context, @AttrRes int attr) {
        TypedValue v = new TypedValue();
        context.getTheme().resolveAttribute(attr, v, true);
        return (String) v.string;
    }

    /* renamed from: com.afollestad.materialdialogs.util.DialogUtils$3, reason: invalid class name */
    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/util/DialogUtils$3.class */
    static /* synthetic */ class AnonymousClass3 {
        static final /* synthetic */ int[] $SwitchMap$com$afollestad$materialdialogs$GravityEnum = new int[GravityEnum.values().length];

        static {
            try {
                $SwitchMap$com$afollestad$materialdialogs$GravityEnum[GravityEnum.CENTER.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$afollestad$materialdialogs$GravityEnum[GravityEnum.END.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    private static int gravityEnumToAttrInt(GravityEnum value) {
        switch (AnonymousClass3.$SwitchMap$com$afollestad$materialdialogs$GravityEnum[value.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                return 1;
            case 2:
                return 2;
            default:
                return 0;
        }
    }

    public static GravityEnum resolveGravityEnum(Context context, @AttrRes int attr, GravityEnum defaultGravity) {
        TypedArray a = context.getTheme().obtainStyledAttributes(new int[]{attr});
        try {
            switch (a.getInt(0, gravityEnumToAttrInt(defaultGravity))) {
                case BuildConfig.VERSION_CODE /* 1 */:
                    GravityEnum gravityEnum = GravityEnum.CENTER;
                    a.recycle();
                    return gravityEnum;
                case 2:
                    GravityEnum gravityEnum2 = GravityEnum.END;
                    a.recycle();
                    return gravityEnum2;
                default:
                    GravityEnum gravityEnum3 = GravityEnum.START;
                    a.recycle();
                    return gravityEnum3;
            }
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    public static Drawable resolveDrawable(Context context, @AttrRes int attr) {
        return resolveDrawable(context, attr, null);
    }

    private static Drawable resolveDrawable(Context context, @AttrRes int attr, Drawable fallback) {
        TypedArray a = context.getTheme().obtainStyledAttributes(new int[]{attr});
        try {
            Drawable d = a.getDrawable(0);
            if (d == null && fallback != null) {
                d = fallback;
            }
            return d;
        } finally {
            a.recycle();
        }
    }

    public static int resolveDimension(Context context, @AttrRes int attr) {
        return resolveDimension(context, attr, -1);
    }

    private static int resolveDimension(Context context, @AttrRes int attr, int fallback) {
        TypedArray a = context.getTheme().obtainStyledAttributes(new int[]{attr});
        try {
            int dimensionPixelSize = a.getDimensionPixelSize(0, fallback);
            a.recycle();
            return dimensionPixelSize;
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    public static boolean resolveBoolean(Context context, @AttrRes int attr, boolean fallback) {
        TypedArray a = context.getTheme().obtainStyledAttributes(new int[]{attr});
        try {
            boolean z = a.getBoolean(0, fallback);
            a.recycle();
            return z;
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    public static boolean resolveBoolean(Context context, @AttrRes int attr) {
        return resolveBoolean(context, attr, false);
    }

    public static boolean isColorDark(int color) {
        double darkness = 1.0d - ((((0.299d * Color.red(color)) + (0.587d * Color.green(color))) + (0.114d * Color.blue(color))) / 255.0d);
        return darkness >= 0.5d;
    }

    public static void setBackgroundCompat(View view, Drawable d) {
        if (Build.VERSION.SDK_INT < 16) {
            view.setBackgroundDrawable(d);
        } else {
            view.setBackground(d);
        }
    }

    public static void showKeyboard(DialogInterface di, final MaterialDialog.Builder builder) {
        final MaterialDialog dialog = (MaterialDialog) di;
        if (dialog.getInputEditText() == null) {
            return;
        }
        dialog.getInputEditText().post(new Runnable() { // from class: com.afollestad.materialdialogs.util.DialogUtils.1
            @Override // java.lang.Runnable
            public void run() {
                dialog.getInputEditText().requestFocus();
                InputMethodManager imm = (InputMethodManager) builder.getContext().getSystemService("input_method");
                if (imm != null) {
                    imm.showSoftInput(dialog.getInputEditText(), 1);
                }
            }
        });
    }

    public static void hideKeyboard(DialogInterface di, final MaterialDialog.Builder builder) {
        final MaterialDialog dialog = (MaterialDialog) di;
        if (dialog.getInputEditText() == null) {
            return;
        }
        dialog.getInputEditText().post(new Runnable() { // from class: com.afollestad.materialdialogs.util.DialogUtils.2
            @Override // java.lang.Runnable
            public void run() {
                dialog.getInputEditText().requestFocus();
                InputMethodManager imm = (InputMethodManager) builder.getContext().getSystemService("input_method");
                if (imm != null) {
                    imm.hideSoftInputFromWindow(dialog.getInputEditText().getWindowToken(), 0);
                }
            }
        });
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [int[], int[][]] */
    public static ColorStateList getActionTextStateList(Context context, int newPrimaryColor) {
        int fallBackButtonColor = resolveColor(context, R.attr.textColorPrimary);
        if (newPrimaryColor == 0) {
            newPrimaryColor = fallBackButtonColor;
        }
        ?? r0 = {new int[]{-16842910}, new int[0]};
        int[] colors = {adjustAlpha(newPrimaryColor, 0.4f), newPrimaryColor};
        return new ColorStateList(r0, colors);
    }

    public static int[] getColorArray(@NonNull Context context, @ArrayRes int array) {
        if (array == 0) {
            return null;
        }
        TypedArray ta = context.getResources().obtainTypedArray(array);
        int[] colors = new int[ta.length()];
        for (int i = 0; i < ta.length(); i++) {
            colors[i] = ta.getColor(i, 0);
        }
        ta.recycle();
        return colors;
    }
}
