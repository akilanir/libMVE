package com.github.mikephil.charting.formatter;

import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.utils.ViewPortHandler;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/formatter/ValueFormatter.class */
public interface ValueFormatter {
    String getFormattedValue(float f, Entry entry, int i, ViewPortHandler viewPortHandler);
}
