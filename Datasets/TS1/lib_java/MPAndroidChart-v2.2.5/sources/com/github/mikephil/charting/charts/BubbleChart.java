package com.github.mikephil.charting.charts;

import android.content.Context;
import android.util.AttributeSet;
import com.github.mikephil.charting.data.BubbleData;
import com.github.mikephil.charting.interfaces.dataprovider.BubbleDataProvider;
import com.github.mikephil.charting.renderer.BubbleChartRenderer;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/BubbleChart.class */
public class BubbleChart extends BarLineChartBase<BubbleData> implements BubbleDataProvider {
    public BubbleChart(Context context) {
        super(context);
    }

    public BubbleChart(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public BubbleChart(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.charts.Chart
    protected void init() {
        super.init();
        this.mRenderer = new BubbleChartRenderer(this, this.mAnimator, this.mViewPortHandler);
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.charts.Chart
    protected void calcMinMax() {
        super.calcMinMax();
        if (this.mXAxis.mAxisRange == 0.0f && ((BubbleData) this.mData).getYValCount() > 0) {
            this.mXAxis.mAxisRange = 1.0f;
        }
        this.mXAxis.mAxisMinimum = -0.5f;
        this.mXAxis.mAxisMaximum = ((BubbleData) this.mData).getXValCount() - 0.5f;
        if (this.mRenderer != null) {
            for (T set : ((BubbleData) this.mData).getDataSets()) {
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
        this.mXAxis.mAxisRange = Math.abs(this.mXAxis.mAxisMaximum - this.mXAxis.mAxisMinimum);
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BubbleDataProvider
    public BubbleData getBubbleData() {
        return (BubbleData) this.mData;
    }
}
