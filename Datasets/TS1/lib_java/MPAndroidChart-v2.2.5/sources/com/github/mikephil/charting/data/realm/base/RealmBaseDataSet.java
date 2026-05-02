package com.github.mikephil.charting.data.realm.base;

import com.github.mikephil.charting.data.BaseDataSet;
import com.github.mikephil.charting.data.DataSet;
import com.github.mikephil.charting.data.Entry;
import io.realm.DynamicRealmObject;
import io.realm.RealmObject;
import io.realm.RealmResults;
import io.realm.Sort;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/realm/base/RealmBaseDataSet.class */
public abstract class RealmBaseDataSet<T extends RealmObject, S extends Entry> extends BaseDataSet<S> {
    protected RealmResults<T> results;
    protected String mValuesField;
    protected String mIndexField;
    protected float mYMax = 0.0f;
    protected float mYMin = 0.0f;
    protected List<S> mValues = new ArrayList();

    public RealmBaseDataSet(RealmResults<T> results, String yValuesField) {
        this.results = results;
        this.mValuesField = yValuesField;
        if (this.mIndexField != null) {
            this.results.sort(this.mIndexField, Sort.ASCENDING);
        }
    }

    public RealmBaseDataSet(RealmResults<T> results, String yValuesField, String xIndexField) {
        this.results = results;
        this.mValuesField = yValuesField;
        this.mIndexField = xIndexField;
        if (this.mIndexField != null) {
            this.results.sort(this.mIndexField, Sort.ASCENDING);
        }
    }

    public void build(RealmResults<T> realmResults) {
        int i = 0;
        Iterator it = realmResults.iterator();
        while (it.hasNext()) {
            int i2 = i;
            i++;
            this.mValues.add(buildEntryFromResultObject((RealmObject) it.next(), i2));
        }
    }

    public S buildEntryFromResultObject(T t, int i) {
        DynamicRealmObject dynamicRealmObject = new DynamicRealmObject(t);
        return (S) new Entry(dynamicRealmObject.getFloat(this.mValuesField), this.mIndexField == null ? i : dynamicRealmObject.getInt(this.mIndexField));
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
    public int getEntryCount() {
        return this.mValues.size();
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void calcMinMax(int start, int end) {
        int yValCount;
        int endValue;
        if (this.mValues == null || (yValCount = this.mValues.size()) == 0) {
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
            S e = this.mValues.get(i);
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
    public S getEntryForXIndex(int i) {
        return (S) getEntryForXIndex(i, DataSet.Rounding.CLOSEST);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public S getEntryForXIndex(int xIndex, DataSet.Rounding rounding) {
        int index = getEntryIndex(xIndex, rounding);
        if (index > -1) {
            return this.mValues.get(index);
        }
        return null;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public List<S> getEntriesForXIndex(int xIndex) {
        ArrayList arrayList = new ArrayList();
        if (this.mIndexField == null) {
            RealmObject realmObject = this.results.get(xIndex);
            if (realmObject != null) {
                arrayList.add(buildEntryFromResultObject(realmObject, xIndex));
            }
        } else {
            RealmResults<T> foundObjects = this.results.where().equalTo(this.mIndexField, Integer.valueOf(xIndex)).findAll();
            Iterator i$ = foundObjects.iterator();
            while (i$.hasNext()) {
                arrayList.add(buildEntryFromResultObject((RealmObject) i$.next(), xIndex));
            }
        }
        return arrayList;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public S getEntryForIndex(int index) {
        return this.mValues.get(index);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public int getEntryIndex(int x, DataSet.Rounding rounding) {
        int low = 0;
        int high = this.mValues.size() - 1;
        int i = -1;
        while (true) {
            int closest = i;
            if (low <= high) {
                int m = (high + low) / 2;
                S entry = this.mValues.get(m);
                if (x == entry.getXIndex()) {
                    while (m > 0 && this.mValues.get(m - 1).getXIndex() == x) {
                        m--;
                    }
                    return m;
                }
                if (x > entry.getXIndex()) {
                    low = m + 1;
                } else {
                    high = m - 1;
                }
                i = m;
            } else {
                if (closest != -1) {
                    int closestXIndex = this.mValues.get(closest).getXIndex();
                    if (rounding == DataSet.Rounding.UP) {
                        if (closestXIndex < x && closest < this.mValues.size() - 1) {
                            closest++;
                        }
                    } else if (rounding == DataSet.Rounding.DOWN && closestXIndex > x && closest > 0) {
                        closest--;
                    }
                }
                return closest;
            }
        }
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public int getEntryIndex(S e) {
        return this.mValues.indexOf(e);
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
        List<S> entries = getEntriesForXIndex(xIndex);
        float[] yVals = new float[entries.size()];
        int i = 0;
        for (S e : entries) {
            int i2 = i;
            i++;
            yVals[i2] = e.getVal();
        }
        return yVals;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean addEntry(S e) {
        if (e == null) {
            return false;
        }
        float val = e.getVal();
        if (this.mValues == null) {
            this.mValues = new ArrayList();
        }
        if (this.mValues.size() == 0) {
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
        this.mValues.add(e);
        return true;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean removeEntry(S e) {
        if (e == null || this.mValues == null) {
            return false;
        }
        boolean removed = this.mValues.remove(e);
        if (removed) {
            calcMinMax(0, this.mValues.size());
        }
        return removed;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void addEntryOrdered(S e) {
        if (e == null) {
            return;
        }
        float val = e.getVal();
        if (this.mValues == null) {
            this.mValues = new ArrayList();
        }
        if (this.mValues.size() == 0) {
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
        if (this.mValues.size() > 0 && this.mValues.get(this.mValues.size() - 1).getXIndex() > e.getXIndex()) {
            int closestIndex = getEntryIndex(e.getXIndex(), DataSet.Rounding.UP);
            this.mValues.add(closestIndex, e);
        } else {
            this.mValues.add(e);
        }
    }

    public List<S> getValues() {
        return this.mValues;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void clear() {
        this.mValues.clear();
        notifyDataSetChanged();
    }

    public RealmResults<T> getResults() {
        return this.results;
    }

    public String getValuesField() {
        return this.mValuesField;
    }

    public void setValuesField(String yValuesField) {
        this.mValuesField = yValuesField;
    }

    public String getIndexField() {
        return this.mIndexField;
    }

    public void setIndexField(String xIndexField) {
        this.mIndexField = xIndexField;
    }
}
