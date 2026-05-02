package org.spongycastle.crypto.tls;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsAuthentication.class */
public interface TlsAuthentication {
    void notifyServerCertificate(Certificate certificate) throws IOException;

    TlsCredentials getClientCredentials(CertificateRequest certificateRequest) throws IOException;
}
