package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Paint;
import org.achartengine.model.CategorySeries;
import org.achartengine.renderer.DialRenderer;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/DialChart.class */
public class DialChart extends RoundChart {
    private static final int NEEDLE_RADIUS = 10;
    private DialRenderer mRenderer;

    public DialChart(CategorySeries dataset, DialRenderer renderer) {
        super(dataset, renderer);
        this.mRenderer = renderer;
    }

    @Override // org.achartengine.chart.AbstractChart
    public void draw(Canvas canvas, int x, int y, int width, int height, Paint paint) {
        paint.setAntiAlias(this.mRenderer.isAntialiasing());
        paint.setStyle(Paint.Style.FILL);
        paint.setTextSize(this.mRenderer.getLabelsTextSize());
        int legendSize = getLegendSize(this.mRenderer, height / 5, 0.0f);
        int right = x + width;
        int sLength = this.mDataset.getItemCount();
        String[] titles = new String[sLength];
        for (int i = 0; i < sLength; i++) {
            titles[i] = this.mDataset.getCategory(i);
        }
        if (this.mRenderer.isFitLegend()) {
            legendSize = drawLegend(canvas, this.mRenderer, titles, x, right, y, width, height, legendSize, paint, true);
        }
        int bottom = (y + height) - legendSize;
        drawBackground(this.mRenderer, canvas, x, y, width, height, paint, false, 0);
        int mRadius = Math.min(Math.abs(right - x), Math.abs(bottom - y));
        int radius = (int) (mRadius * 0.35d * this.mRenderer.getScale());
        if (this.mCenterX == Integer.MAX_VALUE) {
            this.mCenterX = (x + right) / 2;
        }
        if (this.mCenterY == Integer.MAX_VALUE) {
            this.mCenterY = (bottom + y) / 2;
        }
        float shortRadius = radius * 0.9f;
        float longRadius = radius * 1.1f;
        double min = this.mRenderer.getMinValue();
        double max = this.mRenderer.getMaxValue();
        double angleMin = this.mRenderer.getAngleMin();
        double angleMax = this.mRenderer.getAngleMax();
        if (!this.mRenderer.isMinValueSet() || !this.mRenderer.isMaxValueSet()) {
            int count = this.mRenderer.getSeriesRendererCount();
            for (int i2 = 0; i2 < count; i2++) {
                double value = this.mDataset.getValue(i2);
                if (!this.mRenderer.isMinValueSet()) {
                    min = Math.min(min, value);
                }
                if (!this.mRenderer.isMaxValueSet()) {
                    max = Math.max(max, value);
                }
            }
        }
        if (min == max) {
            min *= 0.5d;
            max *= 1.5d;
        }
        paint.setColor(this.mRenderer.getLabelsColor());
        double minorTicks = this.mRenderer.getMinorTicksSpacing();
        double majorTicks = this.mRenderer.getMajorTicksSpacing();
        if (minorTicks == Double.MAX_VALUE) {
            minorTicks = (max - min) / 30.0d;
        }
        if (majorTicks == Double.MAX_VALUE) {
            majorTicks = (max - min) / 10.0d;
        }
        drawTicks(canvas, min, max, angleMin, angleMax, this.mCenterX, this.mCenterY, longRadius, radius, minorTicks, paint, false);
        drawTicks(canvas, min, max, angleMin, angleMax, this.mCenterX, this.mCenterY, longRadius, shortRadius, majorTicks, paint, true);
        int count2 = this.mRenderer.getSeriesRendererCount();
        for (int i3 = 0; i3 < count2; i3++) {
            double angle = getAngleForValue(this.mDataset.getValue(i3), angleMin, angleMax, min, max);
            paint.setColor(this.mRenderer.getSeriesRendererAt(i3).getColor());
            boolean type = this.mRenderer.getVisualTypeForIndex(i3) == DialRenderer.Type.ARROW;
            drawNeedle(canvas, angle, this.mCenterX, this.mCenterY, shortRadius, type, paint);
        }
        drawLegend(canvas, this.mRenderer, titles, x, right, y, width, height, legendSize, paint, false);
        drawTitle(canvas, x, (height + radius) / 2, width, paint);
    }

    private double getAngleForValue(double value, double minAngle, double maxAngle, double min, double max) {
        double angleDiff = maxAngle - minAngle;
        double diff = max - min;
        return Math.toRadians(minAngle + (((value - min) * angleDiff) / diff));
    }

    private void drawTicks(Canvas canvas, double min, double max, double minAngle, double maxAngle, int centerX, int centerY, double longRadius, double shortRadius, double ticks, Paint paint, boolean labels) {
        double d = min;
        while (true) {
            double i = d;
            if (i <= max) {
                double angle = getAngleForValue(i, minAngle, maxAngle, min, max);
                double sinValue = Math.sin(angle);
                double cosValue = Math.cos(angle);
                int x1 = Math.round(centerX + ((float) (shortRadius * sinValue)));
                int y1 = Math.round(centerY + ((float) (shortRadius * cosValue)));
                int x2 = Math.round(centerX + ((float) (longRadius * sinValue)));
                int y2 = Math.round(centerY + ((float) (longRadius * cosValue)));
                canvas.drawLine(x1, y1, x2, y2, paint);
                if (labels) {
                    paint.setTextAlign(x1 == x2 ? Paint.Align.CENTER : x1 <= x2 ? Paint.Align.RIGHT : Paint.Align.LEFT);
                    String text = getLabel(this.mRenderer.getSeriesRendererAt(0).getChartValuesFormat(), i);
                    canvas.drawText(text, x1, y1, paint);
                }
                d = i + ticks;
            } else {
                return;
            }
        }
    }

    private void drawNeedle(Canvas canvas, double angle, int centerX, int centerY, double radius, boolean arrow, Paint paint) {
        float[] points;
        double diff = Math.toRadians(90.0d);
        int needleSinValue = (int) (10.0d * Math.sin(angle - diff));
        int needleCosValue = (int) (10.0d * Math.cos(angle - diff));
        int needleX = (int) (radius * Math.sin(angle));
        int needleY = (int) (radius * Math.cos(angle));
        int needleCenterX = centerX + needleX;
        int needleCenterY = centerY + needleY;
        if (arrow) {
            int arrowBaseX = centerX + ((int) (radius * 0.85d * Math.sin(angle)));
            int arrowBaseY = centerY + ((int) (radius * 0.85d * Math.cos(angle)));
            points = new float[]{arrowBaseX - needleSinValue, arrowBaseY - needleCosValue, needleCenterX, needleCenterY, arrowBaseX + needleSinValue, arrowBaseY + needleCosValue};
            float width = paint.getStrokeWidth();
            paint.setStrokeWidth(5.0f);
            canvas.drawLine(centerX, centerY, needleCenterX, needleCenterY, paint);
            paint.setStrokeWidth(width);
        } else {
            points = new float[]{centerX - needleSinValue, centerY - needleCosValue, needleCenterX, needleCenterY, centerX + needleSinValue, centerY + needleCosValue};
        }
        drawPath(canvas, points, paint, true);
    }
}
