package com.github.mikephil.charting.data;

import android.graphics.Typeface;
import android.util.Log;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.formatter.ValueFormatter;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.datasets.IDataSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/ChartData.class */
public abstract class ChartData<T extends IDataSet<? extends Entry>> {
    protected float mYMax;
    protected float mYMin;
    protected float mLeftAxisMax;
    protected float mLeftAxisMin;
    protected float mRightAxisMax;
    protected float mRightAxisMin;
    private int mYValCount;
    private float mXValMaximumLength;
    protected List<String> mXVals;
    protected List<T> mDataSets;

    public ChartData() {
        this.mYMax = 0.0f;
        this.mYMin = 0.0f;
        this.mLeftAxisMax = 0.0f;
        this.mLeftAxisMin = 0.0f;
        this.mRightAxisMax = 0.0f;
        this.mRightAxisMin = 0.0f;
        this.mYValCount = 0;
        this.mXValMaximumLength = 0.0f;
        this.mXVals = new ArrayList();
        this.mDataSets = new ArrayList();
    }

    public ChartData(List<String> xVals) {
        this.mYMax = 0.0f;
        this.mYMin = 0.0f;
        this.mLeftAxisMax = 0.0f;
        this.mLeftAxisMin = 0.0f;
        this.mRightAxisMax = 0.0f;
        this.mRightAxisMin = 0.0f;
        this.mYValCount = 0;
        this.mXValMaximumLength = 0.0f;
        this.mXVals = xVals;
        this.mDataSets = new ArrayList();
        init();
    }

    public ChartData(String[] xVals) {
        this.mYMax = 0.0f;
        this.mYMin = 0.0f;
        this.mLeftAxisMax = 0.0f;
        this.mLeftAxisMin = 0.0f;
        this.mRightAxisMax = 0.0f;
        this.mRightAxisMin = 0.0f;
        this.mYValCount = 0;
        this.mXValMaximumLength = 0.0f;
        this.mXVals = arrayToList(xVals);
        this.mDataSets = new ArrayList();
        init();
    }

    public ChartData(List<String> xVals, List<T> sets) {
        this.mYMax = 0.0f;
        this.mYMin = 0.0f;
        this.mLeftAxisMax = 0.0f;
        this.mLeftAxisMin = 0.0f;
        this.mRightAxisMax = 0.0f;
        this.mRightAxisMin = 0.0f;
        this.mYValCount = 0;
        this.mXValMaximumLength = 0.0f;
        this.mXVals = xVals;
        this.mDataSets = sets;
        init();
    }

    public ChartData(String[] xVals, List<T> sets) {
        this.mYMax = 0.0f;
        this.mYMin = 0.0f;
        this.mLeftAxisMax = 0.0f;
        this.mLeftAxisMin = 0.0f;
        this.mRightAxisMax = 0.0f;
        this.mRightAxisMin = 0.0f;
        this.mYValCount = 0;
        this.mXValMaximumLength = 0.0f;
        this.mXVals = arrayToList(xVals);
        this.mDataSets = sets;
        init();
    }

    private List<String> arrayToList(String[] array) {
        return Arrays.asList(array);
    }

    protected void init() {
        checkLegal();
        calcYValueCount();
        calcMinMax(0, this.mYValCount);
        calcXValMaximumLength();
    }

    private void calcXValMaximumLength() {
        if (this.mXVals.size() <= 0) {
            this.mXValMaximumLength = 1.0f;
            return;
        }
        int max = 1;
        for (int i = 0; i < this.mXVals.size(); i++) {
            int length = this.mXVals.get(i).length();
            if (length > max) {
                max = length;
            }
        }
        this.mXValMaximumLength = max;
    }

    private void checkLegal() {
        if (this.mDataSets == null || (this instanceof ScatterData) || (this instanceof CombinedData)) {
            return;
        }
        for (int i = 0; i < this.mDataSets.size(); i++) {
            if (this.mDataSets.get(i).getEntryCount() > this.mXVals.size()) {
                throw new IllegalArgumentException("One or more of the DataSet Entry arrays are longer than the x-values array of this ChartData object.");
            }
        }
    }

    public void notifyDataChanged() {
        init();
    }

    public void calcMinMax(int start, int end) {
        if (this.mDataSets == null || this.mDataSets.size() < 1) {
            this.mYMax = 0.0f;
            this.mYMin = 0.0f;
            return;
        }
        this.mYMin = Float.MAX_VALUE;
        this.mYMax = -3.4028235E38f;
        for (int i = 0; i < this.mDataSets.size(); i++) {
            IDataSet set = this.mDataSets.get(i);
            set.calcMinMax(start, end);
            if (set.getYMin() < this.mYMin) {
                this.mYMin = set.getYMin();
            }
            if (set.getYMax() > this.mYMax) {
                this.mYMax = set.getYMax();
            }
        }
        if (this.mYMin == Float.MAX_VALUE) {
            this.mYMin = 0.0f;
            this.mYMax = 0.0f;
        }
        IDataSet firstLeft = getFirstLeft();
        if (firstLeft != null) {
            this.mLeftAxisMax = firstLeft.getYMax();
            this.mLeftAxisMin = firstLeft.getYMin();
            for (T dataSet : this.mDataSets) {
                if (dataSet.getAxisDependency() == YAxis.AxisDependency.LEFT) {
                    if (dataSet.getYMin() < this.mLeftAxisMin) {
                        this.mLeftAxisMin = dataSet.getYMin();
                    }
                    if (dataSet.getYMax() > this.mLeftAxisMax) {
                        this.mLeftAxisMax = dataSet.getYMax();
                    }
                }
            }
        }
        IDataSet firstRight = getFirstRight();
        if (firstRight != null) {
            this.mRightAxisMax = firstRight.getYMax();
            this.mRightAxisMin = firstRight.getYMin();
            for (T dataSet2 : this.mDataSets) {
                if (dataSet2.getAxisDependency() == YAxis.AxisDependency.RIGHT) {
                    if (dataSet2.getYMin() < this.mRightAxisMin) {
                        this.mRightAxisMin = dataSet2.getYMin();
                    }
                    if (dataSet2.getYMax() > this.mRightAxisMax) {
                        this.mRightAxisMax = dataSet2.getYMax();
                    }
                }
            }
        }
        handleEmptyAxis(firstLeft, firstRight);
    }

    protected void calcYValueCount() {
        this.mYValCount = 0;
        if (this.mDataSets == null) {
            return;
        }
        int count = 0;
        for (int i = 0; i < this.mDataSets.size(); i++) {
            count += this.mDataSets.get(i).getEntryCount();
        }
        this.mYValCount = count;
    }

    public int getDataSetCount() {
        if (this.mDataSets == null) {
            return 0;
        }
        return this.mDataSets.size();
    }

    public float getYMin() {
        return this.mYMin;
    }

    public float getYMin(YAxis.AxisDependency axis) {
        if (axis == YAxis.AxisDependency.LEFT) {
            return this.mLeftAxisMin;
        }
        return this.mRightAxisMin;
    }

    public float getYMax() {
        return this.mYMax;
    }

    public float getYMax(YAxis.AxisDependency axis) {
        if (axis == YAxis.AxisDependency.LEFT) {
            return this.mLeftAxisMax;
        }
        return this.mRightAxisMax;
    }

    public float getXValMaximumLength() {
        return this.mXValMaximumLength;
    }

    public int getYValCount() {
        return this.mYValCount;
    }

    public List<String> getXVals() {
        return this.mXVals;
    }

    public void setXVals(List<String> xVals) {
        this.mXVals = xVals;
    }

    public void addXValue(String xVal) {
        if (xVal != null && xVal.length() > this.mXValMaximumLength) {
            this.mXValMaximumLength = xVal.length();
        }
        this.mXVals.add(xVal);
    }

    public void removeXValue(int index) {
        this.mXVals.remove(index);
    }

    public List<T> getDataSets() {
        return this.mDataSets;
    }

    protected int getDataSetIndexByLabel(List<T> dataSets, String label, boolean ignorecase) {
        if (ignorecase) {
            for (int i = 0; i < dataSets.size(); i++) {
                if (label.equalsIgnoreCase(dataSets.get(i).getLabel())) {
                    return i;
                }
            }
            return -1;
        }
        for (int i2 = 0; i2 < dataSets.size(); i2++) {
            if (label.equals(dataSets.get(i2).getLabel())) {
                return i2;
            }
        }
        return -1;
    }

    public int getXValCount() {
        return this.mXVals.size();
    }

    protected String[] getDataSetLabels() {
        String[] types = new String[this.mDataSets.size()];
        for (int i = 0; i < this.mDataSets.size(); i++) {
            types[i] = this.mDataSets.get(i).getLabel();
        }
        return types;
    }

    public Entry getEntryForHighlight(Highlight highlight) {
        if (highlight.getDataSetIndex() >= this.mDataSets.size()) {
            return null;
        }
        List<?> entries = this.mDataSets.get(highlight.getDataSetIndex()).getEntriesForXIndex(highlight.getXIndex());
        for (Object entry : entries) {
            if (((Entry) entry).getVal() == highlight.getValue() || Float.isNaN(highlight.getValue())) {
                return (Entry) entry;
            }
        }
        return null;
    }

    public T getDataSetByLabel(String label, boolean ignorecase) {
        int index = getDataSetIndexByLabel(this.mDataSets, label, ignorecase);
        if (index < 0 || index >= this.mDataSets.size()) {
            return null;
        }
        return this.mDataSets.get(index);
    }

    public T getDataSetByIndex(int index) {
        if (this.mDataSets == null || index < 0 || index >= this.mDataSets.size()) {
            return null;
        }
        return this.mDataSets.get(index);
    }

    public void addDataSet(T d) {
        if (d == null) {
            return;
        }
        this.mYValCount += d.getEntryCount();
        if (this.mDataSets.size() <= 0) {
            this.mYMax = d.getYMax();
            this.mYMin = d.getYMin();
            if (d.getAxisDependency() == YAxis.AxisDependency.LEFT) {
                this.mLeftAxisMax = d.getYMax();
                this.mLeftAxisMin = d.getYMin();
            } else {
                this.mRightAxisMax = d.getYMax();
                this.mRightAxisMin = d.getYMin();
            }
        } else {
            if (this.mYMax < d.getYMax()) {
                this.mYMax = d.getYMax();
            }
            if (this.mYMin > d.getYMin()) {
                this.mYMin = d.getYMin();
            }
            if (d.getAxisDependency() == YAxis.AxisDependency.LEFT) {
                if (this.mLeftAxisMax < d.getYMax()) {
                    this.mLeftAxisMax = d.getYMax();
                }
                if (this.mLeftAxisMin > d.getYMin()) {
                    this.mLeftAxisMin = d.getYMin();
                }
            } else {
                if (this.mRightAxisMax < d.getYMax()) {
                    this.mRightAxisMax = d.getYMax();
                }
                if (this.mRightAxisMin > d.getYMin()) {
                    this.mRightAxisMin = d.getYMin();
                }
            }
        }
        this.mDataSets.add(d);
        handleEmptyAxis(getFirstLeft(), getFirstRight());
    }

    private void handleEmptyAxis(T firstLeft, T firstRight) {
        if (firstLeft == null) {
            this.mLeftAxisMax = this.mRightAxisMax;
            this.mLeftAxisMin = this.mRightAxisMin;
        } else if (firstRight == null) {
            this.mRightAxisMax = this.mLeftAxisMax;
            this.mRightAxisMin = this.mLeftAxisMin;
        }
    }

    public boolean removeDataSet(T d) {
        if (d == null) {
            return false;
        }
        boolean removed = this.mDataSets.remove(d);
        if (removed) {
            this.mYValCount -= d.getEntryCount();
            calcMinMax(0, this.mYValCount);
        }
        return removed;
    }

    public boolean removeDataSet(int index) {
        if (index >= this.mDataSets.size() || index < 0) {
            return false;
        }
        T set = this.mDataSets.get(index);
        return removeDataSet((ChartData<T>) set);
    }

    public void addEntry(Entry e, int dataSetIndex) {
        if (this.mDataSets.size() > dataSetIndex && dataSetIndex >= 0) {
            IDataSet set = this.mDataSets.get(dataSetIndex);
            if (!set.addEntry(e)) {
                return;
            }
            float val = e.getVal();
            if (this.mYValCount == 0) {
                this.mYMin = val;
                this.mYMax = val;
                if (set.getAxisDependency() == YAxis.AxisDependency.LEFT) {
                    this.mLeftAxisMax = e.getVal();
                    this.mLeftAxisMin = e.getVal();
                } else {
                    this.mRightAxisMax = e.getVal();
                    this.mRightAxisMin = e.getVal();
                }
            } else {
                if (this.mYMax < val) {
                    this.mYMax = val;
                }
                if (this.mYMin > val) {
                    this.mYMin = val;
                }
                if (set.getAxisDependency() == YAxis.AxisDependency.LEFT) {
                    if (this.mLeftAxisMax < e.getVal()) {
                        this.mLeftAxisMax = e.getVal();
                    }
                    if (this.mLeftAxisMin > e.getVal()) {
                        this.mLeftAxisMin = e.getVal();
                    }
                } else {
                    if (this.mRightAxisMax < e.getVal()) {
                        this.mRightAxisMax = e.getVal();
                    }
                    if (this.mRightAxisMin > e.getVal()) {
                        this.mRightAxisMin = e.getVal();
                    }
                }
            }
            this.mYValCount++;
            handleEmptyAxis(getFirstLeft(), getFirstRight());
            return;
        }
        Log.e("addEntry", "Cannot add Entry because dataSetIndex too high or too low.");
    }

    public boolean removeEntry(Entry e, int dataSetIndex) {
        IDataSet set;
        if (e != null && dataSetIndex < this.mDataSets.size() && (set = this.mDataSets.get(dataSetIndex)) != null) {
            boolean removed = set.removeEntry((IDataSet) e);
            if (removed) {
                this.mYValCount--;
                calcMinMax(0, this.mYValCount);
            }
            return removed;
        }
        return false;
    }

    public boolean removeEntry(int xIndex, int dataSetIndex) {
        if (dataSetIndex >= this.mDataSets.size()) {
            return false;
        }
        IDataSet dataSet = this.mDataSets.get(dataSetIndex);
        Entry e = dataSet.getEntryForXIndex(xIndex);
        if (e == null || e.getXIndex() != xIndex) {
            return false;
        }
        return removeEntry(e, dataSetIndex);
    }

    public T getDataSetForEntry(Entry e) {
        if (e == null) {
            return null;
        }
        for (int i = 0; i < this.mDataSets.size(); i++) {
            T set = this.mDataSets.get(i);
            for (int j = 0; j < set.getEntryCount(); j++) {
                if (e.equalTo(set.getEntryForXIndex(e.getXIndex()))) {
                    return set;
                }
            }
        }
        return null;
    }

    public int[] getColors() {
        if (this.mDataSets == null) {
            return null;
        }
        int clrcnt = 0;
        for (int i = 0; i < this.mDataSets.size(); i++) {
            clrcnt += this.mDataSets.get(i).getColors().size();
        }
        int[] colors = new int[clrcnt];
        int cnt = 0;
        for (int i2 = 0; i2 < this.mDataSets.size(); i2++) {
            List<Integer> clrs = this.mDataSets.get(i2).getColors();
            for (Integer clr : clrs) {
                colors[cnt] = clr.intValue();
                cnt++;
            }
        }
        return colors;
    }

    public int getIndexOfDataSet(T dataSet) {
        for (int i = 0; i < this.mDataSets.size(); i++) {
            if (this.mDataSets.get(i) == dataSet) {
                return i;
            }
        }
        return -1;
    }

    public T getFirstLeft() {
        for (T dataSet : this.mDataSets) {
            if (dataSet.getAxisDependency() == YAxis.AxisDependency.LEFT) {
                return dataSet;
            }
        }
        return null;
    }

    public T getFirstRight() {
        for (T dataSet : this.mDataSets) {
            if (dataSet.getAxisDependency() == YAxis.AxisDependency.RIGHT) {
                return dataSet;
            }
        }
        return null;
    }

    public static List<String> generateXVals(int from, int to) {
        List<String> xvals = new ArrayList<>();
        for (int i = from; i < to; i++) {
            xvals.add(BuildConfig.FLAVOR + i);
        }
        return xvals;
    }

    public void setValueFormatter(ValueFormatter f) {
        if (f == null) {
            return;
        }
        for (T set : this.mDataSets) {
            set.setValueFormatter(f);
        }
    }

    public void setValueTextColor(int color) {
        for (T set : this.mDataSets) {
            set.setValueTextColor(color);
        }
    }

    public void setValueTextColors(List<Integer> colors) {
        for (T set : this.mDataSets) {
            set.setValueTextColors(colors);
        }
    }

    public void setValueTypeface(Typeface tf) {
        for (T set : this.mDataSets) {
            set.setValueTypeface(tf);
        }
    }

    public void setValueTextSize(float size) {
        for (T set : this.mDataSets) {
            set.setValueTextSize(size);
        }
    }

    public void setDrawValues(boolean enabled) {
        for (T set : this.mDataSets) {
            set.setDrawValues(enabled);
        }
    }

    public void setHighlightEnabled(boolean enabled) {
        for (T set : this.mDataSets) {
            set.setHighlightEnabled(enabled);
        }
    }

    public boolean isHighlightEnabled() {
        for (T set : this.mDataSets) {
            if (!set.isHighlightEnabled()) {
                return false;
            }
        }
        return true;
    }

    public void clearValues() {
        this.mDataSets.clear();
        notifyDataChanged();
    }

    public boolean contains(T dataSet) {
        for (T set : this.mDataSets) {
            if (set.equals(dataSet)) {
                return true;
            }
        }
        return false;
    }
}
