package com.mikepenz.iconics.view;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.Button;
import android.widget.TextView;
import com.mikepenz.iconics.Iconics;
import com.mikepenz.iconics.typeface.FontAwesome;

/* loaded from: com.mikepenz.iconics.1.2.0.jar:com/mikepenz/iconics/view/IconicsButton.class */
public class IconicsButton extends Button {
    public IconicsButton(Context context) {
        super(context);
        if (!isInEditMode()) {
            setTypeface(new FontAwesome().getTypeface(context));
        }
    }

    public IconicsButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        if (!isInEditMode()) {
            setTypeface(new FontAwesome().getTypeface(context));
        }
    }

    public IconicsButton(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        if (!isInEditMode()) {
            setTypeface(new FontAwesome().getTypeface(context));
        }
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
