package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/Commitment.class */
public class Commitment {
    private final byte[] secret;
    private final byte[] commitment;

    public Commitment(byte[] secret, byte[] commitment) {
        this.secret = secret;
        this.commitment = commitment;
    }

    public byte[] getSecret() {
        return this.secret;
    }

    public byte[] getCommitment() {
        return this.commitment;
    }
}
