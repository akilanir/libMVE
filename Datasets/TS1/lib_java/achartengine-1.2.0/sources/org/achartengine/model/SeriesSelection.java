package org.achartengine.model;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/model/SeriesSelection.class */
public class SeriesSelection {
    private int mSeriesIndex;
    private int mPointIndex;
    private double mXValue;
    private double mValue;

    public SeriesSelection(int seriesIndex, int pointIndex, double xValue, double value) {
        this.mSeriesIndex = seriesIndex;
        this.mPointIndex = pointIndex;
        this.mXValue = xValue;
        this.mValue = value;
    }

    public int getSeriesIndex() {
        return this.mSeriesIndex;
    }

    public int getPointIndex() {
        return this.mPointIndex;
    }

    public double getXValue() {
        return this.mXValue;
    }

    public double getValue() {
        return this.mValue;
    }
}
