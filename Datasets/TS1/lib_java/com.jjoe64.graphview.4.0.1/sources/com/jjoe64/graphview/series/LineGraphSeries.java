package com.jjoe64.graphview.series;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import com.jjoe64.graphview.GraphView;
import com.jjoe64.graphview.series.DataPointInterface;
import java.util.Iterator;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/series/LineGraphSeries.class */
public class LineGraphSeries<E extends DataPointInterface> extends BaseSeries<E> {
    private LineGraphSeries<E>.Styles mStyles;
    private Paint mPaint;
    private Paint mPaintBackground;
    private Path mPathBackground;
    private Path mPath;
    private Paint mCustomPaint;

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/series/LineGraphSeries$Styles.class */
    private final class Styles {
        private int thickness;
        private boolean drawBackground;
        private boolean drawDataPoints;
        private float dataPointsRadius;
        private int backgroundColor;

        private Styles() {
            this.thickness = 5;
            this.drawBackground = false;
            this.drawDataPoints = false;
            this.dataPointsRadius = 10.0f;
            this.backgroundColor = Color.argb(100, 172, 218, 255);
        }
    }

    public LineGraphSeries() {
        init();
    }

    public LineGraphSeries(E[] data) {
        super(data);
        init();
    }

    protected void init() {
        this.mStyles = new Styles();
        this.mPaint = new Paint();
        this.mPaint.setStrokeCap(Paint.Cap.ROUND);
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaintBackground = new Paint();
        this.mPathBackground = new Path();
        this.mPath = new Path();
    }

    @Override // com.jjoe64.graphview.series.Series
    public void draw(GraphView graphView, Canvas canvas, boolean isSecondScale) {
        double maxY;
        double minY;
        Paint paint;
        resetDataPoints();
        double maxX = graphView.getViewport().getMaxX(false);
        double minX = graphView.getViewport().getMinX(false);
        if (isSecondScale) {
            maxY = graphView.getSecondScale().getMaxY();
            minY = graphView.getSecondScale().getMinY();
        } else {
            maxY = graphView.getViewport().getMaxY(false);
            minY = graphView.getViewport().getMinY(false);
        }
        Iterator<E> values = getValues(minX, maxX);
        this.mPaint.setStrokeWidth(((Styles) this.mStyles).thickness);
        this.mPaint.setColor(getColor());
        this.mPaintBackground.setColor(((Styles) this.mStyles).backgroundColor);
        if (this.mCustomPaint != null) {
            paint = this.mCustomPaint;
        } else {
            paint = this.mPaint;
        }
        if (((Styles) this.mStyles).drawBackground) {
            this.mPathBackground.reset();
        }
        double diffY = maxY - minY;
        double diffX = maxX - minX;
        float graphHeight = graphView.getGraphContentHeight();
        float graphWidth = graphView.getGraphContentWidth();
        float graphLeft = graphView.getGraphContentLeft();
        float graphTop = graphView.getGraphContentTop();
        double lastEndY = 0.0d;
        double lastEndX = 0.0d;
        double lastUsedEndX = 0.0d;
        float firstX = 0.0f;
        int i = 0;
        while (values.hasNext()) {
            E value = values.next();
            double valY = value.getY() - minY;
            double ratY = valY / diffY;
            double y = graphHeight * ratY;
            double valX = value.getX() - minX;
            double ratX = valX / diffX;
            double x = graphWidth * ratX;
            if (i <= 0) {
                if (((Styles) this.mStyles).drawDataPoints) {
                    float f = ((float) x) + graphLeft + 1.0f;
                    float f2 = ((float) (graphTop - y)) + graphHeight;
                }
            } else {
                if (x > graphWidth) {
                    double b = ((graphWidth - lastEndX) * (y - lastEndY)) / (x - lastEndX);
                    y = lastEndY + b;
                    x = graphWidth;
                }
                if (y < 0.0d) {
                    double b2 = ((0.0d - lastEndY) * (x - lastEndX)) / (y - lastEndY);
                    x = lastEndX + b2;
                    y = 0.0d;
                }
                if (y > graphHeight) {
                    double b3 = ((graphHeight - lastEndY) * (x - lastEndX)) / (y - lastEndY);
                    x = lastEndX + b3;
                    y = graphHeight;
                }
                if (lastEndY < 0.0d) {
                    double b4 = ((0.0d - y) * (x - lastEndX)) / (lastEndY - y);
                    lastEndX = x - b4;
                    lastEndY = 0.0d;
                }
                if (lastEndX < 0.0d) {
                    double b5 = ((0.0d - x) * (y - lastEndY)) / (lastEndX - x);
                    lastEndY = y - b5;
                    lastEndX = 0.0d;
                }
                if (lastEndY > graphHeight) {
                    double b6 = ((graphHeight - y) * (x - lastEndX)) / (lastEndY - y);
                    lastEndX = x - b6;
                    lastEndY = graphHeight;
                }
                float startX = ((float) lastEndX) + graphLeft + 1.0f;
                float startY = ((float) (graphTop - lastEndY)) + graphHeight;
                float endX = ((float) x) + graphLeft + 1.0f;
                float endY = ((float) (graphTop - y)) + graphHeight;
                if (((Styles) this.mStyles).drawDataPoints) {
                    canvas.drawCircle(endX, endY, ((Styles) this.mStyles).dataPointsRadius, this.mPaint);
                }
                registerDataPoint(endX, endY, value);
                this.mPath.reset();
                this.mPath.moveTo(startX, startY);
                this.mPath.lineTo(endX, endY);
                canvas.drawPath(this.mPath, paint);
                if (((Styles) this.mStyles).drawBackground) {
                    if (i == 1) {
                        firstX = startX;
                        this.mPathBackground.moveTo(startX, startY);
                    }
                    this.mPathBackground.lineTo(endX, endY);
                }
                lastUsedEndX = endX;
            }
            lastEndY = y;
            lastEndX = x;
            i++;
        }
        if (((Styles) this.mStyles).drawBackground) {
            this.mPathBackground.lineTo((float) lastUsedEndX, graphHeight + graphTop);
            this.mPathBackground.lineTo(firstX, graphHeight + graphTop);
            this.mPathBackground.close();
            canvas.drawPath(this.mPathBackground, this.mPaintBackground);
        }
    }

    public int getThickness() {
        return ((Styles) this.mStyles).thickness;
    }

    public void setThickness(int thickness) {
        ((Styles) this.mStyles).thickness = thickness;
    }

    public boolean isDrawBackground() {
        return ((Styles) this.mStyles).drawBackground;
    }

    public void setDrawBackground(boolean drawBackground) {
        ((Styles) this.mStyles).drawBackground = drawBackground;
    }

    public boolean isDrawDataPoints() {
        return ((Styles) this.mStyles).drawDataPoints;
    }

    public void setDrawDataPoints(boolean drawDataPoints) {
        ((Styles) this.mStyles).drawDataPoints = drawDataPoints;
    }

    public float getDataPointsRadius() {
        return ((Styles) this.mStyles).dataPointsRadius;
    }

    public void setDataPointsRadius(float dataPointsRadius) {
        ((Styles) this.mStyles).dataPointsRadius = dataPointsRadius;
    }

    public int getBackgroundColor() {
        return ((Styles) this.mStyles).backgroundColor;
    }

    public void setBackgroundColor(int backgroundColor) {
        ((Styles) this.mStyles).backgroundColor = backgroundColor;
    }

    public void setCustomPaint(Paint customPaint) {
        this.mCustomPaint = customPaint;
    }
}
