package com.github.mikephil.charting.interfaces.dataprovider;

import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.LineData;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/dataprovider/LineDataProvider.class */
public interface LineDataProvider extends BarLineScatterCandleBubbleDataProvider {
    LineData getLineData();

    YAxis getAxis(YAxis.AxisDependency axisDependency);
}
