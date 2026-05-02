package com.github.mikephil.charting.renderer;

import android.graphics.Canvas;
import android.graphics.PointF;
import com.github.mikephil.charting.charts.RadarChart;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.utils.Utils;
import com.github.mikephil.charting.utils.ViewPortHandler;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/XAxisRendererRadarChart.class */
public class XAxisRendererRadarChart extends XAxisRenderer {
    private RadarChart mChart;

    public XAxisRendererRadarChart(ViewPortHandler viewPortHandler, XAxis xAxis, RadarChart chart) {
        super(viewPortHandler, xAxis, null);
        this.mChart = chart;
    }

    @Override // com.github.mikephil.charting.renderer.XAxisRenderer, com.github.mikephil.charting.renderer.AxisRenderer
    public void renderAxisLabels(Canvas c) {
        if (!this.mXAxis.isEnabled() || !this.mXAxis.isDrawLabelsEnabled()) {
            return;
        }
        float labelRotationAngleDegrees = this.mXAxis.getLabelRotationAngle();
        PointF drawLabelAnchor = new PointF(0.5f, 0.0f);
        this.mAxisLabelPaint.setTypeface(this.mXAxis.getTypeface());
        this.mAxisLabelPaint.setTextSize(this.mXAxis.getTextSize());
        this.mAxisLabelPaint.setColor(this.mXAxis.getTextColor());
        float sliceangle = this.mChart.getSliceAngle();
        float factor = this.mChart.getFactor();
        PointF center = this.mChart.getCenterOffsets();
        int mod = this.mXAxis.mAxisLabelModulus;
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < this.mXAxis.getValues().size()) {
                String label = this.mXAxis.getValues().get(i2);
                float angle = ((sliceangle * i2) + this.mChart.getRotationAngle()) % 360.0f;
                PointF p = Utils.getPosition(center, (this.mChart.getYRange() * factor) + (this.mXAxis.mLabelRotatedWidth / 2.0f), angle);
                drawLabel(c, label, i2, p.x, p.y - (this.mXAxis.mLabelRotatedHeight / 2.0f), drawLabelAnchor, labelRotationAngleDegrees);
                i = i2 + mod;
            } else {
                return;
            }
        }
    }

    @Override // com.github.mikephil.charting.renderer.XAxisRenderer, com.github.mikephil.charting.renderer.AxisRenderer
    public void renderLimitLines(Canvas c) {
    }
}
