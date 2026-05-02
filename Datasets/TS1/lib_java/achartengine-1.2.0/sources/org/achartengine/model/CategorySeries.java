package org.achartengine.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/model/CategorySeries.class */
public class CategorySeries implements Serializable {
    private String mTitle;
    private List<String> mCategories = new ArrayList();
    private List<Double> mValues = new ArrayList();

    public CategorySeries(String title) {
        this.mTitle = title;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public synchronized void add(double value) {
        add(this.mCategories.size() + "", value);
    }

    public synchronized void add(String category, double value) {
        this.mCategories.add(category);
        this.mValues.add(Double.valueOf(value));
    }

    public synchronized void set(int index, String category, double value) {
        this.mCategories.set(index, category);
        this.mValues.set(index, Double.valueOf(value));
    }

    public synchronized void remove(int index) {
        this.mCategories.remove(index);
        this.mValues.remove(index);
    }

    public synchronized void clear() {
        this.mCategories.clear();
        this.mValues.clear();
    }

    public synchronized double getValue(int index) {
        return this.mValues.get(index).doubleValue();
    }

    public synchronized String getCategory(int index) {
        return this.mCategories.get(index);
    }

    public synchronized int getItemCount() {
        return this.mCategories.size();
    }

    public XYSeries toXYSeries() {
        XYSeries xySeries = new XYSeries(this.mTitle);
        int k = 0;
        Iterator i$ = this.mValues.iterator();
        while (i$.hasNext()) {
            double value = i$.next().doubleValue();
            k++;
            xySeries.add(k, value);
        }
        return xySeries;
    }
}
