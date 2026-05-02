package com.jjoe64.graphview.series;

import android.graphics.PointF;
import com.jjoe64.graphview.GraphView;
import com.jjoe64.graphview.series.DataPointInterface;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/series/BaseSeries.class */
public abstract class BaseSeries<E extends DataPointInterface> implements Series<E> {
    private String mTitle;
    protected OnDataPointTapListener mOnDataPointTapListener;
    private final List<E> mData = new ArrayList();
    private Map<PointF, E> mDataPoints = new HashMap();
    private int mColor = -16746548;
    private List<GraphView> mGraphViews = new ArrayList();

    public BaseSeries() {
    }

    public BaseSeries(E[] data) {
        for (E d : data) {
            this.mData.add(d);
        }
    }

    @Override // com.jjoe64.graphview.series.Series
    public double getLowestValueX() {
        if (this.mData.isEmpty()) {
            return 0.0d;
        }
        return this.mData.get(0).getX();
    }

    @Override // com.jjoe64.graphview.series.Series
    public double getHighestValueX() {
        if (this.mData.isEmpty()) {
            return 0.0d;
        }
        return this.mData.get(this.mData.size() - 1).getX();
    }

    @Override // com.jjoe64.graphview.series.Series
    public double getLowestValueY() {
        if (this.mData.isEmpty()) {
            return 0.0d;
        }
        double l = this.mData.get(0).getY();
        for (int i = 1; i < this.mData.size(); i++) {
            double c = this.mData.get(i).getY();
            if (l > c) {
                l = c;
            }
        }
        return l;
    }

    @Override // com.jjoe64.graphview.series.Series
    public double getHighestValueY() {
        if (this.mData.isEmpty()) {
            return 0.0d;
        }
        double h = this.mData.get(0).getY();
        for (int i = 1; i < this.mData.size(); i++) {
            double c = this.mData.get(i).getY();
            if (h < c) {
                h = c;
            }
        }
        return h;
    }

    @Override // com.jjoe64.graphview.series.Series
    public Iterator<E> getValues(final double d, final double d2) {
        if (d <= getLowestValueX() && d2 >= getHighestValueX()) {
            return this.mData.iterator();
        }
        return (Iterator<E>) new Iterator<E>() { // from class: com.jjoe64.graphview.series.BaseSeries.1
            Iterator<E> org;
            E nextValue;
            E nextNextValue;
            boolean plusOne = true;

            {
                this.org = BaseSeries.this.mData.iterator();
                this.nextValue = null;
                this.nextNextValue = null;
                boolean found = false;
                E prevValue = null;
                prevValue = this.org.hasNext() ? this.org.next() : prevValue;
                if (prevValue.getX() < d) {
                    while (true) {
                        if (!this.org.hasNext()) {
                            break;
                        }
                        this.nextValue = this.org.next();
                        if (this.nextValue.getX() >= d) {
                            found = true;
                            this.nextNextValue = this.nextValue;
                            this.nextValue = prevValue;
                            break;
                        }
                        prevValue = this.nextValue;
                    }
                } else {
                    this.nextValue = prevValue;
                    found = true;
                }
                if (!found) {
                    this.nextValue = null;
                }
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }

            @Override // java.util.Iterator
            public E next() {
                if (hasNext()) {
                    E r = this.nextValue;
                    if (r.getX() > d2) {
                        this.plusOne = false;
                    }
                    if (this.nextNextValue != null) {
                        this.nextValue = this.nextNextValue;
                        this.nextNextValue = null;
                    } else if (this.org.hasNext()) {
                        this.nextValue = this.org.next();
                    } else {
                        this.nextValue = null;
                    }
                    return r;
                }
                throw new NoSuchElementException();
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.nextValue != null && (this.nextValue.getX() <= d2 || this.plusOne);
            }
        };
    }

    @Override // com.jjoe64.graphview.series.Series
    public String getTitle() {
        return this.mTitle;
    }

    public void setTitle(String mTitle) {
        this.mTitle = mTitle;
    }

    @Override // com.jjoe64.graphview.series.Series
    public int getColor() {
        return this.mColor;
    }

    public void setColor(int mColor) {
        this.mColor = mColor;
    }

    @Override // com.jjoe64.graphview.series.Series
    public void setOnDataPointTapListener(OnDataPointTapListener l) {
        this.mOnDataPointTapListener = l;
    }

    @Override // com.jjoe64.graphview.series.Series
    public void onTap(float x, float y) {
        DataPointInterface findDataPoint;
        if (this.mOnDataPointTapListener != null && (findDataPoint = findDataPoint(x, y)) != null) {
            this.mOnDataPointTapListener.onTap(this, findDataPoint);
        }
    }

    protected E findDataPoint(float x, float y) {
        float shortestDistance = Float.NaN;
        E shortest = null;
        for (Map.Entry<PointF, E> entry : this.mDataPoints.entrySet()) {
            float x1 = entry.getKey().x;
            float y1 = entry.getKey().y;
            float distance = (float) Math.sqrt(((x1 - x) * (x1 - x)) + ((y1 - y) * (y1 - y)));
            if (shortest == null || distance < shortestDistance) {
                shortestDistance = distance;
                shortest = entry.getValue();
            }
        }
        if (shortest != null && shortestDistance < 120.0f) {
            return shortest;
        }
        return null;
    }

    protected void registerDataPoint(float x, float y, E dp) {
        this.mDataPoints.put(new PointF(x, y), dp);
    }

    protected void resetDataPoints() {
        this.mDataPoints.clear();
    }

    public void resetData(E[] data) {
        this.mData.clear();
        for (E d : data) {
            this.mData.add(d);
        }
        checkValueOrder(null);
        for (GraphView gv : this.mGraphViews) {
            gv.onDataChanged(true, false);
        }
    }

    @Override // com.jjoe64.graphview.series.Series
    public void onGraphViewAttached(GraphView graphView) {
        this.mGraphViews.add(graphView);
    }

    public void appendData(E dataPoint, boolean scrollToEnd, int maxDataPoints) {
        checkValueOrder(dataPoint);
        if (!this.mData.isEmpty() && dataPoint.getX() < this.mData.get(this.mData.size() - 1).getX()) {
            throw new IllegalArgumentException("new x-value must be greater then the last value. x-values has to be ordered in ASC.");
        }
        synchronized (this.mData) {
            int curDataCount = this.mData.size();
            if (curDataCount < maxDataPoints) {
                this.mData.add(dataPoint);
            } else {
                this.mData.remove(0);
                this.mData.add(dataPoint);
            }
        }
        boolean keepLabels = this.mData.size() != 1;
        for (GraphView gv : this.mGraphViews) {
            gv.onDataChanged(keepLabels, scrollToEnd);
            if (scrollToEnd) {
                gv.getViewport().scrollToEnd();
            }
        }
    }

    @Override // com.jjoe64.graphview.series.Series
    public boolean isEmpty() {
        return this.mData.isEmpty();
    }

    protected void checkValueOrder(DataPointInterface onlyLast) {
        if (this.mData.size() > 1) {
            if (onlyLast != null) {
                if (onlyLast.getX() < this.mData.get(this.mData.size() - 1).getX()) {
                    throw new IllegalArgumentException("new x-value must be greater then the last value. x-values has to be ordered in ASC.");
                }
                return;
            }
            double lx = this.mData.get(0).getX();
            for (int i = 1; i < this.mData.size(); i++) {
                if (this.mData.get(i).getX() != Double.NaN) {
                    if (lx > this.mData.get(i).getX()) {
                        throw new IllegalArgumentException("The order of the values is not correct. X-Values have to be ordered ASC. First the lowest x value and at least the highest x value.");
                    }
                    lx = this.mData.get(i).getX();
                }
            }
        }
    }
}
