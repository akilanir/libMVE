package com.github.mikephil.charting.interfaces.datasets;

import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.PieDataSet;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/datasets/IPieDataSet.class */
public interface IPieDataSet extends IDataSet<Entry> {
    float getSliceSpace();

    float getSelectionShift();

    PieDataSet.ValuePosition getXValuePosition();

    PieDataSet.ValuePosition getYValuePosition();

    int getValueLineColor();

    float getValueLineWidth();

    float getValueLinePart1OffsetPercentage();

    float getValueLinePart1Length();

    float getValueLinePart2Length();

    boolean isValueLineVariableLength();
}
