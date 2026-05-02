package org.spongycastle.math.ec.custom.sec;

import java.math.BigInteger;
import org.spongycastle.math.raw.Nat;
import org.spongycastle.math.raw.Nat128;
import org.spongycastle.math.raw.Nat256;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/math/ec/custom/sec/SecP128R1Field.class */
public class SecP128R1Field {
    private static final long M = 4294967295L;
    private static final int P3 = -3;
    static final int[] P = {-1, -1, -1, P3};
    private static final int PExt7 = -4;
    static final int[] PExt = {1, 0, 0, 4, -2, -1, 3, PExt7};
    private static final int[] PExtInv = {-1, -1, -1, -5, 1, 0, PExt7, 3};

    public static void add(int[] x, int[] y, int[] z) {
        int c = Nat128.add(x, y, z);
        if (c != 0 || (z[3] == P3 && Nat128.gte(z, P))) {
            addPInvTo(z);
        }
    }

    public static void addExt(int[] xx, int[] yy, int[] zz) {
        int c = Nat256.add(xx, yy, zz);
        if (c != 0 || (zz[7] == PExt7 && Nat256.gte(zz, PExt))) {
            Nat.addTo(PExtInv.length, PExtInv, zz);
        }
    }

    public static void addOne(int[] x, int[] z) {
        int c = Nat.inc(4, x, z);
        if (c != 0 || (z[3] == P3 && Nat128.gte(z, P))) {
            addPInvTo(z);
        }
    }

    public static int[] fromBigInteger(BigInteger x) {
        int[] z = Nat128.fromBigInteger(x);
        if (z[3] == P3 && Nat128.gte(z, P)) {
            Nat128.subFrom(P, z);
        }
        return z;
    }

    public static void half(int[] x, int[] z) {
        if ((x[0] & 1) == 0) {
            Nat.shiftDownBit(4, x, 0, z);
        } else {
            int c = Nat128.add(x, P, z);
            Nat.shiftDownBit(4, z, c);
        }
    }

    public static void multiply(int[] x, int[] y, int[] z) {
        int[] tt = Nat128.createExt();
        Nat128.mul(x, y, tt);
        reduce(tt, z);
    }

    public static void multiplyAddToExt(int[] x, int[] y, int[] zz) {
        int c = Nat128.mulAddTo(x, y, zz);
        if (c != 0 || (zz[7] == PExt7 && Nat256.gte(zz, PExt))) {
            Nat.addTo(PExtInv.length, PExtInv, zz);
        }
    }

    public static void negate(int[] x, int[] z) {
        if (Nat128.isZero(x)) {
            Nat128.zero(z);
        } else {
            Nat128.sub(P, x, z);
        }
    }

    public static void reduce(int[] xx, int[] z) {
        long x0 = xx[0] & M;
        long x1 = xx[1] & M;
        long x2 = xx[2] & M;
        long x3 = xx[3] & M;
        long x4 = xx[4] & M;
        long x5 = xx[5] & M;
        long x6 = xx[6] & M;
        long x7 = xx[7] & M;
        long x32 = x3 + x7;
        long x62 = x6 + (x7 << 1);
        long x22 = x2 + x62;
        long x52 = x5 + (x62 << 1);
        long x12 = x1 + x52;
        long x42 = x4 + (x52 << 1);
        long x02 = x0 + x42;
        long x33 = x32 + (x42 << 1);
        z[0] = (int) x02;
        long x13 = x12 + (x02 >>> 32);
        z[1] = (int) x13;
        long x23 = x22 + (x13 >>> 32);
        z[2] = (int) x23;
        long x34 = x33 + (x23 >>> 32);
        z[3] = (int) x34;
        reduce32((int) (x34 >>> 32), z);
    }

    public static void reduce32(int x, int[] z) {
        while (x != 0) {
            long x4 = x & M;
            long c = (z[0] & M) + x4;
            z[0] = (int) c;
            long c2 = c >> 32;
            if (c2 != 0) {
                long c3 = c2 + (z[1] & M);
                z[1] = (int) c3;
                long c4 = (c3 >> 32) + (z[2] & M);
                z[2] = (int) c4;
                c2 = c4 >> 32;
            }
            long c5 = c2 + (z[3] & M) + (x4 << 1);
            z[3] = (int) c5;
            x = (int) (c5 >> 32);
        }
    }

    public static void square(int[] x, int[] z) {
        int[] tt = Nat128.createExt();
        Nat128.square(x, tt);
        reduce(tt, z);
    }

    public static void squareN(int[] x, int n, int[] z) {
        int[] tt = Nat128.createExt();
        Nat128.square(x, tt);
        reduce(tt, z);
        while (true) {
            n--;
            if (n > 0) {
                Nat128.square(z, tt);
                reduce(tt, z);
            } else {
                return;
            }
        }
    }

    public static void subtract(int[] x, int[] y, int[] z) {
        int c = Nat128.sub(x, y, z);
        if (c != 0) {
            subPInvFrom(z);
        }
    }

    public static void subtractExt(int[] xx, int[] yy, int[] zz) {
        int c = Nat.sub(10, xx, yy, zz);
        if (c != 0) {
            Nat.subFrom(PExtInv.length, PExtInv, zz);
        }
    }

    public static void twice(int[] x, int[] z) {
        int c = Nat.shiftUpBit(4, x, 0, z);
        if (c != 0 || (z[3] == P3 && Nat128.gte(z, P))) {
            addPInvTo(z);
        }
    }

    private static void addPInvTo(int[] z) {
        long c = (z[0] & M) + 1;
        z[0] = (int) c;
        long c2 = c >> 32;
        if (c2 != 0) {
            long c3 = c2 + (z[1] & M);
            z[1] = (int) c3;
            long c4 = (c3 >> 32) + (z[2] & M);
            z[2] = (int) c4;
            c2 = c4 >> 32;
        }
        z[3] = (int) (c2 + (z[3] & M) + 2);
    }

    private static void subPInvFrom(int[] z) {
        long c = (z[0] & M) - 1;
        z[0] = (int) c;
        long c2 = c >> 32;
        if (c2 != 0) {
            long c3 = c2 + (z[1] & M);
            z[1] = (int) c3;
            long c4 = (c3 >> 32) + (z[2] & M);
            z[2] = (int) c4;
            c2 = c4 >> 32;
        }
        z[3] = (int) (c2 + ((z[3] & M) - 2));
    }
}
