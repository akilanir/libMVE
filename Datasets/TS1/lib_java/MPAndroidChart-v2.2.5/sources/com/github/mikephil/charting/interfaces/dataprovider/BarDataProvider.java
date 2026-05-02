package com.github.mikephil.charting.interfaces.dataprovider;

import com.github.mikephil.charting.data.BarData;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/dataprovider/BarDataProvider.class */
public interface BarDataProvider extends BarLineScatterCandleBubbleDataProvider {
    BarData getBarData();

    boolean isDrawBarShadowEnabled();

    boolean isDrawValueAboveBarEnabled();

    boolean isDrawHighlightArrowEnabled();
}
