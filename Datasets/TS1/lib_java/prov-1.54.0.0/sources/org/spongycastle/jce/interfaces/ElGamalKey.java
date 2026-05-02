package org.spongycastle.jce.interfaces;

import javax.crypto.interfaces.DHKey;
import org.spongycastle.jce.spec.ElGamalParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/interfaces/ElGamalKey.class */
public interface ElGamalKey extends DHKey {
    ElGamalParameterSpec getParameters();
}
