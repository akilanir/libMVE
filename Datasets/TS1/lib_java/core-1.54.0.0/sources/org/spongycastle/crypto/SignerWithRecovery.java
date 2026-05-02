package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/SignerWithRecovery.class */
public interface SignerWithRecovery extends Signer {
    boolean hasFullMessage();

    byte[] getRecoveredMessage();

    void updateWithRecoveredMessage(byte[] bArr) throws InvalidCipherTextException;
}
