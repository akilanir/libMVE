package com.mikepenz.iconics.view;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;
import com.mikepenz.iconics.Iconics;

/* loaded from: com.mikepenz.iconics.1.2.0.jar:com/mikepenz/iconics/view/IconicsTextView.class */
public class IconicsTextView extends TextView {
    public IconicsTextView(Context context) {
        this(context, null);
    }

    public IconicsTextView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public IconicsTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.widget.TextView
    public void setText(CharSequence text, TextView.BufferType type) {
        if (!isInEditMode()) {
            super.setText(new Iconics.IconicsBuilder().ctx(getContext()).on(text).build(), type);
        } else {
            super.setText(text, type);
        }
    }
}
