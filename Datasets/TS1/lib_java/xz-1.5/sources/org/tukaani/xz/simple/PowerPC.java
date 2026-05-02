package org.tukaani.xz.simple;

/* loaded from: xz-1.5.jar:org/tukaani/xz/simple/PowerPC.class */
public final class PowerPC implements SimpleFilter {
    private final boolean isEncoder;
    private int pos;

    public PowerPC(boolean z, int i) {
        this.isEncoder = z;
        this.pos = i;
    }

    @Override // org.tukaani.xz.simple.SimpleFilter
    public int code(byte[] bArr, int i, int i2) {
        int i3 = (i + i2) - 4;
        int i4 = i;
        while (i4 <= i3) {
            if ((bArr[i4] & 252) == 72 && (bArr[i4 + 3] & 3) == 1) {
                int i5 = ((bArr[i4] & 3) << 24) | ((bArr[i4 + 1] & 255) << 16) | ((bArr[i4 + 2] & 255) << 8) | (bArr[i4 + 3] & 252);
                int i6 = this.isEncoder ? i5 + ((this.pos + i4) - i) : i5 - ((this.pos + i4) - i);
                bArr[i4] = (byte) (72 | ((i6 >>> 24) & 3));
                bArr[i4 + 1] = (byte) (i6 >>> 16);
                bArr[i4 + 2] = (byte) (i6 >>> 8);
                bArr[i4 + 3] = (byte) ((bArr[i4 + 3] & 3) | i6);
            }
            i4 += 4;
        }
        int i7 = i4 - i;
        this.pos += i7;
        return i7;
    }
}
