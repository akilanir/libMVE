package com.google.zxing;

import com.google.zxing.common.BitArray;
import com.google.zxing.common.BitMatrix;

/* loaded from: core-3.2.0.jar:com/google/zxing/Binarizer.class */
public abstract class Binarizer {
    private final LuminanceSource source;

    public abstract BitArray getBlackRow(int i, BitArray bitArray) throws NotFoundException;

    public abstract BitMatrix getBlackMatrix() throws NotFoundException;

    public abstract Binarizer createBinarizer(LuminanceSource luminanceSource);

    protected Binarizer(LuminanceSource source) {
        this.source = source;
    }

    public final LuminanceSource getLuminanceSource() {
        return this.source;
    }

    public final int getWidth() {
        return this.source.getWidth();
    }

    public final int getHeight() {
        return this.source.getHeight();
    }
}
