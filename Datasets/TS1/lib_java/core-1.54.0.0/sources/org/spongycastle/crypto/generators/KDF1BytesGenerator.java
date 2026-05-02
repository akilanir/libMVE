package org.spongycastle.crypto.generators;

import org.spongycastle.crypto.Digest;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/generators/KDF1BytesGenerator.class */
public class KDF1BytesGenerator extends BaseKDFBytesGenerator {
    public KDF1BytesGenerator(Digest digest) {
        super(0, digest);
    }
}
