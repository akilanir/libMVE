package com.github.mikephil.charting.interfaces.datasets;

import android.graphics.DashPathEffect;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.formatter.FillFormatter;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/datasets/ILineDataSet.class */
public interface ILineDataSet extends ILineRadarDataSet<Entry> {
    LineDataSet.Mode getMode();

    float getCubicIntensity();

    @Deprecated
    boolean isDrawCubicEnabled();

    @Deprecated
    boolean isDrawSteppedEnabled();

    float getCircleRadius();

    float getCircleHoleRadius();

    int getCircleColor(int i);

    boolean isDrawCirclesEnabled();

    int getCircleHoleColor();

    boolean isDrawCircleHoleEnabled();

    DashPathEffect getDashPathEffect();

    boolean isDashedLineEnabled();

    FillFormatter getFillFormatter();
}
