package org.tukaani.xz.rangecoder;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: xz-1.5.jar:org/tukaani/xz/rangecoder/RangeEncoder.class */
public final class RangeEncoder extends RangeCoder {
    private static final int MOVE_REDUCING_BITS = 4;
    private static final int BIT_PRICE_SHIFT_BITS = 4;
    private static final int[] prices;
    private long low;
    private int range;
    private int cacheSize;
    private byte cache;
    private final byte[] buf;
    private int bufPos;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$rangecoder$RangeEncoder;

    public RangeEncoder(int i) {
        this.buf = new byte[i];
        reset();
    }

    public void reset() {
        this.low = 0L;
        this.range = -1;
        this.cache = (byte) 0;
        this.cacheSize = 1;
        this.bufPos = 0;
    }

    public int getPendingSize() {
        return ((this.bufPos + this.cacheSize) + 5) - 1;
    }

    public int finish() {
        for (int i = 0; i < 5; i++) {
            shiftLow();
        }
        return this.bufPos;
    }

    public void write(OutputStream outputStream) throws IOException {
        outputStream.write(this.buf, 0, this.bufPos);
    }

    private void shiftLow() {
        int i;
        int i2 = (int) (this.low >>> 32);
        if (i2 != 0 || this.low < 4278190080L) {
            byte b = this.cache;
            do {
                byte[] bArr = this.buf;
                int i3 = this.bufPos;
                this.bufPos = i3 + 1;
                bArr[i3] = (byte) (b + i2);
                b = 255;
                i = this.cacheSize - 1;
                this.cacheSize = i;
            } while (i != 0);
            this.cache = (byte) (this.low >>> 24);
        }
        this.cacheSize++;
        this.low = (this.low & 16777215) << 8;
    }

    public void encodeBit(short[] sArr, int i, int i2) {
        short s = sArr[i];
        int i3 = (this.range >>> 11) * s;
        if (i2 == 0) {
            this.range = i3;
            sArr[i] = (short) (s + ((2048 - s) >>> 5));
        } else {
            this.low += i3 & 4294967295L;
            this.range -= i3;
            sArr[i] = (short) (s - (s >>> 5));
        }
        if ((this.range & (-16777216)) == 0) {
            this.range <<= 8;
            shiftLow();
        }
    }

    public static int getBitPrice(int i, int i2) {
        if ($assertionsDisabled || i2 == 0 || i2 == 1) {
            return prices[(i ^ ((-i2) & 2047)) >>> 4];
        }
        throw new AssertionError();
    }

    public void encodeBitTree(short[] sArr, int i) {
        int i2 = 1;
        int length = sArr.length;
        do {
            length >>>= 1;
            int i3 = i & length;
            encodeBit(sArr, i2, i3);
            i2 <<= 1;
            if (i3 != 0) {
                i2 |= 1;
            }
        } while (length != 1);
    }

    public static int getBitTreePrice(short[] sArr, int i) {
        int i2 = 0;
        int length = i | sArr.length;
        do {
            int i3 = length & 1;
            length >>>= 1;
            i2 += getBitPrice(sArr[length], i3);
        } while (length != 1);
        return i2;
    }

    public void encodeReverseBitTree(short[] sArr, int i) {
        int i2 = 1;
        int length = i | sArr.length;
        do {
            int i3 = length & 1;
            length >>>= 1;
            encodeBit(sArr, i2, i3);
            i2 = (i2 << 1) | i3;
        } while (length != 1);
    }

    public static int getReverseBitTreePrice(short[] sArr, int i) {
        int i2 = 0;
        int i3 = 1;
        int length = i | sArr.length;
        do {
            int i4 = length & 1;
            length >>>= 1;
            i2 += getBitPrice(sArr[i3], i4);
            i3 = (i3 << 1) | i4;
        } while (length != 1);
        return i2;
    }

    public void encodeDirectBits(int i, int i2) {
        do {
            this.range >>>= 1;
            i2--;
            this.low += this.range & (0 - ((i >>> i2) & 1));
            if ((this.range & (-16777216)) == 0) {
                this.range <<= 8;
                shiftLow();
            }
        } while (i2 != 0);
    }

    public static int getDirectBitsPrice(int i) {
        return i << 4;
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    static {
        Class cls;
        if (class$org$tukaani$xz$rangecoder$RangeEncoder == null) {
            cls = class$("org.tukaani.xz.rangecoder.RangeEncoder");
            class$org$tukaani$xz$rangecoder$RangeEncoder = cls;
        } else {
            cls = class$org$tukaani$xz$rangecoder$RangeEncoder;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
        prices = new int[128];
        for (int i = 8; i < 2048; i += 16) {
            int i2 = i;
            int i3 = 0;
            for (int i4 = 0; i4 < 4; i4++) {
                i2 *= i2;
                i3 <<= 1;
                while ((i2 & (-65536)) != 0) {
                    i2 >>>= 1;
                    i3++;
                }
            }
            prices[i >> 4] = 161 - i3;
        }
    }
}
