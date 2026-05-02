package com.github.mikephil.charting.data.realm.base;

import android.graphics.DashPathEffect;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.interfaces.datasets.ILineScatterCandleRadarDataSet;
import com.github.mikephil.charting.utils.Utils;
import io.realm.RealmObject;
import io.realm.RealmResults;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet.class */
public abstract class RealmLineScatterCandleRadarDataSet<T extends RealmObject, S extends Entry> extends RealmBarLineScatterCandleBubbleDataSet<T, S> implements ILineScatterCandleRadarDataSet<S> {
    protected boolean mDrawVerticalHighlightIndicator;
    protected boolean mDrawHorizontalHighlightIndicator;
    protected float mHighlightLineWidth;
    protected DashPathEffect mHighlightDashPathEffect;

    public RealmLineScatterCandleRadarDataSet(RealmResults<T> results, String yValuesField) {
        super(results, yValuesField);
        this.mDrawVerticalHighlightIndicator = true;
        this.mDrawHorizontalHighlightIndicator = true;
        this.mHighlightLineWidth = 0.5f;
        this.mHighlightDashPathEffect = null;
    }

    public RealmLineScatterCandleRadarDataSet(RealmResults<T> results, String yValuesField, String xIndexField) {
        super(results, yValuesField, xIndexField);
        this.mDrawVerticalHighlightIndicator = true;
        this.mDrawHorizontalHighlightIndicator = true;
        this.mHighlightLineWidth = 0.5f;
        this.mHighlightDashPathEffect = null;
    }

    public void setDrawHorizontalHighlightIndicator(boolean enabled) {
        this.mDrawHorizontalHighlightIndicator = enabled;
    }

    public void setDrawVerticalHighlightIndicator(boolean enabled) {
        this.mDrawVerticalHighlightIndicator = enabled;
    }

    public void setDrawHighlightIndicators(boolean enabled) {
        setDrawVerticalHighlightIndicator(enabled);
        setDrawHorizontalHighlightIndicator(enabled);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineScatterCandleRadarDataSet
    public boolean isVerticalHighlightIndicatorEnabled() {
        return this.mDrawVerticalHighlightIndicator;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineScatterCandleRadarDataSet
    public boolean isHorizontalHighlightIndicatorEnabled() {
        return this.mDrawHorizontalHighlightIndicator;
    }

    public void setHighlightLineWidth(float width) {
        this.mHighlightLineWidth = Utils.convertDpToPixel(width);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineScatterCandleRadarDataSet
    public float getHighlightLineWidth() {
        return this.mHighlightLineWidth;
    }

    public void enableDashedHighlightLine(float lineLength, float spaceLength, float phase) {
        this.mHighlightDashPathEffect = new DashPathEffect(new float[]{lineLength, spaceLength}, phase);
    }

    public void disableDashedHighlightLine() {
        this.mHighlightDashPathEffect = null;
    }

    public boolean isDashedHighlightLineEnabled() {
        return this.mHighlightDashPathEffect != null;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineScatterCandleRadarDataSet
    public DashPathEffect getDashPathEffectHighlight() {
        return this.mHighlightDashPathEffect;
    }
}
