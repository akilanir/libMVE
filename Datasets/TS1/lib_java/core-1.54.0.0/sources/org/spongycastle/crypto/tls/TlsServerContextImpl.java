package org.spongycastle.crypto.tls;

import java.security.SecureRandom;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsServerContextImpl.class */
class TlsServerContextImpl extends AbstractTlsContext implements TlsServerContext {
    TlsServerContextImpl(SecureRandom secureRandom, SecurityParameters securityParameters) {
        super(secureRandom, securityParameters);
    }

    @Override // org.spongycastle.crypto.tls.TlsContext
    public boolean isServer() {
        return true;
    }
}
