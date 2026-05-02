package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;
import java.util.ArrayList;
import java.util.List;
import org.achartengine.model.CategorySeries;
import org.achartengine.model.Point;
import org.achartengine.model.SeriesSelection;
import org.achartengine.renderer.DefaultRenderer;
import org.achartengine.renderer.SimpleSeriesRenderer;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/PieChart.class */
public class PieChart extends RoundChart {
    private PieMapper mPieMapper;

    public PieChart(CategorySeries dataset, DefaultRenderer renderer) {
        super(dataset, renderer);
        this.mPieMapper = new PieMapper();
    }

    @Override // org.achartengine.chart.AbstractChart
    public void draw(Canvas canvas, int x, int y, int width, int height, Paint paint) {
        paint.setAntiAlias(this.mRenderer.isAntialiasing());
        paint.setStyle(Paint.Style.FILL);
        paint.setTextSize(this.mRenderer.getLabelsTextSize());
        int legendSize = getLegendSize(this.mRenderer, height / 5, 0.0f);
        int right = x + width;
        int sLength = this.mDataset.getItemCount();
        double total = 0.0d;
        String[] titles = new String[sLength];
        for (int i = 0; i < sLength; i++) {
            total += this.mDataset.getValue(i);
            titles[i] = this.mDataset.getCategory(i);
        }
        if (this.mRenderer.isFitLegend()) {
            legendSize = drawLegend(canvas, this.mRenderer, titles, x, right, y, width, height, legendSize, paint, true);
        }
        int bottom = (y + height) - legendSize;
        drawBackground(this.mRenderer, canvas, x, y, width, height, paint, false, 0);
        float currentAngle = this.mRenderer.getStartAngle();
        int mRadius = Math.min(Math.abs(right - x), Math.abs(bottom - y));
        int radius = (int) (mRadius * 0.35d * this.mRenderer.getScale());
        if (this.mCenterX == Integer.MAX_VALUE) {
            this.mCenterX = (x + right) / 2;
        }
        if (this.mCenterY == Integer.MAX_VALUE) {
            this.mCenterY = (bottom + y) / 2;
        }
        this.mPieMapper.setDimensions(radius, this.mCenterX, this.mCenterY);
        boolean loadPieCfg = !this.mPieMapper.areAllSegmentPresent(sLength);
        if (loadPieCfg) {
            this.mPieMapper.clearPieSegments();
        }
        float shortRadius = radius * 0.9f;
        float longRadius = radius * 1.1f;
        RectF oval = new RectF(this.mCenterX - radius, this.mCenterY - radius, this.mCenterX + radius, this.mCenterY + radius);
        List<RectF> prevLabelsBounds = new ArrayList<>();
        for (int i2 = 0; i2 < sLength; i2++) {
            SimpleSeriesRenderer seriesRenderer = this.mRenderer.getSeriesRendererAt(i2);
            if (seriesRenderer.isGradientEnabled()) {
                RadialGradient grad = new RadialGradient(this.mCenterX, this.mCenterY, longRadius, seriesRenderer.getGradientStartColor(), seriesRenderer.getGradientStopColor(), Shader.TileMode.MIRROR);
                paint.setShader(grad);
            } else {
                paint.setColor(seriesRenderer.getColor());
            }
            float value = (float) this.mDataset.getValue(i2);
            float angle = (float) ((value / total) * 360.0d);
            if (seriesRenderer.isHighlighted()) {
                double rAngle = Math.toRadians(90.0f - (currentAngle + (angle / 2.0f)));
                float translateX = (float) (radius * 0.1d * Math.sin(rAngle));
                float translateY = (float) (radius * 0.1d * Math.cos(rAngle));
                oval.offset(translateX, translateY);
                canvas.drawArc(oval, currentAngle, angle, true, paint);
                oval.offset(-translateX, -translateY);
            } else {
                canvas.drawArc(oval, currentAngle, angle, true, paint);
            }
            paint.setColor(seriesRenderer.getColor());
            paint.setShader(null);
            drawLabel(canvas, this.mDataset.getCategory(i2), this.mRenderer, prevLabelsBounds, this.mCenterX, this.mCenterY, shortRadius, longRadius, currentAngle, angle, x, right, this.mRenderer.getLabelsColor(), paint, true, false);
            if (this.mRenderer.isDisplayValues()) {
                drawLabel(canvas, getLabel(this.mRenderer.getSeriesRendererAt(i2).getChartValuesFormat(), this.mDataset.getValue(i2)), this.mRenderer, prevLabelsBounds, this.mCenterX, this.mCenterY, shortRadius / 2.0f, longRadius / 2.0f, currentAngle, angle, x, right, this.mRenderer.getLabelsColor(), paint, false, true);
            }
            if (loadPieCfg) {
                this.mPieMapper.addPieSegment(i2, value, currentAngle, angle);
            }
            currentAngle += angle;
        }
        prevLabelsBounds.clear();
        drawLegend(canvas, this.mRenderer, titles, x, right, y, width, height, legendSize, paint, false);
        drawTitle(canvas, x, y, width, paint);
    }

    @Override // org.achartengine.chart.AbstractChart
    public SeriesSelection getSeriesAndPointForScreenCoordinate(Point screenPoint) {
        return this.mPieMapper.getSeriesAndPointForScreenCoordinate(screenPoint);
    }
}
