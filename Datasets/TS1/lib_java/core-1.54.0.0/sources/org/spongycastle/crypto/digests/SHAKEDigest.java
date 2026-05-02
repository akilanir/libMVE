package org.spongycastle.crypto.digests;

import org.spongycastle.crypto.Xof;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/digests/SHAKEDigest.class */
public class SHAKEDigest extends KeccakDigest implements Xof {
    private static int checkBitLength(int bitLength) {
        switch (bitLength) {
            case 128:
            case 256:
                return bitLength;
            default:
                throw new IllegalArgumentException("'bitLength' " + bitLength + " not supported for SHAKE");
        }
    }

    public SHAKEDigest() {
        this(128);
    }

    public SHAKEDigest(int bitLength) {
        super(checkBitLength(bitLength));
    }

    public SHAKEDigest(SHAKEDigest source) {
        super(source);
    }

    @Override // org.spongycastle.crypto.digests.KeccakDigest, org.spongycastle.crypto.Digest
    public String getAlgorithmName() {
        return "SHAKE" + this.fixedOutputLength;
    }

    @Override // org.spongycastle.crypto.digests.KeccakDigest, org.spongycastle.crypto.Digest
    public int doFinal(byte[] out, int outOff) {
        return doFinal(out, outOff, getDigestSize());
    }

    @Override // org.spongycastle.crypto.Xof
    public int doFinal(byte[] out, int outOff, int outLen) {
        absorb(new byte[]{15}, 0, 4L);
        squeeze(out, outOff, outLen * 8);
        reset();
        return outLen;
    }

    @Override // org.spongycastle.crypto.digests.KeccakDigest
    protected int doFinal(byte[] out, int outOff, byte partialByte, int partialBits) {
        return doFinal(out, outOff, getDigestSize(), partialByte, partialBits);
    }

    protected int doFinal(byte[] out, int outOff, int outLen, byte partialByte, int partialBits) {
        if (partialBits < 0 || partialBits > 7) {
            throw new IllegalArgumentException("'partialBits' must be in the range [0,7]");
        }
        int finalInput = (partialByte & ((1 << partialBits) - 1)) | (15 << partialBits);
        int finalBits = partialBits + 4;
        if (finalBits >= 8) {
            this.oneByte[0] = (byte) finalInput;
            absorb(this.oneByte, 0, 8L);
            finalBits -= 8;
            finalInput >>>= 8;
        }
        if (finalBits > 0) {
            this.oneByte[0] = (byte) finalInput;
            absorb(this.oneByte, 0, finalBits);
        }
        squeeze(out, outOff, outLen * 8);
        reset();
        return outLen;
    }
}
