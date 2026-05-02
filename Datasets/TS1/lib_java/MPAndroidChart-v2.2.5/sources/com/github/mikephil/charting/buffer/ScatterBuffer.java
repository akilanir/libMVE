package com.github.mikephil.charting.buffer;

import com.github.mikephil.charting.interfaces.datasets.IScatterDataSet;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/buffer/ScatterBuffer.class */
public class ScatterBuffer extends AbstractBuffer<IScatterDataSet> {
    public ScatterBuffer(int size) {
        super(size);
    }

    protected void addForm(float x, float y) {
        float[] fArr = this.buffer;
        int i = this.index;
        this.index = i + 1;
        fArr[i] = x;
        float[] fArr2 = this.buffer;
        int i2 = this.index;
        this.index = i2 + 1;
        fArr2[i2] = y;
    }

    /* JADX WARN: Type inference failed for: r0v10, types: [com.github.mikephil.charting.data.Entry] */
    @Override // com.github.mikephil.charting.buffer.AbstractBuffer
    public void feed(IScatterDataSet data) {
        float size = data.getEntryCount() * this.phaseX;
        for (int i = 0; i < size; i++) {
            addForm(r0.getXIndex(), data.getEntryForIndex(i).getVal() * this.phaseY);
        }
        reset();
    }
}
