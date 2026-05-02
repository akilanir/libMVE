package com.github.mikephil.charting.data.realm.implementation;

import android.graphics.Color;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.realm.base.RealmBarLineScatterCandleBubbleDataSet;
import com.github.mikephil.charting.interfaces.datasets.IBarDataSet;
import io.realm.DynamicRealmObject;
import io.realm.RealmFieldType;
import io.realm.RealmList;
import io.realm.RealmObject;
import io.realm.RealmResults;
import java.util.Iterator;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/realm/implementation/RealmBarDataSet.class */
public class RealmBarDataSet<T extends RealmObject> extends RealmBarLineScatterCandleBubbleDataSet<T, BarEntry> implements IBarDataSet {
    private String mStackValueFieldName;
    private float mBarSpace;
    private int mStackSize;
    private int mBarShadowColor;
    private float mBarBorderWidth;
    private int mBarBorderColor;
    private int mHighLightAlpha;
    private String[] mStackLabels;

    @Override // com.github.mikephil.charting.data.realm.base.RealmBaseDataSet
    public /* bridge */ /* synthetic */ Entry buildEntryFromResultObject(RealmObject x0, int x1) {
        return buildEntryFromResultObject((RealmBarDataSet<T>) x0, x1);
    }

    public RealmBarDataSet(RealmResults<T> results, String yValuesField, String xIndexField) {
        super(results, yValuesField, xIndexField);
        this.mBarSpace = 0.15f;
        this.mStackSize = 1;
        this.mBarShadowColor = Color.rgb(215, 215, 215);
        this.mBarBorderWidth = 0.0f;
        this.mBarBorderColor = -16777216;
        this.mHighLightAlpha = 120;
        this.mStackLabels = new String[]{"Stack"};
        this.mHighLightColor = Color.rgb(0, 0, 0);
        build(this.results);
        calcMinMax(0, results.size());
    }

    public RealmBarDataSet(RealmResults<T> results, String yValuesField, String xIndexField, String stackValueFieldName) {
        super(results, yValuesField, xIndexField);
        this.mBarSpace = 0.15f;
        this.mStackSize = 1;
        this.mBarShadowColor = Color.rgb(215, 215, 215);
        this.mBarBorderWidth = 0.0f;
        this.mBarBorderColor = -16777216;
        this.mHighLightAlpha = 120;
        this.mStackLabels = new String[]{"Stack"};
        this.mStackValueFieldName = stackValueFieldName;
        this.mHighLightColor = Color.rgb(0, 0, 0);
        build(this.results);
        calcMinMax(0, results.size());
    }

    @Override // com.github.mikephil.charting.data.realm.base.RealmBaseDataSet
    public void build(RealmResults<T> results) {
        super.build(results);
        calcStackSize();
    }

    @Override // com.github.mikephil.charting.data.realm.base.RealmBaseDataSet
    public BarEntry buildEntryFromResultObject(T realmObject, int xIndex) {
        DynamicRealmObject dynamicObject = new DynamicRealmObject(realmObject);
        if (dynamicObject.getFieldType(this.mValuesField) == RealmFieldType.LIST) {
            RealmList<DynamicRealmObject> list = dynamicObject.getList(this.mValuesField);
            float[] values = new float[list.size()];
            int i = 0;
            Iterator i$ = list.iterator();
            while (i$.hasNext()) {
                DynamicRealmObject o = (DynamicRealmObject) i$.next();
                values[i] = o.getFloat(this.mStackValueFieldName);
                i++;
            }
            return new BarEntry(values, this.mIndexField == null ? xIndex : dynamicObject.getInt(this.mIndexField));
        }
        float value = dynamicObject.getFloat(this.mValuesField);
        return new BarEntry(value, this.mIndexField == null ? xIndex : dynamicObject.getInt(this.mIndexField));
    }

    @Override // com.github.mikephil.charting.data.realm.base.RealmBaseDataSet, com.github.mikephil.charting.interfaces.datasets.IDataSet
    public void calcMinMax(int start, int end) {
        int yValCount;
        int endValue;
        if (this.mValues == null || (yValCount = this.mValues.size()) == 0) {
            return;
        }
        if (end == 0 || end >= yValCount) {
            endValue = yValCount - 1;
        } else {
            endValue = end;
        }
        this.mYMin = Float.MAX_VALUE;
        this.mYMax = -3.4028235E38f;
        for (int i = start; i <= endValue; i++) {
            BarEntry e = (BarEntry) this.mValues.get(i);
            if (e != null && !Float.isNaN(e.getVal())) {
                if (e.getVals() == null) {
                    if (e.getVal() < this.mYMin) {
                        this.mYMin = e.getVal();
                    }
                    if (e.getVal() > this.mYMax) {
                        this.mYMax = e.getVal();
                    }
                } else {
                    if ((-e.getNegativeSum()) < this.mYMin) {
                        this.mYMin = -e.getNegativeSum();
                    }
                    if (e.getPositiveSum() > this.mYMax) {
                        this.mYMax = e.getPositiveSum();
                    }
                }
            }
        }
        if (this.mYMin == Float.MAX_VALUE) {
            this.mYMin = 0.0f;
            this.mYMax = 0.0f;
        }
    }

    private void calcStackSize() {
        for (int i = 0; i < this.mValues.size(); i++) {
            float[] vals = ((BarEntry) this.mValues.get(i)).getVals();
            if (vals != null && vals.length > this.mStackSize) {
                this.mStackSize = vals.length;
            }
        }
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public int getStackSize() {
        return this.mStackSize;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public boolean isStacked() {
        return this.mStackSize > 1;
    }

    public float getBarSpacePercent() {
        return this.mBarSpace * 100.0f;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public float getBarSpace() {
        return this.mBarSpace;
    }

    public void setBarSpacePercent(float percent) {
        this.mBarSpace = percent / 100.0f;
    }

    public void setBarShadowColor(int color) {
        this.mBarShadowColor = color;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public int getBarShadowColor() {
        return this.mBarShadowColor;
    }

    public void setBarBorderWidth(float width) {
        this.mBarBorderWidth = width;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public float getBarBorderWidth() {
        return this.mBarBorderWidth;
    }

    public void setBarBorderColor(int color) {
        this.mBarBorderColor = color;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public int getBarBorderColor() {
        return this.mBarBorderColor;
    }

    public void setHighLightAlpha(int alpha) {
        this.mHighLightAlpha = alpha;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public int getHighLightAlpha() {
        return this.mHighLightAlpha;
    }

    public void setStackLabels(String[] labels) {
        this.mStackLabels = labels;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IBarDataSet
    public String[] getStackLabels() {
        return this.mStackLabels;
    }
}
