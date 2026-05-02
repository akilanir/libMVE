package com.github.mikephil.charting.components;

import android.graphics.Color;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.utils.Utils;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/LimitLine.class */
public class LimitLine extends ComponentBase {
    private float mLimit;
    private float mLineWidth;
    private int mLineColor;
    private Paint.Style mTextStyle;
    private String mLabel;
    private DashPathEffect mDashPathEffect;
    private LimitLabelPosition mLabelPosition;

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/LimitLine$LimitLabelPosition.class */
    public enum LimitLabelPosition {
        LEFT_TOP,
        LEFT_BOTTOM,
        RIGHT_TOP,
        RIGHT_BOTTOM
    }

    public LimitLine(float limit) {
        this.mLimit = 0.0f;
        this.mLineWidth = 2.0f;
        this.mLineColor = Color.rgb(237, 91, 91);
        this.mTextStyle = Paint.Style.FILL_AND_STROKE;
        this.mLabel = BuildConfig.FLAVOR;
        this.mDashPathEffect = null;
        this.mLabelPosition = LimitLabelPosition.RIGHT_TOP;
        this.mLimit = limit;
    }

    public LimitLine(float limit, String label) {
        this.mLimit = 0.0f;
        this.mLineWidth = 2.0f;
        this.mLineColor = Color.rgb(237, 91, 91);
        this.mTextStyle = Paint.Style.FILL_AND_STROKE;
        this.mLabel = BuildConfig.FLAVOR;
        this.mDashPathEffect = null;
        this.mLabelPosition = LimitLabelPosition.RIGHT_TOP;
        this.mLimit = limit;
        this.mLabel = label;
    }

    public float getLimit() {
        return this.mLimit;
    }

    public void setLineWidth(float width) {
        if (width < 0.2f) {
            width = 0.2f;
        }
        if (width > 12.0f) {
            width = 12.0f;
        }
        this.mLineWidth = Utils.convertDpToPixel(width);
    }

    public float getLineWidth() {
        return this.mLineWidth;
    }

    public void setLineColor(int color) {
        this.mLineColor = color;
    }

    public int getLineColor() {
        return this.mLineColor;
    }

    public void enableDashedLine(float lineLength, float spaceLength, float phase) {
        this.mDashPathEffect = new DashPathEffect(new float[]{lineLength, spaceLength}, phase);
    }

    public void disableDashedLine() {
        this.mDashPathEffect = null;
    }

    public boolean isDashedLineEnabled() {
        return this.mDashPathEffect != null;
    }

    public DashPathEffect getDashPathEffect() {
        return this.mDashPathEffect;
    }

    public void setTextStyle(Paint.Style style) {
        this.mTextStyle = style;
    }

    public Paint.Style getTextStyle() {
        return this.mTextStyle;
    }

    public void setLabelPosition(LimitLabelPosition pos) {
        this.mLabelPosition = pos;
    }

    public LimitLabelPosition getLabelPosition() {
        return this.mLabelPosition;
    }

    public void setLabel(String label) {
        this.mLabel = label;
    }

    public String getLabel() {
        return this.mLabel;
    }
}
