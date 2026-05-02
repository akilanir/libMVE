package com.makeramen;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.widget.ImageView;
import com.squareup.picasso.Transformation;

/* loaded from: com.makeramen.roundedimageview.1.5.0.jar:com/makeramen/RoundedTransformationBuilder.class */
public final class RoundedTransformationBuilder {
    private float mCornerRadius = 0.0f;
    private boolean mOval = false;
    private float mBorderWidth = 0.0f;
    private ColorStateList mBorderColor = ColorStateList.valueOf(RoundedDrawable.DEFAULT_BORDER_COLOR);
    private ImageView.ScaleType mScaleType = ImageView.ScaleType.FIT_CENTER;
    private final DisplayMetrics mDisplayMetrics = Resources.getSystem().getDisplayMetrics();

    public RoundedTransformationBuilder scaleType(ImageView.ScaleType scaleType) {
        this.mScaleType = scaleType;
        return this;
    }

    public RoundedTransformationBuilder cornerRadius(float radiusPx) {
        this.mCornerRadius = radiusPx;
        return this;
    }

    public RoundedTransformationBuilder cornerRadiusDp(float radiusDp) {
        this.mCornerRadius = TypedValue.applyDimension(1, radiusDp, this.mDisplayMetrics);
        return this;
    }

    public RoundedTransformationBuilder borderWidth(float widthPx) {
        this.mBorderWidth = widthPx;
        return this;
    }

    public RoundedTransformationBuilder borderWidthDp(float widthDp) {
        this.mBorderWidth = TypedValue.applyDimension(1, widthDp, this.mDisplayMetrics);
        return this;
    }

    public RoundedTransformationBuilder borderColor(int color) {
        this.mBorderColor = ColorStateList.valueOf(color);
        return this;
    }

    public RoundedTransformationBuilder borderColor(ColorStateList colors) {
        this.mBorderColor = colors;
        return this;
    }

    public RoundedTransformationBuilder oval(boolean oval) {
        this.mOval = oval;
        return this;
    }

    public Transformation build() {
        return new Transformation() { // from class: com.makeramen.RoundedTransformationBuilder.1
            public Bitmap transform(Bitmap source) {
                Bitmap transformed = RoundedDrawable.fromBitmap(source).setScaleType(RoundedTransformationBuilder.this.mScaleType).setCornerRadius(RoundedTransformationBuilder.this.mCornerRadius).setBorderWidth(RoundedTransformationBuilder.this.mBorderWidth).setBorderColor(RoundedTransformationBuilder.this.mBorderColor).setOval(RoundedTransformationBuilder.this.mOval).toBitmap();
                if (!source.equals(transformed)) {
                    source.recycle();
                }
                return transformed;
            }

            public String key() {
                return "r:" + RoundedTransformationBuilder.this.mCornerRadius + "b:" + RoundedTransformationBuilder.this.mBorderWidth + "c:" + RoundedTransformationBuilder.this.mBorderColor + "o:" + RoundedTransformationBuilder.this.mOval;
            }
        };
    }
}
