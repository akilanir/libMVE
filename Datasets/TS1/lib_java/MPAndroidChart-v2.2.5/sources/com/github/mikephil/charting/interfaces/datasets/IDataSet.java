package com.github.mikephil.charting.interfaces.datasets;

import android.graphics.Typeface;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.DataSet;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.formatter.ValueFormatter;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/datasets/IDataSet.class */
public interface IDataSet<T extends Entry> {
    float getYMin();

    float getYMax();

    int getEntryCount();

    void calcMinMax(int i, int i2);

    T getEntryForXIndex(int i, DataSet.Rounding rounding);

    T getEntryForXIndex(int i);

    List<T> getEntriesForXIndex(int i);

    T getEntryForIndex(int i);

    int getEntryIndex(int i, DataSet.Rounding rounding);

    int getEntryIndex(T t);

    float getYValForXIndex(int i);

    float[] getYValsForXIndex(int i);

    int getIndexInEntries(int i);

    boolean addEntry(T t);

    boolean removeEntry(T t);

    void addEntryOrdered(T t);

    boolean removeFirst();

    boolean removeLast();

    boolean removeEntry(int i);

    boolean contains(T t);

    void clear();

    String getLabel();

    void setLabel(String str);

    YAxis.AxisDependency getAxisDependency();

    void setAxisDependency(YAxis.AxisDependency axisDependency);

    List<Integer> getColors();

    int getColor();

    int getColor(int i);

    boolean isHighlightEnabled();

    void setHighlightEnabled(boolean z);

    void setValueFormatter(ValueFormatter valueFormatter);

    ValueFormatter getValueFormatter();

    void setValueTextColor(int i);

    void setValueTextColors(List<Integer> list);

    void setValueTypeface(Typeface typeface);

    void setValueTextSize(float f);

    int getValueTextColor();

    int getValueTextColor(int i);

    Typeface getValueTypeface();

    float getValueTextSize();

    void setDrawValues(boolean z);

    boolean isDrawValuesEnabled();

    void setVisible(boolean z);

    boolean isVisible();
}
