package org.spongycastle.crypto.prng;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/prng/EntropySource.class */
public interface EntropySource {
    boolean isPredictionResistant();

    byte[] getEntropy();

    int entropySize();
}
