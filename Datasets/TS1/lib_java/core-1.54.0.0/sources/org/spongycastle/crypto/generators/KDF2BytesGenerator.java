package org.spongycastle.crypto.generators;

import org.spongycastle.crypto.Digest;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/generators/KDF2BytesGenerator.class */
public class KDF2BytesGenerator extends BaseKDFBytesGenerator {
    public KDF2BytesGenerator(Digest digest) {
        super(1, digest);
    }
}
