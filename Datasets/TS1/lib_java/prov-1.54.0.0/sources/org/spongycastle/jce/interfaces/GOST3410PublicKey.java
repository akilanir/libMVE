package org.spongycastle.jce.interfaces;

import java.math.BigInteger;
import java.security.PublicKey;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/interfaces/GOST3410PublicKey.class */
public interface GOST3410PublicKey extends GOST3410Key, PublicKey {
    BigInteger getY();
}
