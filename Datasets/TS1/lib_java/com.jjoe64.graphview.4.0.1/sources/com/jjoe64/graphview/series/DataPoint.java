package com.jjoe64.graphview.series;

import java.io.Serializable;
import java.util.Date;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/series/DataPoint.class */
public class DataPoint implements DataPointInterface, Serializable {
    private static final long serialVersionUID = 1428263322645L;
    private double x;
    private double y;

    public DataPoint(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public DataPoint(Date x, double y) {
        this.x = x.getTime();
        this.y = y;
    }

    @Override // com.jjoe64.graphview.series.DataPointInterface
    public double getX() {
        return this.x;
    }

    @Override // com.jjoe64.graphview.series.DataPointInterface
    public double getY() {
        return this.y;
    }

    public String toString() {
        return "[" + this.x + "/" + this.y + "]";
    }
}
