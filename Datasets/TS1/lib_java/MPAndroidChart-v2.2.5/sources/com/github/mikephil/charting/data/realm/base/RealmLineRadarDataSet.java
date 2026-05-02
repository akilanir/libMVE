package com.github.mikephil.charting.data.realm.base;

import android.graphics.Color;
import android.graphics.drawable.Drawable;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet;
import com.github.mikephil.charting.utils.Utils;
import io.realm.RealmObject;
import io.realm.RealmResults;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet.class */
public abstract class RealmLineRadarDataSet<T extends RealmObject> extends RealmLineScatterCandleRadarDataSet<T, Entry> implements ILineRadarDataSet<Entry> {
    private int mFillColor;
    protected Drawable mFillDrawable;
    private int mFillAlpha;
    private float mLineWidth;
    private boolean mDrawFilled;

    public RealmLineRadarDataSet(RealmResults<T> results, String yValuesField) {
        super(results, yValuesField);
        this.mFillColor = Color.rgb(140, 234, 255);
        this.mFillAlpha = 85;
        this.mLineWidth = 2.5f;
        this.mDrawFilled = false;
    }

    public RealmLineRadarDataSet(RealmResults<T> results, String yValuesField, String xIndexField) {
        super(results, yValuesField, xIndexField);
        this.mFillColor = Color.rgb(140, 234, 255);
        this.mFillAlpha = 85;
        this.mLineWidth = 2.5f;
        this.mDrawFilled = false;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public int getFillColor() {
        return this.mFillColor;
    }

    public void setFillColor(int color) {
        this.mFillColor = color;
        this.mFillDrawable = null;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public Drawable getFillDrawable() {
        return this.mFillDrawable;
    }

    public void setFillDrawable(Drawable drawable) {
        this.mFillDrawable = drawable;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public int getFillAlpha() {
        return this.mFillAlpha;
    }

    public void setFillAlpha(int alpha) {
        this.mFillAlpha = alpha;
    }

    public void setLineWidth(float width) {
        if (width < 0.2f) {
            width = 0.2f;
        }
        if (width > 10.0f) {
            width = 10.0f;
        }
        this.mLineWidth = Utils.convertDpToPixel(width);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public float getLineWidth() {
        return this.mLineWidth;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public void setDrawFilled(boolean filled) {
        this.mDrawFilled = filled;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineRadarDataSet
    public boolean isDrawFilledEnabled() {
        return this.mDrawFilled;
    }
}
