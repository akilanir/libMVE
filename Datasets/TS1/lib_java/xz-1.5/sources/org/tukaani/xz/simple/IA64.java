package org.tukaani.xz.simple;

/* loaded from: xz-1.5.jar:org/tukaani/xz/simple/IA64.class */
public final class IA64 implements SimpleFilter {
    private static final int[] BRANCH_TABLE = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 6, 6, 0, 0, 7, 7, 4, 4, 0, 0, 4, 4, 0, 0};
    private final boolean isEncoder;
    private int pos;

    public IA64(boolean z, int i) {
        this.isEncoder = z;
        this.pos = i;
    }

    @Override // org.tukaani.xz.simple.SimpleFilter
    public int code(byte[] bArr, int i, int i2) {
        int i3 = (i + i2) - 16;
        int i4 = i;
        while (i4 <= i3) {
            int i5 = BRANCH_TABLE[bArr[i4] & 31];
            int i6 = 0;
            int i7 = 5;
            while (i6 < 3) {
                if (((i5 >>> i6) & 1) != 0) {
                    int i8 = i7 >>> 3;
                    int i9 = i7 & 7;
                    long j = 0;
                    for (int i10 = 0; i10 < 6; i10++) {
                        j |= (bArr[(i4 + i8) + i10] & 255) << (8 * i10);
                    }
                    long j2 = j >>> i9;
                    if (((j2 >>> 37) & 15) == 5 && ((j2 >>> 9) & 7) == 0) {
                        int i11 = (((int) ((j2 >>> 13) & 1048575)) | ((((int) (j2 >>> 36)) & 1) << 20)) << 4;
                        int i12 = (this.isEncoder ? i11 + ((this.pos + i4) - i) : i11 - ((this.pos + i4) - i)) >>> 4;
                        long j3 = (j & ((1 << i9) - 1)) | ((((j2 & (-77309403137L)) | ((i12 & 1048575) << 13)) | ((i12 & 1048576) << 16)) << i9);
                        for (int i13 = 0; i13 < 6; i13++) {
                            bArr[i4 + i8 + i13] = (byte) (j3 >>> (8 * i13));
                        }
                    }
                }
                i6++;
                i7 += 41;
            }
            i4 += 16;
        }
        int i14 = i4 - i;
        this.pos += i14;
        return i14;
    }
}
