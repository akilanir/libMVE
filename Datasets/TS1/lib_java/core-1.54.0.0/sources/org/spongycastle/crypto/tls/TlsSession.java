package org.spongycastle.crypto.tls;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsSession.class */
public interface TlsSession {
    SessionParameters exportSessionParameters();

    byte[] getSessionID();

    void invalidate();

    boolean isResumable();
}
