package com.google.zxing.common;

import com.google.zxing.ResultPoint;

/* loaded from: core-3.2.1.jar:com/google/zxing/common/DetectorResult.class */
public class DetectorResult {
    private final BitMatrix bits;
    private final ResultPoint[] points;

    public DetectorResult(BitMatrix bits, ResultPoint[] points) {
        this.bits = bits;
        this.points = points;
    }

    public final BitMatrix getBits() {
        return this.bits;
    }

    public final ResultPoint[] getPoints() {
        return this.points;
    }
}
