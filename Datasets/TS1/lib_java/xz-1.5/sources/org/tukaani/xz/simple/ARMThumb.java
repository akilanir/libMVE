package org.tukaani.xz.simple;

/* loaded from: xz-1.5.jar:org/tukaani/xz/simple/ARMThumb.class */
public final class ARMThumb implements SimpleFilter {
    private final boolean isEncoder;
    private int pos;

    public ARMThumb(boolean z, int i) {
        this.isEncoder = z;
        this.pos = i + 4;
    }

    @Override // org.tukaani.xz.simple.SimpleFilter
    public int code(byte[] bArr, int i, int i2) {
        int i3 = (i + i2) - 4;
        int i4 = i;
        while (i4 <= i3) {
            if ((bArr[i4 + 1] & 248) == 240 && (bArr[i4 + 3] & 248) == 248) {
                int i5 = (((((bArr[i4 + 1] & 7) << 19) | ((bArr[i4] & 255) << 11)) | ((bArr[i4 + 3] & 7) << 8)) | (bArr[i4 + 2] & 255)) << 1;
                int i6 = (this.isEncoder ? i5 + ((this.pos + i4) - i) : i5 - ((this.pos + i4) - i)) >>> 1;
                bArr[i4 + 1] = (byte) (240 | ((i6 >>> 19) & 7));
                bArr[i4] = (byte) (i6 >>> 11);
                bArr[i4 + 3] = (byte) (248 | ((i6 >>> 8) & 7));
                bArr[i4 + 2] = (byte) i6;
                i4 += 2;
            }
            i4 += 2;
        }
        int i7 = i4 - i;
        this.pos += i7;
        return i7;
    }
}
