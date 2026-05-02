package com.github.mikephil.charting.charts;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.PointF;
import android.graphics.RectF;
import android.util.AttributeSet;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.RadarData;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.renderer.RadarChartRenderer;
import com.github.mikephil.charting.renderer.XAxisRendererRadarChart;
import com.github.mikephil.charting.renderer.YAxisRendererRadarChart;
import com.github.mikephil.charting.utils.Utils;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/RadarChart.class */
public class RadarChart extends PieRadarChartBase<RadarData> {
    private float mWebLineWidth;
    private float mInnerWebLineWidth;
    private int mWebColor;
    private int mWebColorInner;
    private int mWebAlpha;
    private boolean mDrawWeb;
    private int mSkipWebLineCount;
    private YAxis mYAxis;
    protected YAxisRendererRadarChart mYAxisRenderer;
    protected XAxisRendererRadarChart mXAxisRenderer;

    public RadarChart(Context context) {
        super(context);
        this.mWebLineWidth = 2.5f;
        this.mInnerWebLineWidth = 1.5f;
        this.mWebColor = Color.rgb(122, 122, 122);
        this.mWebColorInner = Color.rgb(122, 122, 122);
        this.mWebAlpha = 150;
        this.mDrawWeb = true;
        this.mSkipWebLineCount = 0;
    }

    public RadarChart(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mWebLineWidth = 2.5f;
        this.mInnerWebLineWidth = 1.5f;
        this.mWebColor = Color.rgb(122, 122, 122);
        this.mWebColorInner = Color.rgb(122, 122, 122);
        this.mWebAlpha = 150;
        this.mDrawWeb = true;
        this.mSkipWebLineCount = 0;
    }

    public RadarChart(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mWebLineWidth = 2.5f;
        this.mInnerWebLineWidth = 1.5f;
        this.mWebColor = Color.rgb(122, 122, 122);
        this.mWebColorInner = Color.rgb(122, 122, 122);
        this.mWebAlpha = 150;
        this.mDrawWeb = true;
        this.mSkipWebLineCount = 0;
    }

    @Override // com.github.mikephil.charting.charts.PieRadarChartBase, com.github.mikephil.charting.charts.Chart
    protected void init() {
        super.init();
        this.mYAxis = new YAxis(YAxis.AxisDependency.LEFT);
        this.mXAxis.setSpaceBetweenLabels(0);
        this.mWebLineWidth = Utils.convertDpToPixel(1.5f);
        this.mInnerWebLineWidth = Utils.convertDpToPixel(0.75f);
        this.mRenderer = new RadarChartRenderer(this, this.mAnimator, this.mViewPortHandler);
        this.mYAxisRenderer = new YAxisRendererRadarChart(this.mViewPortHandler, this.mYAxis, this);
        this.mXAxisRenderer = new XAxisRendererRadarChart(this.mViewPortHandler, this.mXAxis, this);
    }

    @Override // com.github.mikephil.charting.charts.PieRadarChartBase, com.github.mikephil.charting.charts.Chart
    protected void calcMinMax() {
        super.calcMinMax();
        this.mXAxis.mAxisMaximum = ((RadarData) this.mData).getXVals().size() - 1;
        this.mXAxis.mAxisRange = Math.abs(this.mXAxis.mAxisMaximum - this.mXAxis.mAxisMinimum);
        this.mYAxis.calculate(((RadarData) this.mData).getYMin(YAxis.AxisDependency.LEFT), ((RadarData) this.mData).getYMax(YAxis.AxisDependency.LEFT));
    }

    @Override // com.github.mikephil.charting.charts.Chart
    protected float[] getMarkerPosition(Entry e, Highlight highlight) {
        float angle = (getSliceAngle() * e.getXIndex()) + getRotationAngle();
        float val = e.getVal() * getFactor();
        PointF c = getCenterOffsets();
        PointF p = new PointF((float) (c.x + (val * Math.cos(Math.toRadians(angle)))), (float) (c.y + (val * Math.sin(Math.toRadians(angle)))));
        return new float[]{p.x, p.y};
    }

    @Override // com.github.mikephil.charting.charts.PieRadarChartBase, com.github.mikephil.charting.charts.Chart
    public void notifyDataSetChanged() {
        if (this.mData == 0) {
            return;
        }
        calcMinMax();
        this.mYAxisRenderer.computeAxis(this.mYAxis.mAxisMinimum, this.mYAxis.mAxisMaximum);
        this.mXAxisRenderer.computeAxis(((RadarData) this.mData).getXValMaximumLength(), ((RadarData) this.mData).getXVals());
        if (this.mLegend != null && !this.mLegend.isLegendCustom()) {
            this.mLegendRenderer.computeLegend(this.mData);
        }
        calculateOffsets();
    }

    @Override // com.github.mikephil.charting.charts.Chart, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mData == 0) {
            return;
        }
        this.mXAxisRenderer.renderAxisLabels(canvas);
        if (this.mDrawWeb) {
            this.mRenderer.drawExtras(canvas);
        }
        this.mYAxisRenderer.renderLimitLines(canvas);
        this.mRenderer.drawData(canvas);
        if (valuesToHighlight()) {
            this.mRenderer.drawHighlighted(canvas, this.mIndicesToHighlight);
        }
        this.mYAxisRenderer.renderAxisLabels(canvas);
        this.mRenderer.drawValues(canvas);
        this.mLegendRenderer.renderLegend(canvas);
        drawDescription(canvas);
        drawMarkers(canvas);
    }

    public float getFactor() {
        RectF content = this.mViewPortHandler.getContentRect();
        return Math.min(content.width() / 2.0f, content.height() / 2.0f) / this.mYAxis.mAxisRange;
    }

    public float getSliceAngle() {
        return 360.0f / ((RadarData) this.mData).getXValCount();
    }

    @Override // com.github.mikephil.charting.charts.PieRadarChartBase
    public int getIndexForAngle(float angle) {
        float a = Utils.getNormalizedAngle(angle - getRotationAngle());
        float sliceangle = getSliceAngle();
        for (int i = 0; i < ((RadarData) this.mData).getXValCount(); i++) {
            if ((sliceangle * (i + 1)) - (sliceangle / 2.0f) > a) {
                return i;
            }
        }
        return 0;
    }

    public YAxis getYAxis() {
        return this.mYAxis;
    }

    public void setWebLineWidth(float width) {
        this.mWebLineWidth = Utils.convertDpToPixel(width);
    }

    public float getWebLineWidth() {
        return this.mWebLineWidth;
    }

    public void setWebLineWidthInner(float width) {
        this.mInnerWebLineWidth = Utils.convertDpToPixel(width);
    }

    public float getWebLineWidthInner() {
        return this.mInnerWebLineWidth;
    }

    public void setWebAlpha(int alpha) {
        this.mWebAlpha = alpha;
    }

    public int getWebAlpha() {
        return this.mWebAlpha;
    }

    public void setWebColor(int color) {
        this.mWebColor = color;
    }

    public int getWebColor() {
        return this.mWebColor;
    }

    public void setWebColorInner(int color) {
        this.mWebColorInner = color;
    }

    public int getWebColorInner() {
        return this.mWebColorInner;
    }

    public void setDrawWeb(boolean enabled) {
        this.mDrawWeb = enabled;
    }

    public void setSkipWebLineCount(int count) {
        this.mSkipWebLineCount = Math.max(0, count);
    }

    public int getSkipWebLineCount() {
        return this.mSkipWebLineCount;
    }

    @Override // com.github.mikephil.charting.charts.PieRadarChartBase
    protected float getRequiredLegendOffset() {
        return this.mLegendRenderer.getLabelPaint().getTextSize() * 4.0f;
    }

    @Override // com.github.mikephil.charting.charts.PieRadarChartBase
    protected float getRequiredBaseOffset() {
        return (this.mXAxis.isEnabled() && this.mXAxis.isDrawLabelsEnabled()) ? this.mXAxis.mLabelRotatedWidth : Utils.convertDpToPixel(10.0f);
    }

    @Override // com.github.mikephil.charting.charts.PieRadarChartBase
    public float getRadius() {
        RectF content = this.mViewPortHandler.getContentRect();
        return Math.min(content.width() / 2.0f, content.height() / 2.0f);
    }

    @Override // com.github.mikephil.charting.charts.PieRadarChartBase, com.github.mikephil.charting.interfaces.dataprovider.ChartInterface
    public float getYChartMax() {
        return this.mYAxis.mAxisMaximum;
    }

    @Override // com.github.mikephil.charting.charts.PieRadarChartBase, com.github.mikephil.charting.interfaces.dataprovider.ChartInterface
    public float getYChartMin() {
        return this.mYAxis.mAxisMinimum;
    }

    public float getYRange() {
        return this.mYAxis.mAxisRange;
    }
}
