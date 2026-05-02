package com.mikepenz.iconics.context;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v7.view.menu.ActionMenuItemView;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.iconics.Iconics;
import com.mikepenz.iconics.IconicsDrawable;
import com.mikepenz.iconics.core.R;

/* loaded from: com.mikepenz.iconics-core.2.5.5.jar:com/mikepenz/iconics/context/IconicsFactory.class */
class IconicsFactory {
    IconicsFactory() {
    }

    public View onViewCreated(View view, Context context, AttributeSet attrs) {
        if (view != null && view.getTag(R.id.iconics_tag_id) != Boolean.TRUE) {
            onViewCreatedInternal(view, context, attrs);
            view.setTag(R.id.iconics_tag_id, Boolean.TRUE);
        }
        return view;
    }

    void onViewCreatedInternal(View view, final Context context, AttributeSet attrs) {
        if (attrs == null) {
            return;
        }
        if (view instanceof ActionMenuItemView) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.Iconics);
            String icon = a.getString(R.styleable.IconicsImageView_iiv_icon);
            if (!TextUtils.isEmpty(icon)) {
                ((ActionMenuItemView) view).setIcon(getDrawable(context, a, icon));
            }
            a.recycle();
            return;
        }
        if (view instanceof EditText) {
            new Iconics.IconicsBuilder().ctx(context).on((TextView) view).build();
            return;
        }
        if (view instanceof TextView) {
            new Iconics.IconicsBuilder().ctx(context).on((TextView) view).build();
            ((TextView) view).addTextChangedListener(new TextWatcher() { // from class: com.mikepenz.iconics.context.IconicsFactory.1
                @Override // android.text.TextWatcher
                public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                }

                @Override // android.text.TextWatcher
                public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                }

                @Override // android.text.TextWatcher
                public void afterTextChanged(Editable editable) {
                    Iconics.styleEditable(context, editable);
                }
            });
        } else if (view instanceof ImageView) {
            TypedArray a2 = context.obtainStyledAttributes(attrs, R.styleable.Iconics);
            String icon2 = a2.getString(R.styleable.IconicsImageView_iiv_icon);
            if (!TextUtils.isEmpty(icon2)) {
                ((ImageView) view).setImageDrawable(getDrawable(context, a2, icon2));
            }
            a2.recycle();
        }
    }

    IconicsDrawable getDrawable(Context context, TypedArray a, String icon) {
        int color = a.getColor(R.styleable.Iconics_ico_color, 0);
        int size = a.getDimensionPixelSize(R.styleable.Iconics_ico_size, -1);
        int offsetX = a.getDimensionPixelSize(R.styleable.Iconics_ico_offset_x, -1);
        int offsetY = a.getDimensionPixelSize(R.styleable.Iconics_ico_offset_y, -1);
        int padding = a.getDimensionPixelSize(R.styleable.Iconics_ico_padding, -1);
        int contourColor = a.getColor(R.styleable.Iconics_ico_contour_color, 0);
        int contourWidth = a.getDimensionPixelSize(R.styleable.Iconics_ico_contour_width, -1);
        int backgroundColor = a.getColor(R.styleable.Iconics_ico_background_color, 0);
        int cornerRadius = a.getDimensionPixelSize(R.styleable.Iconics_ico_corner_radius, -1);
        IconicsDrawable drawable = new IconicsDrawable(context, icon);
        if (color != 0) {
            drawable.color(color);
        }
        if (size != -1) {
            drawable.sizePx(size);
        }
        if (offsetX != -1) {
            drawable.iconOffsetXPx(offsetX);
        }
        if (offsetY != -1) {
            drawable.iconOffsetYPx(offsetY);
        }
        if (padding != -1) {
            drawable.paddingPx(padding);
        }
        if (contourColor != 0) {
            drawable.contourColor(contourColor);
        }
        if (contourWidth != -1) {
            drawable.contourWidthPx(contourWidth);
        }
        if (backgroundColor != 0) {
            drawable.backgroundColor(backgroundColor);
        }
        if (cornerRadius != -1) {
            drawable.roundedCornersPx(cornerRadius);
        }
        return drawable;
    }
}
