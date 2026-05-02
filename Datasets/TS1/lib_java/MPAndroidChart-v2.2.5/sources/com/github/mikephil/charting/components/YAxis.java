package com.github.mikephil.charting.components;

import android.graphics.Paint;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.formatter.DefaultValueFormatter;
import com.github.mikephil.charting.formatter.DefaultYAxisValueFormatter;
import com.github.mikephil.charting.formatter.YAxisValueFormatter;
import com.github.mikephil.charting.utils.Utils;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/YAxis.class */
public class YAxis extends AxisBase {
    protected YAxisValueFormatter mYAxisValueFormatter;
    public float[] mEntries;
    public int mEntryCount;
    public int mDecimals;
    private int mLabelCount;
    private boolean mDrawTopYLabelEntry;
    protected boolean mShowOnlyMinMax;
    protected boolean mInverted;
    protected boolean mForceLabels;
    protected boolean mDrawZeroLine;
    protected int mZeroLineColor;
    protected float mZeroLineWidth;
    protected float mSpacePercentTop;
    protected float mSpacePercentBottom;
    private YAxisLabelPosition mPosition;
    private AxisDependency mAxisDependency;
    protected float mMinWidth;
    protected float mMaxWidth;
    protected boolean mGranularityEnabled;
    protected float mGranularity;

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/YAxis$AxisDependency.class */
    public enum AxisDependency {
        LEFT,
        RIGHT
    }

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/YAxis$YAxisLabelPosition.class */
    public enum YAxisLabelPosition {
        OUTSIDE_CHART,
        INSIDE_CHART
    }

    public YAxis() {
        this.mEntries = new float[0];
        this.mLabelCount = 6;
        this.mDrawTopYLabelEntry = true;
        this.mShowOnlyMinMax = false;
        this.mInverted = false;
        this.mForceLabels = false;
        this.mDrawZeroLine = false;
        this.mZeroLineColor = -7829368;
        this.mZeroLineWidth = 1.0f;
        this.mSpacePercentTop = 10.0f;
        this.mSpacePercentBottom = 10.0f;
        this.mPosition = YAxisLabelPosition.OUTSIDE_CHART;
        this.mMinWidth = 0.0f;
        this.mMaxWidth = Float.POSITIVE_INFINITY;
        this.mGranularityEnabled = false;
        this.mGranularity = 1.0f;
        this.mAxisDependency = AxisDependency.LEFT;
        this.mYOffset = 0.0f;
    }

    public YAxis(AxisDependency position) {
        this.mEntries = new float[0];
        this.mLabelCount = 6;
        this.mDrawTopYLabelEntry = true;
        this.mShowOnlyMinMax = false;
        this.mInverted = false;
        this.mForceLabels = false;
        this.mDrawZeroLine = false;
        this.mZeroLineColor = -7829368;
        this.mZeroLineWidth = 1.0f;
        this.mSpacePercentTop = 10.0f;
        this.mSpacePercentBottom = 10.0f;
        this.mPosition = YAxisLabelPosition.OUTSIDE_CHART;
        this.mMinWidth = 0.0f;
        this.mMaxWidth = Float.POSITIVE_INFINITY;
        this.mGranularityEnabled = false;
        this.mGranularity = 1.0f;
        this.mAxisDependency = position;
        this.mYOffset = 0.0f;
    }

    public AxisDependency getAxisDependency() {
        return this.mAxisDependency;
    }

    public float getMinWidth() {
        return this.mMinWidth;
    }

    public void setMinWidth(float minWidth) {
        this.mMinWidth = minWidth;
    }

    public float getMaxWidth() {
        return this.mMaxWidth;
    }

    public void setMaxWidth(float maxWidth) {
        this.mMaxWidth = maxWidth;
    }

    public boolean isGranularityEnabled() {
        return this.mGranularityEnabled;
    }

    public void setGranularityEnabled(boolean enabled) {
        this.mGranularityEnabled = true;
    }

    public float getGranularity() {
        return this.mGranularity;
    }

    public void setGranularity(float granularity) {
        this.mGranularity = granularity;
        this.mGranularityEnabled = true;
    }

    public YAxisLabelPosition getLabelPosition() {
        return this.mPosition;
    }

    public void setPosition(YAxisLabelPosition pos) {
        this.mPosition = pos;
    }

    public boolean isDrawTopYLabelEntryEnabled() {
        return this.mDrawTopYLabelEntry;
    }

    public void setDrawTopYLabelEntry(boolean enabled) {
        this.mDrawTopYLabelEntry = enabled;
    }

    public void setLabelCount(int count, boolean force) {
        if (count > 25) {
            count = 25;
        }
        if (count < 2) {
            count = 2;
        }
        this.mLabelCount = count;
        this.mForceLabels = force;
    }

    public int getLabelCount() {
        return this.mLabelCount;
    }

    public boolean isForceLabelsEnabled() {
        return this.mForceLabels;
    }

    public void setShowOnlyMinMax(boolean enabled) {
        this.mShowOnlyMinMax = enabled;
    }

    public boolean isShowOnlyMinMaxEnabled() {
        return this.mShowOnlyMinMax;
    }

    public void setInverted(boolean enabled) {
        this.mInverted = enabled;
    }

    public boolean isInverted() {
        return this.mInverted;
    }

    @Deprecated
    public void setStartAtZero(boolean startAtZero) {
        if (startAtZero) {
            setAxisMinValue(0.0f);
        } else {
            resetAxisMinValue();
        }
    }

    public void setSpaceTop(float percent) {
        this.mSpacePercentTop = percent;
    }

    public float getSpaceTop() {
        return this.mSpacePercentTop;
    }

    public void setSpaceBottom(float percent) {
        this.mSpacePercentBottom = percent;
    }

    public float getSpaceBottom() {
        return this.mSpacePercentBottom;
    }

    public boolean isDrawZeroLineEnabled() {
        return this.mDrawZeroLine;
    }

    public void setDrawZeroLine(boolean mDrawZeroLine) {
        this.mDrawZeroLine = mDrawZeroLine;
    }

    public int getZeroLineColor() {
        return this.mZeroLineColor;
    }

    public void setZeroLineColor(int color) {
        this.mZeroLineColor = color;
    }

    public float getZeroLineWidth() {
        return this.mZeroLineWidth;
    }

    public void setZeroLineWidth(float width) {
        this.mZeroLineWidth = Utils.convertDpToPixel(width);
    }

    public float getRequiredWidthSpace(Paint p) {
        p.setTextSize(this.mTextSize);
        String label = getLongestLabel();
        float width = Utils.calcTextWidth(p, label) + (getXOffset() * 2.0f);
        float minWidth = getMinWidth();
        float maxWidth = getMaxWidth();
        if (minWidth > 0.0f) {
            minWidth = Utils.convertDpToPixel(minWidth);
        }
        if (maxWidth > 0.0f && maxWidth != Float.POSITIVE_INFINITY) {
            maxWidth = Utils.convertDpToPixel(maxWidth);
        }
        return Math.max(minWidth, Math.min(width, ((double) maxWidth) > 0.0d ? maxWidth : width));
    }

    public float getRequiredHeightSpace(Paint p) {
        p.setTextSize(this.mTextSize);
        String label = getLongestLabel();
        return Utils.calcTextHeight(p, label) + (getYOffset() * 2.0f);
    }

    @Override // com.github.mikephil.charting.components.AxisBase
    public String getLongestLabel() {
        String longest = BuildConfig.FLAVOR;
        for (int i = 0; i < this.mEntries.length; i++) {
            String text = getFormattedLabel(i);
            if (longest.length() < text.length()) {
                longest = text;
            }
        }
        return longest;
    }

    public String getFormattedLabel(int index) {
        if (index < 0 || index >= this.mEntries.length) {
            return BuildConfig.FLAVOR;
        }
        return getValueFormatter().getFormattedValue(this.mEntries[index], this);
    }

    public void setValueFormatter(YAxisValueFormatter f) {
        if (f == null) {
            this.mYAxisValueFormatter = new DefaultYAxisValueFormatter(this.mDecimals);
        } else {
            this.mYAxisValueFormatter = f;
        }
    }

    public YAxisValueFormatter getValueFormatter() {
        if (this.mYAxisValueFormatter == null) {
            this.mYAxisValueFormatter = new DefaultYAxisValueFormatter(this.mDecimals);
        }
        return this.mYAxisValueFormatter;
    }

    public boolean needsDefaultFormatter() {
        if (this.mYAxisValueFormatter == null || (this.mYAxisValueFormatter instanceof DefaultValueFormatter)) {
            return true;
        }
        return false;
    }

    public boolean needsOffset() {
        if (isEnabled() && isDrawLabelsEnabled() && getLabelPosition() == YAxisLabelPosition.OUTSIDE_CHART) {
            return true;
        }
        return false;
    }

    public void calculate(float dataMin, float dataMax) {
        float min = this.mCustomAxisMin ? this.mAxisMinimum : dataMin;
        float max = this.mCustomAxisMax ? this.mAxisMaximum : dataMax;
        float range = Math.abs(max - min);
        if (range == 0.0f) {
            max += 1.0f;
            min -= 1.0f;
        }
        if (!this.mCustomAxisMin) {
            float bottomSpace = (range / 100.0f) * getSpaceBottom();
            this.mAxisMinimum = min - bottomSpace;
        }
        if (!this.mCustomAxisMax) {
            float topSpace = (range / 100.0f) * getSpaceTop();
            this.mAxisMaximum = max + topSpace;
        }
        this.mAxisRange = Math.abs(this.mAxisMaximum - this.mAxisMinimum);
    }
}
