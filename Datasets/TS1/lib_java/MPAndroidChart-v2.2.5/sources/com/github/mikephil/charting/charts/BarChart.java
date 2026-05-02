package com.github.mikephil.charting.charts;

import android.content.Context;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.Log;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.highlight.BarHighlighter;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider;
import com.github.mikephil.charting.interfaces.datasets.IBarDataSet;
import com.github.mikephil.charting.renderer.BarChartRenderer;
import com.github.mikephil.charting.renderer.XAxisRendererBarChart;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/BarChart.class */
public class BarChart extends BarLineChartBase<BarData> implements BarDataProvider {
    private boolean mDrawHighlightArrow;
    private boolean mDrawValueAboveBar;
    private boolean mDrawBarShadow;

    public BarChart(Context context) {
        super(context);
        this.mDrawHighlightArrow = false;
        this.mDrawValueAboveBar = true;
        this.mDrawBarShadow = false;
    }

    public BarChart(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mDrawHighlightArrow = false;
        this.mDrawValueAboveBar = true;
        this.mDrawBarShadow = false;
    }

    public BarChart(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mDrawHighlightArrow = false;
        this.mDrawValueAboveBar = true;
        this.mDrawBarShadow = false;
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.charts.Chart
    protected void init() {
        super.init();
        this.mRenderer = new BarChartRenderer(this, this.mAnimator, this.mViewPortHandler);
        this.mXAxisRenderer = new XAxisRendererBarChart(this.mViewPortHandler, this.mXAxis, this.mLeftAxisTransformer, this);
        setHighlighter(new BarHighlighter(this));
        this.mXAxis.mAxisMinimum = -0.5f;
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.charts.Chart
    protected void calcMinMax() {
        super.calcMinMax();
        this.mXAxis.mAxisRange += 0.5f;
        this.mXAxis.mAxisRange *= ((BarData) this.mData).getDataSetCount();
        float groupSpace = ((BarData) this.mData).getGroupSpace();
        this.mXAxis.mAxisRange += ((BarData) this.mData).getXValCount() * groupSpace;
        this.mXAxis.mAxisMaximum = this.mXAxis.mAxisRange - this.mXAxis.mAxisMinimum;
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase
    public Highlight getHighlightByTouchPoint(float x, float y) {
        if (this.mData == 0) {
            Log.e(Chart.LOG_TAG, "Can't select by touch. No data set.");
            return null;
        }
        return getHighlighter().getHighlight(x, y);
    }

    public RectF getBarBounds(BarEntry e) {
        IBarDataSet set = (IBarDataSet) ((BarData) this.mData).getDataSetForEntry(e);
        if (set == null) {
            return null;
        }
        float barspace = set.getBarSpace();
        float y = e.getVal();
        float x = e.getXIndex();
        float spaceHalf = barspace / 2.0f;
        float left = (x - 0.5f) + spaceHalf;
        float right = (x + 0.5f) - spaceHalf;
        float top = y >= 0.0f ? y : 0.0f;
        float bottom = y <= 0.0f ? y : 0.0f;
        RectF bounds = new RectF(left, top, right, bottom);
        getTransformer(set.getAxisDependency()).rectValueToPixel(bounds);
        return bounds;
    }

    public void setDrawHighlightArrow(boolean enabled) {
        this.mDrawHighlightArrow = enabled;
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider
    public boolean isDrawHighlightArrowEnabled() {
        return this.mDrawHighlightArrow;
    }

    public void setDrawValueAboveBar(boolean enabled) {
        this.mDrawValueAboveBar = enabled;
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider
    public boolean isDrawValueAboveBarEnabled() {
        return this.mDrawValueAboveBar;
    }

    public void setDrawBarShadow(boolean enabled) {
        this.mDrawBarShadow = enabled;
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider
    public boolean isDrawBarShadowEnabled() {
        return this.mDrawBarShadow;
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider
    public BarData getBarData() {
        return (BarData) this.mData;
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider
    public int getLowestVisibleXIndex() {
        float step = ((BarData) this.mData).getDataSetCount();
        float div = step <= 1.0f ? 1.0f : step + ((BarData) this.mData).getGroupSpace();
        float[] pts = {this.mViewPortHandler.contentLeft(), this.mViewPortHandler.contentBottom()};
        getTransformer(YAxis.AxisDependency.LEFT).pixelsToValue(pts);
        return (int) (pts[0] <= getXChartMin() ? 0.0f : (pts[0] / div) + 1.0f);
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider
    public int getHighestVisibleXIndex() {
        float step = ((BarData) this.mData).getDataSetCount();
        float div = step <= 1.0f ? 1.0f : step + ((BarData) this.mData).getGroupSpace();
        float[] pts = {this.mViewPortHandler.contentRight(), this.mViewPortHandler.contentBottom()};
        getTransformer(YAxis.AxisDependency.LEFT).pixelsToValue(pts);
        return (int) (pts[0] >= getXChartMax() ? getXChartMax() / div : pts[0] / div);
    }
}
