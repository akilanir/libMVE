package com.mikepenz.iconics.view;

import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.widget.Button;
import android.widget.TextView;
import com.mikepenz.iconics.Iconics;

/* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/view/IconicsButton.class */
public class IconicsButton extends Button {
    public IconicsButton(Context context) {
        super(context);
    }

    public IconicsButton(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public IconicsButton(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.widget.TextView
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
