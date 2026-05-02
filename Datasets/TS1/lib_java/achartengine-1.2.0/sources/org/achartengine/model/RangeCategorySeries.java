package org.achartengine.model;

import java.util.ArrayList;
import java.util.List;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/model/RangeCategorySeries.class */
public class RangeCategorySeries extends CategorySeries {
    private List<Double> mMaxValues;

    public RangeCategorySeries(String title) {
        super(title);
        this.mMaxValues = new ArrayList();
    }

    public synchronized void add(double minValue, double maxValue) {
        super.add(minValue);
        this.mMaxValues.add(Double.valueOf(maxValue));
    }

    public synchronized void add(String category, double minValue, double maxValue) {
        super.add(category, minValue);
        this.mMaxValues.add(Double.valueOf(maxValue));
    }

    @Override // org.achartengine.model.CategorySeries
    public synchronized void remove(int index) {
        super.remove(index);
        this.mMaxValues.remove(index);
    }

    @Override // org.achartengine.model.CategorySeries
    public synchronized void clear() {
        super.clear();
        this.mMaxValues.clear();
    }

    public double getMinimumValue(int index) {
        return getValue(index);
    }

    public double getMaximumValue(int index) {
        return this.mMaxValues.get(index).doubleValue();
    }

    @Override // org.achartengine.model.CategorySeries
    public XYSeries toXYSeries() {
        XYSeries xySeries = new XYSeries(getTitle());
        int length = getItemCount();
        for (int k = 0; k < length; k++) {
            xySeries.add(k + 1, getMinimumValue(k));
            xySeries.add(k + 1.000001d, getMaximumValue(k));
        }
        return xySeries;
    }
}
