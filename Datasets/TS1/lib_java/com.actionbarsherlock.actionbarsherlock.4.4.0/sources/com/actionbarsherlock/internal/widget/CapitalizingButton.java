package com.actionbarsherlock.internal.widget;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.AttributeSet;
import android.widget.Button;
import java.util.Locale;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/CapitalizingButton.class */
public class CapitalizingButton extends Button {
    private static final boolean SANS_ICE_CREAM;
    private static final boolean IS_GINGERBREAD;
    private static final int[] R_styleable_Button;
    private static final int R_styleable_Button_textAppearance = 0;
    private static final int[] R_styleable_TextAppearance;
    private static final int R_styleable_TextAppearance_textAllCaps = 0;
    private boolean mAllCaps;

    static {
        SANS_ICE_CREAM = Build.VERSION.SDK_INT < 14;
        IS_GINGERBREAD = Build.VERSION.SDK_INT >= 9;
        R_styleable_Button = new int[]{R.attr.textAppearance};
        R_styleable_TextAppearance = new int[]{R.attr.textAllCaps};
    }

    public CapitalizingButton(Context context, AttributeSet attrs) {
        TypedArray appearance;
        super(context, attrs);
        TypedArray a = context.obtainStyledAttributes(attrs, R_styleable_Button);
        int ap = a.getResourceId(0, -1);
        a.recycle();
        if (ap != -1 && (appearance = context.obtainStyledAttributes(ap, R_styleable_TextAppearance)) != null) {
            this.mAllCaps = appearance.getBoolean(0, true);
            appearance.recycle();
        }
    }

    public void setTextCompat(CharSequence text) {
        if (SANS_ICE_CREAM && this.mAllCaps && text != null) {
            if (IS_GINGERBREAD) {
                try {
                    setText(text.toString().toUpperCase(Locale.ROOT));
                    return;
                } catch (NoSuchFieldError e) {
                    setText(text.toString().toUpperCase());
                    return;
                }
            }
            setText(text.toString().toUpperCase());
            return;
        }
        setText(text);
    }
}
