package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import java.util.List;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.model.XYValueSeries;
import org.achartengine.renderer.SimpleSeriesRenderer;
import org.achartengine.renderer.XYMultipleSeriesRenderer;
import org.achartengine.renderer.XYSeriesRenderer;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/BubbleChart.class */
public class BubbleChart extends XYChart {
    public static final String TYPE = "Bubble";
    private static final int SHAPE_WIDTH = 10;
    private static final int MIN_BUBBLE_SIZE = 2;
    private static final int MAX_BUBBLE_SIZE = 20;

    BubbleChart() {
    }

    public BubbleChart(XYMultipleSeriesDataset dataset, XYMultipleSeriesRenderer renderer) {
        super(dataset, renderer);
    }

    @Override // org.achartengine.chart.XYChart
    public void drawSeries(Canvas canvas, Paint paint, List<Float> points, XYSeriesRenderer renderer, float yAxisValue, int seriesIndex, int startIndex) {
        paint.setColor(renderer.getColor());
        paint.setStyle(Paint.Style.FILL);
        int length = points.size();
        XYValueSeries series = (XYValueSeries) this.mDataset.getSeriesAt(seriesIndex);
        double max = series.getMaxValue();
        double coef = 20.0d / max;
        for (int i = 0; i < length; i += 2) {
            double size = (series.getValue(startIndex + (i / 2)) * coef) + 2.0d;
            drawCircle(canvas, paint, points.get(i).floatValue(), points.get(i + 1).floatValue(), (float) size);
        }
    }

    @Override // org.achartengine.chart.XYChart
    protected ClickableArea[] clickableAreasForPoints(List<Float> points, List<Double> values, float yAxisValue, int seriesIndex, int startIndex) {
        int length = points.size();
        XYValueSeries series = (XYValueSeries) this.mDataset.getSeriesAt(seriesIndex);
        double max = series.getMaxValue();
        double coef = 20.0d / max;
        ClickableArea[] ret = new ClickableArea[length / 2];
        for (int i = 0; i < length; i += 2) {
            double size = (series.getValue(startIndex + (i / 2)) * coef) + 2.0d;
            ret[i / 2] = new ClickableArea(new RectF(points.get(i).floatValue() - ((float) size), points.get(i + 1).floatValue() - ((float) size), points.get(i).floatValue() + ((float) size), points.get(i + 1).floatValue() + ((float) size)), values.get(i).doubleValue(), values.get(i + 1).doubleValue());
        }
        return ret;
    }

    @Override // org.achartengine.chart.AbstractChart
    public int getLegendShapeWidth(int seriesIndex) {
        return SHAPE_WIDTH;
    }

    @Override // org.achartengine.chart.AbstractChart
    public void drawLegendShape(Canvas canvas, SimpleSeriesRenderer renderer, float x, float y, int seriesIndex, Paint paint) {
        paint.setStyle(Paint.Style.FILL);
        drawCircle(canvas, paint, x + 10.0f, y, 3.0f);
    }

    private void drawCircle(Canvas canvas, Paint paint, float x, float y, float radius) {
        canvas.drawCircle(x, y, radius, paint);
    }

    @Override // org.achartengine.chart.XYChart
    public String getChartType() {
        return TYPE;
    }
}
