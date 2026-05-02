package com.github.mikephil.charting.interfaces.datasets;

import com.github.mikephil.charting.data.BubbleEntry;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/datasets/IBubbleDataSet.class */
public interface IBubbleDataSet extends IBarLineScatterCandleBubbleDataSet<BubbleEntry> {
    void setHighlightCircleWidth(float f);

    float getXMax();

    float getXMin();

    float getMaxSize();

    boolean isNormalizeSizeEnabled();

    float getHighlightCircleWidth();
}
