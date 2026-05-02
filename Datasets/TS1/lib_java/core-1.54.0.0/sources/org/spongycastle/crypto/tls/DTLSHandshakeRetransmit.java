package org.spongycastle.crypto.tls;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/DTLSHandshakeRetransmit.class */
interface DTLSHandshakeRetransmit {
    void receivedHandshakeRecord(int i, byte[] bArr, int i2, int i3) throws IOException;
}
