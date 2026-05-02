package com.github.mikephil.charting.highlight;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/highlight/Highlight.class */
public class Highlight {
    private int mXIndex;
    private float mValue;
    private int mDataIndex;
    private int mDataSetIndex;
    private int mStackIndex;
    private Range mRange;

    public Highlight(int x, float value, int dataIndex, int dataSetIndex) {
        this.mValue = Float.NaN;
        this.mStackIndex = -1;
        this.mXIndex = x;
        this.mValue = value;
        this.mDataIndex = dataIndex;
        this.mDataSetIndex = dataSetIndex;
    }

    public Highlight(int x, float value, int dataIndex, int dataSetIndex, int stackIndex) {
        this(x, value, dataIndex, dataSetIndex);
        this.mStackIndex = stackIndex;
    }

    public Highlight(int x, float value, int dataIndex, int dataSetIndex, int stackIndex, Range range) {
        this(x, value, dataIndex, dataSetIndex, stackIndex);
        this.mRange = range;
    }

    public Highlight(int x, int dataSetIndex) {
        this(x, Float.NaN, 0, dataSetIndex, -1);
    }

    public int getXIndex() {
        return this.mXIndex;
    }

    public float getValue() {
        return this.mValue;
    }

    public int getDataIndex() {
        return this.mDataIndex;
    }

    public int getDataSetIndex() {
        return this.mDataSetIndex;
    }

    public int getStackIndex() {
        return this.mStackIndex;
    }

    public Range getRange() {
        return this.mRange;
    }

    public boolean equalTo(Highlight h) {
        if (h != null && this.mDataSetIndex == h.mDataSetIndex && this.mXIndex == h.mXIndex && this.mStackIndex == h.mStackIndex) {
            return true;
        }
        return false;
    }

    public String toString() {
        return "Highlight, xIndex: " + this.mXIndex + ", dataSetIndex: " + this.mDataSetIndex + ", stackIndex (only stacked barentry): " + this.mStackIndex;
    }
}
