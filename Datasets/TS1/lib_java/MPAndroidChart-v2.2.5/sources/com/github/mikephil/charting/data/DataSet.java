package com.github.mikephil.charting.data;

import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.data.Entry;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/DataSet.class */
public abstract class DataSet<T extends Entry> extends BaseDataSet<T> {
    protected List<T> mYVals;
    protected float mYMax;
    protected float mYMin;

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/DataSet$Rounding.class */
    public enum Rounding {
        UP,
        DOWN,
        CLOSEST
    }

    public abstract DataSet<T> copy();

    public DataSet(List<T> yVals, String label) {
        super(label);
        this.mYVals = null;
        this.mYMax = 0.0f;
        this.mYMin = 0.0f;
        this.mYVals = yVals;
        if (this.mYVals == null) {
            this.mYVals = new ArrayList();
        }
        calcMinMax(0, this.mYVals.size());
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void calcMinMax(int start, int end) {
        int yValCount;
        int endValue;
        if (this.mYVals == null || (yValCount = this.mYVals.size()) == 0) {
            return;
        }
        if (end == 0 || end >= yValCount) {
            endValue = yValCount - 1;
        } else {
            endValue = end;
        }
        this.mYMin = Float.MAX_VALUE;
        this.mYMax = -3.4028235E38f;
        for (int i = start; i <= endValue; i++) {
            T e = this.mYVals.get(i);
            if (e != null && !Float.isNaN(e.getVal())) {
                if (e.getVal() < this.mYMin) {
                    this.mYMin = e.getVal();
                }
                if (e.getVal() > this.mYMax) {
                    this.mYMax = e.getVal();
                }
            }
        }
        if (this.mYMin == Float.MAX_VALUE) {
            this.mYMin = 0.0f;
            this.mYMax = 0.0f;
        }
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public int getEntryCount() {
        return this.mYVals.size();
    }

    public List<T> getYVals() {
        return this.mYVals;
    }

    public void setYVals(List<T> yVals) {
        this.mYVals = yVals;
        notifyDataSetChanged();
    }

    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append(toSimpleString());
        for (int i = 0; i < this.mYVals.size(); i++) {
            buffer.append(this.mYVals.get(i).toString() + " ");
        }
        return buffer.toString();
    }

    public String toSimpleString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("DataSet, label: " + (getLabel() == null ? BuildConfig.FLAVOR : getLabel()) + ", entries: " + this.mYVals.size() + "\n");
        return buffer.toString();
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public float getYMin() {
        return this.mYMin;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public float getYMax() {
        return this.mYMax;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void addEntryOrdered(T e) {
        if (e == null) {
            return;
        }
        float val = e.getVal();
        if (this.mYVals == null) {
            this.mYVals = new ArrayList();
        }
        if (this.mYVals.size() == 0) {
            this.mYMax = val;
            this.mYMin = val;
        } else {
            if (this.mYMax < val) {
                this.mYMax = val;
            }
            if (this.mYMin > val) {
                this.mYMin = val;
            }
        }
        if (this.mYVals.size() > 0 && this.mYVals.get(this.mYVals.size() - 1).getXIndex() > e.getXIndex()) {
            int closestIndex = getEntryIndex(e.getXIndex(), Rounding.UP);
            this.mYVals.add(closestIndex, e);
        } else {
            this.mYVals.add(e);
        }
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void clear() {
        this.mYVals.clear();
        notifyDataSetChanged();
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean addEntry(T e) {
        if (e == null) {
            return false;
        }
        float val = e.getVal();
        List<T> yVals = getYVals();
        if (yVals == null) {
            yVals = new ArrayList();
        }
        if (yVals.size() == 0) {
            this.mYMax = val;
            this.mYMin = val;
        } else {
            if (this.mYMax < val) {
                this.mYMax = val;
            }
            if (this.mYMin > val) {
                this.mYMin = val;
            }
        }
        yVals.add(e);
        return true;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean removeEntry(T e) {
        if (e == null || this.mYVals == null) {
            return false;
        }
        boolean removed = this.mYVals.remove(e);
        if (removed) {
            calcMinMax(0, this.mYVals.size());
        }
        return removed;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public int getEntryIndex(Entry e) {
        return this.mYVals.indexOf(e);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public T getEntryForXIndex(int xIndex, Rounding rounding) {
        int index = getEntryIndex(xIndex, rounding);
        if (index > -1) {
            return this.mYVals.get(index);
        }
        return null;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public T getEntryForXIndex(int i) {
        return (T) getEntryForXIndex(i, Rounding.CLOSEST);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public T getEntryForIndex(int index) {
        return this.mYVals.get(index);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public int getEntryIndex(int xIndex, Rounding rounding) {
        int low = 0;
        int high = this.mYVals.size() - 1;
        int i = -1;
        while (true) {
            int closest = i;
            if (low <= high) {
                int m = (high + low) / 2;
                if (xIndex == this.mYVals.get(m).getXIndex()) {
                    while (m > 0 && this.mYVals.get(m - 1).getXIndex() == xIndex) {
                        m--;
                    }
                    return m;
                }
                if (xIndex > this.mYVals.get(m).getXIndex()) {
                    low = m + 1;
                } else {
                    high = m - 1;
                }
                i = m;
            } else {
                if (closest != -1) {
                    int closestXIndex = this.mYVals.get(closest).getXIndex();
                    if (rounding == Rounding.UP) {
                        if (closestXIndex < xIndex && closest < this.mYVals.size() - 1) {
                            closest++;
                        }
                    } else if (rounding == Rounding.DOWN && closestXIndex > xIndex && closest > 0) {
                        closest--;
                    }
                }
                return closest;
            }
        }
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public float getYValForXIndex(int xIndex) {
        Entry e = getEntryForXIndex(xIndex);
        if (e != null && e.getXIndex() == xIndex) {
            return e.getVal();
        }
        return Float.NaN;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public float[] getYValsForXIndex(int xIndex) {
        List<T> entries = getEntriesForXIndex(xIndex);
        float[] yVals = new float[entries.size()];
        int i = 0;
        for (T e : entries) {
            int i2 = i;
            i++;
            yVals[i2] = e.getVal();
        }
        return yVals;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public List<T> getEntriesForXIndex(int xIndex) {
        List<T> entries = new ArrayList<>();
        int low = 0;
        int high = this.mYVals.size() - 1;
        while (true) {
            if (low > high) {
                break;
            }
            int m = (high + low) / 2;
            T entry = this.mYVals.get(m);
            if (xIndex == entry.getXIndex()) {
                while (m > 0 && this.mYVals.get(m - 1).getXIndex() == xIndex) {
                    m--;
                }
                int high2 = this.mYVals.size();
                while (m < high2) {
                    T entry2 = this.mYVals.get(m);
                    if (entry2.getXIndex() != xIndex) {
                        break;
                    }
                    entries.add(entry2);
                    m++;
                }
            } else if (xIndex > entry.getXIndex()) {
                low = m + 1;
            } else {
                high = m - 1;
            }
        }
        return entries;
    }
}
