package org.spongycastle.jce.interfaces;

import java.math.BigInteger;
import javax.crypto.interfaces.DHPrivateKey;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/interfaces/ElGamalPrivateKey.class */
public interface ElGamalPrivateKey extends ElGamalKey, DHPrivateKey {
    BigInteger getX();
}
