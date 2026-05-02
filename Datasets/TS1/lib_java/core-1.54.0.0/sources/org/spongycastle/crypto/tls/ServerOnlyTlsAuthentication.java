package org.spongycastle.crypto.tls;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/ServerOnlyTlsAuthentication.class */
public abstract class ServerOnlyTlsAuthentication implements TlsAuthentication {
    @Override // org.spongycastle.crypto.tls.TlsAuthentication
    public final TlsCredentials getClientCredentials(CertificateRequest certificateRequest) {
        return null;
    }
}
