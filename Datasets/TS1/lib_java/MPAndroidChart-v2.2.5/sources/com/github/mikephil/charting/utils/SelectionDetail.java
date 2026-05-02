package com.github.mikephil.charting.utils;

import com.github.mikephil.charting.interfaces.datasets.IDataSet;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/utils/SelectionDetail.class */
public class SelectionDetail {
    public float y;
    public float value;
    public int dataIndex;
    public int dataSetIndex;
    public IDataSet dataSet;

    public SelectionDetail(float y, float value, int dataIndex, int dataSetIndex, IDataSet set) {
        this.y = y;
        this.value = value;
        this.dataIndex = dataIndex;
        this.dataSetIndex = dataSetIndex;
        this.dataSet = set;
    }

    public SelectionDetail(float y, float value, int dataSetIndex, IDataSet set) {
        this(y, value, 0, dataSetIndex, set);
    }

    public SelectionDetail(float value, int dataSetIndex, IDataSet set) {
        this(Float.NaN, value, 0, dataSetIndex, set);
    }
}
