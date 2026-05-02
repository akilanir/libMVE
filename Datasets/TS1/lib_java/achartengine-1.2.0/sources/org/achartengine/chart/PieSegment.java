package org.achartengine.chart;

import java.io.Serializable;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/PieSegment.class */
public class PieSegment implements Serializable {
    private float mStartAngle;
    private float mEndAngle;
    private int mDataIndex;
    private float mValue;

    public PieSegment(int dataIndex, float value, float startAngle, float angle) {
        this.mStartAngle = startAngle;
        this.mEndAngle = angle + startAngle;
        this.mDataIndex = dataIndex;
        this.mValue = value;
    }

    public boolean isInSegment(double angle) {
        double stopAngle;
        if (angle >= this.mStartAngle && angle <= this.mEndAngle) {
            return true;
        }
        double cAngle = angle % 360.0d;
        double startAngle = this.mStartAngle;
        double d = this.mEndAngle;
        while (true) {
            stopAngle = d;
            if (stopAngle <= 360.0d) {
                break;
            }
            startAngle -= 360.0d;
            d = stopAngle - 360.0d;
        }
        return cAngle >= startAngle && cAngle <= stopAngle;
    }

    protected float getStartAngle() {
        return this.mStartAngle;
    }

    protected float getEndAngle() {
        return this.mEndAngle;
    }

    protected int getDataIndex() {
        return this.mDataIndex;
    }

    protected float getValue() {
        return this.mValue;
    }

    public String toString() {
        return "mDataIndex=" + this.mDataIndex + ",mValue=" + this.mValue + ",mStartAngle=" + this.mStartAngle + ",mEndAngle=" + this.mEndAngle;
    }
}
