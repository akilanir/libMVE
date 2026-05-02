package org.spongycastle.math.raw;

import java.math.BigInteger;
import org.spongycastle.asn1.cmp.PKIFailureInfo;
import org.spongycastle.util.Pack;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/math/raw/Nat160.class */
public abstract class Nat160 {
    private static final long M = 4294967295L;

    public static int add(int[] x, int[] y, int[] z) {
        long c = 0 + (x[0] & M) + (y[0] & M);
        z[0] = (int) c;
        long c2 = (c >>> 32) + (x[1] & M) + (y[1] & M);
        z[1] = (int) c2;
        long c3 = (c2 >>> 32) + (x[2] & M) + (y[2] & M);
        z[2] = (int) c3;
        long c4 = (c3 >>> 32) + (x[3] & M) + (y[3] & M);
        z[3] = (int) c4;
        long c5 = (c4 >>> 32) + (x[4] & M) + (y[4] & M);
        z[4] = (int) c5;
        return (int) (c5 >>> 32);
    }

    public static int addBothTo(int[] x, int[] y, int[] z) {
        long c = 0 + (x[0] & M) + (y[0] & M) + (z[0] & M);
        z[0] = (int) c;
        long c2 = (c >>> 32) + (x[1] & M) + (y[1] & M) + (z[1] & M);
        z[1] = (int) c2;
        long c3 = (c2 >>> 32) + (x[2] & M) + (y[2] & M) + (z[2] & M);
        z[2] = (int) c3;
        long c4 = (c3 >>> 32) + (x[3] & M) + (y[3] & M) + (z[3] & M);
        z[3] = (int) c4;
        long c5 = (c4 >>> 32) + (x[4] & M) + (y[4] & M) + (z[4] & M);
        z[4] = (int) c5;
        return (int) (c5 >>> 32);
    }

    public static int addTo(int[] x, int[] z) {
        long c = 0 + (x[0] & M) + (z[0] & M);
        z[0] = (int) c;
        long c2 = (c >>> 32) + (x[1] & M) + (z[1] & M);
        z[1] = (int) c2;
        long c3 = (c2 >>> 32) + (x[2] & M) + (z[2] & M);
        z[2] = (int) c3;
        long c4 = (c3 >>> 32) + (x[3] & M) + (z[3] & M);
        z[3] = (int) c4;
        long c5 = (c4 >>> 32) + (x[4] & M) + (z[4] & M);
        z[4] = (int) c5;
        return (int) (c5 >>> 32);
    }

    public static int addTo(int[] x, int xOff, int[] z, int zOff, int cIn) {
        long c = (cIn & M) + (x[xOff + 0] & M) + (z[zOff + 0] & M);
        z[zOff + 0] = (int) c;
        long c2 = (c >>> 32) + (x[xOff + 1] & M) + (z[zOff + 1] & M);
        z[zOff + 1] = (int) c2;
        long c3 = (c2 >>> 32) + (x[xOff + 2] & M) + (z[zOff + 2] & M);
        z[zOff + 2] = (int) c3;
        long c4 = (c3 >>> 32) + (x[xOff + 3] & M) + (z[zOff + 3] & M);
        z[zOff + 3] = (int) c4;
        long c5 = (c4 >>> 32) + (x[xOff + 4] & M) + (z[zOff + 4] & M);
        z[zOff + 4] = (int) c5;
        return (int) (c5 >>> 32);
    }

    public static int addToEachOther(int[] u, int uOff, int[] v, int vOff) {
        long c = 0 + (u[uOff + 0] & M) + (v[vOff + 0] & M);
        u[uOff + 0] = (int) c;
        v[vOff + 0] = (int) c;
        long c2 = (c >>> 32) + (u[uOff + 1] & M) + (v[vOff + 1] & M);
        u[uOff + 1] = (int) c2;
        v[vOff + 1] = (int) c2;
        long c3 = (c2 >>> 32) + (u[uOff + 2] & M) + (v[vOff + 2] & M);
        u[uOff + 2] = (int) c3;
        v[vOff + 2] = (int) c3;
        long c4 = (c3 >>> 32) + (u[uOff + 3] & M) + (v[vOff + 3] & M);
        u[uOff + 3] = (int) c4;
        v[vOff + 3] = (int) c4;
        long c5 = (c4 >>> 32) + (u[uOff + 4] & M) + (v[vOff + 4] & M);
        u[uOff + 4] = (int) c5;
        v[vOff + 4] = (int) c5;
        return (int) (c5 >>> 32);
    }

    public static void copy(int[] x, int[] z) {
        z[0] = x[0];
        z[1] = x[1];
        z[2] = x[2];
        z[3] = x[3];
        z[4] = x[4];
    }

    public static int[] create() {
        return new int[5];
    }

    public static int[] createExt() {
        return new int[10];
    }

    public static boolean diff(int[] x, int xOff, int[] y, int yOff, int[] z, int zOff) {
        boolean pos = gte(x, xOff, y, yOff);
        if (pos) {
            sub(x, xOff, y, yOff, z, zOff);
        } else {
            sub(y, yOff, x, xOff, z, zOff);
        }
        return pos;
    }

    public static boolean eq(int[] x, int[] y) {
        for (int i = 4; i >= 0; i--) {
            if (x[i] != y[i]) {
                return false;
            }
        }
        return true;
    }

    public static int[] fromBigInteger(BigInteger x) {
        if (x.signum() < 0 || x.bitLength() > 160) {
            throw new IllegalArgumentException();
        }
        int[] z = create();
        int i = 0;
        while (x.signum() != 0) {
            int i2 = i;
            i++;
            z[i2] = x.intValue();
            x = x.shiftRight(32);
        }
        return z;
    }

    public static int getBit(int[] x, int bit) {
        if (bit == 0) {
            return x[0] & 1;
        }
        int w = bit >> 5;
        if (w < 0 || w >= 5) {
            return 0;
        }
        int b = bit & 31;
        return (x[w] >>> b) & 1;
    }

    public static boolean gte(int[] x, int[] y) {
        for (int i = 4; i >= 0; i--) {
            int x_i = x[i] ^ PKIFailureInfo.systemUnavail;
            int y_i = y[i] ^ PKIFailureInfo.systemUnavail;
            if (x_i < y_i) {
                return false;
            }
            if (x_i > y_i) {
                return true;
            }
        }
        return true;
    }

    public static boolean gte(int[] x, int xOff, int[] y, int yOff) {
        for (int i = 4; i >= 0; i--) {
            int x_i = x[xOff + i] ^ PKIFailureInfo.systemUnavail;
            int y_i = y[yOff + i] ^ PKIFailureInfo.systemUnavail;
            if (x_i < y_i) {
                return false;
            }
            if (x_i > y_i) {
                return true;
            }
        }
        return true;
    }

    public static boolean isOne(int[] x) {
        if (x[0] != 1) {
            return false;
        }
        for (int i = 1; i < 5; i++) {
            if (x[i] != 0) {
                return false;
            }
        }
        return true;
    }

    public static boolean isZero(int[] x) {
        for (int i = 0; i < 5; i++) {
            if (x[i] != 0) {
                return false;
            }
        }
        return true;
    }

    public static void mul(int[] x, int[] y, int[] zz) {
        long y_0 = y[0] & M;
        long y_1 = y[1] & M;
        long y_2 = y[2] & M;
        long y_3 = y[3] & M;
        long y_4 = y[4] & M;
        long x_0 = x[0] & M;
        long c = 0 + (x_0 * y_0);
        zz[0] = (int) c;
        long c2 = (c >>> 32) + (x_0 * y_1);
        zz[1] = (int) c2;
        long c3 = (c2 >>> 32) + (x_0 * y_2);
        zz[2] = (int) c3;
        long c4 = (c3 >>> 32) + (x_0 * y_3);
        zz[3] = (int) c4;
        long c5 = (c4 >>> 32) + (x_0 * y_4);
        zz[4] = (int) c5;
        zz[5] = (int) (c5 >>> 32);
        for (int i = 1; i < 5; i++) {
            long x_i = x[i] & M;
            long c6 = 0 + (x_i * y_0) + (zz[i + 0] & M);
            zz[i + 0] = (int) c6;
            long c7 = (c6 >>> 32) + (x_i * y_1) + (zz[i + 1] & M);
            zz[i + 1] = (int) c7;
            long c8 = (c7 >>> 32) + (x_i * y_2) + (zz[i + 2] & M);
            zz[i + 2] = (int) c8;
            long c9 = (c8 >>> 32) + (x_i * y_3) + (zz[i + 3] & M);
            zz[i + 3] = (int) c9;
            long c10 = (c9 >>> 32) + (x_i * y_4) + (zz[i + 4] & M);
            zz[i + 4] = (int) c10;
            zz[i + 5] = (int) (c10 >>> 32);
        }
    }

    public static void mul(int[] x, int xOff, int[] y, int yOff, int[] zz, int zzOff) {
        long y_0 = y[yOff + 0] & M;
        long y_1 = y[yOff + 1] & M;
        long y_2 = y[yOff + 2] & M;
        long y_3 = y[yOff + 3] & M;
        long y_4 = y[yOff + 4] & M;
        long x_0 = x[xOff + 0] & M;
        long c = 0 + (x_0 * y_0);
        zz[zzOff + 0] = (int) c;
        long c2 = (c >>> 32) + (x_0 * y_1);
        zz[zzOff + 1] = (int) c2;
        long c3 = (c2 >>> 32) + (x_0 * y_2);
        zz[zzOff + 2] = (int) c3;
        long c4 = (c3 >>> 32) + (x_0 * y_3);
        zz[zzOff + 3] = (int) c4;
        long c5 = (c4 >>> 32) + (x_0 * y_4);
        zz[zzOff + 4] = (int) c5;
        zz[zzOff + 5] = (int) (c5 >>> 32);
        for (int i = 1; i < 5; i++) {
            zzOff++;
            long x_i = x[xOff + i] & M;
            long c6 = 0 + (x_i * y_0) + (zz[zzOff + 0] & M);
            zz[zzOff + 0] = (int) c6;
            long c7 = (c6 >>> 32) + (x_i * y_1) + (zz[zzOff + 1] & M);
            zz[zzOff + 1] = (int) c7;
            long c8 = (c7 >>> 32) + (x_i * y_2) + (zz[zzOff + 2] & M);
            zz[zzOff + 2] = (int) c8;
            long c9 = (c8 >>> 32) + (x_i * y_3) + (zz[zzOff + 3] & M);
            zz[zzOff + 3] = (int) c9;
            long c10 = (c9 >>> 32) + (x_i * y_4) + (zz[zzOff + 4] & M);
            zz[zzOff + 4] = (int) c10;
            zz[zzOff + 5] = (int) (c10 >>> 32);
        }
    }

    public static int mulAddTo(int[] x, int[] y, int[] zz) {
        long y_0 = y[0] & M;
        long y_1 = y[1] & M;
        long y_2 = y[2] & M;
        long y_3 = y[3] & M;
        long y_4 = y[4] & M;
        long zc = 0;
        for (int i = 0; i < 5; i++) {
            long x_i = x[i] & M;
            long c = 0 + (x_i * y_0) + (zz[i + 0] & M);
            zz[i + 0] = (int) c;
            long c2 = (c >>> 32) + (x_i * y_1) + (zz[i + 1] & M);
            zz[i + 1] = (int) c2;
            long c3 = (c2 >>> 32) + (x_i * y_2) + (zz[i + 2] & M);
            zz[i + 2] = (int) c3;
            long c4 = (c3 >>> 32) + (x_i * y_3) + (zz[i + 3] & M);
            zz[i + 3] = (int) c4;
            long c5 = (c4 >>> 32) + (x_i * y_4) + (zz[i + 4] & M);
            zz[i + 4] = (int) c5;
            long c6 = (c5 >>> 32) + zc + (zz[i + 5] & M);
            zz[i + 5] = (int) c6;
            zc = c6 >>> 32;
        }
        return (int) zc;
    }

    public static int mulAddTo(int[] x, int xOff, int[] y, int yOff, int[] zz, int zzOff) {
        long y_0 = y[yOff + 0] & M;
        long y_1 = y[yOff + 1] & M;
        long y_2 = y[yOff + 2] & M;
        long y_3 = y[yOff + 3] & M;
        long y_4 = y[yOff + 4] & M;
        long zc = 0;
        for (int i = 0; i < 5; i++) {
            long x_i = x[xOff + i] & M;
            long c = 0 + (x_i * y_0) + (zz[zzOff + 0] & M);
            zz[zzOff + 0] = (int) c;
            long c2 = (c >>> 32) + (x_i * y_1) + (zz[zzOff + 1] & M);
            zz[zzOff + 1] = (int) c2;
            long c3 = (c2 >>> 32) + (x_i * y_2) + (zz[zzOff + 2] & M);
            zz[zzOff + 2] = (int) c3;
            long c4 = (c3 >>> 32) + (x_i * y_3) + (zz[zzOff + 3] & M);
            zz[zzOff + 3] = (int) c4;
            long c5 = (c4 >>> 32) + (x_i * y_4) + (zz[zzOff + 4] & M);
            zz[zzOff + 4] = (int) c5;
            long c6 = (c5 >>> 32) + zc + (zz[zzOff + 5] & M);
            zz[zzOff + 5] = (int) c6;
            zc = c6 >>> 32;
            zzOff++;
        }
        return (int) zc;
    }

    public static long mul33Add(int w, int[] x, int xOff, int[] y, int yOff, int[] z, int zOff) {
        long wVal = w & M;
        long x0 = x[xOff + 0] & M;
        long c = 0 + (wVal * x0) + (y[yOff + 0] & M);
        z[zOff + 0] = (int) c;
        long c2 = c >>> 32;
        long x1 = x[xOff + 1] & M;
        long c3 = c2 + (wVal * x1) + x0 + (y[yOff + 1] & M);
        z[zOff + 1] = (int) c3;
        long c4 = c3 >>> 32;
        long x2 = x[xOff + 2] & M;
        long c5 = c4 + (wVal * x2) + x1 + (y[yOff + 2] & M);
        z[zOff + 2] = (int) c5;
        long c6 = c5 >>> 32;
        long x3 = x[xOff + 3] & M;
        long c7 = c6 + (wVal * x3) + x2 + (y[yOff + 3] & M);
        z[zOff + 3] = (int) c7;
        long c8 = c7 >>> 32;
        long x4 = x[xOff + 4] & M;
        long c9 = c8 + (wVal * x4) + x3 + (y[yOff + 4] & M);
        z[zOff + 4] = (int) c9;
        return (c9 >>> 32) + x4;
    }

    public static int mulWordAddExt(int x, int[] yy, int yyOff, int[] zz, int zzOff) {
        long xVal = x & M;
        long c = 0 + (xVal * (yy[yyOff + 0] & M)) + (zz[zzOff + 0] & M);
        zz[zzOff + 0] = (int) c;
        long c2 = (c >>> 32) + (xVal * (yy[yyOff + 1] & M)) + (zz[zzOff + 1] & M);
        zz[zzOff + 1] = (int) c2;
        long c3 = (c2 >>> 32) + (xVal * (yy[yyOff + 2] & M)) + (zz[zzOff + 2] & M);
        zz[zzOff + 2] = (int) c3;
        long c4 = (c3 >>> 32) + (xVal * (yy[yyOff + 3] & M)) + (zz[zzOff + 3] & M);
        zz[zzOff + 3] = (int) c4;
        long c5 = (c4 >>> 32) + (xVal * (yy[yyOff + 4] & M)) + (zz[zzOff + 4] & M);
        zz[zzOff + 4] = (int) c5;
        return (int) (c5 >>> 32);
    }

    public static int mul33DWordAdd(int x, long y, int[] z, int zOff) {
        long xVal = x & M;
        long y00 = y & M;
        long c = 0 + (xVal * y00) + (z[zOff + 0] & M);
        z[zOff + 0] = (int) c;
        long c2 = c >>> 32;
        long y01 = y >>> 32;
        long c3 = c2 + (xVal * y01) + y00 + (z[zOff + 1] & M);
        z[zOff + 1] = (int) c3;
        long c4 = (c3 >>> 32) + y01 + (z[zOff + 2] & M);
        z[zOff + 2] = (int) c4;
        long c5 = (c4 >>> 32) + (z[zOff + 3] & M);
        z[zOff + 3] = (int) c5;
        if ((c5 >>> 32) == 0) {
            return 0;
        }
        return Nat.incAt(5, z, zOff, 4);
    }

    public static int mul33WordAdd(int x, int y, int[] z, int zOff) {
        long xVal = x & M;
        long yVal = y & M;
        long c = 0 + (yVal * xVal) + (z[zOff + 0] & M);
        z[zOff + 0] = (int) c;
        long c2 = (c >>> 32) + yVal + (z[zOff + 1] & M);
        z[zOff + 1] = (int) c2;
        long c3 = (c2 >>> 32) + (z[zOff + 2] & M);
        z[zOff + 2] = (int) c3;
        if ((c3 >>> 32) == 0) {
            return 0;
        }
        return Nat.incAt(5, z, zOff, 3);
    }

    public static int mulWordDwordAdd(int x, long y, int[] z, int zOff) {
        long xVal = x & M;
        long c = 0 + (xVal * (y & M)) + (z[zOff + 0] & M);
        z[zOff + 0] = (int) c;
        long c2 = (c >>> 32) + (xVal * (y >>> 32)) + (z[zOff + 1] & M);
        z[zOff + 1] = (int) c2;
        long c3 = (c2 >>> 32) + (z[zOff + 2] & M);
        z[zOff + 2] = (int) c3;
        if ((c3 >>> 32) == 0) {
            return 0;
        }
        return Nat.incAt(5, z, zOff, 3);
    }

    public static int mulWordsAdd(int x, int y, int[] z, int zOff) {
        long xVal = x & M;
        long yVal = y & M;
        long c = 0 + (yVal * xVal) + (z[zOff + 0] & M);
        z[zOff + 0] = (int) c;
        long c2 = (c >>> 32) + (z[zOff + 1] & M);
        z[zOff + 1] = (int) c2;
        if ((c2 >>> 32) == 0) {
            return 0;
        }
        return Nat.incAt(5, z, zOff, 2);
    }

    public static int mulWord(int x, int[] y, int[] z, int zOff) {
        long c = 0;
        long xVal = x & M;
        int i = 0;
        do {
            long c2 = c + (xVal * (y[i] & M));
            z[zOff + i] = (int) c2;
            c = c2 >>> 32;
            i++;
        } while (i < 5);
        return (int) c;
    }

    public static void square(int[] x, int[] zz) {
        long x_0 = x[0] & M;
        int c = 0;
        int i = 4;
        int j = 10;
        do {
            int i2 = i;
            i--;
            long xVal = x[i2] & M;
            long p = xVal * xVal;
            int j2 = j - 1;
            zz[j2] = (c << 31) | ((int) (p >>> 33));
            j = j2 - 1;
            zz[j] = (int) (p >>> 1);
            c = (int) p;
        } while (i > 0);
        long p2 = x_0 * x_0;
        long zz_1 = ((c << 31) & M) | (p2 >>> 33);
        zz[0] = (int) p2;
        int c2 = ((int) (p2 >>> 32)) & 1;
        long x_1 = x[1] & M;
        long zz_2 = zz[2] & M;
        long zz_12 = zz_1 + (x_1 * x_0);
        int w = (int) zz_12;
        zz[1] = (w << 1) | c2;
        int c3 = w >>> 31;
        long zz_22 = zz_2 + (zz_12 >>> 32);
        long x_2 = x[2] & M;
        long zz_3 = zz[3] & M;
        long zz_4 = zz[4] & M;
        long zz_23 = zz_22 + (x_2 * x_0);
        int w2 = (int) zz_23;
        zz[2] = (w2 << 1) | c3;
        int c4 = w2 >>> 31;
        long zz_32 = zz_3 + (zz_23 >>> 32) + (x_2 * x_1);
        long zz_42 = zz_4 + (zz_32 >>> 32);
        long zz_33 = zz_32 & M;
        long x_3 = x[3] & M;
        long zz_5 = zz[5] & M;
        long zz_6 = zz[6] & M;
        long zz_34 = zz_33 + (x_3 * x_0);
        int w3 = (int) zz_34;
        zz[3] = (w3 << 1) | c4;
        int c5 = w3 >>> 31;
        long zz_43 = zz_42 + (zz_34 >>> 32) + (x_3 * x_1);
        long zz_52 = zz_5 + (zz_43 >>> 32) + (x_3 * x_2);
        long zz_44 = zz_43 & M;
        long zz_62 = zz_6 + (zz_52 >>> 32);
        long zz_53 = zz_52 & M;
        long x_4 = x[4] & M;
        long zz_7 = zz[7] & M;
        long zz_8 = zz[8] & M;
        long zz_45 = zz_44 + (x_4 * x_0);
        int w4 = (int) zz_45;
        zz[4] = (w4 << 1) | c5;
        int c6 = w4 >>> 31;
        long zz_54 = zz_53 + (zz_45 >>> 32) + (x_4 * x_1);
        long zz_63 = zz_62 + (zz_54 >>> 32) + (x_4 * x_2);
        long zz_72 = zz_7 + (zz_63 >>> 32) + (x_4 * x_3);
        long zz_82 = zz_8 + (zz_72 >>> 32);
        int w5 = (int) zz_54;
        zz[5] = (w5 << 1) | c6;
        int c7 = w5 >>> 31;
        int w6 = (int) zz_63;
        zz[6] = (w6 << 1) | c7;
        int c8 = w6 >>> 31;
        int w7 = (int) zz_72;
        zz[7] = (w7 << 1) | c8;
        int c9 = w7 >>> 31;
        int w8 = (int) zz_82;
        zz[8] = (w8 << 1) | c9;
        int c10 = w8 >>> 31;
        zz[9] = ((zz[9] + ((int) (zz_82 >> 32))) << 1) | c10;
    }

    public static void square(int[] x, int xOff, int[] zz, int zzOff) {
        long x_0 = x[xOff + 0] & M;
        int c = 0;
        int i = 4;
        int j = 10;
        do {
            int i2 = i;
            i--;
            long xVal = x[xOff + i2] & M;
            long p = xVal * xVal;
            int j2 = j - 1;
            zz[zzOff + j2] = (c << 31) | ((int) (p >>> 33));
            j = j2 - 1;
            zz[zzOff + j] = (int) (p >>> 1);
            c = (int) p;
        } while (i > 0);
        long p2 = x_0 * x_0;
        long zz_1 = ((c << 31) & M) | (p2 >>> 33);
        zz[zzOff + 0] = (int) p2;
        int c2 = ((int) (p2 >>> 32)) & 1;
        long x_1 = x[xOff + 1] & M;
        long zz_2 = zz[zzOff + 2] & M;
        long zz_12 = zz_1 + (x_1 * x_0);
        int w = (int) zz_12;
        zz[zzOff + 1] = (w << 1) | c2;
        int c3 = w >>> 31;
        long zz_22 = zz_2 + (zz_12 >>> 32);
        long x_2 = x[xOff + 2] & M;
        long zz_3 = zz[zzOff + 3] & M;
        long zz_4 = zz[zzOff + 4] & M;
        long zz_23 = zz_22 + (x_2 * x_0);
        int w2 = (int) zz_23;
        zz[zzOff + 2] = (w2 << 1) | c3;
        int c4 = w2 >>> 31;
        long zz_32 = zz_3 + (zz_23 >>> 32) + (x_2 * x_1);
        long zz_42 = zz_4 + (zz_32 >>> 32);
        long zz_33 = zz_32 & M;
        long x_3 = x[xOff + 3] & M;
        long zz_5 = zz[zzOff + 5] & M;
        long zz_6 = zz[zzOff + 6] & M;
        long zz_34 = zz_33 + (x_3 * x_0);
        int w3 = (int) zz_34;
        zz[zzOff + 3] = (w3 << 1) | c4;
        int c5 = w3 >>> 31;
        long zz_43 = zz_42 + (zz_34 >>> 32) + (x_3 * x_1);
        long zz_52 = zz_5 + (zz_43 >>> 32) + (x_3 * x_2);
        long zz_44 = zz_43 & M;
        long zz_62 = zz_6 + (zz_52 >>> 32);
        long zz_53 = zz_52 & M;
        long x_4 = x[xOff + 4] & M;
        long zz_7 = zz[zzOff + 7] & M;
        long zz_8 = zz[zzOff + 8] & M;
        long zz_45 = zz_44 + (x_4 * x_0);
        int w4 = (int) zz_45;
        zz[zzOff + 4] = (w4 << 1) | c5;
        int c6 = w4 >>> 31;
        long zz_54 = zz_53 + (zz_45 >>> 32) + (x_4 * x_1);
        long zz_63 = zz_62 + (zz_54 >>> 32) + (x_4 * x_2);
        long zz_72 = zz_7 + (zz_63 >>> 32) + (x_4 * x_3);
        long zz_82 = zz_8 + (zz_72 >>> 32);
        int w5 = (int) zz_54;
        zz[zzOff + 5] = (w5 << 1) | c6;
        int c7 = w5 >>> 31;
        int w6 = (int) zz_63;
        zz[zzOff + 6] = (w6 << 1) | c7;
        int c8 = w6 >>> 31;
        int w7 = (int) zz_72;
        zz[zzOff + 7] = (w7 << 1) | c8;
        int c9 = w7 >>> 31;
        int w8 = (int) zz_82;
        zz[zzOff + 8] = (w8 << 1) | c9;
        int c10 = w8 >>> 31;
        zz[zzOff + 9] = ((zz[zzOff + 9] + ((int) (zz_82 >> 32))) << 1) | c10;
    }

    public static int sub(int[] x, int[] y, int[] z) {
        long c = 0 + ((x[0] & M) - (y[0] & M));
        z[0] = (int) c;
        long c2 = (c >> 32) + ((x[1] & M) - (y[1] & M));
        z[1] = (int) c2;
        long c3 = (c2 >> 32) + ((x[2] & M) - (y[2] & M));
        z[2] = (int) c3;
        long c4 = (c3 >> 32) + ((x[3] & M) - (y[3] & M));
        z[3] = (int) c4;
        long c5 = (c4 >> 32) + ((x[4] & M) - (y[4] & M));
        z[4] = (int) c5;
        return (int) (c5 >> 32);
    }

    public static int sub(int[] x, int xOff, int[] y, int yOff, int[] z, int zOff) {
        long c = 0 + ((x[xOff + 0] & M) - (y[yOff + 0] & M));
        z[zOff + 0] = (int) c;
        long c2 = (c >> 32) + ((x[xOff + 1] & M) - (y[yOff + 1] & M));
        z[zOff + 1] = (int) c2;
        long c3 = (c2 >> 32) + ((x[xOff + 2] & M) - (y[yOff + 2] & M));
        z[zOff + 2] = (int) c3;
        long c4 = (c3 >> 32) + ((x[xOff + 3] & M) - (y[yOff + 3] & M));
        z[zOff + 3] = (int) c4;
        long c5 = (c4 >> 32) + ((x[xOff + 4] & M) - (y[yOff + 4] & M));
        z[zOff + 4] = (int) c5;
        return (int) (c5 >> 32);
    }

    public static int subBothFrom(int[] x, int[] y, int[] z) {
        long c = 0 + (((z[0] & M) - (x[0] & M)) - (y[0] & M));
        z[0] = (int) c;
        long c2 = (c >> 32) + (((z[1] & M) - (x[1] & M)) - (y[1] & M));
        z[1] = (int) c2;
        long c3 = (c2 >> 32) + (((z[2] & M) - (x[2] & M)) - (y[2] & M));
        z[2] = (int) c3;
        long c4 = (c3 >> 32) + (((z[3] & M) - (x[3] & M)) - (y[3] & M));
        z[3] = (int) c4;
        long c5 = (c4 >> 32) + (((z[4] & M) - (x[4] & M)) - (y[4] & M));
        z[4] = (int) c5;
        return (int) (c5 >> 32);
    }

    public static int subFrom(int[] x, int[] z) {
        long c = 0 + ((z[0] & M) - (x[0] & M));
        z[0] = (int) c;
        long c2 = (c >> 32) + ((z[1] & M) - (x[1] & M));
        z[1] = (int) c2;
        long c3 = (c2 >> 32) + ((z[2] & M) - (x[2] & M));
        z[2] = (int) c3;
        long c4 = (c3 >> 32) + ((z[3] & M) - (x[3] & M));
        z[3] = (int) c4;
        long c5 = (c4 >> 32) + ((z[4] & M) - (x[4] & M));
        z[4] = (int) c5;
        return (int) (c5 >> 32);
    }

    public static int subFrom(int[] x, int xOff, int[] z, int zOff) {
        long c = 0 + ((z[zOff + 0] & M) - (x[xOff + 0] & M));
        z[zOff + 0] = (int) c;
        long c2 = (c >> 32) + ((z[zOff + 1] & M) - (x[xOff + 1] & M));
        z[zOff + 1] = (int) c2;
        long c3 = (c2 >> 32) + ((z[zOff + 2] & M) - (x[xOff + 2] & M));
        z[zOff + 2] = (int) c3;
        long c4 = (c3 >> 32) + ((z[zOff + 3] & M) - (x[xOff + 3] & M));
        z[zOff + 3] = (int) c4;
        long c5 = (c4 >> 32) + ((z[zOff + 4] & M) - (x[xOff + 4] & M));
        z[zOff + 4] = (int) c5;
        return (int) (c5 >> 32);
    }

    public static BigInteger toBigInteger(int[] x) {
        byte[] bs = new byte[20];
        for (int i = 0; i < 5; i++) {
            int x_i = x[i];
            if (x_i != 0) {
                Pack.intToBigEndian(x_i, bs, (4 - i) << 2);
            }
        }
        return new BigInteger(1, bs);
    }

    public static void zero(int[] z) {
        z[0] = 0;
        z[1] = 0;
        z[2] = 0;
        z[3] = 0;
        z[4] = 0;
    }
}
