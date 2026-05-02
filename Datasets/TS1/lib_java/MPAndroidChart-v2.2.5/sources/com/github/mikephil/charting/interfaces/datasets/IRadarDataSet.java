package com.github.mikephil.charting.interfaces.datasets;

import com.github.mikephil.charting.data.Entry;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/datasets/IRadarDataSet.class */
public interface IRadarDataSet extends ILineRadarDataSet<Entry> {
    boolean isDrawHighlightCircleEnabled();

    void setDrawHighlightCircleEnabled(boolean z);

    int getHighlightCircleFillColor();

    int getHighlightCircleStrokeColor();

    int getHighlightCircleStrokeAlpha();

    float getHighlightCircleInnerRadius();

    float getHighlightCircleOuterRadius();

    float getHighlightCircleStrokeWidth();
}
