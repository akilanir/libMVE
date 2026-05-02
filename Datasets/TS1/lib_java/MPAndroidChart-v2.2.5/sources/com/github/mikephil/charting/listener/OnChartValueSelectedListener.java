package com.github.mikephil.charting.listener;

import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.highlight.Highlight;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/listener/OnChartValueSelectedListener.class */
public interface OnChartValueSelectedListener {
    void onValueSelected(Entry entry, int i, Highlight highlight);

    void onNothingSelected();
}
