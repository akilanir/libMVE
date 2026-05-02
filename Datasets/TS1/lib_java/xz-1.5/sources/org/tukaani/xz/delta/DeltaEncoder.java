package org.tukaani.xz.delta;

/* loaded from: xz-1.5.jar:org/tukaani/xz/delta/DeltaEncoder.class */
public class DeltaEncoder extends DeltaCoder {
    public DeltaEncoder(int i) {
        super(i);
    }

    public void encode(byte[] bArr, int i, int i2, byte[] bArr2) {
        for (int i3 = 0; i3 < i2; i3++) {
            byte b = this.history[(this.distance + this.pos) & 255];
            byte[] bArr3 = this.history;
            int i4 = this.pos;
            this.pos = i4 - 1;
            bArr3[i4 & 255] = bArr[i + i3];
            bArr2[i3] = (byte) (bArr[i + i3] - b);
        }
    }
}
