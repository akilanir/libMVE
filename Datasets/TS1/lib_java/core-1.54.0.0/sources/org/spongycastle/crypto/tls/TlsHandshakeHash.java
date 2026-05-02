package org.spongycastle.crypto.tls;

import org.spongycastle.crypto.Digest;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsHandshakeHash.class */
public interface TlsHandshakeHash extends Digest {
    void init(TlsContext tlsContext);

    TlsHandshakeHash notifyPRFDetermined();

    void trackHashAlgorithm(short s);

    void sealHashAlgorithms();

    TlsHandshakeHash stopTracking();

    Digest forkPRFHash();

    byte[] getFinalHash(short s);
}
