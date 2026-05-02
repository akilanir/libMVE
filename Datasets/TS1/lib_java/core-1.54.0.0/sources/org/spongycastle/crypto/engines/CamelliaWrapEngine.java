package org.spongycastle.crypto.engines;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/engines/CamelliaWrapEngine.class */
public class CamelliaWrapEngine extends RFC3394WrapEngine {
    public CamelliaWrapEngine() {
        super(new CamelliaEngine());
    }
}
