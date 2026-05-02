package org.spongycastle.crypto.engines;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/engines/AESWrapEngine.class */
public class AESWrapEngine extends RFC3394WrapEngine {
    public AESWrapEngine() {
        super(new AESEngine());
    }

    public AESWrapEngine(boolean useReverseDirection) {
        super(new AESEngine(), useReverseDirection);
    }
}
