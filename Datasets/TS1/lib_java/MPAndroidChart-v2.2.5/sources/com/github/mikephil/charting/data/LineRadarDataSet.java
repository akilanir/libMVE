package com.github.mikephil.charting.data;

import android.annotation.TargetApi;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import com.github.mikephil.charting.charts.Chart;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet;
import com.github.mikephil.charting.utils.Utils;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/LineRadarDataSet.class */
public abstract class LineRadarDataSet<T extends Entry> extends LineScatterCandleRadarDataSet<T> implements ILineRadarDataSet<T> {
    private int mFillColor;
    protected Drawable mFillDrawable;
    private int mFillAlpha;
    private float mLineWidth;
    private boolean mDrawFilled;

    public LineRadarDataSet(List<T> yVals, String label) {
        super(yVals, label);
        this.mFillColor = Color.rgb(140, 234, 255);
        this.mFillAlpha = 85;
        this.mLineWidth = 2.5f;
        this.mDrawFilled = false;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public int getFillColor() {
        return this.mFillColor;
    }

    public void setFillColor(int color) {
        this.mFillColor = color;
        this.mFillDrawable = null;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public Drawable getFillDrawable() {
        return this.mFillDrawable;
    }

    @TargetApi(Chart.PAINT_LEGEND_LABEL)
    public void setFillDrawable(Drawable drawable) {
        this.mFillDrawable = drawable;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public int getFillAlpha() {
        return this.mFillAlpha;
    }

    public void setFillAlpha(int alpha) {
        this.mFillAlpha = alpha;
    }

    public void setLineWidth(float width) {
        if (width < 0.2f) {
            width = 0.2f;
        }
        if (width > 10.0f) {
            width = 10.0f;
        }
        this.mLineWidth = Utils.convertDpToPixel(width);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public float getLineWidth() {
        return this.mLineWidth;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public void setDrawFilled(boolean filled) {
        this.mDrawFilled = filled;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public boolean isDrawFilledEnabled() {
        return this.mDrawFilled;
    }
}
