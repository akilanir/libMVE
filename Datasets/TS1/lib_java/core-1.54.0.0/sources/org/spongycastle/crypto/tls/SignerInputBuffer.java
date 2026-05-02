package org.spongycastle.crypto.tls;

import java.io.ByteArrayOutputStream;
import org.spongycastle.crypto.Signer;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/SignerInputBuffer.class */
class SignerInputBuffer extends ByteArrayOutputStream {
    SignerInputBuffer() {
    }

    void updateSigner(Signer s) {
        s.update(this.buf, 0, this.count);
    }
}
