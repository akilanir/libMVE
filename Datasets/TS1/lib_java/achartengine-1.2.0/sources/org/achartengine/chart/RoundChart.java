package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Paint;
import org.achartengine.model.CategorySeries;
import org.achartengine.renderer.DefaultRenderer;
import org.achartengine.renderer.SimpleSeriesRenderer;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/RoundChart.class */
public abstract class RoundChart extends AbstractChart {
    protected static final int SHAPE_WIDTH = 10;
    protected CategorySeries mDataset;
    protected DefaultRenderer mRenderer;
    protected static final int NO_VALUE = Integer.MAX_VALUE;
    protected int mCenterX = NO_VALUE;
    protected int mCenterY = NO_VALUE;

    public RoundChart(CategorySeries dataset, DefaultRenderer renderer) {
        this.mDataset = dataset;
        this.mRenderer = renderer;
    }

    public void drawTitle(Canvas canvas, int x, int y, int width, Paint paint) {
        if (this.mRenderer.isShowLabels()) {
            paint.setColor(this.mRenderer.getLabelsColor());
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setTextSize(this.mRenderer.getChartTitleTextSize());
            drawString(canvas, this.mRenderer.getChartTitle(), x + (width / 2), y + this.mRenderer.getChartTitleTextSize(), paint);
        }
    }

    @Override // org.achartengine.chart.AbstractChart
    public int getLegendShapeWidth(int seriesIndex) {
        return SHAPE_WIDTH;
    }

    @Override // org.achartengine.chart.AbstractChart
    public void drawLegendShape(Canvas canvas, SimpleSeriesRenderer renderer, float x, float y, int seriesIndex, Paint paint) {
        canvas.drawRect(x, y - 5.0f, x + 10.0f, y + 5.0f, paint);
    }

    public DefaultRenderer getRenderer() {
        return this.mRenderer;
    }

    public int getCenterX() {
        return this.mCenterX;
    }

    public int getCenterY() {
        return this.mCenterY;
    }

    public void setCenterX(int centerX) {
        this.mCenterX = centerX;
    }

    public void setCenterY(int centerY) {
        this.mCenterY = centerY;
    }
}
