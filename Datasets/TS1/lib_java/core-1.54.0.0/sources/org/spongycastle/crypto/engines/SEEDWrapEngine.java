package org.spongycastle.crypto.engines;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/engines/SEEDWrapEngine.class */
public class SEEDWrapEngine extends RFC3394WrapEngine {
    public SEEDWrapEngine() {
        super(new SEEDEngine());
    }
}
