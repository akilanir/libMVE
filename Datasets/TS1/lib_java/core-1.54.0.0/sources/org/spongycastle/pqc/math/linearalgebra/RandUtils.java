package org.spongycastle.pqc.math.linearalgebra;

import java.security.SecureRandom;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/math/linearalgebra/RandUtils.class */
public class RandUtils {
    static int nextInt(SecureRandom rand, int n) {
        int bits;
        int value;
        if ((n & (-n)) == n) {
            return (int) ((n * (rand.nextInt() >>> 1)) >> 31);
        }
        do {
            bits = rand.nextInt() >>> 1;
            value = bits % n;
        } while ((bits - value) + (n - 1) < 0);
        return value;
    }
}
