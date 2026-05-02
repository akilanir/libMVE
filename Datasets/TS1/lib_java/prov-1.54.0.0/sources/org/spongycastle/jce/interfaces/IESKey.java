package org.spongycastle.jce.interfaces;

import java.security.Key;
import java.security.PrivateKey;
import java.security.PublicKey;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/interfaces/IESKey.class */
public interface IESKey extends Key {
    PublicKey getPublic();

    PrivateKey getPrivate();
}
