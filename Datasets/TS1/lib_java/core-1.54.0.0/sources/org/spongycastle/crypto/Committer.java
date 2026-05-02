package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/Committer.class */
public interface Committer {
    Commitment commit(byte[] bArr);

    boolean isRevealed(Commitment commitment, byte[] bArr);
}
