package com.mikepenz.materialdrawer.holder;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.widget.TextView;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.utils.BadgeDrawableBuilder;
import com.mikepenz.materialize.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/holder/BadgeStyle.class */
public class BadgeStyle {
    private int mGradientDrawable;
    private Drawable mBadgeBackground;
    private ColorHolder mColor;
    private ColorHolder mColorPressed;
    private ColorHolder mTextColor;
    private DimenHolder mCorners;
    private DimenHolder mPaddingTopBottom;
    private DimenHolder mPaddingLeftRight;
    private DimenHolder mMinWidth;

    public int getGradientDrawable() {
        return this.mGradientDrawable;
    }

    public BadgeStyle withGradientDrawable(@DrawableRes int gradientDrawable) {
        this.mGradientDrawable = gradientDrawable;
        this.mBadgeBackground = null;
        return this;
    }

    public Drawable getBadgeBackground() {
        return this.mBadgeBackground;
    }

    public BadgeStyle withBadgeBackground(Drawable badgeBackground) {
        this.mBadgeBackground = badgeBackground;
        this.mGradientDrawable = -1;
        return this;
    }

    public ColorHolder getColor() {
        return this.mColor;
    }

    public BadgeStyle withColor(@ColorInt int color) {
        this.mColor = ColorHolder.fromColor(color);
        return this;
    }

    public BadgeStyle withColorRes(@ColorRes int color) {
        this.mColor = ColorHolder.fromColorRes(color);
        return this;
    }

    public ColorHolder getColorPressed() {
        return this.mColorPressed;
    }

    public BadgeStyle withColorPressed(@ColorInt int colorPressed) {
        this.mColorPressed = ColorHolder.fromColor(colorPressed);
        return this;
    }

    public BadgeStyle withColorPressedRes(@ColorRes int colorPressed) {
        this.mColorPressed = ColorHolder.fromColorRes(colorPressed);
        return this;
    }

    public ColorHolder getTextColor() {
        return this.mTextColor;
    }

    public BadgeStyle withTextColor(@ColorInt int textColor) {
        this.mTextColor = ColorHolder.fromColor(textColor);
        return this;
    }

    public BadgeStyle withTextColorRes(@ColorRes int textColor) {
        this.mTextColor = ColorHolder.fromColorRes(textColor);
        return this;
    }

    public DimenHolder getCorners() {
        return this.mCorners;
    }

    public BadgeStyle withCorners(int corners) {
        this.mCorners = DimenHolder.fromPixel(corners);
        return this;
    }

    public BadgeStyle withCornersDp(int corners) {
        this.mCorners = DimenHolder.fromDp(corners);
        return this;
    }

    public DimenHolder getPaddingLeftRight() {
        return this.mPaddingLeftRight;
    }

    public void withPaddingLeftRightPx(int paddingLeftRight) {
        this.mPaddingLeftRight = DimenHolder.fromPixel(paddingLeftRight);
    }

    public void withPaddingLeftRightDp(int paddingLeftRight) {
        this.mPaddingLeftRight = DimenHolder.fromDp(paddingLeftRight);
    }

    public DimenHolder getPaddingTopBottom() {
        return this.mPaddingTopBottom;
    }

    public void withPaddingTopBottomPx(int paddingTopBottom) {
        this.mPaddingTopBottom = DimenHolder.fromPixel(paddingTopBottom);
    }

    public void withPaddingTopBottomDp(int paddingTopBottom) {
        this.mPaddingTopBottom = DimenHolder.fromDp(paddingTopBottom);
    }

    public void withPadding(int padding) {
        this.mPaddingLeftRight = DimenHolder.fromPixel(padding);
        this.mPaddingTopBottom = DimenHolder.fromPixel(padding);
    }

    public BadgeStyle() {
        this.mGradientDrawable = R.drawable.material_drawer_badge;
        this.mPaddingTopBottom = DimenHolder.fromDp(2);
        this.mPaddingLeftRight = DimenHolder.fromDp(3);
        this.mMinWidth = DimenHolder.fromDp(20);
    }

    public DimenHolder getMinWidth() {
        return this.mMinWidth;
    }

    public BadgeStyle withMinWidth(int minWidth) {
        this.mMinWidth = DimenHolder.fromPixel(minWidth);
        return this;
    }

    public BadgeStyle(@ColorInt int color, @ColorInt int colorPressed) {
        this.mGradientDrawable = R.drawable.material_drawer_badge;
        this.mPaddingTopBottom = DimenHolder.fromDp(2);
        this.mPaddingLeftRight = DimenHolder.fromDp(3);
        this.mMinWidth = DimenHolder.fromDp(20);
        this.mColor = ColorHolder.fromColor(color);
        this.mColorPressed = ColorHolder.fromColor(colorPressed);
    }

    public BadgeStyle(@DrawableRes int gradientDrawable, @ColorInt int color, @ColorInt int colorPressed, @ColorInt int textColor) {
        this.mGradientDrawable = R.drawable.material_drawer_badge;
        this.mPaddingTopBottom = DimenHolder.fromDp(2);
        this.mPaddingLeftRight = DimenHolder.fromDp(3);
        this.mMinWidth = DimenHolder.fromDp(20);
        this.mGradientDrawable = gradientDrawable;
        this.mColor = ColorHolder.fromColor(color);
        this.mColorPressed = ColorHolder.fromColor(colorPressed);
        this.mTextColor = ColorHolder.fromColor(textColor);
    }

    public void style(TextView badgeTextView) {
        style(badgeTextView, null);
    }

    public void style(TextView badgeTextView, ColorStateList colorStateList) {
        Context ctx = badgeTextView.getContext();
        if (this.mBadgeBackground == null) {
            UIUtils.setBackground(badgeTextView, new BadgeDrawableBuilder(this).build(ctx));
        } else {
            UIUtils.setBackground(badgeTextView, this.mBadgeBackground);
        }
        if (this.mTextColor != null) {
            ColorHolder.applyToOr(this.mTextColor, badgeTextView, null);
        } else if (colorStateList != null) {
            badgeTextView.setTextColor(colorStateList);
        }
        int paddingLeftRight = this.mPaddingLeftRight.asPixel(ctx);
        int paddingTopBottom = this.mPaddingTopBottom.asPixel(ctx);
        badgeTextView.setPadding(paddingLeftRight, paddingTopBottom, paddingLeftRight, paddingTopBottom);
        badgeTextView.setMinWidth(this.mMinWidth.asPixel(ctx));
    }
}
