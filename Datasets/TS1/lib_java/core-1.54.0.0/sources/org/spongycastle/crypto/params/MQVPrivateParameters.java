package org.spongycastle.crypto.params;

import org.spongycastle.crypto.CipherParameters;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/MQVPrivateParameters.class */
public class MQVPrivateParameters implements CipherParameters {
    private ECPrivateKeyParameters staticPrivateKey;
    private ECPrivateKeyParameters ephemeralPrivateKey;
    private ECPublicKeyParameters ephemeralPublicKey;

    public MQVPrivateParameters(ECPrivateKeyParameters staticPrivateKey, ECPrivateKeyParameters ephemeralPrivateKey) {
        this(staticPrivateKey, ephemeralPrivateKey, null);
    }

    public MQVPrivateParameters(ECPrivateKeyParameters staticPrivateKey, ECPrivateKeyParameters ephemeralPrivateKey, ECPublicKeyParameters ephemeralPublicKey) {
        this.staticPrivateKey = staticPrivateKey;
        this.ephemeralPrivateKey = ephemeralPrivateKey;
        this.ephemeralPublicKey = ephemeralPublicKey;
    }

    public ECPrivateKeyParameters getStaticPrivateKey() {
        return this.staticPrivateKey;
    }

    public ECPrivateKeyParameters getEphemeralPrivateKey() {
        return this.ephemeralPrivateKey;
    }

    public ECPublicKeyParameters getEphemeralPublicKey() {
        return this.ephemeralPublicKey;
    }
}
