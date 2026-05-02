package com.mikepenz.iconics.view;

import android.content.Context;
import android.os.Build;
import android.support.v7.widget.AppCompatButton;
import android.util.AttributeSet;
import android.widget.TextView;
import com.mikepenz.iconics.Iconics;

/* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/view/IconicsCompatButton.class */
public class IconicsCompatButton extends AppCompatButton {
    public IconicsCompatButton(Context context) {
        super(context);
    }

    public IconicsCompatButton(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public IconicsCompatButton(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    public void setText(CharSequence text, TextView.BufferType type) {
        if (Build.VERSION.SDK_INT > 14) {
            setAllCaps(false);
        }
        if (!isInEditMode()) {
            super.setText(new Iconics.IconicsBuilder().ctx(getContext()).on(text).build(), type);
        } else {
            super.setText(text, type);
        }
    }
}
