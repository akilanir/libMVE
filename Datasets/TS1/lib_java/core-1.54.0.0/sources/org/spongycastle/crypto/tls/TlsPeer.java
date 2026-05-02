package org.spongycastle.crypto.tls;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsPeer.class */
public interface TlsPeer {
    boolean shouldUseGMTUnixTime();

    void notifySecureRenegotiation(boolean z) throws IOException;

    TlsCompression getCompression() throws IOException;

    TlsCipher getCipher() throws IOException;

    void notifyAlertRaised(short s, short s2, String str, Throwable th);

    void notifyAlertReceived(short s, short s2);

    void notifyHandshakeComplete() throws IOException;
}
