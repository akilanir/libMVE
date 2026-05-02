package com.actionbarsherlock.internal.widget;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.AttributeSet;
import android.widget.TextView;
import java.util.Locale;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/CapitalizingTextView.class */
public class CapitalizingTextView extends TextView {
    private static final boolean SANS_ICE_CREAM;
    private static final boolean IS_GINGERBREAD;
    private static final int[] R_styleable_TextView;
    private static final int R_styleable_TextView_textAllCaps = 0;
    private boolean mAllCaps;

    static {
        SANS_ICE_CREAM = Build.VERSION.SDK_INT < 14;
        IS_GINGERBREAD = Build.VERSION.SDK_INT >= 9;
        R_styleable_TextView = new int[]{R.attr.textAllCaps};
    }

    public CapitalizingTextView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public CapitalizingTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        TypedArray a = context.obtainStyledAttributes(attrs, R_styleable_TextView, defStyle, 0);
        this.mAllCaps = a.getBoolean(0, true);
        a.recycle();
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
