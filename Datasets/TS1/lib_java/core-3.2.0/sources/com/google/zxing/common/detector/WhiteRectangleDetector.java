package com.google.zxing.common.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;

/* loaded from: core-3.2.0.jar:com/google/zxing/common/detector/WhiteRectangleDetector.class */
public final class WhiteRectangleDetector {
    private static final int INIT_SIZE = 10;
    private static final int CORR = 1;
    private final BitMatrix image;
    private final int height;
    private final int width;
    private final int leftInit;
    private final int rightInit;
    private final int downInit;
    private final int upInit;

    public WhiteRectangleDetector(BitMatrix image) throws NotFoundException {
        this(image, INIT_SIZE, image.getWidth() / 2, image.getHeight() / 2);
    }

    public WhiteRectangleDetector(BitMatrix image, int initSize, int x, int y) throws NotFoundException {
        this.image = image;
        this.height = image.getHeight();
        this.width = image.getWidth();
        int halfsize = initSize / 2;
        this.leftInit = x - halfsize;
        this.rightInit = x + halfsize;
        this.upInit = y - halfsize;
        this.downInit = y + halfsize;
        if (this.upInit < 0 || this.leftInit < 0 || this.downInit >= this.height || this.rightInit >= this.width) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    public ResultPoint[] detect() throws NotFoundException {
        int left = this.leftInit;
        int right = this.rightInit;
        int up = this.upInit;
        int down = this.downInit;
        boolean sizeExceeded = false;
        boolean aBlackPointFoundOnBorder = CORR;
        boolean atLeastOneBlackPointFoundOnBorder = false;
        boolean atLeastOneBlackPointFoundOnRight = false;
        boolean atLeastOneBlackPointFoundOnBottom = false;
        boolean atLeastOneBlackPointFoundOnLeft = false;
        boolean atLeastOneBlackPointFoundOnTop = false;
        while (true) {
            if (!aBlackPointFoundOnBorder) {
                break;
            }
            aBlackPointFoundOnBorder = false;
            boolean rightBorderNotWhite = CORR;
            while (true) {
                if ((!rightBorderNotWhite && atLeastOneBlackPointFoundOnRight) || right >= this.width) {
                    break;
                }
                rightBorderNotWhite = containsBlackPoint(up, down, right, false);
                if (rightBorderNotWhite) {
                    right += CORR;
                    aBlackPointFoundOnBorder = CORR;
                    atLeastOneBlackPointFoundOnRight = CORR;
                } else if (!atLeastOneBlackPointFoundOnRight) {
                    right += CORR;
                }
            }
            if (right >= this.width) {
                sizeExceeded = CORR;
                break;
            }
            boolean bottomBorderNotWhite = CORR;
            while (true) {
                if ((!bottomBorderNotWhite && atLeastOneBlackPointFoundOnBottom) || down >= this.height) {
                    break;
                }
                bottomBorderNotWhite = containsBlackPoint(left, right, down, true);
                if (bottomBorderNotWhite) {
                    down += CORR;
                    aBlackPointFoundOnBorder = CORR;
                    atLeastOneBlackPointFoundOnBottom = CORR;
                } else if (!atLeastOneBlackPointFoundOnBottom) {
                    down += CORR;
                }
            }
            if (down >= this.height) {
                sizeExceeded = CORR;
                break;
            }
            boolean leftBorderNotWhite = CORR;
            while (true) {
                if ((!leftBorderNotWhite && atLeastOneBlackPointFoundOnLeft) || left < 0) {
                    break;
                }
                leftBorderNotWhite = containsBlackPoint(up, down, left, false);
                if (leftBorderNotWhite) {
                    left--;
                    aBlackPointFoundOnBorder = CORR;
                    atLeastOneBlackPointFoundOnLeft = CORR;
                } else if (!atLeastOneBlackPointFoundOnLeft) {
                    left--;
                }
            }
            if (left < 0) {
                sizeExceeded = CORR;
                break;
            }
            boolean topBorderNotWhite = CORR;
            while (true) {
                if ((!topBorderNotWhite && atLeastOneBlackPointFoundOnTop) || up < 0) {
                    break;
                }
                topBorderNotWhite = containsBlackPoint(left, right, up, true);
                if (topBorderNotWhite) {
                    up--;
                    aBlackPointFoundOnBorder = CORR;
                    atLeastOneBlackPointFoundOnTop = CORR;
                } else if (!atLeastOneBlackPointFoundOnTop) {
                    up--;
                }
            }
            if (up < 0) {
                sizeExceeded = CORR;
                break;
            }
            if (aBlackPointFoundOnBorder) {
                atLeastOneBlackPointFoundOnBorder = CORR;
            }
        }
        if (!sizeExceeded && atLeastOneBlackPointFoundOnBorder) {
            int maxSize = right - left;
            ResultPoint z = null;
            for (int i = CORR; i < maxSize; i += CORR) {
                z = getBlackPointOnSegment(left, down - i, left + i, down);
                if (z != null) {
                    break;
                }
            }
            if (z == null) {
                throw NotFoundException.getNotFoundInstance();
            }
            ResultPoint t = null;
            for (int i2 = CORR; i2 < maxSize; i2 += CORR) {
                t = getBlackPointOnSegment(left, up + i2, left + i2, up);
                if (t != null) {
                    break;
                }
            }
            if (t == null) {
                throw NotFoundException.getNotFoundInstance();
            }
            ResultPoint x = null;
            for (int i3 = CORR; i3 < maxSize; i3 += CORR) {
                x = getBlackPointOnSegment(right, up + i3, right - i3, up);
                if (x != null) {
                    break;
                }
            }
            if (x == null) {
                throw NotFoundException.getNotFoundInstance();
            }
            ResultPoint y = null;
            for (int i4 = CORR; i4 < maxSize; i4 += CORR) {
                y = getBlackPointOnSegment(right, down - i4, right - i4, down);
                if (y != null) {
                    break;
                }
            }
            if (y == null) {
                throw NotFoundException.getNotFoundInstance();
            }
            return centerEdges(y, z, x, t);
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private ResultPoint getBlackPointOnSegment(float aX, float aY, float bX, float bY) {
        int dist = MathUtils.round(MathUtils.distance(aX, aY, bX, bY));
        float xStep = (bX - aX) / dist;
        float yStep = (bY - aY) / dist;
        for (int i = 0; i < dist; i += CORR) {
            int x = MathUtils.round(aX + (i * xStep));
            int y = MathUtils.round(aY + (i * yStep));
            if (this.image.get(x, y)) {
                return new ResultPoint(x, y);
            }
        }
        return null;
    }

    private ResultPoint[] centerEdges(ResultPoint y, ResultPoint z, ResultPoint x, ResultPoint t) {
        float yi = y.getX();
        float yj = y.getY();
        float zi = z.getX();
        float zj = z.getY();
        float xi = x.getX();
        float xj = x.getY();
        float ti = t.getX();
        float tj = t.getY();
        if (yi < this.width / 2.0f) {
            return new ResultPoint[]{new ResultPoint(ti - 1.0f, tj + 1.0f), new ResultPoint(zi + 1.0f, zj + 1.0f), new ResultPoint(xi - 1.0f, xj - 1.0f), new ResultPoint(yi + 1.0f, yj - 1.0f)};
        }
        return new ResultPoint[]{new ResultPoint(ti + 1.0f, tj + 1.0f), new ResultPoint(zi + 1.0f, zj - 1.0f), new ResultPoint(xi - 1.0f, xj + 1.0f), new ResultPoint(yi - 1.0f, yj - 1.0f)};
    }

    private boolean containsBlackPoint(int a, int b, int fixed, boolean horizontal) {
        if (horizontal) {
            for (int x = a; x <= b; x += CORR) {
                if (this.image.get(x, fixed)) {
                    return true;
                }
            }
            return false;
        }
        for (int y = a; y <= b; y += CORR) {
            if (this.image.get(fixed, y)) {
                return true;
            }
        }
        return false;
    }
}
