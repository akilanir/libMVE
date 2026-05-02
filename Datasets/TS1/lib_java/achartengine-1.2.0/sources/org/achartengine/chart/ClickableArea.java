package org.achartengine.chart;

import android.graphics.RectF;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/ClickableArea.class */
public class ClickableArea {
    private RectF rect;
    private double x;
    private double y;

    public ClickableArea(RectF rect, double x, double y) {
        this.rect = rect;
        this.x = x;
        this.y = y;
    }

    public RectF getRect() {
        return this.rect;
    }

    public double getX() {
        return this.x;
    }

    public double getY() {
        return this.y;
    }
}
