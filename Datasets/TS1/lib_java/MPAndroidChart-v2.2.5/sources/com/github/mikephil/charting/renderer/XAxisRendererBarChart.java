package com.github.mikephil.charting.renderer;

import android.graphics.Canvas;
import android.graphics.PointF;
import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.Utils;
import com.github.mikephil.charting.utils.ViewPortHandler;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/XAxisRendererBarChart.class */
public class XAxisRendererBarChart extends XAxisRenderer {
    protected BarChart mChart;

    public XAxisRendererBarChart(ViewPortHandler viewPortHandler, XAxis xAxis, Transformer trans, BarChart chart) {
        super(viewPortHandler, xAxis, trans);
        this.mChart = chart;
    }

    @Override // com.github.mikephil.charting.renderer.XAxisRenderer
    protected void drawLabels(Canvas c, float pos, PointF anchor) {
        float labelRotationAngleDegrees = this.mXAxis.getLabelRotationAngle();
        float[] position = {0.0f, 0.0f};
        BarData bd = (BarData) this.mChart.getData();
        int step = bd.getDataSetCount();
        int i = this.mMinX;
        while (true) {
            int i2 = i;
            if (i2 <= this.mMaxX) {
                position[0] = (i2 * step) + (i2 * bd.getGroupSpace()) + (bd.getGroupSpace() / 2.0f);
                if (step > 1) {
                    position[0] = position[0] + ((step - 1.0f) / 2.0f);
                }
                this.mTrans.pointValuesToPixel(position);
                if (this.mViewPortHandler.isInBoundsX(position[0]) && i2 >= 0 && i2 < this.mXAxis.getValues().size()) {
                    String label = this.mXAxis.getValues().get(i2);
                    if (this.mXAxis.isAvoidFirstLastClippingEnabled()) {
                        if (i2 == this.mXAxis.getValues().size() - 1) {
                            float width = Utils.calcTextWidth(this.mAxisLabelPaint, label);
                            if (position[0] + (width / 2.0f) > this.mViewPortHandler.contentRight()) {
                                position[0] = this.mViewPortHandler.contentRight() - (width / 2.0f);
                            }
                        } else if (i2 == 0) {
                            float width2 = Utils.calcTextWidth(this.mAxisLabelPaint, label);
                            if (position[0] - (width2 / 2.0f) < this.mViewPortHandler.contentLeft()) {
                                position[0] = this.mViewPortHandler.contentLeft() + (width2 / 2.0f);
                            }
                        }
                    }
                    drawLabel(c, label, i2, position[0], pos, anchor, labelRotationAngleDegrees);
                }
                i = i2 + this.mXAxis.mAxisLabelModulus;
            } else {
                return;
            }
        }
    }

    @Override // com.github.mikephil.charting.renderer.XAxisRenderer, com.github.mikephil.charting.renderer.AxisRenderer
    public void renderGridLines(Canvas c) {
        if (!this.mXAxis.isDrawGridLinesEnabled() || !this.mXAxis.isEnabled()) {
            return;
        }
        float[] position = {0.0f, 0.0f};
        this.mGridPaint.setColor(this.mXAxis.getGridColor());
        this.mGridPaint.setStrokeWidth(this.mXAxis.getGridLineWidth());
        BarData bd = (BarData) this.mChart.getData();
        int step = bd.getDataSetCount();
        int i = this.mMinX;
        while (true) {
            int i2 = i;
            if (i2 < this.mMaxX) {
                position[0] = ((i2 * step) + (i2 * bd.getGroupSpace())) - 0.5f;
                this.mTrans.pointValuesToPixel(position);
                if (this.mViewPortHandler.isInBoundsX(position[0])) {
                    c.drawLine(position[0], this.mViewPortHandler.offsetTop(), position[0], this.mViewPortHandler.contentBottom(), this.mGridPaint);
                }
                i = i2 + this.mXAxis.mAxisLabelModulus;
            } else {
                return;
            }
        }
    }
}
