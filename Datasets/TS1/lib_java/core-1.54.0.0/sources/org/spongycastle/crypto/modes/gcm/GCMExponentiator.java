package org.spongycastle.crypto.modes.gcm;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/modes/gcm/GCMExponentiator.class */
public interface GCMExponentiator {
    void init(byte[] bArr);

    void exponentiateX(long j, byte[] bArr);
}
