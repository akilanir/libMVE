package com.github.mikephil.charting.data;

import com.github.mikephil.charting.interfaces.datasets.IPieDataSet;
import com.github.mikephil.charting.utils.Utils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/PieDataSet.class */
public class PieDataSet extends DataSet<Entry> implements IPieDataSet {
    private float mSliceSpace;
    private float mShift;
    private ValuePosition mXValuePosition;
    private ValuePosition mYValuePosition;
    private int mValueLineColor;
    private float mValueLineWidth;
    private float mValueLinePart1OffsetPercentage;
    private float mValueLinePart1Length;
    private float mValueLinePart2Length;
    private boolean mValueLineVariableLength;

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/PieDataSet$ValuePosition.class */
    public enum ValuePosition {
        INSIDE_SLICE,
        OUTSIDE_SLICE
    }

    public PieDataSet(List<Entry> yVals, String label) {
        super(yVals, label);
        this.mSliceSpace = 0.0f;
        this.mShift = 18.0f;
        this.mXValuePosition = ValuePosition.INSIDE_SLICE;
        this.mYValuePosition = ValuePosition.INSIDE_SLICE;
        this.mValueLineColor = -16777216;
        this.mValueLineWidth = 1.0f;
        this.mValueLinePart1OffsetPercentage = 75.0f;
        this.mValueLinePart1Length = 0.3f;
        this.mValueLinePart2Length = 0.4f;
        this.mValueLineVariableLength = true;
    }

    @Override // com.github.mikephil.charting.data.DataSet
    public DataSet<Entry> copy() {
        List<Entry> yVals = new ArrayList<>();
        for (int i = 0; i < this.mYVals.size(); i++) {
            yVals.add(((Entry) this.mYVals.get(i)).copy());
        }
        PieDataSet copied = new PieDataSet(yVals, getLabel());
        copied.mColors = this.mColors;
        copied.mSliceSpace = this.mSliceSpace;
        copied.mShift = this.mShift;
        return copied;
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
    public ValuePosition getXValuePosition() {
        return this.mXValuePosition;
    }

    public void setXValuePosition(ValuePosition xValuePosition) {
        this.mXValuePosition = xValuePosition;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.IPieDataSet
    public ValuePosition getYValuePosition() {
        return this.mYValuePosition;
    }

    public void setYValuePosition(ValuePosition yValuePosition) {
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
