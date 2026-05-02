package org.spongycastle.crypto.modes.gcm;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/modes/gcm/GCMMultiplier.class */
public interface GCMMultiplier {
    void init(byte[] bArr);

    void multiplyH(byte[] bArr);
}
