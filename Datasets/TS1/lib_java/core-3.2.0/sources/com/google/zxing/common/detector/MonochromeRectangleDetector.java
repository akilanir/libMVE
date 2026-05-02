package com.google.zxing.common.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;

/* loaded from: core-3.2.0.jar:com/google/zxing/common/detector/MonochromeRectangleDetector.class */
public final class MonochromeRectangleDetector {
    private static final int MAX_MODULES = 32;
    private final BitMatrix image;

    public MonochromeRectangleDetector(BitMatrix image) {
        this.image = image;
    }

    public ResultPoint[] detect() throws NotFoundException {
        int height = this.image.getHeight();
        int width = this.image.getWidth();
        int halfHeight = height / 2;
        int halfWidth = width / 2;
        int deltaY = Math.max(1, height / 256);
        int deltaX = Math.max(1, width / 256);
        ResultPoint pointA = findCornerFromCenter(halfWidth, 0, 0, width, halfHeight, -deltaY, 0, height, halfWidth / 2);
        int top = ((int) pointA.getY()) - 1;
        ResultPoint pointB = findCornerFromCenter(halfWidth, -deltaX, 0, width, halfHeight, 0, top, height, halfHeight / 2);
        int left = ((int) pointB.getX()) - 1;
        ResultPoint pointC = findCornerFromCenter(halfWidth, deltaX, left, width, halfHeight, 0, top, height, halfHeight / 2);
        int right = ((int) pointC.getX()) + 1;
        ResultPoint pointD = findCornerFromCenter(halfWidth, 0, left, right, halfHeight, deltaY, top, height, halfWidth / 2);
        int bottom = ((int) pointD.getY()) + 1;
        ResultPoint pointA2 = findCornerFromCenter(halfWidth, 0, left, right, halfHeight, -deltaY, top, bottom, halfWidth / 4);
        return new ResultPoint[]{pointA2, pointB, pointC, pointD};
    }

    /* JADX WARN: Code restructure failed: missing block: B:53:0x011a, code lost:
    
        throw com.google.zxing.NotFoundException.getNotFoundInstance();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private com.google.zxing.ResultPoint findCornerFromCenter(int r8, int r9, int r10, int r11, int r12, int r13, int r14, int r15, int r16) throws com.google.zxing.NotFoundException {
        /*
            Method dump skipped, instructions count: 283
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.common.detector.MonochromeRectangleDetector.findCornerFromCenter(int, int, int, int, int, int, int, int, int):com.google.zxing.ResultPoint");
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0069 A[EDGE_INSN: B:73:0x0069->B:23:0x0069 BREAK  A[LOOP:1: B:14:0x003e->B:76:0x003e], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x00ec A[EDGE_INSN: B:89:0x00ec->B:50:0x00ec BREAK  A[LOOP:3: B:41:0x00c0->B:94:0x00c0], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int[] blackWhiteRange(int r6, int r7, int r8, int r9, boolean r10) {
        /*
            Method dump skipped, instructions count: 294
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.common.detector.MonochromeRectangleDetector.blackWhiteRange(int, int, int, int, boolean):int[]");
    }
}
