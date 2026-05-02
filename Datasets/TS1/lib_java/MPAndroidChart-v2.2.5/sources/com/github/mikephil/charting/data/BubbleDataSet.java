package com.github.mikephil.charting.data;

import com.github.mikephil.charting.interfaces.datasets.IBubbleDataSet;
import com.github.mikephil.charting.utils.Utils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/BubbleDataSet.class */
public class BubbleDataSet extends BarLineScatterCandleBubbleDataSet<BubbleEntry> implements IBubbleDataSet {
    protected float mXMax;
    protected float mXMin;
    protected float mMaxSize;
    protected boolean mNormalizeSize;
    private float mHighlightCircleWidth;

    public BubbleDataSet(List<BubbleEntry> yVals, String label) {
        super(yVals, label);
        this.mNormalizeSize = true;
        this.mHighlightCircleWidth = 2.5f;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBubbleDataSet
    public void setHighlightCircleWidth(float width) {
        this.mHighlightCircleWidth = Utils.convertDpToPixel(width);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBubbleDataSet
    public float getHighlightCircleWidth() {
        return this.mHighlightCircleWidth;
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
        this.mYMin = yMin((BubbleEntry) this.mYVals.get(start));
        this.mYMax = yMax((BubbleEntry) this.mYVals.get(start));
        for (int i = start; i <= endValue; i++) {
            BubbleEntry entry = (BubbleEntry) this.mYVals.get(i);
            float ymin = yMin(entry);
            float ymax = yMax(entry);
            if (ymin < this.mYMin) {
                this.mYMin = ymin;
            }
            if (ymax > this.mYMax) {
                this.mYMax = ymax;
            }
            float xmin = xMin(entry);
            float xmax = xMax(entry);
            if (xmin < this.mXMin) {
                this.mXMin = xmin;
            }
            if (xmax > this.mXMax) {
                this.mXMax = xmax;
            }
            float size = largestSize(entry);
            if (size > this.mMaxSize) {
                this.mMaxSize = size;
            }
        }
    }

    @Override // com.github.mikephil.charting.data.DataSet
    public DataSet<BubbleEntry> copy() {
        List<BubbleEntry> yVals = new ArrayList<>();
        for (int i = 0; i < this.mYVals.size(); i++) {
            yVals.add(((BubbleEntry) this.mYVals.get(i)).copy());
        }
        BubbleDataSet copied = new BubbleDataSet(yVals, getLabel());
        copied.mColors = this.mColors;
        copied.mHighLightColor = this.mHighLightColor;
        return copied;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBubbleDataSet
    public float getXMax() {
        return this.mXMax;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBubbleDataSet
    public float getXMin() {
        return this.mXMin;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBubbleDataSet
    public float getMaxSize() {
        return this.mMaxSize;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBubbleDataSet
    public boolean isNormalizeSizeEnabled() {
        return this.mNormalizeSize;
    }

    public void setNormalizeSizeEnabled(boolean normalizeSize) {
        this.mNormalizeSize = normalizeSize;
    }

    private float yMin(BubbleEntry entry) {
        return entry.getVal();
    }

    private float yMax(BubbleEntry entry) {
        return entry.getVal();
    }

    private float xMin(BubbleEntry entry) {
        return entry.getXIndex();
    }

    private float xMax(BubbleEntry entry) {
        return entry.getXIndex();
    }

    private float largestSize(BubbleEntry entry) {
        return entry.getSize();
    }
}
