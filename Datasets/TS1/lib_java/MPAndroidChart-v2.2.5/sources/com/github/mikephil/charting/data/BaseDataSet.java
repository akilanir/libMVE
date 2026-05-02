package com.github.mikephil.charting.data;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.formatter.DefaultValueFormatter;
import com.github.mikephil.charting.formatter.ValueFormatter;
import com.github.mikephil.charting.interfaces.datasets.IDataSet;
import com.github.mikephil.charting.utils.ColorTemplate;
import com.github.mikephil.charting.utils.Utils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/BaseDataSet.class */
public abstract class BaseDataSet<T extends Entry> implements IDataSet<T> {
    protected List<Integer> mColors;
    protected List<Integer> mValueColors;
    private String mLabel;
    protected YAxis.AxisDependency mAxisDependency;
    protected boolean mHighlightEnabled;
    protected transient ValueFormatter mValueFormatter;
    protected Typeface mValueTypeface;
    protected boolean mDrawValues;
    protected float mValueTextSize;
    protected boolean mVisible;

    public BaseDataSet() {
        this.mColors = null;
        this.mValueColors = null;
        this.mLabel = "DataSet";
        this.mAxisDependency = YAxis.AxisDependency.LEFT;
        this.mHighlightEnabled = true;
        this.mDrawValues = true;
        this.mValueTextSize = 17.0f;
        this.mVisible = true;
        this.mColors = new ArrayList();
        this.mValueColors = new ArrayList();
        this.mColors.add(Integer.valueOf(Color.rgb(140, 234, 255)));
        this.mValueColors.add(-16777216);
    }

    public BaseDataSet(String label) {
        this();
        this.mLabel = label;
    }

    public void notifyDataSetChanged() {
        calcMinMax(0, getEntryCount() - 1);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public List<Integer> getColors() {
        return this.mColors;
    }

    public List<Integer> getValueColors() {
        return this.mValueColors;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public int getColor() {
        return this.mColors.get(0).intValue();
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public int getColor(int index) {
        return this.mColors.get(index % this.mColors.size()).intValue();
    }

    public void setColors(List<Integer> colors) {
        this.mColors = colors;
    }

    public void setColors(int[] colors) {
        this.mColors = ColorTemplate.createColors(colors);
    }

    public void setColors(int[] colors, Context c) {
        List<Integer> clrs = new ArrayList<>();
        for (int color : colors) {
            clrs.add(Integer.valueOf(c.getResources().getColor(color)));
        }
        this.mColors = clrs;
    }

    public void addColor(int color) {
        if (this.mColors == null) {
            this.mColors = new ArrayList();
        }
        this.mColors.add(Integer.valueOf(color));
    }

    public void setColor(int color) {
        resetColors();
        this.mColors.add(Integer.valueOf(color));
    }

    public void setColor(int color, int alpha) {
        setColor(Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color)));
    }

    public void setColors(int[] colors, int alpha) {
        resetColors();
        for (int color : colors) {
            addColor(Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color)));
        }
    }

    public void resetColors() {
        this.mColors = new ArrayList();
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void setLabel(String label) {
        this.mLabel = label;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public String getLabel() {
        return this.mLabel;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void setHighlightEnabled(boolean enabled) {
        this.mHighlightEnabled = enabled;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean isHighlightEnabled() {
        return this.mHighlightEnabled;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void setValueFormatter(ValueFormatter f) {
        if (f == null) {
            return;
        }
        this.mValueFormatter = f;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public ValueFormatter getValueFormatter() {
        if (this.mValueFormatter == null) {
            return new DefaultValueFormatter(1);
        }
        return this.mValueFormatter;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void setValueTextColor(int color) {
        this.mValueColors.clear();
        this.mValueColors.add(Integer.valueOf(color));
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void setValueTextColors(List<Integer> colors) {
        this.mValueColors = colors;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void setValueTypeface(Typeface tf) {
        this.mValueTypeface = tf;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void setValueTextSize(float size) {
        this.mValueTextSize = Utils.convertDpToPixel(size);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public int getValueTextColor() {
        return this.mValueColors.get(0).intValue();
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public int getValueTextColor(int index) {
        return this.mValueColors.get(index % this.mValueColors.size()).intValue();
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public Typeface getValueTypeface() {
        return this.mValueTypeface;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public float getValueTextSize() {
        return this.mValueTextSize;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void setDrawValues(boolean enabled) {
        this.mDrawValues = enabled;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean isDrawValuesEnabled() {
        return this.mDrawValues;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void setVisible(boolean visible) {
        this.mVisible = visible;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean isVisible() {
        return this.mVisible;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public YAxis.AxisDependency getAxisDependency() {
        return this.mAxisDependency;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void setAxisDependency(YAxis.AxisDependency dependency) {
        this.mAxisDependency = dependency;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public int getIndexInEntries(int xIndex) {
        for (int i = 0; i < getEntryCount(); i++) {
            if (xIndex == getEntryForIndex(i).getXIndex()) {
                return i;
            }
        }
        return -1;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean removeFirst() {
        T entry = getEntryForIndex(0);
        return removeEntry((BaseDataSet<T>) entry);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean removeLast() {
        T entry = getEntryForIndex(getEntryCount() - 1);
        return removeEntry((BaseDataSet<T>) entry);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean removeEntry(int xIndex) {
        T e = getEntryForXIndex(xIndex);
        return removeEntry((BaseDataSet<T>) e);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IDataSet
    public boolean contains(T e) {
        for (int i = 0; i < getEntryCount(); i++) {
            if (getEntryForIndex(i).equals(e)) {
                return true;
            }
        }
        return false;
    }
}
