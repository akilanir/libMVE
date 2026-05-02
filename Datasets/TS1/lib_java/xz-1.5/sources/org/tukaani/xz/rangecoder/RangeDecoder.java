package org.tukaani.xz.rangecoder;

import java.io.IOException;

/* loaded from: xz-1.5.jar:org/tukaani/xz/rangecoder/RangeDecoder.class */
public abstract class RangeDecoder extends RangeCoder {
    int range = 0;
    int code = 0;

    public abstract void normalize() throws IOException;

    public int decodeBit(short[] sArr, int i) throws IOException {
        int i2;
        normalize();
        short s = sArr[i];
        int i3 = (this.range >>> 11) * s;
        if ((this.code ^ Integer.MIN_VALUE) < (i3 ^ Integer.MIN_VALUE)) {
            this.range = i3;
            sArr[i] = (short) (s + ((2048 - s) >>> 5));
            i2 = 0;
        } else {
            this.range -= i3;
            this.code -= i3;
            sArr[i] = (short) (s - (s >>> 5));
            i2 = 1;
        }
        return i2;
    }

    public int decodeBitTree(short[] sArr) throws IOException {
        int i = 1;
        do {
            i = (i << 1) | decodeBit(sArr, i);
        } while (i < sArr.length);
        return i - sArr.length;
    }

    public int decodeReverseBitTree(short[] sArr) throws IOException {
        int i = 1;
        int i2 = 0;
        int i3 = 0;
        do {
            int decodeBit = decodeBit(sArr, i);
            i = (i << 1) | decodeBit;
            int i4 = i2;
            i2++;
            i3 |= decodeBit << i4;
        } while (i < sArr.length);
        return i3;
    }

    public int decodeDirectBits(int i) throws IOException {
        int i2 = 0;
        do {
            normalize();
            this.range >>>= 1;
            int i3 = (this.code - this.range) >>> 31;
            this.code -= this.range & (i3 - 1);
            i2 = (i2 << 1) | (1 - i3);
            i--;
        } while (i != 0);
        return i2;
    }
}
