package org.spongycastle.jce.interfaces;

import java.security.PublicKey;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/interfaces/MQVPublicKey.class */
public interface MQVPublicKey extends PublicKey {
    PublicKey getStaticKey();

    PublicKey getEphemeralKey();
}
