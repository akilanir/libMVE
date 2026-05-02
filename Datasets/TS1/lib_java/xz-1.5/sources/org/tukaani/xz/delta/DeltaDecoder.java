package org.tukaani.xz.delta;

/* loaded from: xz-1.5.jar:org/tukaani/xz/delta/DeltaDecoder.class */
public class DeltaDecoder extends DeltaCoder {
    public DeltaDecoder(int i) {
        super(i);
    }

    public void decode(byte[] bArr, int i, int i2) {
        int i3 = i + i2;
        for (int i4 = i; i4 < i3; i4++) {
            int i5 = i4;
            bArr[i5] = (byte) (bArr[i5] + this.history[(this.distance + this.pos) & 255]);
            byte[] bArr2 = this.history;
            int i6 = this.pos;
            this.pos = i6 - 1;
            bArr2[i6 & 255] = bArr[i4];
        }
    }
}
