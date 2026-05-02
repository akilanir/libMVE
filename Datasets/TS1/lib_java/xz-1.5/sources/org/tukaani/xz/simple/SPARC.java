package org.tukaani.xz.simple;

/* loaded from: xz-1.5.jar:org/tukaani/xz/simple/SPARC.class */
public final class SPARC implements SimpleFilter {
    private final boolean isEncoder;
    private int pos;

    public SPARC(boolean z, int i) {
        this.isEncoder = z;
        this.pos = i;
    }

    @Override // org.tukaani.xz.simple.SimpleFilter
    public int code(byte[] bArr, int i, int i2) {
        int i3 = (i + i2) - 4;
        int i4 = i;
        while (i4 <= i3) {
            if ((bArr[i4] == 64 && (bArr[i4 + 1] & 192) == 0) || (bArr[i4] == Byte.MAX_VALUE && (bArr[i4 + 1] & 192) == 192)) {
                int i5 = (((((bArr[i4] & 255) << 24) | ((bArr[i4 + 1] & 255) << 16)) | ((bArr[i4 + 2] & 255) << 8)) | (bArr[i4 + 3] & 255)) << 2;
                int i6 = (this.isEncoder ? i5 + ((this.pos + i4) - i) : i5 - ((this.pos + i4) - i)) >>> 2;
                int i7 = (((0 - ((i6 >>> 22) & 1)) << 22) & 1073741823) | (i6 & 4194303) | 1073741824;
                bArr[i4] = (byte) (i7 >>> 24);
                bArr[i4 + 1] = (byte) (i7 >>> 16);
                bArr[i4 + 2] = (byte) (i7 >>> 8);
                bArr[i4 + 3] = (byte) i7;
            }
            i4 += 4;
        }
        int i8 = i4 - i;
        this.pos += i8;
        return i8;
    }
}
