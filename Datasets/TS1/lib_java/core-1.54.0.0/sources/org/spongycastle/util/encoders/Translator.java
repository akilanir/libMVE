package org.spongycastle.util.encoders;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/encoders/Translator.class */
public interface Translator {
    int getEncodedBlockSize();

    int encode(byte[] bArr, int i, int i2, byte[] bArr2, int i3);

    int getDecodedBlockSize();

    int decode(byte[] bArr, int i, int i2, byte[] bArr2, int i3);
}
