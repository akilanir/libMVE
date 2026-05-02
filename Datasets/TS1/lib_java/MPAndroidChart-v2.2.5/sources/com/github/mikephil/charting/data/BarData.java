package com.github.mikephil.charting.data;

import com.github.mikephil.charting.interfaces.datasets.IBarDataSet;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/BarData.class */
public class BarData extends BarLineScatterCandleBubbleData<IBarDataSet> {
    private float mGroupSpace;

    public BarData() {
        this.mGroupSpace = 0.8f;
    }

    public BarData(List<String> xVals) {
        super(xVals);
        this.mGroupSpace = 0.8f;
    }

    public BarData(String[] xVals) {
        super(xVals);
        this.mGroupSpace = 0.8f;
    }

    public BarData(List<String> xVals, List<IBarDataSet> dataSets) {
        super(xVals, dataSets);
        this.mGroupSpace = 0.8f;
    }

    public BarData(String[] xVals, List<IBarDataSet> dataSets) {
        super(xVals, dataSets);
        this.mGroupSpace = 0.8f;
    }

    public BarData(List<String> xVals, IBarDataSet dataSet) {
        super(xVals, toList(dataSet));
        this.mGroupSpace = 0.8f;
    }

    public BarData(String[] xVals, IBarDataSet dataSet) {
        super(xVals, toList(dataSet));
        this.mGroupSpace = 0.8f;
    }

    private static List<IBarDataSet> toList(IBarDataSet dataSet) {
        List<IBarDataSet> sets = new ArrayList<>();
        sets.add(dataSet);
        return sets;
    }

    public float getGroupSpace() {
        if (this.mDataSets.size() <= 1) {
            return 0.0f;
        }
        return this.mGroupSpace;
    }

    public void setGroupSpace(float percent) {
        this.mGroupSpace = percent / 100.0f;
    }

    public boolean isGrouped() {
        return this.mDataSets.size() > 1;
    }
}
