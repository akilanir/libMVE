package org.spongycastle.crypto.params;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/RSAKeyParameters.class */
public class RSAKeyParameters extends AsymmetricKeyParameter {
    private BigInteger modulus;
    private BigInteger exponent;

    public RSAKeyParameters(boolean isPrivate, BigInteger modulus, BigInteger exponent) {
        super(isPrivate);
        this.modulus = modulus;
        this.exponent = exponent;
    }

    public BigInteger getModulus() {
        return this.modulus;
    }

    public BigInteger getExponent() {
        return this.exponent;
    }
}
