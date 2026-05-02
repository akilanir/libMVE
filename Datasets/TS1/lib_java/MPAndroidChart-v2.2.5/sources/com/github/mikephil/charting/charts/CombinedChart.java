package com.github.mikephil.charting.charts;

import android.content.Context;
import android.util.AttributeSet;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BubbleData;
import com.github.mikephil.charting.data.CandleData;
import com.github.mikephil.charting.data.CombinedData;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.ScatterData;
import com.github.mikephil.charting.highlight.CombinedHighlighter;
import com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider;
import com.github.mikephil.charting.interfaces.dataprovider.BubbleDataProvider;
import com.github.mikephil.charting.interfaces.dataprovider.CandleDataProvider;
import com.github.mikephil.charting.interfaces.dataprovider.LineDataProvider;
import com.github.mikephil.charting.interfaces.dataprovider.ScatterDataProvider;
import com.github.mikephil.charting.renderer.CombinedChartRenderer;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/CombinedChart.class */
public class CombinedChart extends BarLineChartBase<CombinedData> implements LineDataProvider, BarDataProvider, ScatterDataProvider, CandleDataProvider, BubbleDataProvider {
    private boolean mDrawHighlightArrow;
    private boolean mDrawValueAboveBar;
    private boolean mDrawBarShadow;
    protected DrawOrder[] mDrawOrder;

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/CombinedChart$DrawOrder.class */
    public enum DrawOrder {
        BAR,
        BUBBLE,
        LINE,
        CANDLE,
        SCATTER
    }

    public CombinedChart(Context context) {
        super(context);
        this.mDrawHighlightArrow = false;
        this.mDrawValueAboveBar = true;
        this.mDrawBarShadow = false;
        this.mDrawOrder = new DrawOrder[]{DrawOrder.BAR, DrawOrder.BUBBLE, DrawOrder.LINE, DrawOrder.CANDLE, DrawOrder.SCATTER};
    }

    public CombinedChart(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mDrawHighlightArrow = false;
        this.mDrawValueAboveBar = true;
        this.mDrawBarShadow = false;
        this.mDrawOrder = new DrawOrder[]{DrawOrder.BAR, DrawOrder.BUBBLE, DrawOrder.LINE, DrawOrder.CANDLE, DrawOrder.SCATTER};
    }

    public CombinedChart(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mDrawHighlightArrow = false;
        this.mDrawValueAboveBar = true;
        this.mDrawBarShadow = false;
        this.mDrawOrder = new DrawOrder[]{DrawOrder.BAR, DrawOrder.BUBBLE, DrawOrder.LINE, DrawOrder.CANDLE, DrawOrder.SCATTER};
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.charts.Chart
    protected void init() {
        super.init();
        setHighlighter(new CombinedHighlighter(this));
        setHighlightFullBarEnabled(true);
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.charts.Chart
    protected void calcMinMax() {
        super.calcMinMax();
        if (getBarData() != null || getCandleData() != null || getBubbleData() != null) {
            this.mXAxis.mAxisMinimum = -0.5f;
            this.mXAxis.mAxisMaximum = ((CombinedData) this.mData).getXVals().size() - 0.5f;
            if (getBubbleData() != null) {
                for (T set : getBubbleData().getDataSets()) {
                    float xmin = set.getXMin();
                    float xmax = set.getXMax();
                    if (xmin < this.mXAxis.mAxisMinimum) {
                        this.mXAxis.mAxisMinimum = xmin;
                    }
                    if (xmax > this.mXAxis.mAxisMaximum) {
                        this.mXAxis.mAxisMaximum = xmax;
                    }
                }
            }
        }
        this.mXAxis.mAxisRange = Math.abs(this.mXAxis.mAxisMaximum - this.mXAxis.mAxisMinimum);
        if (this.mXAxis.mAxisRange == 0.0f && getLineData() != null && getLineData().getYValCount() > 0) {
            this.mXAxis.mAxisRange = 1.0f;
        }
    }

    @Override // com.github.mikephil.charting.charts.Chart
    public void setData(CombinedData data) {
        this.mData = null;
        this.mRenderer = null;
        super.setData((CombinedChart) data);
        this.mRenderer = new CombinedChartRenderer(this, this.mAnimator, this.mViewPortHandler);
        this.mRenderer.initBuffers();
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.LineDataProvider
    public LineData getLineData() {
        if (this.mData == 0) {
            return null;
        }
        return ((CombinedData) this.mData).getLineData();
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider
    public BarData getBarData() {
        if (this.mData == 0) {
            return null;
        }
        return ((CombinedData) this.mData).getBarData();
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.ScatterDataProvider
    public ScatterData getScatterData() {
        if (this.mData == 0) {
            return null;
        }
        return ((CombinedData) this.mData).getScatterData();
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.CandleDataProvider
    public CandleData getCandleData() {
        if (this.mData == 0) {
            return null;
        }
        return ((CombinedData) this.mData).getCandleData();
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BubbleDataProvider
    public BubbleData getBubbleData() {
        if (this.mData == 0) {
            return null;
        }
        return ((CombinedData) this.mData).getBubbleData();
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider
    public boolean isDrawBarShadowEnabled() {
        return this.mDrawBarShadow;
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider
    public boolean isDrawValueAboveBarEnabled() {
        return this.mDrawValueAboveBar;
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider
    public boolean isDrawHighlightArrowEnabled() {
        return this.mDrawHighlightArrow;
    }

    public void setDrawHighlightArrow(boolean enabled) {
        this.mDrawHighlightArrow = enabled;
    }

    public void setDrawValueAboveBar(boolean enabled) {
        this.mDrawValueAboveBar = enabled;
    }

    public void setDrawBarShadow(boolean enabled) {
        this.mDrawBarShadow = enabled;
    }

    public DrawOrder[] getDrawOrder() {
        return this.mDrawOrder;
    }

    public void setDrawOrder(DrawOrder[] order) {
        if (order == null || order.length <= 0) {
            return;
        }
        this.mDrawOrder = order;
    }
}
