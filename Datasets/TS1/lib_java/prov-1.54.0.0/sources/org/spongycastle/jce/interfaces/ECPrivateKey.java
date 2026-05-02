package org.spongycastle.jce.interfaces;

import java.math.BigInteger;
import java.security.PrivateKey;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/interfaces/ECPrivateKey.class */
public interface ECPrivateKey extends ECKey, PrivateKey {
    BigInteger getD();
}
