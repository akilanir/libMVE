package org.spongycastle.crypto;

import org.spongycastle.crypto.params.AsymmetricKeyParameter;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/KeyEncoder.class */
public interface KeyEncoder {
    byte[] getEncoded(AsymmetricKeyParameter asymmetricKeyParameter);
}
