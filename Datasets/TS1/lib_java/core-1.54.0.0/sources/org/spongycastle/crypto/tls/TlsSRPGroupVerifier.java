package org.spongycastle.crypto.tls;

import org.spongycastle.crypto.params.SRP6GroupParameters;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsSRPGroupVerifier.class */
public interface TlsSRPGroupVerifier {
    boolean accept(SRP6GroupParameters sRP6GroupParameters);
}
