package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import java.util.ArrayList;
import java.util.List;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.renderer.SimpleSeriesRenderer;
import org.achartengine.renderer.XYMultipleSeriesRenderer;
import org.achartengine.renderer.XYSeriesRenderer;
import org.achartengine.tools.Zoom;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/LineChart.class */
public class LineChart extends XYChart {
    public static final String TYPE = "Line";
    private static final int SHAPE_WIDTH = 30;
    private ScatterChart pointsChart;

    LineChart() {
    }

    public LineChart(XYMultipleSeriesDataset dataset, XYMultipleSeriesRenderer renderer) {
        super(dataset, renderer);
        this.pointsChart = new ScatterChart(dataset, renderer);
    }

    @Override // org.achartengine.chart.XYChart
    protected void setDatasetRenderer(XYMultipleSeriesDataset dataset, XYMultipleSeriesRenderer renderer) {
        super.setDatasetRenderer(dataset, renderer);
        this.pointsChart = new ScatterChart(dataset, renderer);
    }

    @Override // org.achartengine.chart.XYChart
    public void drawSeries(Canvas canvas, Paint paint, List<Float> points, XYSeriesRenderer renderer, float yAxisValue, int seriesIndex, int startIndex) {
        float referencePoint;
        float lineWidth = paint.getStrokeWidth();
        paint.setStrokeWidth(renderer.getLineWidth());
        XYSeriesRenderer.FillOutsideLine[] fillOutsideLine = renderer.getFillOutsideLine();
        for (XYSeriesRenderer.FillOutsideLine fill : fillOutsideLine) {
            if (fill.getType() != XYSeriesRenderer.FillOutsideLine.Type.NONE) {
                paint.setColor(fill.getColor());
                ArrayList arrayList = new ArrayList();
                int[] range = fill.getFillRange();
                if (range == null) {
                    arrayList.addAll(points);
                } else if (points.size() > range[0] * 2 && points.size() > range[1] * 2) {
                    arrayList.addAll(points.subList(range[0] * 2, range[1] * 2));
                }
                switch (AnonymousClass1.$SwitchMap$org$achartengine$renderer$XYSeriesRenderer$FillOutsideLine$Type[fill.getType().ordinal()]) {
                    case Zoom.ZOOM_AXIS_X /* 1 */:
                        referencePoint = yAxisValue;
                        break;
                    case Zoom.ZOOM_AXIS_Y /* 2 */:
                        referencePoint = yAxisValue;
                        break;
                    case 3:
                        referencePoint = yAxisValue;
                        break;
                    case 4:
                        referencePoint = canvas.getHeight();
                        break;
                    case 5:
                        referencePoint = 0.0f;
                        break;
                    default:
                        throw new RuntimeException("You have added a new type of filling but have not implemented.");
                }
                if (fill.getType() == XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_ABOVE || fill.getType() == XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_BELOW) {
                    ArrayList arrayList2 = new ArrayList();
                    boolean add = false;
                    int length = arrayList.size();
                    if ((length > 0 && fill.getType() == XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_ABOVE && ((Float) arrayList.get(1)).floatValue() < referencePoint) || (fill.getType() == XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_BELOW && ((Float) arrayList.get(1)).floatValue() > referencePoint)) {
                        arrayList2.add(arrayList.get(0));
                        arrayList2.add(arrayList.get(1));
                        add = true;
                    }
                    int i = 3;
                    while (i < length) {
                        float prevValue = ((Float) arrayList.get(i - 2)).floatValue();
                        float value = ((Float) arrayList.get(i)).floatValue();
                        if ((prevValue < referencePoint && value > referencePoint) || (prevValue > referencePoint && value < referencePoint)) {
                            float prevX = ((Float) arrayList.get(i - 3)).floatValue();
                            float x = ((Float) arrayList.get(i - 1)).floatValue();
                            arrayList2.add(Float.valueOf(prevX + (((x - prevX) * (referencePoint - prevValue)) / (value - prevValue))));
                            arrayList2.add(Float.valueOf(referencePoint));
                            if ((fill.getType() == XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_ABOVE && value > referencePoint) || (fill.getType() == XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_BELOW && value < referencePoint)) {
                                i += 2;
                                add = false;
                            } else {
                                arrayList2.add(Float.valueOf(x));
                                arrayList2.add(Float.valueOf(value));
                                add = true;
                            }
                        } else if (add || ((fill.getType() == XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_ABOVE && value < referencePoint) || (fill.getType() == XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_BELOW && value > referencePoint))) {
                            arrayList2.add(arrayList.get(i - 1));
                            arrayList2.add(Float.valueOf(value));
                        }
                        i += 2;
                    }
                    arrayList.clear();
                    arrayList.addAll(arrayList2);
                }
                int length2 = arrayList.size();
                if (length2 > 0) {
                    arrayList.set(0, Float.valueOf(((Float) arrayList.get(0)).floatValue() + 1.0f));
                    arrayList.add(arrayList.get(length2 - 2));
                    arrayList.add(Float.valueOf(referencePoint));
                    arrayList.add(arrayList.get(0));
                    arrayList.add(arrayList.get(length2 + 1));
                    for (int i2 = 0; i2 < length2 + 4; i2 += 2) {
                        if (((Float) arrayList.get(i2 + 1)).floatValue() < 0.0f) {
                            arrayList.set(i2 + 1, Float.valueOf(0.0f));
                        }
                    }
                    paint.setStyle(Paint.Style.FILL);
                    drawPath(canvas, (List<Float>) arrayList, paint, true);
                }
            }
        }
        paint.setColor(renderer.getColor());
        paint.setStyle(Paint.Style.STROKE);
        drawPath(canvas, points, paint, false);
        paint.setStrokeWidth(lineWidth);
    }

    /* renamed from: org.achartengine.chart.LineChart$1, reason: invalid class name */
    /* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/LineChart$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$achartengine$renderer$XYSeriesRenderer$FillOutsideLine$Type = new int[XYSeriesRenderer.FillOutsideLine.Type.values().length];

        static {
            try {
                $SwitchMap$org$achartengine$renderer$XYSeriesRenderer$FillOutsideLine$Type[XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_ALL.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$achartengine$renderer$XYSeriesRenderer$FillOutsideLine$Type[XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_BELOW.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$achartengine$renderer$XYSeriesRenderer$FillOutsideLine$Type[XYSeriesRenderer.FillOutsideLine.Type.BOUNDS_ABOVE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$achartengine$renderer$XYSeriesRenderer$FillOutsideLine$Type[XYSeriesRenderer.FillOutsideLine.Type.BELOW.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$achartengine$renderer$XYSeriesRenderer$FillOutsideLine$Type[XYSeriesRenderer.FillOutsideLine.Type.ABOVE.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
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
        float oldWidth = paint.getStrokeWidth();
        paint.setStrokeWidth(((XYSeriesRenderer) renderer).getLineWidth());
        canvas.drawLine(x, y, x + 30.0f, y, paint);
        paint.setStrokeWidth(oldWidth);
        if (isRenderPoints(renderer)) {
            this.pointsChart.drawLegendShape(canvas, renderer, x + 5.0f, y, seriesIndex, paint);
        }
    }

    @Override // org.achartengine.chart.XYChart
    public boolean isRenderPoints(SimpleSeriesRenderer renderer) {
        return ((XYSeriesRenderer) renderer).getPointStyle() != PointStyle.POINT;
    }

    @Override // org.achartengine.chart.XYChart
    public ScatterChart getPointsChart() {
        return this.pointsChart;
    }

    @Override // org.achartengine.chart.XYChart
    public String getChartType() {
        return TYPE;
    }
}
