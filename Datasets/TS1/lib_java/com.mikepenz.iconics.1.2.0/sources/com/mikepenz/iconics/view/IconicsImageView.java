package com.mikepenz.iconics.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.mikepenz.iconics.IconicsDrawable;
import com.mikepenz.iconics.R;
import com.mikepenz.iconics.typeface.IIcon;

/* loaded from: com.mikepenz.iconics.1.2.0.jar:com/mikepenz/iconics/view/IconicsImageView.class */
public class IconicsImageView extends ImageView {
    private IconicsDrawable mIcon;
    private int mColor;
    private int mSize;
    private int mPadding;

    public IconicsImageView(Context context) {
        this(context, null);
    }

    public IconicsImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public IconicsImageView(Context context, AttributeSet attrs, int defStyle) {
        TypedArray a;
        String icon;
        super(context, attrs, defStyle);
        this.mIcon = null;
        this.mColor = 0;
        this.mSize = -1;
        this.mPadding = -1;
        if (isInEditMode() || (icon = (a = context.obtainStyledAttributes(attrs, R.styleable.IconicsImageView, defStyle, 0)).getString(R.styleable.IconicsImageView_iiv_icon)) == null) {
            return;
        }
        this.mColor = a.getColor(R.styleable.IconicsImageView_iiv_color, 0);
        this.mSize = a.getDimensionPixelSize(R.styleable.IconicsImageView_iiv_size, -1);
        this.mPadding = a.getDimensionPixelSize(R.styleable.IconicsImageView_iiv_padding, -1);
        this.mIcon = new IconicsDrawable(context, icon);
        if (this.mColor != 0) {
            this.mIcon.color(this.mColor);
        }
        if (this.mSize != -1) {
            this.mIcon.sizePx(this.mSize);
        }
        if (this.mSize != -1) {
            this.mIcon.paddingPx(this.mPadding);
        }
        a.recycle();
        setImageDrawable(this.mIcon);
        setScaleType(ImageView.ScaleType.MATRIX);
    }

    public void setIcon(String icon) {
        setIcon(new IconicsDrawable(getContext(), icon));
    }

    public void setIcon(IIcon icon) {
        setIcon(new IconicsDrawable(getContext(), icon));
    }

    public void setIcon(IconicsDrawable icon) {
        if (this.mColor != 0) {
            icon.color(this.mColor);
        }
        this.mIcon = icon;
        setImageDrawable(this.mIcon);
    }

    public void setColor(int color) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).color(color);
        }
    }

    public void setColorRes(int colorRes) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).colorRes(colorRes);
        }
    }

    public IconicsDrawable getIcon() {
        if (getDrawable() instanceof IconicsDrawable) {
            return (IconicsDrawable) getDrawable();
        }
        return null;
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldW, int oldH) {
        super.onSizeChanged(w, h, oldW, oldH);
        if (getDrawable() instanceof IconicsDrawable) {
            if (w > h) {
                ((IconicsDrawable) getDrawable()).sizePx(w);
            } else {
                ((IconicsDrawable) getDrawable()).sizePx(h);
            }
        }
    }
}
