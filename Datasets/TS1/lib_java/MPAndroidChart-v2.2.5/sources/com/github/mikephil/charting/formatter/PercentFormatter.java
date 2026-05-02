package com.github.mikephil.charting.formatter;

import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.utils.ViewPortHandler;
import java.text.DecimalFormat;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/formatter/PercentFormatter.class */
public class PercentFormatter implements ValueFormatter, YAxisValueFormatter {
    protected DecimalFormat mFormat;

    public PercentFormatter() {
        this.mFormat = new DecimalFormat("###,###,##0.0");
    }

    public PercentFormatter(DecimalFormat format) {
        this.mFormat = format;
    }

    @Override // com.github.mikephil.charting.formatter.ValueFormatter
    public String getFormattedValue(float value, Entry entry, int dataSetIndex, ViewPortHandler viewPortHandler) {
        return this.mFormat.format(value) + " %";
    }

    @Override // com.github.mikephil.charting.formatter.YAxisValueFormatter
    public String getFormattedValue(float value, YAxis yAxis) {
        return this.mFormat.format(value) + " %";
    }
}
