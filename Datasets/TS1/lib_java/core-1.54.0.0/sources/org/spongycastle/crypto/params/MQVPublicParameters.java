package org.spongycastle.crypto.params;

import org.spongycastle.crypto.CipherParameters;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/MQVPublicParameters.class */
public class MQVPublicParameters implements CipherParameters {
    private ECPublicKeyParameters staticPublicKey;
    private ECPublicKeyParameters ephemeralPublicKey;

    public MQVPublicParameters(ECPublicKeyParameters staticPublicKey, ECPublicKeyParameters ephemeralPublicKey) {
        this.staticPublicKey = staticPublicKey;
        this.ephemeralPublicKey = ephemeralPublicKey;
    }

    public ECPublicKeyParameters getStaticPublicKey() {
        return this.staticPublicKey;
    }

    public ECPublicKeyParameters getEphemeralPublicKey() {
        return this.ephemeralPublicKey;
    }
}
