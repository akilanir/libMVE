package com.github.mikephil.charting.data;

import com.github.mikephil.charting.charts.ScatterChart;
import com.github.mikephil.charting.interfaces.datasets.IScatterDataSet;
import com.github.mikephil.charting.utils.ColorTemplate;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/ScatterDataSet.class */
public class ScatterDataSet extends LineScatterCandleRadarDataSet<Entry> implements IScatterDataSet {
    private float mShapeSize;
    private ScatterChart.ScatterShape mScatterShape;
    private float mScatterShapeHoleRadius;
    private int mScatterShapeHoleColor;

    public ScatterDataSet(List<Entry> yVals, String label) {
        super(yVals, label);
        this.mShapeSize = 15.0f;
        this.mScatterShape = ScatterChart.ScatterShape.SQUARE;
        this.mScatterShapeHoleRadius = 0.0f;
        this.mScatterShapeHoleColor = ColorTemplate.COLOR_NONE;
    }

    @Override // com.github.mikephil.charting.data.DataSet
    public DataSet<Entry> copy() {
        List<Entry> yVals = new ArrayList<>();
        for (int i = 0; i < this.mYVals.size(); i++) {
            yVals.add(((Entry) this.mYVals.get(i)).copy());
        }
        ScatterDataSet copied = new ScatterDataSet(yVals, getLabel());
        copied.mColors = this.mColors;
        copied.mShapeSize = this.mShapeSize;
        copied.mScatterShape = this.mScatterShape;
        copied.mScatterShapeHoleRadius = this.mScatterShapeHoleRadius;
        copied.mScatterShapeHoleColor = this.mScatterShapeHoleColor;
        copied.mHighLightColor = this.mHighLightColor;
        return copied;
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
