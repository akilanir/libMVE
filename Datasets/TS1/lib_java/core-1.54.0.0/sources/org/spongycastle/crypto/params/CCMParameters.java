package org.spongycastle.crypto.params;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/CCMParameters.class */
public class CCMParameters extends AEADParameters {
    public CCMParameters(KeyParameter key, int macSize, byte[] nonce, byte[] associatedText) {
        super(key, macSize, nonce, associatedText);
    }
}
