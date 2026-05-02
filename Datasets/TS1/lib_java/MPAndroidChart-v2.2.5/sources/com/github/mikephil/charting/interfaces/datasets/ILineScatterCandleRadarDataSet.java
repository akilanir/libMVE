package com.github.mikephil.charting.interfaces.datasets;

import android.graphics.DashPathEffect;
import com.github.mikephil.charting.data.Entry;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/interfaces/datasets/ILineScatterCandleRadarDataSet.class */
public interface ILineScatterCandleRadarDataSet<T extends Entry> extends IBarLineScatterCandleBubbleDataSet<T> {
    boolean isVerticalHighlightIndicatorEnabled();

    boolean isHorizontalHighlightIndicatorEnabled();

    float getHighlightLineWidth();

    DashPathEffect getDashPathEffectHighlight();
}
