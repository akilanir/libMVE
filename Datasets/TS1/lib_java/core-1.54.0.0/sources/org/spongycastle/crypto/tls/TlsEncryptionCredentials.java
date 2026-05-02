package org.spongycastle.crypto.tls;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsEncryptionCredentials.class */
public interface TlsEncryptionCredentials extends TlsCredentials {
    byte[] decryptPreMasterSecret(byte[] bArr) throws IOException;
}
