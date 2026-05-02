package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/SkippingCipher.class */
public interface SkippingCipher {
    long skip(long j);

    long seekTo(long j);

    long getPosition();
}
