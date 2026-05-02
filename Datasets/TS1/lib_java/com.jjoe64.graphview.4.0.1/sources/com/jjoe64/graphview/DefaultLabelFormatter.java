package com.jjoe64.graphview;

import java.text.NumberFormat;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/DefaultLabelFormatter.class */
public class DefaultLabelFormatter implements LabelFormatter {
    protected NumberFormat[] mNumberFormatter;
    protected Viewport mViewport;

    public DefaultLabelFormatter() {
        this.mNumberFormatter = new NumberFormat[2];
    }

    public DefaultLabelFormatter(NumberFormat xFormat, NumberFormat yFormat) {
        this.mNumberFormatter = new NumberFormat[2];
        this.mNumberFormatter[0] = yFormat;
        this.mNumberFormatter[1] = xFormat;
    }

    @Override // com.jjoe64.graphview.LabelFormatter
    public void setViewport(Viewport viewport) {
        this.mViewport = viewport;
    }

    @Override // com.jjoe64.graphview.LabelFormatter
    public String formatLabel(double value, boolean isValueX) {
        int i = isValueX ? 1 : 0;
        if (this.mNumberFormatter[i] == null) {
            this.mNumberFormatter[i] = NumberFormat.getNumberInstance();
            double highestvalue = isValueX ? this.mViewport.getMaxX(false) : this.mViewport.getMaxY(false);
            double lowestvalue = isValueX ? this.mViewport.getMinX(false) : this.mViewport.getMinY(false);
            if (highestvalue - lowestvalue < 0.1d) {
                this.mNumberFormatter[i].setMaximumFractionDigits(6);
            } else if (highestvalue - lowestvalue < 1.0d) {
                this.mNumberFormatter[i].setMaximumFractionDigits(4);
            } else if (highestvalue - lowestvalue < 20.0d) {
                this.mNumberFormatter[i].setMaximumFractionDigits(3);
            } else if (highestvalue - lowestvalue < 100.0d) {
                this.mNumberFormatter[i].setMaximumFractionDigits(1);
            } else {
                this.mNumberFormatter[i].setMaximumFractionDigits(0);
            }
        }
        return this.mNumberFormatter[i].format(value);
    }
}
