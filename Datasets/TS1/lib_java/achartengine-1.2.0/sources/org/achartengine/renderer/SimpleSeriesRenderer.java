package org.achartengine.renderer;

import java.io.Serializable;
import java.text.NumberFormat;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/renderer/SimpleSeriesRenderer.class */
public class SimpleSeriesRenderer implements Serializable {
    private BasicStroke mStroke;
    private double mGradientStartValue;
    private int mGradientStartColor;
    private double mGradientStopValue;
    private int mGradientStopColor;
    private boolean mHighlighted;
    private NumberFormat mChartValuesFormat;
    private int mColor = -16776961;
    private boolean mGradientEnabled = false;
    private boolean mShowLegendItem = true;
    private boolean mDisplayBoundingPoints = true;

    public int getColor() {
        return this.mColor;
    }

    public void setColor(int color) {
        this.mColor = color;
    }

    public BasicStroke getStroke() {
        return this.mStroke;
    }

    public void setStroke(BasicStroke stroke) {
        this.mStroke = stroke;
    }

    public boolean isGradientEnabled() {
        return this.mGradientEnabled;
    }

    public void setGradientEnabled(boolean enabled) {
        this.mGradientEnabled = enabled;
    }

    public double getGradientStartValue() {
        return this.mGradientStartValue;
    }

    public int getGradientStartColor() {
        return this.mGradientStartColor;
    }

    public void setGradientStart(double start, int color) {
        this.mGradientStartValue = start;
        this.mGradientStartColor = color;
    }

    public double getGradientStopValue() {
        return this.mGradientStopValue;
    }

    public int getGradientStopColor() {
        return this.mGradientStopColor;
    }

    public void setGradientStop(double start, int color) {
        this.mGradientStopValue = start;
        this.mGradientStopColor = color;
    }

    public boolean isShowLegendItem() {
        return this.mShowLegendItem;
    }

    public void setShowLegendItem(boolean showLegend) {
        this.mShowLegendItem = showLegend;
    }

    public boolean isHighlighted() {
        return this.mHighlighted;
    }

    public void setHighlighted(boolean highlighted) {
        this.mHighlighted = highlighted;
    }

    public boolean isDisplayBoundingPoints() {
        return this.mDisplayBoundingPoints;
    }

    public void setDisplayBoundingPoints(boolean display) {
        this.mDisplayBoundingPoints = display;
    }

    public NumberFormat getChartValuesFormat() {
        return this.mChartValuesFormat;
    }

    public void setChartValuesFormat(NumberFormat format) {
        this.mChartValuesFormat = format;
    }
}
