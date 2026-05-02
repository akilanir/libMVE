package com.github.mikephil.charting.charts;

import android.content.Context;
import android.util.AttributeSet;
import com.github.mikephil.charting.data.CandleData;
import com.github.mikephil.charting.interfaces.dataprovider.CandleDataProvider;
import com.github.mikephil.charting.renderer.CandleStickChartRenderer;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/CandleStickChart.class */
public class CandleStickChart extends BarLineChartBase<CandleData> implements CandleDataProvider {
    public CandleStickChart(Context context) {
        super(context);
    }

    public CandleStickChart(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public CandleStickChart(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.charts.Chart
    protected void init() {
        super.init();
        this.mRenderer = new CandleStickChartRenderer(this, this.mAnimator, this.mViewPortHandler);
        this.mXAxis.mAxisMinimum = -0.5f;
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.charts.Chart
    protected void calcMinMax() {
        super.calcMinMax();
        this.mXAxis.mAxisMaximum += 0.5f;
        this.mXAxis.mAxisRange = Math.abs(this.mXAxis.mAxisMaximum - this.mXAxis.mAxisMinimum);
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.CandleDataProvider
    public CandleData getCandleData() {
        return (CandleData) this.mData;
    }
}
