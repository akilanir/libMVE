package me.zhanghai.android.materialprogressbar;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import me.zhanghai.android.materialprogressbar.internal.ThemeUtils;

/* loaded from: me.zhanghai.android.materialprogressbar.library.1.1.5.jar:me/zhanghai/android/materialprogressbar/HorizontalProgressDrawable.class */
public class HorizontalProgressDrawable extends LayerDrawable implements IntrinsicPaddingDrawable, ShowTrackDrawable, TintableDrawable {
    private int mSecondaryAlpha;
    private SingleHorizontalProgressDrawable mTrackDrawable;
    private SingleHorizontalProgressDrawable mSecondaryProgressDrawable;
    private SingleHorizontalProgressDrawable mProgressDrawable;

    public HorizontalProgressDrawable(Context context) {
        super(new Drawable[]{new SingleHorizontalProgressDrawable(context), new SingleHorizontalProgressDrawable(context), new SingleHorizontalProgressDrawable(context)});
        setId(0, R.id.background);
        this.mTrackDrawable = (SingleHorizontalProgressDrawable) getDrawable(0);
        setId(1, R.id.secondaryProgress);
        this.mSecondaryProgressDrawable = (SingleHorizontalProgressDrawable) getDrawable(1);
        float disabledAlpha = ThemeUtils.getFloatFromAttrRes(R.attr.disabledAlpha, context);
        this.mSecondaryAlpha = Math.round(disabledAlpha * 255.0f);
        this.mSecondaryProgressDrawable.setAlpha(this.mSecondaryAlpha);
        this.mSecondaryProgressDrawable.setShowTrack(false);
        setId(2, R.id.progress);
        this.mProgressDrawable = (SingleHorizontalProgressDrawable) getDrawable(2);
        this.mProgressDrawable.setShowTrack(false);
    }

    @Override // me.zhanghai.android.materialprogressbar.ShowTrackDrawable
    public boolean getShowTrack() {
        return this.mTrackDrawable.getShowTrack();
    }

    @Override // me.zhanghai.android.materialprogressbar.ShowTrackDrawable
    public void setShowTrack(boolean showTrack) {
        if (this.mTrackDrawable.getShowTrack() != showTrack) {
            this.mTrackDrawable.setShowTrack(showTrack);
            this.mSecondaryProgressDrawable.setAlpha(showTrack ? this.mSecondaryAlpha : 2 * this.mSecondaryAlpha);
        }
    }

    @Override // me.zhanghai.android.materialprogressbar.IntrinsicPaddingDrawable
    public boolean getUseIntrinsicPadding() {
        return this.mTrackDrawable.getUseIntrinsicPadding();
    }

    @Override // me.zhanghai.android.materialprogressbar.IntrinsicPaddingDrawable
    public void setUseIntrinsicPadding(boolean useIntrinsicPadding) {
        this.mTrackDrawable.setUseIntrinsicPadding(useIntrinsicPadding);
        this.mSecondaryProgressDrawable.setUseIntrinsicPadding(useIntrinsicPadding);
        this.mProgressDrawable.setUseIntrinsicPadding(useIntrinsicPadding);
    }

    @Override // android.graphics.drawable.Drawable, me.zhanghai.android.materialprogressbar.TintableDrawable
    @SuppressLint({"NewApi"})
    public void setTint(@ColorInt int tintColor) {
        this.mTrackDrawable.setTint(tintColor);
        this.mSecondaryProgressDrawable.setTint(tintColor);
        this.mProgressDrawable.setTint(tintColor);
    }

    @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable, me.zhanghai.android.materialprogressbar.TintableDrawable
    @SuppressLint({"NewApi"})
    public void setTintList(@Nullable ColorStateList tint) {
        this.mTrackDrawable.setTintList(tint);
        this.mSecondaryProgressDrawable.setTintList(tint);
        this.mProgressDrawable.setTintList(tint);
    }

    @Override // android.graphics.drawable.Drawable, me.zhanghai.android.materialprogressbar.TintableDrawable
    @SuppressLint({"NewApi"})
    public void setTintMode(@NonNull PorterDuff.Mode tintMode) {
        this.mTrackDrawable.setTintMode(tintMode);
        this.mSecondaryProgressDrawable.setTintMode(tintMode);
        this.mProgressDrawable.setTintMode(tintMode);
    }
}
