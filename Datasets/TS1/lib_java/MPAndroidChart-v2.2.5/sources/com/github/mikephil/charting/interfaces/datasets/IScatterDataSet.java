package com.github.mikephil.charting.interfaces.datasets;

import com.github.mikephil.charting.charts.ScatterChart;
import com.github.mikephil.charting.data.Entry;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/datasets/IScatterDataSet.class */
public interface IScatterDataSet extends ILineScatterCandleRadarDataSet<Entry> {
    float getScatterShapeSize();

    ScatterChart.ScatterShape getScatterShape();

    float getScatterShapeHoleRadius();

    int getScatterShapeHoleColor();
}
