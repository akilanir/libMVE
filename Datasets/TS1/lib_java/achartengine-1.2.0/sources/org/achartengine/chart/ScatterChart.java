package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import java.util.List;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.renderer.SimpleSeriesRenderer;
import org.achartengine.renderer.XYMultipleSeriesRenderer;
import org.achartengine.renderer.XYSeriesRenderer;
import org.achartengine.tools.Zoom;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/ScatterChart.class */
public class ScatterChart extends XYChart {
    public static final String TYPE = "Scatter";
    private static final float SIZE = 3.0f;
    private static final int SHAPE_WIDTH = 10;
    private float size;

    ScatterChart() {
        this.size = SIZE;
    }

    public ScatterChart(XYMultipleSeriesDataset dataset, XYMultipleSeriesRenderer renderer) {
        super(dataset, renderer);
        this.size = SIZE;
        this.size = renderer.getPointSize();
    }

    @Override // org.achartengine.chart.XYChart
    protected void setDatasetRenderer(XYMultipleSeriesDataset dataset, XYMultipleSeriesRenderer renderer) {
        super.setDatasetRenderer(dataset, renderer);
        this.size = renderer.getPointSize();
    }

    @Override // org.achartengine.chart.XYChart
    public void drawSeries(Canvas canvas, Paint paint, List<Float> points, XYSeriesRenderer renderer, float yAxisValue, int seriesIndex, int startIndex) {
        paint.setColor(renderer.getColor());
        float stroke = paint.getStrokeWidth();
        if (renderer.isFillPoints()) {
            paint.setStyle(Paint.Style.FILL);
        } else {
            paint.setStrokeWidth(renderer.getPointStrokeWidth());
            paint.setStyle(Paint.Style.STROKE);
        }
        int length = points.size();
        switch (AnonymousClass1.$SwitchMap$org$achartengine$chart$PointStyle[renderer.getPointStyle().ordinal()]) {
            case Zoom.ZOOM_AXIS_X /* 1 */:
                paint.setStrokeWidth(renderer.getPointStrokeWidth());
                for (int i = 0; i < length; i += 2) {
                    drawX(canvas, paint, points.get(i).floatValue(), points.get(i + 1).floatValue());
                }
                break;
            case Zoom.ZOOM_AXIS_Y /* 2 */:
                for (int i2 = 0; i2 < length; i2 += 2) {
                    drawCircle(canvas, paint, points.get(i2).floatValue(), points.get(i2 + 1).floatValue());
                }
                break;
            case 3:
                float[] path = new float[6];
                for (int i3 = 0; i3 < length; i3 += 2) {
                    drawTriangle(canvas, paint, path, points.get(i3).floatValue(), points.get(i3 + 1).floatValue());
                }
                break;
            case 4:
                for (int i4 = 0; i4 < length; i4 += 2) {
                    drawSquare(canvas, paint, points.get(i4).floatValue(), points.get(i4 + 1).floatValue());
                }
                break;
            case 5:
                float[] path2 = new float[8];
                for (int i5 = 0; i5 < length; i5 += 2) {
                    drawDiamond(canvas, paint, path2, points.get(i5).floatValue(), points.get(i5 + 1).floatValue());
                }
                break;
            case 6:
                for (int i6 = 0; i6 < length; i6 += 2) {
                    canvas.drawPoint(points.get(i6).floatValue(), points.get(i6 + 1).floatValue(), paint);
                }
                break;
        }
        paint.setStrokeWidth(stroke);
    }

    /* renamed from: org.achartengine.chart.ScatterChart$1, reason: invalid class name */
    /* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/ScatterChart$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$achartengine$chart$PointStyle = new int[PointStyle.values().length];

        static {
            try {
                $SwitchMap$org$achartengine$chart$PointStyle[PointStyle.X.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$achartengine$chart$PointStyle[PointStyle.CIRCLE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$achartengine$chart$PointStyle[PointStyle.TRIANGLE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$achartengine$chart$PointStyle[PointStyle.SQUARE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$achartengine$chart$PointStyle[PointStyle.DIAMOND.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$achartengine$chart$PointStyle[PointStyle.POINT.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
        }
    }

    @Override // org.achartengine.chart.XYChart
    protected ClickableArea[] clickableAreasForPoints(List<Float> points, List<Double> values, float yAxisValue, int seriesIndex, int startIndex) {
        int length = points.size();
        ClickableArea[] ret = new ClickableArea[length / 2];
        for (int i = 0; i < length; i += 2) {
            int selectableBuffer = this.mRenderer.getSelectableBuffer();
            ret[i / 2] = new ClickableArea(new RectF(points.get(i).floatValue() - selectableBuffer, points.get(i + 1).floatValue() - selectableBuffer, points.get(i).floatValue() + selectableBuffer, points.get(i + 1).floatValue() + selectableBuffer), values.get(i).doubleValue(), values.get(i + 1).doubleValue());
        }
        return ret;
    }

    @Override // org.achartengine.chart.AbstractChart
    public int getLegendShapeWidth(int seriesIndex) {
        return SHAPE_WIDTH;
    }

    @Override // org.achartengine.chart.AbstractChart
    public void drawLegendShape(Canvas canvas, SimpleSeriesRenderer renderer, float x, float y, int seriesIndex, Paint paint) {
        if (((XYSeriesRenderer) renderer).isFillPoints()) {
            paint.setStyle(Paint.Style.FILL);
        } else {
            paint.setStyle(Paint.Style.STROKE);
        }
        switch (AnonymousClass1.$SwitchMap$org$achartengine$chart$PointStyle[((XYSeriesRenderer) renderer).getPointStyle().ordinal()]) {
            case Zoom.ZOOM_AXIS_X /* 1 */:
                drawX(canvas, paint, x + 10.0f, y);
                break;
            case Zoom.ZOOM_AXIS_Y /* 2 */:
                drawCircle(canvas, paint, x + 10.0f, y);
                break;
            case 3:
                drawTriangle(canvas, paint, new float[6], x + 10.0f, y);
                break;
            case 4:
                drawSquare(canvas, paint, x + 10.0f, y);
                break;
            case 5:
                drawDiamond(canvas, paint, new float[8], x + 10.0f, y);
                break;
            case 6:
                canvas.drawPoint(x + 10.0f, y, paint);
                break;
        }
    }

    private void drawX(Canvas canvas, Paint paint, float x, float y) {
        canvas.drawLine(x - this.size, y - this.size, x + this.size, y + this.size, paint);
        canvas.drawLine(x + this.size, y - this.size, x - this.size, y + this.size, paint);
    }

    private void drawCircle(Canvas canvas, Paint paint, float x, float y) {
        canvas.drawCircle(x, y, this.size, paint);
    }

    private void drawTriangle(Canvas canvas, Paint paint, float[] path, float x, float y) {
        path[0] = x;
        path[1] = (y - this.size) - (this.size / 2.0f);
        path[2] = x - this.size;
        path[3] = y + this.size;
        path[4] = x + this.size;
        path[5] = path[3];
        drawPath(canvas, path, paint, true);
    }

    private void drawSquare(Canvas canvas, Paint paint, float x, float y) {
        canvas.drawRect(x - this.size, y - this.size, x + this.size, y + this.size, paint);
    }

    private void drawDiamond(Canvas canvas, Paint paint, float[] path, float x, float y) {
        path[0] = x;
        path[1] = y - this.size;
        path[2] = x - this.size;
        path[3] = y;
        path[4] = x;
        path[5] = y + this.size;
        path[6] = x + this.size;
        path[7] = y;
        drawPath(canvas, path, paint, true);
    }

    @Override // org.achartengine.chart.XYChart
    public String getChartType() {
        return TYPE;
    }
}
