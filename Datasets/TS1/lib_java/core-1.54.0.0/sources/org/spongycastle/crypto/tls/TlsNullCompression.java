package org.spongycastle.crypto.tls;

import java.io.OutputStream;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsNullCompression.class */
public class TlsNullCompression implements TlsCompression {
    @Override // org.spongycastle.crypto.tls.TlsCompression
    public OutputStream compress(OutputStream output) {
        return output;
    }

    @Override // org.spongycastle.crypto.tls.TlsCompression
    public OutputStream decompress(OutputStream output) {
        return output;
    }
}
