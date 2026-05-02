package com.google.zxing.pdf417.detector;

import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import java.util.List;

/* loaded from: core-3.2.0.jar:com/google/zxing/pdf417/detector/PDF417DetectorResult.class */
public final class PDF417DetectorResult {
    private final BitMatrix bits;
    private final List<ResultPoint[]> points;

    public PDF417DetectorResult(BitMatrix bits, List<ResultPoint[]> points) {
        this.bits = bits;
        this.points = points;
    }

    public BitMatrix getBits() {
        return this.bits;
    }

    public List<ResultPoint[]> getPoints() {
        return this.points;
    }
}
