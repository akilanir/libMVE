package com.github.mikephil.charting.interfaces.datasets;

import com.github.mikephil.charting.data.BarEntry;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/datasets/IBarDataSet.class */
public interface IBarDataSet extends IBarLineScatterCandleBubbleDataSet<BarEntry> {
    float getBarSpace();

    boolean isStacked();

    int getStackSize();

    int getBarShadowColor();

    float getBarBorderWidth();

    int getBarBorderColor();

    int getHighLightAlpha();

    String[] getStackLabels();
}
