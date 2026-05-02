package org.spongycastle.jce.interfaces;

import java.security.PublicKey;
import org.spongycastle.math.ec.ECPoint;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/interfaces/ECPublicKey.class */
public interface ECPublicKey extends ECKey, PublicKey {
    ECPoint getQ();
}
