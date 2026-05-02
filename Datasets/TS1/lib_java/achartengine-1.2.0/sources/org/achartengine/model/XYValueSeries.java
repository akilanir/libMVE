package org.achartengine.model;

import java.util.ArrayList;
import java.util.List;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/model/XYValueSeries.class */
public class XYValueSeries extends XYSeries {
    private List<Double> mValue;
    private double mMinValue;
    private double mMaxValue;

    public XYValueSeries(String title) {
        super(title);
        this.mValue = new ArrayList();
        this.mMinValue = Double.MAX_VALUE;
        this.mMaxValue = -1.7976931348623157E308d;
    }

    public synchronized void add(double x, double y, double value) {
        super.add(x, y);
        this.mValue.add(Double.valueOf(value));
        updateRange(value);
    }

    private void initRange() {
        this.mMinValue = Double.MAX_VALUE;
        this.mMaxValue = -1.7976931348623157E308d;
        int length = getItemCount();
        for (int k = 0; k < length; k++) {
            updateRange(getValue(k));
        }
    }

    private void updateRange(double value) {
        this.mMinValue = Math.min(this.mMinValue, value);
        this.mMaxValue = Math.max(this.mMaxValue, value);
    }

    @Override // org.achartengine.model.XYSeries
    public synchronized void add(double x, double y) {
        add(x, y, 0.0d);
    }

    @Override // org.achartengine.model.XYSeries
    public synchronized void remove(int index) {
        super.remove(index);
        double removedValue = this.mValue.remove(index).doubleValue();
        if (removedValue == this.mMinValue || removedValue == this.mMaxValue) {
            initRange();
        }
    }

    @Override // org.achartengine.model.XYSeries
    public synchronized void clear() {
        super.clear();
        this.mValue.clear();
        initRange();
    }

    public synchronized double getValue(int index) {
        return this.mValue.get(index).doubleValue();
    }

    public double getMinValue() {
        return this.mMinValue;
    }

    public double getMaxValue() {
        return this.mMaxValue;
    }
}
