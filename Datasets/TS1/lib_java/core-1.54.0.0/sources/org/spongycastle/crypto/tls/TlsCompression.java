package org.spongycastle.crypto.tls;

import java.io.OutputStream;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsCompression.class */
public interface TlsCompression {
    OutputStream compress(OutputStream outputStream);

    OutputStream decompress(OutputStream outputStream);
}
