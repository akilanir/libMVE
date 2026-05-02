package com.github.mikephil.charting.data.realm.implementation;

import com.github.mikephil.charting.data.BubbleEntry;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.realm.base.RealmBarLineScatterCandleBubbleDataSet;
import com.github.mikephil.charting.interfaces.datasets.IBubbleDataSet;
import com.github.mikephil.charting.utils.Utils;
import io.realm.DynamicRealmObject;
import io.realm.RealmObject;
import io.realm.RealmResults;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet.class */
public class RealmBubbleDataSet<T extends RealmObject> extends RealmBarLineScatterCandleBubbleDataSet<T, BubbleEntry> implements IBubbleDataSet {
    private String mSizeField;
    protected float mXMax;
    protected float mXMin;
    protected float mMaxSize;
    protected boolean mNormalizeSize;
    private float mHighlightCircleWidth;

    @Override // com.github.mikephil.charting.data.realm.base.RealmBaseDataSet
    public /* bridge */ /* synthetic */ Entry buildEntryFromResultObject(RealmObject x0, int x1) {
        return buildEntryFromResultObject((RealmBubbleDataSet<T>) x0, x1);
    }

    public RealmBubbleDataSet(RealmResults<T> result, String yValuesField, String sizeField) {
        super(result, yValuesField);
        this.mNormalizeSize = true;
        this.mHighlightCircleWidth = 2.5f;
        this.mSizeField = sizeField;
        build(this.results);
        calcMinMax(0, this.results.size());
    }

    public RealmBubbleDataSet(RealmResults<T> result, String yValuesField, String xIndexField, String sizeField) {
        super(result, yValuesField, xIndexField);
        this.mNormalizeSize = true;
        this.mHighlightCircleWidth = 2.5f;
        this.mSizeField = sizeField;
        build(this.results);
        calcMinMax(0, this.results.size());
    }

    @Override // com.github.mikephil.charting.data.realm.base.RealmBaseDataSet
    public BubbleEntry buildEntryFromResultObject(T realmObject, int xIndex) {
        DynamicRealmObject dynamicObject = new DynamicRealmObject(realmObject);
        return new BubbleEntry(this.mIndexField == null ? xIndex : dynamicObject.getInt(this.mIndexField), dynamicObject.getFloat(this.mValuesField), dynamicObject.getFloat(this.mSizeField));
    }

    @Override // com.github.mikephil.charting.data.realm.base.RealmBaseDataSet, com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void calcMinMax(int start, int end) {
        int endValue;
        if (this.mValues == null || this.mValues.size() == 0) {
            return;
        }
        if (end == 0 || end >= this.mValues.size()) {
            endValue = this.mValues.size() - 1;
        } else {
            endValue = end;
        }
        this.mYMin = yMin((BubbleEntry) this.mValues.get(start));
        this.mYMax = yMax((BubbleEntry) this.mValues.get(start));
        for (int i = start; i < endValue; i++) {
            BubbleEntry entry = (BubbleEntry) this.mValues.get(i);
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

    @Override // com.github.mikephil.charting.interfaces.datasets.IBubbleDataSet
    public void setHighlightCircleWidth(float width) {
        this.mHighlightCircleWidth = Utils.convertDpToPixel(width);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBubbleDataSet
    public float getHighlightCircleWidth() {
        return this.mHighlightCircleWidth;
    }

    public void setSizeField(String sizeField) {
        this.mSizeField = sizeField;
    }

    public String getSizeField() {
        return this.mSizeField;
    }
}
