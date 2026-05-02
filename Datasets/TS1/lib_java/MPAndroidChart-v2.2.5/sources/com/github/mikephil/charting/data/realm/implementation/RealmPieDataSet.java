package com.github.mikephil.charting.data.realm.implementation;

import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.PieDataSet;
import com.github.mikephil.charting.data.realm.base.RealmBaseDataSet;
import com.github.mikephil.charting.interfaces.datasets.IPieDataSet;
import com.github.mikephil.charting.utils.Utils;
import io.realm.RealmObject;
import io.realm.RealmResults;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/realm/implementation/RealmPieDataSet.class */
public class RealmPieDataSet<T extends RealmObject> extends RealmBaseDataSet<T, Entry> implements IPieDataSet {
    private float mSliceSpace;
    private float mShift;
    private PieDataSet.ValuePosition mXValuePosition;
    private PieDataSet.ValuePosition mYValuePosition;
    private int mValueLineColor;
    private float mValueLineWidth;
    private float mValueLinePart1OffsetPercentage;
    private float mValueLinePart1Length;
    private float mValueLinePart2Length;
    private boolean mValueLineVariableLength;

    public RealmPieDataSet(RealmResults<T> result, String yValuesField) {
        super(result, yValuesField);
        this.mSliceSpace = 0.0f;
        this.mShift = 18.0f;
        this.mXValuePosition = PieDataSet.ValuePosition.INSIDE_SLICE;
        this.mYValuePosition = PieDataSet.ValuePosition.INSIDE_SLICE;
        this.mValueLineColor = -16777216;
        this.mValueLineWidth = 1.0f;
        this.mValueLinePart1OffsetPercentage = 75.0f;
        this.mValueLinePart1Length = 0.3f;
        this.mValueLinePart2Length = 0.4f;
        this.mValueLineVariableLength = true;
        build(this.results);
        calcMinMax(0, this.results.size());
    }

    public RealmPieDataSet(RealmResults<T> result, String yValuesField, String xIndexField) {
        super(result, yValuesField, xIndexField);
        this.mSliceSpace = 0.0f;
        this.mShift = 18.0f;
        this.mXValuePosition = PieDataSet.ValuePosition.INSIDE_SLICE;
        this.mYValuePosition = PieDataSet.ValuePosition.INSIDE_SLICE;
        this.mValueLineColor = -16777216;
        this.mValueLineWidth = 1.0f;
        this.mValueLinePart1OffsetPercentage = 75.0f;
        this.mValueLinePart1Length = 0.3f;
        this.mValueLinePart2Length = 0.4f;
        this.mValueLineVariableLength = true;
        build(this.results);
        calcMinMax(0, this.results.size());
    }

    public void setSliceSpace(float spaceDp) {
        if (spaceDp > 20.0f) {
            spaceDp = 20.0f;
        }
        if (spaceDp < 0.0f) {
            spaceDp = 0.0f;
        }
        this.mSliceSpace = Utils.convertDpToPixel(spaceDp);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public float getSliceSpace() {
        return this.mSliceSpace;
    }

    public void setSelectionShift(float shift) {
        this.mShift = Utils.convertDpToPixel(shift);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public float getSelectionShift() {
        return this.mShift;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public PieDataSet.ValuePosition getXValuePosition() {
        return this.mXValuePosition;
    }

    public void setXValuePosition(PieDataSet.ValuePosition xValuePosition) {
        this.mXValuePosition = xValuePosition;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public PieDataSet.ValuePosition getYValuePosition() {
        return this.mYValuePosition;
    }

    public void setYValuePosition(PieDataSet.ValuePosition yValuePosition) {
        this.mYValuePosition = yValuePosition;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public int getValueLineColor() {
        return this.mValueLineColor;
    }

    public void setValueLineColor(int valueLineColor) {
        this.mValueLineColor = valueLineColor;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public float getValueLineWidth() {
        return this.mValueLineWidth;
    }

    public void setValueLineWidth(float valueLineWidth) {
        this.mValueLineWidth = valueLineWidth;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public float getValueLinePart1OffsetPercentage() {
        return this.mValueLinePart1OffsetPercentage;
    }

    public void setValueLinePart1OffsetPercentage(float valueLinePart1OffsetPercentage) {
        this.mValueLinePart1OffsetPercentage = valueLinePart1OffsetPercentage;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public float getValueLinePart1Length() {
        return this.mValueLinePart1Length;
    }

    public void setValueLinePart1Length(float valueLinePart1Length) {
        this.mValueLinePart1Length = valueLinePart1Length;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public float getValueLinePart2Length() {
        return this.mValueLinePart2Length;
    }

    public void setValueLinePart2Length(float valueLinePart2Length) {
        this.mValueLinePart2Length = valueLinePart2Length;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public boolean isValueLineVariableLength() {
        return this.mValueLineVariableLength;
    }

    public void setValueLineVariableLength(boolean valueLineVariableLength) {
        this.mValueLineVariableLength = valueLineVariableLength;
    }
}
