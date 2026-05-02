package org.spongycastle.jce.interfaces;

import java.security.PrivateKey;
import java.security.PublicKey;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/interfaces/MQVPrivateKey.class */
public interface MQVPrivateKey extends PrivateKey {
    PrivateKey getStaticPrivateKey();

    PrivateKey getEphemeralPrivateKey();

    PublicKey getEphemeralPublicKey();
}
