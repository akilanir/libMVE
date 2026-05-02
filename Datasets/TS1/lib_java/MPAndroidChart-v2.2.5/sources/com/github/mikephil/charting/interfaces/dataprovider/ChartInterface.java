package com.github.mikephil.charting.interfaces.dataprovider;

import android.graphics.PointF;
import android.graphics.RectF;
import com.github.mikephil.charting.data.ChartData;
import com.github.mikephil.charting.formatter.ValueFormatter;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/dataprovider/ChartInterface.class */
public interface ChartInterface {
    float getXChartMin();

    float getXChartMax();

    float getYChartMin();

    float getYChartMax();

    int getXValCount();

    int getWidth();

    int getHeight();

    PointF getCenterOfView();

    PointF getCenterOffsets();

    RectF getContentRect();

    ValueFormatter getDefaultValueFormatter();

    ChartData getData();
}
