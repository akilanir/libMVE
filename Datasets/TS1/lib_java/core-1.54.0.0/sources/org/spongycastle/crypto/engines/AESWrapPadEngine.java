package org.spongycastle.crypto.engines;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/engines/AESWrapPadEngine.class */
public class AESWrapPadEngine extends RFC5649WrapEngine {
    public AESWrapPadEngine() {
        super(new AESEngine());
    }
}
