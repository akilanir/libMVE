package org.spongycastle.crypto.tls;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsCipherFactory.class */
public interface TlsCipherFactory {
    TlsCipher createCipher(TlsContext tlsContext, int i, int i2) throws IOException;
}
