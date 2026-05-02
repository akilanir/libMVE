package com.github.mikephil.charting.data;

import android.graphics.Color;
import com.github.mikephil.charting.interfaces.datasets.IBarDataSet;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/BarDataSet.class */
public class BarDataSet extends BarLineScatterCandleBubbleDataSet<BarEntry> implements IBarDataSet {
    private float mBarSpace;
    private int mStackSize;
    private int mBarShadowColor;
    private float mBarBorderWidth;
    private int mBarBorderColor;
    private int mHighLightAlpha;
    private int mEntryCountStacks;
    private String[] mStackLabels;

    public BarDataSet(List<BarEntry> yVals, String label) {
        super(yVals, label);
        this.mBarSpace = 0.15f;
        this.mStackSize = 1;
        this.mBarShadowColor = Color.rgb(215, 215, 215);
        this.mBarBorderWidth = 0.0f;
        this.mBarBorderColor = -16777216;
        this.mHighLightAlpha = 120;
        this.mEntryCountStacks = 0;
        this.mStackLabels = new String[]{"Stack"};
        this.mHighLightColor = Color.rgb(0, 0, 0);
        calcStackSize(yVals);
        calcEntryCountIncludingStacks(yVals);
    }

    @Override // com.github.mikephil.charting.data.DataSet
    public DataSet<BarEntry> copy() {
        List<BarEntry> yVals = new ArrayList<>();
        for (int i = 0; i < this.mYVals.size(); i++) {
            yVals.add(((BarEntry) this.mYVals.get(i)).copy());
        }
        BarDataSet copied = new BarDataSet(yVals, getLabel());
        copied.mColors = this.mColors;
        copied.mStackSize = this.mStackSize;
        copied.mBarSpace = this.mBarSpace;
        copied.mBarShadowColor = this.mBarShadowColor;
        copied.mStackLabels = this.mStackLabels;
        copied.mHighLightColor = this.mHighLightColor;
        copied.mHighLightAlpha = this.mHighLightAlpha;
        return copied;
    }

    private void calcEntryCountIncludingStacks(List<BarEntry> yVals) {
        this.mEntryCountStacks = 0;
        for (int i = 0; i < yVals.size(); i++) {
            float[] vals = yVals.get(i).getVals();
            if (vals == null) {
                this.mEntryCountStacks++;
            } else {
                this.mEntryCountStacks += vals.length;
            }
        }
    }

    private void calcStackSize(List<BarEntry> yVals) {
        for (int i = 0; i < yVals.size(); i++) {
            float[] vals = yVals.get(i).getVals();
            if (vals != null && vals.length > this.mStackSize) {
                this.mStackSize = vals.length;
            }
        }
    }

    @Override // com.github.mikephil.charting.data.DataSet, com.github.mikephil.charting.interfaces.datasets.IDataSet
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
            BarEntry e = (BarEntry) this.mYVals.get(i);
            if (e != null && !Float.isNaN(e.getVal())) {
                if (e.getVals() == null) {
                    if (e.getVal() < this.mYMin) {
                        this.mYMin = e.getVal();
                    }
                    if (e.getVal() > this.mYMax) {
                        this.mYMax = e.getVal();
                    }
                } else {
                    if ((-e.getNegativeSum()) < this.mYMin) {
                        this.mYMin = -e.getNegativeSum();
                    }
                    if (e.getPositiveSum() > this.mYMax) {
                        this.mYMax = e.getPositiveSum();
                    }
                }
            }
        }
        if (this.mYMin == Float.MAX_VALUE) {
            this.mYMin = 0.0f;
            this.mYMax = 0.0f;
        }
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public int getStackSize() {
        return this.mStackSize;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public boolean isStacked() {
        return this.mStackSize > 1;
    }

    public int getEntryCountStacks() {
        return this.mEntryCountStacks;
    }

    public float getBarSpacePercent() {
        return this.mBarSpace * 100.0f;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public float getBarSpace() {
        return this.mBarSpace;
    }

    public void setBarSpacePercent(float percent) {
        this.mBarSpace = percent / 100.0f;
    }

    public void setBarShadowColor(int color) {
        this.mBarShadowColor = color;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public int getBarShadowColor() {
        return this.mBarShadowColor;
    }

    public void setBarBorderWidth(float width) {
        this.mBarBorderWidth = width;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public float getBarBorderWidth() {
        return this.mBarBorderWidth;
    }

    public void setBarBorderColor(int color) {
        this.mBarBorderColor = color;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public int getBarBorderColor() {
        return this.mBarBorderColor;
    }

    public void setHighLightAlpha(int alpha) {
        this.mHighLightAlpha = alpha;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public int getHighLightAlpha() {
        return this.mHighLightAlpha;
    }

    public void setStackLabels(String[] labels) {
        this.mStackLabels = labels;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public String[] getStackLabels() {
        return this.mStackLabels;
    }
}
