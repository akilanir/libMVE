package com.jjoe64.graphview.series;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.Log;
import com.jjoe64.graphview.GraphView;
import com.jjoe64.graphview.ValueDependentColor;
import com.jjoe64.graphview.series.DataPointInterface;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/series/BarGraphSeries.class */
public class BarGraphSeries<E extends DataPointInterface> extends BaseSeries<E> {
    private Paint mPaint;
    private int mSpacing;
    private ValueDependentColor<E> mValueDependentColor;
    private boolean mDrawValuesOnTop;
    private int mValuesOnTopColor;
    private float mValuesOnTopSize;
    private Map<RectF, E> mDataPoints;

    public BarGraphSeries() {
        this.mDataPoints = new HashMap();
        this.mPaint = new Paint();
    }

    public BarGraphSeries(E[] data) {
        super(data);
        this.mDataPoints = new HashMap();
        this.mPaint = new Paint();
    }

    @Override // com.jjoe64.graphview.series.Series
    public void draw(GraphView graphView, Canvas canvas, boolean isSecondScale) {
        double maxY;
        double minY;
        float graphContentWidth;
        float top;
        this.mPaint.setTextAlign(Paint.Align.CENTER);
        if (this.mValuesOnTopSize == 0.0f) {
            this.mValuesOnTopSize = graphView.getGridLabelRenderer().getTextSize();
        }
        this.mPaint.setTextSize(this.mValuesOnTopSize);
        double maxX = graphView.getViewport().getMaxX(false);
        double minX = graphView.getViewport().getMinX(false);
        if (isSecondScale) {
            maxY = graphView.getSecondScale().getMaxY();
            minY = graphView.getSecondScale().getMinY();
        } else {
            maxY = graphView.getViewport().getMaxY(false);
            minY = graphView.getViewport().getMinY(false);
        }
        int numBarSeries = 0;
        int currentSeriesOrder = 0;
        int numValues = 0;
        SortedSet<Double> xVals = new TreeSet<>();
        Iterator<Series> it = graphView.getSeries().iterator();
        while (it.hasNext()) {
            Series inspectedSeries = it.next();
            if (inspectedSeries instanceof BarGraphSeries) {
                boolean isCurrentSeries = inspectedSeries == this;
                if (isCurrentSeries) {
                    currentSeriesOrder = numBarSeries;
                }
                numBarSeries++;
                Iterator<E> curValues = inspectedSeries.getValues(minX, maxX);
                if (curValues.hasNext()) {
                    xVals.add(Double.valueOf(curValues.next().getX()));
                    if (isCurrentSeries) {
                        numValues++;
                    }
                    while (curValues.hasNext()) {
                        xVals.add(Double.valueOf(curValues.next().getX()));
                        if (isCurrentSeries) {
                            numValues++;
                        }
                    }
                }
            }
        }
        if (numValues == 0) {
            return;
        }
        Double lastVal = null;
        double minGap = 0.0d;
        for (Double curVal : xVals) {
            if (lastVal != null) {
                double curGap = Math.abs(curVal.doubleValue() - lastVal.doubleValue());
                if (minGap == 0.0d || (curGap > 0.0d && curGap < minGap)) {
                    minGap = curGap;
                }
            }
            lastVal = curVal;
        }
        int numBarSlots = minGap == 0.0d ? 1 : ((int) Math.round((maxX - minX) / minGap)) + 1;
        Iterator<E> values = getValues(minX, maxX);
        if (numBarSlots == 1) {
            graphContentWidth = graphView.getGraphContentWidth();
        } else {
            graphContentWidth = graphView.getGraphContentWidth() / (numBarSlots - 1);
        }
        float barSlotWidth = graphContentWidth;
        Log.d("BarGraphSeries", "numBars=" + numBarSlots);
        float spacing = Math.min((barSlotWidth * this.mSpacing) / 100.0f, barSlotWidth * 0.98f);
        float barWidth = (barSlotWidth - spacing) / numBarSeries;
        float offset = barSlotWidth / 2.0f;
        double diffY = maxY - minY;
        double diffX = maxX - minX;
        float contentHeight = graphView.getGraphContentHeight();
        float contentWidth = graphView.getGraphContentWidth();
        float contentLeft = graphView.getGraphContentLeft();
        float contentTop = graphView.getGraphContentTop();
        int i = 0;
        while (values.hasNext()) {
            E value = values.next();
            double valY = value.getY() - minY;
            double ratY = valY / diffY;
            double y = contentHeight * ratY;
            double valY0 = 0.0d - minY;
            double ratY0 = valY0 / diffY;
            double y0 = contentHeight * ratY0;
            double valX = value.getX() - minX;
            double ratX = valX / diffX;
            double x = contentWidth * ratX;
            if (getValueDependentColor() != null) {
                this.mPaint.setColor(getValueDependentColor().get(value));
            } else {
                this.mPaint.setColor(getColor());
            }
            float left = ((((float) x) + contentLeft) - offset) + (spacing / 2.0f) + (currentSeriesOrder * barWidth);
            float top2 = (contentTop - ((float) y)) + contentHeight;
            float right = left + barWidth;
            float bottom = ((contentTop - ((float) y0)) + contentHeight) - (graphView.getGridLabelRenderer().isHighlightZeroLines() ? 4 : 1);
            boolean reverse = top2 > bottom;
            if (reverse) {
                top2 = bottom + (graphView.getGridLabelRenderer().isHighlightZeroLines() ? 4 : 1);
                bottom = top2;
            }
            float left2 = Math.max(left, contentLeft);
            float right2 = Math.min(right, contentLeft + contentWidth);
            float bottom2 = Math.min(bottom, contentTop + contentHeight);
            float top3 = Math.max(top2, contentTop);
            this.mDataPoints.put(new RectF(left2, top3, right2, bottom2), value);
            canvas.drawRect(left2, top3, right2, bottom2, this.mPaint);
            if (this.mDrawValuesOnTop) {
                if (reverse) {
                    top = bottom2 + this.mValuesOnTopSize + 4.0f;
                    if (top > contentTop + contentHeight) {
                        top = contentTop + contentHeight;
                    }
                } else {
                    top = top3 - 4.0f;
                    if (top <= contentTop) {
                        top += contentTop + 4.0f;
                    }
                }
                this.mPaint.setColor(this.mValuesOnTopColor);
                canvas.drawText(graphView.getGridLabelRenderer().getLabelFormatter().formatLabel(value.getY(), false), (left2 + right2) / 2.0f, top, this.mPaint);
            }
            i++;
        }
    }

    public ValueDependentColor<E> getValueDependentColor() {
        return this.mValueDependentColor;
    }

    public void setValueDependentColor(ValueDependentColor<E> mValueDependentColor) {
        this.mValueDependentColor = mValueDependentColor;
    }

    public int getSpacing() {
        return this.mSpacing;
    }

    public void setSpacing(int mSpacing) {
        this.mSpacing = mSpacing;
    }

    public boolean isDrawValuesOnTop() {
        return this.mDrawValuesOnTop;
    }

    public void setDrawValuesOnTop(boolean mDrawValuesOnTop) {
        this.mDrawValuesOnTop = mDrawValuesOnTop;
    }

    public int getValuesOnTopColor() {
        return this.mValuesOnTopColor;
    }

    public void setValuesOnTopColor(int mValuesOnTopColor) {
        this.mValuesOnTopColor = mValuesOnTopColor;
    }

    public float getValuesOnTopSize() {
        return this.mValuesOnTopSize;
    }

    public void setValuesOnTopSize(float mValuesOnTopSize) {
        this.mValuesOnTopSize = mValuesOnTopSize;
    }

    @Override // com.jjoe64.graphview.series.BaseSeries
    protected void resetDataPoints() {
        this.mDataPoints.clear();
    }

    @Override // com.jjoe64.graphview.series.BaseSeries
    protected E findDataPoint(float x, float y) {
        for (Map.Entry<RectF, E> entry : this.mDataPoints.entrySet()) {
            if (x >= entry.getKey().left && x <= entry.getKey().right && y >= entry.getKey().top && y <= entry.getKey().bottom) {
                return entry.getValue();
            }
        }
        return null;
    }
}
