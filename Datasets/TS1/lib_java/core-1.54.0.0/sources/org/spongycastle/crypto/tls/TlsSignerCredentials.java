package org.spongycastle.crypto.tls;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsSignerCredentials.class */
public interface TlsSignerCredentials extends TlsCredentials {
    byte[] generateCertificateSignature(byte[] bArr) throws IOException;

    SignatureAndHashAlgorithm getSignatureAndHashAlgorithm();
}
