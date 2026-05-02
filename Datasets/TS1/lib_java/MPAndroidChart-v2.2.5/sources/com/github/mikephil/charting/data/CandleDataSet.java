package com.github.mikephil.charting.data;

import android.graphics.Paint;
import com.github.mikephil.charting.interfaces.datasets.ICandleDataSet;
import com.github.mikephil.charting.utils.ColorTemplate;
import com.github.mikephil.charting.utils.Utils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/CandleDataSet.class */
public class CandleDataSet extends LineScatterCandleRadarDataSet<CandleEntry> implements ICandleDataSet {
    private float mShadowWidth;
    private boolean mShowCandleBar;
    private float mBarSpace;
    private boolean mShadowColorSameAsCandle;
    protected Paint.Style mIncreasingPaintStyle;
    protected Paint.Style mDecreasingPaintStyle;
    protected int mNeutralColor;
    protected int mIncreasingColor;
    protected int mDecreasingColor;
    protected int mShadowColor;

    public CandleDataSet(List<CandleEntry> yVals, String label) {
        super(yVals, label);
        this.mShadowWidth = 3.0f;
        this.mShowCandleBar = true;
        this.mBarSpace = 0.1f;
        this.mShadowColorSameAsCandle = false;
        this.mIncreasingPaintStyle = Paint.Style.STROKE;
        this.mDecreasingPaintStyle = Paint.Style.FILL;
        this.mNeutralColor = ColorTemplate.COLOR_NONE;
        this.mIncreasingColor = ColorTemplate.COLOR_NONE;
        this.mDecreasingColor = ColorTemplate.COLOR_NONE;
        this.mShadowColor = ColorTemplate.COLOR_NONE;
    }

    @Override // com.github.mikephil.charting.data.DataSet
    public DataSet<CandleEntry> copy() {
        List<CandleEntry> yVals = new ArrayList<>();
        for (int i = 0; i < this.mYVals.size(); i++) {
            yVals.add(((CandleEntry) this.mYVals.get(i)).copy());
        }
        CandleDataSet copied = new CandleDataSet(yVals, getLabel());
        copied.mColors = this.mColors;
        copied.mShadowWidth = this.mShadowWidth;
        copied.mShowCandleBar = this.mShowCandleBar;
        copied.mBarSpace = this.mBarSpace;
        copied.mHighLightColor = this.mHighLightColor;
        copied.mIncreasingPaintStyle = this.mIncreasingPaintStyle;
        copied.mDecreasingPaintStyle = this.mDecreasingPaintStyle;
        copied.mShadowColor = this.mShadowColor;
        return copied;
    }

    @Override // com.github.mikephil.charting.data.DataSet, com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void calcMinMax(int start, int end) {
        int endValue;
        if (this.mYVals == null || this.mYVals.size() == 0) {
            return;
        }
        if (end == 0 || end >= this.mYVals.size()) {
            endValue = this.mYVals.size() - 1;
        } else {
            endValue = end;
        }
        this.mYMin = Float.MAX_VALUE;
        this.mYMax = -3.4028235E38f;
        for (int i = start; i <= endValue; i++) {
            CandleEntry e = (CandleEntry) this.mYVals.get(i);
            if (e.getLow() < this.mYMin) {
                this.mYMin = e.getLow();
            }
            if (e.getHigh() > this.mYMax) {
                this.mYMax = e.getHigh();
            }
        }
    }

    public void setBarSpace(float space) {
        if (space < 0.0f) {
            space = 0.0f;
        }
        if (space > 0.45f) {
            space = 0.45f;
        }
        this.mBarSpace = space;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ICandleDataSet
    public float getBarSpace() {
        return this.mBarSpace;
    }

    public void setShadowWidth(float width) {
        this.mShadowWidth = Utils.convertDpToPixel(width);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ICandleDataSet
    public float getShadowWidth() {
        return this.mShadowWidth;
    }

    public void setShowCandleBar(boolean showCandleBar) {
        this.mShowCandleBar = showCandleBar;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ICandleDataSet
    public boolean getShowCandleBar() {
        return this.mShowCandleBar;
    }

    public void setNeutralColor(int color) {
        this.mNeutralColor = color;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ICandleDataSet
    public int getNeutralColor() {
        return this.mNeutralColor;
    }

    public void setIncreasingColor(int color) {
        this.mIncreasingColor = color;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ICandleDataSet
    public int getIncreasingColor() {
        return this.mIncreasingColor;
    }

    public void setDecreasingColor(int color) {
        this.mDecreasingColor = color;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ICandleDataSet
    public int getDecreasingColor() {
        return this.mDecreasingColor;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ICandleDataSet
    public Paint.Style getIncreasingPaintStyle() {
        return this.mIncreasingPaintStyle;
    }

    public void setIncreasingPaintStyle(Paint.Style paintStyle) {
        this.mIncreasingPaintStyle = paintStyle;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ICandleDataSet
    public Paint.Style getDecreasingPaintStyle() {
        return this.mDecreasingPaintStyle;
    }

    public void setDecreasingPaintStyle(Paint.Style decreasingPaintStyle) {
        this.mDecreasingPaintStyle = decreasingPaintStyle;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ICandleDataSet
    public int getShadowColor() {
        return this.mShadowColor;
    }

    public void setShadowColor(int shadowColor) {
        this.mShadowColor = shadowColor;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ICandleDataSet
    public boolean getShadowColorSameAsCandle() {
        return this.mShadowColorSameAsCandle;
    }

    public void setShadowColorSameAsCandle(boolean shadowColorSameAsCandle) {
        this.mShadowColorSameAsCandle = shadowColorSameAsCandle;
    }
}
