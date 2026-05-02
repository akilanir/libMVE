package org.spongycastle.jce.interfaces;

import java.math.BigInteger;
import javax.crypto.interfaces.DHPublicKey;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/interfaces/ElGamalPublicKey.class */
public interface ElGamalPublicKey extends ElGamalKey, DHPublicKey {
    BigInteger getY();
}
