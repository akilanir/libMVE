package org.spongycastle.crypto.params;

import java.security.SecureRandom;
import org.spongycastle.crypto.KeyGenerationParameters;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/ECKeyGenerationParameters.class */
public class ECKeyGenerationParameters extends KeyGenerationParameters {
    private ECDomainParameters domainParams;

    public ECKeyGenerationParameters(ECDomainParameters domainParams, SecureRandom random) {
        super(random, domainParams.getN().bitLength());
        this.domainParams = domainParams;
    }

    public ECDomainParameters getDomainParameters() {
        return this.domainParams;
    }
}
