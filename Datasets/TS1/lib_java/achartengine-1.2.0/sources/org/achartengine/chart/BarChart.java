package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.GradientDrawable;
import java.util.List;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.model.XYSeries;
import org.achartengine.renderer.SimpleSeriesRenderer;
import org.achartengine.renderer.XYMultipleSeriesRenderer;
import org.achartengine.renderer.XYSeriesRenderer;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/BarChart.class */
public class BarChart extends XYChart {
    public static final String TYPE = "Bar";
    private static final int SHAPE_WIDTH = 12;
    protected Type mType;
    private List<Float> mPreviousSeriesPoints;

    /* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/BarChart$Type.class */
    public enum Type {
        DEFAULT,
        STACKED,
        HEAPED
    }

    BarChart() {
        this.mType = Type.DEFAULT;
    }

    BarChart(Type type) {
        this.mType = Type.DEFAULT;
        this.mType = type;
    }

    public BarChart(XYMultipleSeriesDataset dataset, XYMultipleSeriesRenderer renderer, Type type) {
        super(dataset, renderer);
        this.mType = Type.DEFAULT;
        this.mType = type;
    }

    @Override // org.achartengine.chart.XYChart
    protected ClickableArea[] clickableAreasForPoints(List<Float> points, List<Double> values, float yAxisValue, int seriesIndex, int startIndex) {
        int seriesNr = this.mDataset.getSeriesCount();
        int length = points.size();
        ClickableArea[] ret = new ClickableArea[length / 2];
        float halfDiffX = getHalfDiffX(points, length, seriesNr);
        for (int i = 0; i < length; i += 2) {
            float x = points.get(i).floatValue();
            float y = points.get(i + 1).floatValue();
            if (this.mType == Type.STACKED || this.mType == Type.HEAPED) {
                ret[i / 2] = new ClickableArea(new RectF(x - halfDiffX, Math.min(y, yAxisValue), x + halfDiffX, Math.max(y, yAxisValue)), values.get(i).doubleValue(), values.get(i + 1).doubleValue());
            } else {
                float startX = (x - (seriesNr * halfDiffX)) + (seriesIndex * 2 * halfDiffX);
                ret[i / 2] = new ClickableArea(new RectF(startX, Math.min(y, yAxisValue), startX + (2.0f * halfDiffX), Math.max(y, yAxisValue)), values.get(i).doubleValue(), values.get(i + 1).doubleValue());
            }
        }
        return ret;
    }

    @Override // org.achartengine.chart.XYChart
    public void drawSeries(Canvas canvas, Paint paint, List<Float> points, XYSeriesRenderer seriesRenderer, float yAxisValue, int seriesIndex, int startIndex) {
        int seriesNr = this.mDataset.getSeriesCount();
        int length = points.size();
        paint.setColor(seriesRenderer.getColor());
        paint.setStyle(Paint.Style.FILL);
        float halfDiffX = getHalfDiffX(points, length, seriesNr);
        for (int i = 0; i < length; i += 2) {
            float x = points.get(i).floatValue();
            float y = points.get(i + 1).floatValue();
            if (this.mType == Type.HEAPED && seriesIndex > 0) {
                float lastY = this.mPreviousSeriesPoints.get(i + 1).floatValue();
                float y2 = y + (lastY - yAxisValue);
                points.set(i + 1, Float.valueOf(y2));
                drawBar(canvas, x, lastY, x, y2, halfDiffX, seriesNr, seriesIndex, paint);
            } else {
                drawBar(canvas, x, yAxisValue, x, y, halfDiffX, seriesNr, seriesIndex, paint);
            }
        }
        paint.setColor(seriesRenderer.getColor());
        this.mPreviousSeriesPoints = points;
    }

    protected void drawBar(Canvas canvas, float xMin, float yMin, float xMax, float yMax, float halfDiffX, int seriesNr, int seriesIndex, Paint paint) {
        int scale = this.mDataset.getSeriesAt(seriesIndex).getScaleNumber();
        if (this.mType == Type.STACKED || this.mType == Type.HEAPED) {
            drawBar(canvas, xMin - halfDiffX, yMax, xMax + halfDiffX, yMin, scale, seriesIndex, paint);
        } else {
            float startX = (xMin - (seriesNr * halfDiffX)) + (seriesIndex * 2 * halfDiffX);
            drawBar(canvas, startX, yMax, startX + (2.0f * halfDiffX), yMin, scale, seriesIndex, paint);
        }
    }

    protected void drawBar(Canvas canvas, float xMin, float yMin, float xMax, float yMax, int scale, int seriesIndex, Paint paint) {
        if (xMin > xMax) {
            xMin = xMax;
            xMax = xMin;
        }
        if (yMin > yMax) {
            yMin = yMax;
            yMax = yMin;
        }
        SimpleSeriesRenderer renderer = this.mRenderer.getSeriesRendererAt(seriesIndex);
        if (renderer.isGradientEnabled()) {
            float minY = (float) toScreenPoint(new double[]{0.0d, renderer.getGradientStopValue()}, scale)[1];
            float maxY = (float) toScreenPoint(new double[]{0.0d, renderer.getGradientStartValue()}, scale)[1];
            float gradientMinY = Math.max(minY, Math.min(yMin, yMax));
            float gradientMaxY = Math.min(maxY, Math.max(yMin, yMax));
            int gradientMinColor = renderer.getGradientStopColor();
            int gradientMaxColor = renderer.getGradientStartColor();
            int gradientStartColor = gradientMaxColor;
            int gradientStopColor = gradientMinColor;
            if (yMin < minY) {
                paint.setColor(gradientMinColor);
                canvas.drawRect(Math.round(xMin), Math.round(yMin), Math.round(xMax), Math.round(gradientMinY), paint);
            } else {
                gradientStopColor = getGradientPartialColor(gradientMinColor, gradientMaxColor, (maxY - gradientMinY) / (maxY - minY));
            }
            if (yMax > maxY) {
                paint.setColor(gradientMaxColor);
                canvas.drawRect(Math.round(xMin), Math.round(gradientMaxY), Math.round(xMax), Math.round(yMax), paint);
            } else {
                gradientStartColor = getGradientPartialColor(gradientMaxColor, gradientMinColor, (gradientMaxY - minY) / (maxY - minY));
            }
            GradientDrawable gradient = new GradientDrawable(GradientDrawable.Orientation.BOTTOM_TOP, new int[]{gradientStartColor, gradientStopColor});
            gradient.setBounds(Math.round(xMin), Math.round(gradientMinY), Math.round(xMax), Math.round(gradientMaxY));
            gradient.draw(canvas);
            return;
        }
        if (Math.abs(yMin - yMax) < 1.0f) {
            if (yMin < yMax) {
                yMax = yMin + 1.0f;
            } else {
                yMax = yMin - 1.0f;
            }
        }
        canvas.drawRect(Math.round(xMin), Math.round(yMin), Math.round(xMax), Math.round(yMax), paint);
    }

    protected int getGradientPartialColor(int minColor, int maxColor, float fraction) {
        int alpha = Math.round((fraction * Color.alpha(minColor)) + ((1.0f - fraction) * Color.alpha(maxColor)));
        int r = Math.round((fraction * Color.red(minColor)) + ((1.0f - fraction) * Color.red(maxColor)));
        int g = Math.round((fraction * Color.green(minColor)) + ((1.0f - fraction) * Color.green(maxColor)));
        int b = Math.round((fraction * Color.blue(minColor)) + ((1.0f - fraction) * Color.blue(maxColor)));
        return Color.argb(alpha, r, g, b);
    }

    @Override // org.achartengine.chart.XYChart
    protected void drawChartValuesText(Canvas canvas, XYSeries series, XYSeriesRenderer renderer, Paint paint, List<Float> points, int seriesIndex, int startIndex) {
        int seriesNr = this.mDataset.getSeriesCount();
        int length = points.size();
        float halfDiffX = getHalfDiffX(points, length, seriesNr);
        for (int i = 0; i < length; i += 2) {
            int index = startIndex + (i / 2);
            double value = series.getY(index);
            if (!isNullValue(value)) {
                float x = points.get(i).floatValue();
                if (this.mType == Type.DEFAULT) {
                    x += ((seriesIndex * 2) * halfDiffX) - ((seriesNr - 1.5f) * halfDiffX);
                }
                if (value >= 0.0d) {
                    drawText(canvas, getLabel(renderer.getChartValuesFormat(), value), x, points.get(i + 1).floatValue() - renderer.getChartValuesSpacing(), paint, 0.0f);
                } else {
                    drawText(canvas, getLabel(renderer.getChartValuesFormat(), value), x, ((points.get(i + 1).floatValue() + renderer.getChartValuesTextSize()) + renderer.getChartValuesSpacing()) - 3.0f, paint, 0.0f);
                }
            }
        }
    }

    @Override // org.achartengine.chart.AbstractChart
    public int getLegendShapeWidth(int seriesIndex) {
        return SHAPE_WIDTH;
    }

    @Override // org.achartengine.chart.AbstractChart
    public void drawLegendShape(Canvas canvas, SimpleSeriesRenderer renderer, float x, float y, int seriesIndex, Paint paint) {
        canvas.drawRect(x, y - 6.0f, x + 12.0f, y + 6.0f, paint);
    }

    protected float getHalfDiffX(List<Float> points, int length, int seriesNr) {
        float barWidth = this.mRenderer.getBarWidth();
        if (barWidth > 0.0f) {
            return barWidth / 2.0f;
        }
        int div = length;
        if (length > 2) {
            div = length - 2;
        }
        float halfDiffX = (points.get(length - 2).floatValue() - points.get(0).floatValue()) / div;
        if (halfDiffX == 0.0f) {
            halfDiffX = 10.0f;
        }
        if (this.mType != Type.STACKED && this.mType != Type.HEAPED) {
            halfDiffX /= seriesNr;
        }
        return (float) (halfDiffX / (getCoeficient() * (1.0d + this.mRenderer.getBarSpacing())));
    }

    protected float getCoeficient() {
        return 1.0f;
    }

    @Override // org.achartengine.chart.XYChart
    protected boolean isRenderNullValues() {
        return true;
    }

    @Override // org.achartengine.chart.XYChart
    public double getDefaultMinimum() {
        return 0.0d;
    }

    @Override // org.achartengine.chart.XYChart
    public String getChartType() {
        return TYPE;
    }
}
