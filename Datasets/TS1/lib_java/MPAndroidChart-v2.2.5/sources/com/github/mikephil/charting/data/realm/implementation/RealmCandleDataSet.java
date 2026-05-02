package com.github.mikephil.charting.data.realm.implementation;

import android.graphics.Paint;
import com.github.mikephil.charting.data.CandleEntry;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.realm.base.RealmLineScatterCandleRadarDataSet;
import com.github.mikephil.charting.interfaces.datasets.ICandleDataSet;
import com.github.mikephil.charting.utils.ColorTemplate;
import com.github.mikephil.charting.utils.Utils;
import io.realm.DynamicRealmObject;
import io.realm.RealmObject;
import io.realm.RealmResults;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet.class */
public class RealmCandleDataSet<T extends RealmObject> extends RealmLineScatterCandleRadarDataSet<T, CandleEntry> implements ICandleDataSet {
    private String mHighField;
    private String mLowField;
    private String mOpenField;
    private String mCloseField;
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

    @Override // com.github.mikephil.charting.data.realm.base.RealmBaseDataSet
    public /* bridge */ /* synthetic */ Entry buildEntryFromResultObject(RealmObject x0, int x1) {
        return buildEntryFromResultObject((RealmCandleDataSet<T>) x0, x1);
    }

    public RealmCandleDataSet(RealmResults<T> result, String highField, String lowField, String openField, String closeField) {
        super(result, null);
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
        this.mHighField = highField;
        this.mLowField = lowField;
        this.mOpenField = openField;
        this.mCloseField = closeField;
        build(this.results);
        calcMinMax(0, this.results.size());
    }

    public RealmCandleDataSet(RealmResults<T> result, String highField, String lowField, String openField, String closeField, String xIndexField) {
        super(result, null, xIndexField);
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
        this.mHighField = highField;
        this.mLowField = lowField;
        this.mOpenField = openField;
        this.mCloseField = closeField;
        build(this.results);
        calcMinMax(0, this.results.size());
    }

    @Override // com.github.mikephil.charting.data.realm.base.RealmBaseDataSet
    public CandleEntry buildEntryFromResultObject(T realmObject, int xIndex) {
        DynamicRealmObject dynamicObject = new DynamicRealmObject(realmObject);
        return new CandleEntry(this.mIndexField == null ? xIndex : dynamicObject.getInt(this.mIndexField), dynamicObject.getFloat(this.mHighField), dynamicObject.getFloat(this.mLowField), dynamicObject.getFloat(this.mOpenField), dynamicObject.getFloat(this.mCloseField));
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
        this.mYMin = Float.MAX_VALUE;
        this.mYMax = -3.4028235E38f;
        for (int i = start; i <= endValue; i++) {
            CandleEntry e = (CandleEntry) this.mValues.get(i);
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
