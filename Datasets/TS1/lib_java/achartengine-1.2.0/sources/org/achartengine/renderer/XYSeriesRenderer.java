package org.achartengine.renderer;

import android.graphics.Color;
import android.graphics.Paint;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.achartengine.chart.PointStyle;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/renderer/XYSeriesRenderer.class */
public class XYSeriesRenderer extends SimpleSeriesRenderer {
    private boolean mDisplayChartValues;
    private boolean mFillPoints = false;
    private List<FillOutsideLine> mFillBelowLine = new ArrayList();
    private PointStyle mPointStyle = PointStyle.POINT;
    private float mPointStrokeWidth = 1.0f;
    private float mLineWidth = 1.0f;
    private int mDisplayChartValuesDistance = 100;
    private float mChartValuesTextSize = 10.0f;
    private Paint.Align mChartValuesTextAlign = Paint.Align.CENTER;
    private float mChartValuesSpacing = 5.0f;
    private float mAnnotationsTextSize = 10.0f;
    private Paint.Align mAnnotationsTextAlign = Paint.Align.CENTER;
    private int mAnnotationsColor = DefaultRenderer.TEXT_COLOR;

    /* loaded from: achartengine-1.2.0.jar:org/achartengine/renderer/XYSeriesRenderer$FillOutsideLine.class */
    public static class FillOutsideLine implements Serializable {
        private final Type mType;
        private int mColor = Color.argb(125, 0, 0, 200);
        private int[] mFillRange;

        /* loaded from: achartengine-1.2.0.jar:org/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type.class */
        public enum Type {
            NONE,
            BOUNDS_ALL,
            BOUNDS_BELOW,
            BOUNDS_ABOVE,
            BELOW,
            ABOVE
        }

        public FillOutsideLine(Type type) {
            this.mType = type;
        }

        public int getColor() {
            return this.mColor;
        }

        public void setColor(int color) {
            this.mColor = color;
        }

        public Type getType() {
            return this.mType;
        }

        public int[] getFillRange() {
            return this.mFillRange;
        }

        public void setFillRange(int[] range) {
            this.mFillRange = range;
        }
    }

    @Deprecated
    public boolean isFillBelowLine() {
        return this.mFillBelowLine.size() > 0;
    }

    @Deprecated
    public void setFillBelowLine(boolean fill) {
        this.mFillBelowLine.clear();
        if (fill) {
            this.mFillBelowLine.add(new FillOutsideLine(FillOutsideLine.Type.BOUNDS_ALL));
        } else {
            this.mFillBelowLine.add(new FillOutsideLine(FillOutsideLine.Type.NONE));
        }
    }

    public FillOutsideLine[] getFillOutsideLine() {
        return (FillOutsideLine[]) this.mFillBelowLine.toArray(new FillOutsideLine[0]);
    }

    public void addFillOutsideLine(FillOutsideLine fill) {
        this.mFillBelowLine.add(fill);
    }

    public boolean isFillPoints() {
        return this.mFillPoints;
    }

    public void setFillPoints(boolean fill) {
        this.mFillPoints = fill;
    }

    @Deprecated
    public void setFillBelowLineColor(int color) {
        if (this.mFillBelowLine.size() > 0) {
            this.mFillBelowLine.get(0).setColor(color);
        }
    }

    public PointStyle getPointStyle() {
        return this.mPointStyle;
    }

    public void setPointStyle(PointStyle style) {
        this.mPointStyle = style;
    }

    public float getPointStrokeWidth() {
        return this.mPointStrokeWidth;
    }

    public void setPointStrokeWidth(float strokeWidth) {
        this.mPointStrokeWidth = strokeWidth;
    }

    public float getLineWidth() {
        return this.mLineWidth;
    }

    public void setLineWidth(float lineWidth) {
        this.mLineWidth = lineWidth;
    }

    public boolean isDisplayChartValues() {
        return this.mDisplayChartValues;
    }

    public void setDisplayChartValues(boolean display) {
        this.mDisplayChartValues = display;
    }

    public int getDisplayChartValuesDistance() {
        return this.mDisplayChartValuesDistance;
    }

    public void setDisplayChartValuesDistance(int distance) {
        this.mDisplayChartValuesDistance = distance;
    }

    public float getChartValuesTextSize() {
        return this.mChartValuesTextSize;
    }

    public void setChartValuesTextSize(float textSize) {
        this.mChartValuesTextSize = textSize;
    }

    public Paint.Align getChartValuesTextAlign() {
        return this.mChartValuesTextAlign;
    }

    public void setChartValuesTextAlign(Paint.Align align) {
        this.mChartValuesTextAlign = align;
    }

    public float getChartValuesSpacing() {
        return this.mChartValuesSpacing;
    }

    public void setChartValuesSpacing(float spacing) {
        this.mChartValuesSpacing = spacing;
    }

    public float getAnnotationsTextSize() {
        return this.mAnnotationsTextSize;
    }

    public void setAnnotationsTextSize(float textSize) {
        this.mAnnotationsTextSize = textSize;
    }

    public Paint.Align getAnnotationsTextAlign() {
        return this.mAnnotationsTextAlign;
    }

    public void setAnnotationsTextAlign(Paint.Align align) {
        this.mAnnotationsTextAlign = align;
    }

    public int getAnnotationsColor() {
        return this.mAnnotationsColor;
    }

    public void setAnnotationsColor(int color) {
        this.mAnnotationsColor = color;
    }
}
