package com.github.mikephil.charting.charts;

import android.content.Context;
import android.util.AttributeSet;
import com.github.mikephil.charting.data.ScatterData;
import com.github.mikephil.charting.interfaces.dataprovider.ScatterDataProvider;
import com.github.mikephil.charting.renderer.ScatterChartRenderer;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/ScatterChart.class */
public class ScatterChart extends BarLineChartBase<ScatterData> implements ScatterDataProvider {

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/ScatterChart$ScatterShape.class */
    public enum ScatterShape {
        SQUARE,
        CIRCLE,
        TRIANGLE,
        CROSS,
        X
    }

    public ScatterChart(Context context) {
        super(context);
    }

    public ScatterChart(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ScatterChart(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.charts.Chart
    protected void init() {
        super.init();
        this.mRenderer = new ScatterChartRenderer(this, this.mAnimator, this.mViewPortHandler);
        this.mXAxis.mAxisMinimum = -0.5f;
    }

    @Override // com.github.mikephil.charting.charts.BarLineChartBase, com.github.mikephil.charting.charts.Chart
    protected void calcMinMax() {
        super.calcMinMax();
        if (this.mXAxis.mAxisRange == 0.0f && ((ScatterData) this.mData).getYValCount() > 0) {
            this.mXAxis.mAxisRange = 1.0f;
        }
        this.mXAxis.mAxisMaximum += 0.5f;
        this.mXAxis.mAxisRange = Math.abs(this.mXAxis.mAxisMaximum - this.mXAxis.mAxisMinimum);
    }

    public static ScatterShape[] getAllPossibleShapes() {
        return new ScatterShape[]{ScatterShape.SQUARE, ScatterShape.CIRCLE, ScatterShape.TRIANGLE, ScatterShape.CROSS};
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.ScatterDataProvider
    public ScatterData getScatterData() {
        return (ScatterData) this.mData;
    }
}
