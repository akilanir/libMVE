package com.github.mikephil.charting.interfaces.dataprovider;

import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.BarLineScatterCandleBubbleData;
import com.github.mikephil.charting.utils.Transformer;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider.class */
public interface BarLineScatterCandleBubbleDataProvider extends ChartInterface {
    Transformer getTransformer(YAxis.AxisDependency axisDependency);

    int getMaxVisibleCount();

    boolean isInverted(YAxis.AxisDependency axisDependency);

    int getLowestVisibleXIndex();

    int getHighestVisibleXIndex();

    BarLineScatterCandleBubbleData getData();
}
