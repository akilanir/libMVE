package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Paint;
import java.util.List;
import org.achartengine.chart.BarChart;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.model.XYSeries;
import org.achartengine.renderer.XYMultipleSeriesRenderer;
import org.achartengine.renderer.XYSeriesRenderer;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/RangeBarChart.class */
public class RangeBarChart extends BarChart {
    public static final String TYPE = "RangeBar";

    RangeBarChart() {
    }

    RangeBarChart(BarChart.Type type) {
        super(type);
    }

    public RangeBarChart(XYMultipleSeriesDataset dataset, XYMultipleSeriesRenderer renderer, BarChart.Type type) {
        super(dataset, renderer, type);
    }

    @Override // org.achartengine.chart.BarChart, org.achartengine.chart.XYChart
    public void drawSeries(Canvas canvas, Paint paint, List<Float> points, XYSeriesRenderer seriesRenderer, float yAxisValue, int seriesIndex, int startIndex) {
        int seriesNr = this.mDataset.getSeriesCount();
        int length = points.size();
        paint.setColor(seriesRenderer.getColor());
        paint.setStyle(Paint.Style.FILL);
        float halfDiffX = getHalfDiffX(points, length, seriesNr);
        int start = 0;
        if (startIndex > 0) {
            start = 2;
        }
        for (int i = start; i < length; i += 4) {
            if (points.size() > i + 3) {
                float xMin = points.get(i).floatValue();
                float yMin = points.get(i + 1).floatValue();
                float xMax = points.get(i + 2).floatValue();
                float yMax = points.get(i + 3).floatValue();
                drawBar(canvas, xMin, yMin, xMax, yMax, halfDiffX, seriesNr, seriesIndex, paint);
            }
        }
        paint.setColor(seriesRenderer.getColor());
    }

    @Override // org.achartengine.chart.BarChart, org.achartengine.chart.XYChart
    protected void drawChartValuesText(Canvas canvas, XYSeries series, XYSeriesRenderer renderer, Paint paint, List<Float> points, int seriesIndex, int startIndex) {
        int seriesNr = this.mDataset.getSeriesCount();
        float halfDiffX = getHalfDiffX(points, points.size(), seriesNr);
        int start = 0;
        if (startIndex > 0) {
            start = 2;
        }
        for (int i = start; i < points.size(); i += 4) {
            int index = startIndex + (i / 2);
            float x = points.get(i).floatValue();
            if (this.mType == BarChart.Type.DEFAULT) {
                x += ((seriesIndex * 2) * halfDiffX) - ((seriesNr - 1.5f) * halfDiffX);
            }
            if (!isNullValue(series.getY(index + 1)) && points.size() > i + 3) {
                drawText(canvas, getLabel(renderer.getChartValuesFormat(), series.getY(index + 1)), x, points.get(i + 3).floatValue() - renderer.getChartValuesSpacing(), paint, 0.0f);
            }
            if (!isNullValue(series.getY(index)) && points.size() > i + 1) {
                drawText(canvas, getLabel(renderer.getChartValuesFormat(), series.getY(index)), x, ((points.get(i + 1).floatValue() + renderer.getChartValuesTextSize()) + renderer.getChartValuesSpacing()) - 3.0f, paint, 0.0f);
            }
        }
    }

    @Override // org.achartengine.chart.BarChart
    protected float getCoeficient() {
        return 0.5f;
    }

    @Override // org.achartengine.chart.BarChart, org.achartengine.chart.XYChart
    public String getChartType() {
        return TYPE;
    }
}
