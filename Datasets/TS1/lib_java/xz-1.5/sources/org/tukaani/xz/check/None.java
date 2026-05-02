package org.tukaani.xz.check;

/* loaded from: xz-1.5.jar:org/tukaani/xz/check/None.class */
public class None extends Check {
    public None() {
        this.size = 0;
        this.name = "None";
    }

    @Override // org.tukaani.xz.check.Check
    public void update(byte[] bArr, int i, int i2) {
    }

    @Override // org.tukaani.xz.check.Check
    public byte[] finish() {
        return new byte[0];
    }
}
