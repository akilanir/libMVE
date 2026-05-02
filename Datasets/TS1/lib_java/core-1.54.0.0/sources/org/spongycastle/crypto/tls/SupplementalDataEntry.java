package org.spongycastle.crypto.tls;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/SupplementalDataEntry.class */
public class SupplementalDataEntry {
    protected int dataType;
    protected byte[] data;

    public SupplementalDataEntry(int dataType, byte[] data) {
        this.dataType = dataType;
        this.data = data;
    }

    public int getDataType() {
        return this.dataType;
    }

    public byte[] getData() {
        return this.data;
    }
}
