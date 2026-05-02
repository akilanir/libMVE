package com.jjoe64.graphview.series;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import com.jjoe64.graphview.GraphView;
import com.jjoe64.graphview.series.DataPointInterface;
import java.util.Iterator;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/series/PointsGraphSeries.class */
public class PointsGraphSeries<E extends DataPointInterface> extends BaseSeries<E> {
    private PointsGraphSeries<E>.Styles mStyles;
    private Paint mPaint;
    private CustomShape mCustomShape;

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/series/PointsGraphSeries$CustomShape.class */
    public interface CustomShape {
        void draw(Canvas canvas, Paint paint, float f, float f2, DataPointInterface dataPointInterface);
    }

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/series/PointsGraphSeries$Shape.class */
    public enum Shape {
        POINT,
        TRIANGLE,
        RECTANGLE
    }

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/series/PointsGraphSeries$Styles.class */
    private final class Styles {
        float size;
        Shape shape;

        private Styles() {
        }
    }

    public PointsGraphSeries() {
        init();
    }

    public PointsGraphSeries(E[] data) {
        super(data);
        init();
    }

    protected void init() {
        this.mStyles = new Styles();
        this.mStyles.size = 20.0f;
        this.mPaint = new Paint();
        this.mPaint.setStrokeCap(Paint.Cap.ROUND);
        setShape(Shape.POINT);
    }

    @Override // com.jjoe64.graphview.series.Series
    public void draw(GraphView graphView, Canvas canvas, boolean isSecondScale) {
        double maxY;
        double minY;
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
        this.mPaint.setColor(getColor());
        double diffY = maxY - minY;
        double diffX = maxX - minX;
        float graphHeight = graphView.getGraphContentHeight();
        float graphWidth = graphView.getGraphContentWidth();
        float graphLeft = graphView.getGraphContentLeft();
        float graphTop = graphView.getGraphContentTop();
        int i = 0;
        while (values.hasNext()) {
            E value = values.next();
            double valY = value.getY() - minY;
            double ratY = valY / diffY;
            double y = graphHeight * ratY;
            double valX = value.getX() - minX;
            double ratX = valX / diffX;
            double x = graphWidth * ratX;
            boolean overdraw = false;
            if (x > graphWidth) {
                overdraw = true;
            }
            if (y < 0.0d) {
                overdraw = true;
            }
            if (y > graphHeight) {
                overdraw = true;
            }
            float endX = ((float) x) + graphLeft + 1.0f;
            float endY = ((float) (graphTop - y)) + graphHeight;
            registerDataPoint(endX, endY, value);
            if (!overdraw) {
                if (this.mCustomShape != null) {
                    this.mCustomShape.draw(canvas, this.mPaint, endX, endY, value);
                } else if (this.mStyles.shape == Shape.POINT) {
                    canvas.drawCircle(endX, endY, this.mStyles.size, this.mPaint);
                } else if (this.mStyles.shape == Shape.RECTANGLE) {
                    canvas.drawRect(endX - this.mStyles.size, endY - this.mStyles.size, endX + this.mStyles.size, endY + this.mStyles.size, this.mPaint);
                } else if (this.mStyles.shape == Shape.TRIANGLE) {
                    Point[] points = {new Point((int) endX, (int) (endY - getSize())), new Point((int) (endX + getSize()), (int) (endY + (getSize() * 0.67d))), new Point((int) (endX - getSize()), (int) (endY + (getSize() * 0.67d)))};
                    drawArrows(points, canvas, this.mPaint);
                }
            }
            i++;
        }
    }

    private void drawArrows(Point[] point, Canvas canvas, Paint paint) {
        float[] points = {point[0].x, point[0].y, point[1].x, point[1].y, point[2].x, point[2].y, point[0].x, point[0].y};
        canvas.drawVertices(Canvas.VertexMode.TRIANGLES, 8, points, 0, null, 0, null, 0, null, 0, 0, paint);
        Path path = new Path();
        path.moveTo(point[0].x, point[0].y);
        path.lineTo(point[1].x, point[1].y);
        path.lineTo(point[2].x, point[2].y);
        canvas.drawPath(path, paint);
    }

    public float getSize() {
        return this.mStyles.size;
    }

    public void setSize(float radius) {
        this.mStyles.size = radius;
    }

    public Shape getShape() {
        return this.mStyles.shape;
    }

    public void setShape(Shape s) {
        this.mStyles.shape = s;
    }

    public void setCustomShape(CustomShape shape) {
        this.mCustomShape = shape;
    }
}
