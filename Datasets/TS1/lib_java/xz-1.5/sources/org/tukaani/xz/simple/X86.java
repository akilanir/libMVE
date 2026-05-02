package org.tukaani.xz.simple;

/* loaded from: xz-1.5.jar:org/tukaani/xz/simple/X86.class */
public final class X86 implements SimpleFilter {
    private static final boolean[] MASK_TO_ALLOWED_STATUS = {true, true, true, false, true, false, false, false};
    private static final int[] MASK_TO_BIT_NUMBER = {0, 1, 2, 2, 3, 3, 3, 3};
    private final boolean isEncoder;
    private int pos;
    private int prevMask = 0;

    private static boolean test86MSByte(byte b) {
        int i = b & 255;
        return i == 0 || i == 255;
    }

    public X86(boolean z, int i) {
        this.isEncoder = z;
        this.pos = i + 5;
    }

    @Override // org.tukaani.xz.simple.SimpleFilter
    public int code(byte[] bArr, int i, int i2) {
        int i3;
        int i4 = i - 1;
        int i5 = (i + i2) - 5;
        int i6 = i;
        while (i6 <= i5) {
            if ((bArr[i6] & 254) == 232) {
                int i7 = i6 - i4;
                if ((i7 & (-4)) != 0) {
                    this.prevMask = 0;
                } else {
                    this.prevMask = (this.prevMask << (i7 - 1)) & 7;
                    if (this.prevMask != 0 && (!MASK_TO_ALLOWED_STATUS[this.prevMask] || test86MSByte(bArr[(i6 + 4) - MASK_TO_BIT_NUMBER[this.prevMask]]))) {
                        i4 = i6;
                        this.prevMask = (this.prevMask << 1) | 1;
                    }
                }
                i4 = i6;
                if (test86MSByte(bArr[i6 + 4])) {
                    int i8 = (bArr[i6 + 1] & 255) | ((bArr[i6 + 2] & 255) << 8) | ((bArr[i6 + 3] & 255) << 16) | ((bArr[i6 + 4] & 255) << 24);
                    while (true) {
                        int i9 = i8;
                        i3 = this.isEncoder ? i9 + ((this.pos + i6) - i) : i9 - ((this.pos + i6) - i);
                        if (this.prevMask == 0) {
                            break;
                        }
                        int i10 = MASK_TO_BIT_NUMBER[this.prevMask] * 8;
                        if (!test86MSByte((byte) (i3 >>> (24 - i10)))) {
                            break;
                        }
                        i8 = i3 ^ ((1 << (32 - i10)) - 1);
                    }
                    bArr[i6 + 1] = (byte) i3;
                    bArr[i6 + 2] = (byte) (i3 >>> 8);
                    bArr[i6 + 3] = (byte) (i3 >>> 16);
                    bArr[i6 + 4] = (byte) ((((i3 >>> 24) & 1) - 1) ^ (-1));
                    i6 += 4;
                } else {
                    this.prevMask = (this.prevMask << 1) | 1;
                }
            }
            i6++;
        }
        int i11 = i6 - i4;
        this.prevMask = (i11 & (-4)) != 0 ? 0 : this.prevMask << (i11 - 1);
        int i12 = i6 - i;
        this.pos += i12;
        return i12;
    }
}
