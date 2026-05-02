package org.spongycastle.pqc.crypto.mceliece;

import org.spongycastle.crypto.Digest;
import org.spongycastle.crypto.digests.SHA256Digest;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters.class */
public class McElieceCCA2Parameters extends McElieceParameters {
    public Digest digest;

    public McElieceCCA2Parameters() {
        this.digest = new SHA256Digest();
    }

    public McElieceCCA2Parameters(int m, int t) {
        super(m, t);
        this.digest = new SHA256Digest();
    }

    public McElieceCCA2Parameters(Digest digest) {
        this.digest = digest;
    }

    public Digest getDigest() {
        return this.digest;
    }
}
