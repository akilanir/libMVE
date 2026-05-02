package org.spongycastle.crypto.macs;

import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.crypto.DataLengthException;
import org.spongycastle.crypto.Mac;
import org.spongycastle.crypto.params.KeyParameter;
import org.spongycastle.util.Pack;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/macs/SipHash.class */
public class SipHash implements Mac {
    protected final int c;
    protected final int d;
    protected long k0;
    protected long k1;
    protected long v0;
    protected long v1;
    protected long v2;
    protected long v3;
    protected long m;
    protected int wordPos;
    protected int wordCount;

    public SipHash() {
        this.m = 0L;
        this.wordPos = 0;
        this.wordCount = 0;
        this.c = 2;
        this.d = 4;
    }

    public SipHash(int c, int d) {
        this.m = 0L;
        this.wordPos = 0;
        this.wordCount = 0;
        this.c = c;
        this.d = d;
    }

    @Override // org.spongycastle.crypto.Mac
    public String getAlgorithmName() {
        return "SipHash-" + this.c + "-" + this.d;
    }

    @Override // org.spongycastle.crypto.Mac
    public int getMacSize() {
        return 8;
    }

    @Override // org.spongycastle.crypto.Mac
    public void init(CipherParameters params) throws IllegalArgumentException {
        if (!(params instanceof KeyParameter)) {
            throw new IllegalArgumentException("'params' must be an instance of KeyParameter");
        }
        KeyParameter keyParameter = (KeyParameter) params;
        byte[] key = keyParameter.getKey();
        if (key.length != 16) {
            throw new IllegalArgumentException("'params' must be a 128-bit key");
        }
        this.k0 = Pack.littleEndianToLong(key, 0);
        this.k1 = Pack.littleEndianToLong(key, 8);
        reset();
    }

    @Override // org.spongycastle.crypto.Mac
    public void update(byte input) throws IllegalStateException {
        this.m >>>= 8;
        this.m |= (input & 255) << 56;
        int i = this.wordPos + 1;
        this.wordPos = i;
        if (i == 8) {
            processMessageWord();
            this.wordPos = 0;
        }
    }

    @Override // org.spongycastle.crypto.Mac
    public void update(byte[] input, int offset, int length) throws DataLengthException, IllegalStateException {
        int i = 0;
        int fullWords = length & (-8);
        if (this.wordPos == 0) {
            while (i < fullWords) {
                this.m = Pack.littleEndianToLong(input, offset + i);
                processMessageWord();
                i += 8;
            }
            while (i < length) {
                this.m >>>= 8;
                this.m |= (input[offset + i] & 255) << 56;
                i++;
            }
            this.wordPos = length - fullWords;
            return;
        }
        int bits = this.wordPos << 3;
        while (i < fullWords) {
            long n = Pack.littleEndianToLong(input, offset + i);
            this.m = (n << bits) | (this.m >>> (-bits));
            processMessageWord();
            this.m = n;
            i += 8;
        }
        while (i < length) {
            this.m >>>= 8;
            this.m |= (input[offset + i] & 255) << 56;
            int i2 = this.wordPos + 1;
            this.wordPos = i2;
            if (i2 == 8) {
                processMessageWord();
                this.wordPos = 0;
            }
            i++;
        }
    }

    public long doFinal() throws DataLengthException, IllegalStateException {
        this.m >>>= (7 - this.wordPos) << 3;
        this.m >>>= 8;
        this.m |= (((this.wordCount << 3) + this.wordPos) & 255) << 56;
        processMessageWord();
        this.v2 ^= 255;
        applySipRounds(this.d);
        long result = ((this.v0 ^ this.v1) ^ this.v2) ^ this.v3;
        reset();
        return result;
    }

    @Override // org.spongycastle.crypto.Mac
    public int doFinal(byte[] out, int outOff) throws DataLengthException, IllegalStateException {
        long result = doFinal();
        Pack.longToLittleEndian(result, out, outOff);
        return 8;
    }

    @Override // org.spongycastle.crypto.Mac
    public void reset() {
        this.v0 = this.k0 ^ 8317987319222330741L;
        this.v1 = this.k1 ^ 7237128888997146477L;
        this.v2 = this.k0 ^ 7816392313619706465L;
        this.v3 = this.k1 ^ 8387220255154660723L;
        this.m = 0L;
        this.wordPos = 0;
        this.wordCount = 0;
    }

    protected void processMessageWord() {
        this.wordCount++;
        this.v3 ^= this.m;
        applySipRounds(this.c);
        this.v0 ^= this.m;
    }

    protected void applySipRounds(int n) {
        long r0 = this.v0;
        long r1 = this.v1;
        long r2 = this.v2;
        long r3 = this.v3;
        for (int r = 0; r < n; r++) {
            long r02 = r0 + r1;
            long r22 = r2 + r3;
            long r12 = rotateLeft(r1, 13) ^ r02;
            long r32 = rotateLeft(r3, 16) ^ r22;
            long r03 = rotateLeft(r02, 32);
            long r23 = r22 + r12;
            r0 = r03 + r32;
            r1 = rotateLeft(r12, 17) ^ r23;
            r3 = rotateLeft(r32, 21) ^ r0;
            r2 = rotateLeft(r23, 32);
        }
        this.v0 = r0;
        this.v1 = r1;
        this.v2 = r2;
        this.v3 = r3;
    }

    protected static long rotateLeft(long x, int n) {
        return (x << n) | (x >>> (-n));
    }
}
