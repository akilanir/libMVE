package com.jjoe64.graphview;

import com.jjoe64.graphview.series.Series;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/SecondScale.class */
public class SecondScale {
    protected final Viewport mViewport;
    private double mMinY;
    private double mMaxY;
    private boolean mYAxisBoundsManual = true;
    protected List<Series> mSeries = new ArrayList();
    protected LabelFormatter mLabelFormatter = new DefaultLabelFormatter();

    SecondScale(Viewport viewport) {
        this.mViewport = viewport;
        this.mLabelFormatter.setViewport(this.mViewport);
    }

    public void addSeries(Series s) {
        this.mSeries.add(s);
    }

    public void setMinY(double d) {
        this.mMinY = d;
    }

    public void setMaxY(double d) {
        this.mMaxY = d;
    }

    public List<Series> getSeries() {
        return this.mSeries;
    }

    public double getMinY() {
        return this.mMinY;
    }

    public double getMaxY() {
        return this.mMaxY;
    }

    public boolean isYAxisBoundsManual() {
        return this.mYAxisBoundsManual;
    }

    public LabelFormatter getLabelFormatter() {
        return this.mLabelFormatter;
    }

    public void setLabelFormatter(LabelFormatter formatter) {
        this.mLabelFormatter = formatter;
        this.mLabelFormatter.setViewport(this.mViewport);
    }
}
