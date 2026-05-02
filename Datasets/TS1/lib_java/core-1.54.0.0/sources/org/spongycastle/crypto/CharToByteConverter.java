package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/CharToByteConverter.class */
public interface CharToByteConverter {
    String getType();

    byte[] convert(char[] cArr);
}
