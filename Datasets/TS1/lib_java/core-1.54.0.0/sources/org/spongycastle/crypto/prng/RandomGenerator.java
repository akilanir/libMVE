package org.spongycastle.crypto.prng;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/prng/RandomGenerator.class */
public interface RandomGenerator {
    void addSeedMaterial(byte[] bArr);

    void addSeedMaterial(long j);

    void nextBytes(byte[] bArr);

    void nextBytes(byte[] bArr, int i, int i2);
}
