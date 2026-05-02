package com.mikepenz.iconics.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DimenRes;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.mikepenz.iconics.IconicsDrawable;
import com.mikepenz.iconics.core.R;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.iconics.utils.Utils;

/* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/view/IconicsImageView.class */
public class IconicsImageView extends ImageView {
    private IconicsDrawable mIcon;

    @ColorInt
    private int mColor;
    private int mSize;
    private int mPadding;

    @ColorInt
    private int mContourColor;
    private int mContourWidth;

    @ColorInt
    private int mBackgroundColor;
    private int mCornerRadius;

    public IconicsImageView(Context context) {
        this(context, null);
    }

    public IconicsImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public IconicsImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mIcon = null;
        this.mColor = 0;
        this.mSize = -1;
        this.mPadding = -1;
        this.mContourColor = 0;
        this.mContourWidth = -1;
        this.mBackgroundColor = 0;
        this.mCornerRadius = -1;
        if (!isInEditMode()) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.IconicsImageView, defStyle, 0);
            String icon = a.getString(R.styleable.IconicsImageView_iiv_icon);
            this.mColor = a.getColor(R.styleable.IconicsImageView_iiv_color, 0);
            this.mSize = a.getDimensionPixelSize(R.styleable.IconicsImageView_iiv_size, -1);
            this.mPadding = a.getDimensionPixelSize(R.styleable.IconicsImageView_iiv_padding, -1);
            this.mContourColor = a.getColor(R.styleable.IconicsImageView_iiv_contour_color, 0);
            this.mContourWidth = a.getDimensionPixelSize(R.styleable.IconicsImageView_iiv_contour_width, -1);
            this.mBackgroundColor = a.getColor(R.styleable.IconicsImageView_iiv_background_color, 0);
            this.mCornerRadius = a.getDimensionPixelSize(R.styleable.IconicsImageView_iiv_corner_radius, -1);
            a.recycle();
            setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            if (icon == null) {
                return;
            }
            this.mIcon = new IconicsDrawable(context, icon);
            setAttributes();
            setImageDrawable(this.mIcon);
        }
    }

    public void setIcon(Character icon) {
        setIcon(icon, true);
    }

    public void setIcon(Character icon, boolean resetAttributes) {
        setIcon(new IconicsDrawable(getContext(), icon), resetAttributes);
    }

    public void setIcon(String icon) {
        setIcon(icon, true);
    }

    public void setIcon(String icon, boolean resetAttributes) {
        setIcon(new IconicsDrawable(getContext(), icon), resetAttributes);
    }

    public void setIcon(IIcon icon) {
        setIcon(icon, true);
    }

    public void setIcon(IIcon icon, boolean resetAttributes) {
        setIcon(new IconicsDrawable(getContext(), icon), resetAttributes);
    }

    public void setIcon(IconicsDrawable icon) {
        setIcon(icon, true);
    }

    public void setIcon(IconicsDrawable icon, boolean resetAttributes) {
        this.mIcon = icon;
        if (resetAttributes) {
            setAttributes();
        }
        setImageDrawable(this.mIcon);
    }

    public void setIconText(String iconText) {
        setIconText(iconText, true);
    }

    public void setIconText(String iconText, boolean resetAttributes) {
        setIcon(new IconicsDrawable(getContext()).iconText(iconText), resetAttributes);
    }

    private void setAttributes() {
        if (this.mColor != 0) {
            this.mIcon.color(this.mColor);
        }
        if (this.mSize != -1) {
            this.mIcon.sizePx(this.mSize);
        }
        if (this.mPadding != -1) {
            this.mIcon.paddingPx(this.mPadding);
        }
        if (this.mContourColor != 0) {
            this.mIcon.contourColor(this.mContourColor);
        }
        if (this.mContourWidth != -1) {
            this.mIcon.contourWidthPx(this.mContourWidth);
        }
        if (this.mBackgroundColor != 0) {
            this.mIcon.backgroundColor(this.mBackgroundColor);
        }
        if (this.mCornerRadius != -1) {
            this.mIcon.roundedCornersPx(this.mCornerRadius);
        }
    }

    public void setColor(@ColorInt int color) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).color(color);
        }
        this.mColor = color;
    }

    public void setColorRes(@ColorRes int colorRes) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).colorRes(colorRes);
        }
        this.mColor = ContextCompat.getColor(getContext(), colorRes);
    }

    public void setPaddingPx(int padding) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).paddingPx(padding);
        }
        this.mPadding = padding;
    }

    public void setPaddingDp(int paddingDp) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).paddingDp(paddingDp);
        }
        this.mPadding = Utils.convertDpToPx(getContext(), paddingDp);
    }

    public void setPaddingRes(@DimenRes int paddingRes) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).paddingRes(paddingRes);
        }
        this.mPadding = getContext().getResources().getDimensionPixelSize(paddingRes);
    }

    public void setContourColor(@ColorInt int color) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).contourColor(color);
        }
        this.mContourColor = color;
    }

    public void setContourColorRes(@ColorRes int colorRes) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).contourColorRes(colorRes);
        }
        this.mContourColor = ContextCompat.getColor(getContext(), colorRes);
    }

    public void setContourWidthPx(int contourWidth) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).contourWidthPx(contourWidth);
        }
        this.mContourWidth = contourWidth;
    }

    public void setContourWidthDp(int contourWidthDp) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).contourWidthDp(contourWidthDp);
        }
        this.mContourWidth = Utils.convertDpToPx(getContext(), contourWidthDp);
    }

    public void setContourWidthRes(@DimenRes int contourWidthRes) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).contourWidthRes(contourWidthRes);
        }
        this.mContourWidth = getContext().getResources().getDimensionPixelSize(contourWidthRes);
    }

    @Override // android.view.View
    public void setBackgroundColor(@ColorInt int color) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).backgroundColor(color);
        }
        this.mBackgroundColor = color;
    }

    public void setBackgroundColorRes(@ColorRes int colorRes) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).backgroundColorRes(colorRes);
        }
        this.mBackgroundColor = ContextCompat.getColor(getContext(), colorRes);
    }

    public void setRoundedCornersPx(int cornerRadius) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).roundedCornersDp(cornerRadius);
        }
        this.mCornerRadius = cornerRadius;
    }

    public void setRoundedCornersDp(int cornerRadiusDp) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).roundedCornersDp(cornerRadiusDp);
        }
        this.mCornerRadius = Utils.convertDpToPx(getContext(), cornerRadiusDp);
    }

    public void setRoundedCornersRes(@DimenRes int cornerRadiusRes) {
        if (getDrawable() instanceof IconicsDrawable) {
            ((IconicsDrawable) getDrawable()).roundedCornersPx(cornerRadiusRes);
        }
        this.mCornerRadius = getContext().getResources().getDimensionPixelSize(cornerRadiusRes);
    }

    public IconicsDrawable getIcon() {
        if (getDrawable() instanceof IconicsDrawable) {
            return (IconicsDrawable) getDrawable();
        }
        return this.mIcon;
    }
}
