package com.github.mikephil.charting.data.realm.implementation;

import com.github.mikephil.charting.charts.ScatterChart;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.realm.base.RealmLineScatterCandleRadarDataSet;
import com.github.mikephil.charting.interfaces.datasets.IScatterDataSet;
import com.github.mikephil.charting.utils.ColorTemplate;
import io.realm.RealmObject;
import io.realm.RealmResults;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet.class */
public class RealmScatterDataSet<T extends RealmObject> extends RealmLineScatterCandleRadarDataSet<T, Entry> implements IScatterDataSet {
    private float mShapeSize;
    private ScatterChart.ScatterShape mScatterShape;
    private float mScatterShapeHoleRadius;
    private int mScatterShapeHoleColor;

    public RealmScatterDataSet(RealmResults<T> result, String yValuesField) {
        super(result, yValuesField);
        this.mShapeSize = 10.0f;
        this.mScatterShape = ScatterChart.ScatterShape.SQUARE;
        this.mScatterShapeHoleRadius = 0.0f;
        this.mScatterShapeHoleColor = ColorTemplate.COLOR_NONE;
        build(this.results);
        calcMinMax(0, this.results.size());
    }

    public RealmScatterDataSet(RealmResults<T> result, String yValuesField, String xIndexField) {
        super(result, yValuesField, xIndexField);
        this.mShapeSize = 10.0f;
        this.mScatterShape = ScatterChart.ScatterShape.SQUARE;
        this.mScatterShapeHoleRadius = 0.0f;
        this.mScatterShapeHoleColor = ColorTemplate.COLOR_NONE;
        build(this.results);
        calcMinMax(0, this.results.size());
    }

    public void setScatterShapeSize(float size) {
        this.mShapeSize = size;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IScatterDataSet
    public float getScatterShapeSize() {
        return this.mShapeSize;
    }

    public void setScatterShape(ScatterChart.ScatterShape shape) {
        this.mScatterShape = shape;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IScatterDataSet
    public ScatterChart.ScatterShape getScatterShape() {
        return this.mScatterShape;
    }

    public void setScatterShapeHoleRadius(float holeRadius) {
        this.mScatterShapeHoleRadius = holeRadius;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IScatterDataSet
    public float getScatterShapeHoleRadius() {
        return this.mScatterShapeHoleRadius;
    }

    public void setScatterShapeHoleColor(int holeColor) {
        this.mScatterShapeHoleColor = holeColor;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IScatterDataSet
    public int getScatterShapeHoleColor() {
        return this.mScatterShapeHoleColor;
    }
}
