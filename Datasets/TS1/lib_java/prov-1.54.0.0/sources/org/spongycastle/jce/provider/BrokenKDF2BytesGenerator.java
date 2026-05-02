package org.spongycastle.jce.provider;

import org.spongycastle.crypto.DataLengthException;
import org.spongycastle.crypto.DerivationFunction;
import org.spongycastle.crypto.DerivationParameters;
import org.spongycastle.crypto.Digest;
import org.spongycastle.crypto.params.KDFParameters;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/provider/BrokenKDF2BytesGenerator.class */
public class BrokenKDF2BytesGenerator implements DerivationFunction {
    private Digest digest;
    private byte[] shared;
    private byte[] iv;

    public BrokenKDF2BytesGenerator(Digest digest) {
        this.digest = digest;
    }

    public void init(DerivationParameters param) {
        if (!(param instanceof KDFParameters)) {
            throw new IllegalArgumentException("KDF parameters required for KDF2Generator");
        }
        KDFParameters p = (KDFParameters) param;
        this.shared = p.getSharedSecret();
        this.iv = p.getIV();
    }

    public Digest getDigest() {
        return this.digest;
    }

    public int generateBytes(byte[] out, int outOff, int len) throws DataLengthException, IllegalArgumentException {
        if (out.length - len < outOff) {
            throw new DataLengthException("output buffer too small");
        }
        long oBits = len * 8;
        if (oBits > this.digest.getDigestSize() * 8 * 29) {
            new IllegalArgumentException("Output length to large");
        }
        int cThreshold = (int) (oBits / this.digest.getDigestSize());
        byte[] dig = new byte[this.digest.getDigestSize()];
        for (int counter = 1; counter <= cThreshold; counter++) {
            this.digest.update(this.shared, 0, this.shared.length);
            this.digest.update((byte) (counter & 255));
            this.digest.update((byte) ((counter >> 8) & 255));
            this.digest.update((byte) ((counter >> 16) & 255));
            this.digest.update((byte) ((counter >> 24) & 255));
            this.digest.update(this.iv, 0, this.iv.length);
            this.digest.doFinal(dig, 0);
            if (len - outOff > dig.length) {
                System.arraycopy(dig, 0, out, outOff, dig.length);
                outOff += dig.length;
            } else {
                System.arraycopy(dig, 0, out, outOff, len - outOff);
            }
        }
        this.digest.reset();
        return len;
    }
}
