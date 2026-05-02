package org.achartengine.model;

import java.util.Date;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/model/TimeSeries.class */
public class TimeSeries extends XYSeries {
    public TimeSeries(String title) {
        super(title);
    }

    public synchronized void add(Date x, double y) {
        super.add(x.getTime(), y);
    }

    @Override // org.achartengine.model.XYSeries
    protected double getPadding(double x) {
        return 1.0d;
    }
}
