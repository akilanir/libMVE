package org.spongycastle.crypto.macs;

import org.spongycastle.crypto.BlockCipher;
import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.crypto.DataLengthException;
import org.spongycastle.crypto.Mac;
import org.spongycastle.crypto.generators.Poly1305KeyGenerator;
import org.spongycastle.crypto.params.KeyParameter;
import org.spongycastle.crypto.params.ParametersWithIV;
import org.spongycastle.util.Pack;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/macs/Poly1305.class */
public class Poly1305 implements Mac {
    private static final int BLOCK_SIZE = 16;
    private final BlockCipher cipher;
    private final byte[] singleByte;
    private int r0;
    private int r1;
    private int r2;
    private int r3;
    private int r4;
    private int s1;
    private int s2;
    private int s3;
    private int s4;
    private int k0;
    private int k1;
    private int k2;
    private int k3;
    private final byte[] currentBlock;
    private int currentBlockOffset;
    private int h0;
    private int h1;
    private int h2;
    private int h3;
    private int h4;

    public Poly1305() {
        this.singleByte = new byte[1];
        this.currentBlock = new byte[16];
        this.currentBlockOffset = 0;
        this.cipher = null;
    }

    public Poly1305(BlockCipher cipher) {
        this.singleByte = new byte[1];
        this.currentBlock = new byte[16];
        this.currentBlockOffset = 0;
        if (cipher.getBlockSize() != 16) {
            throw new IllegalArgumentException("Poly1305 requires a 128 bit block cipher.");
        }
        this.cipher = cipher;
    }

    @Override // org.spongycastle.crypto.Mac
    public void init(CipherParameters params) throws IllegalArgumentException {
        byte[] nonce = null;
        if (this.cipher != null) {
            if (!(params instanceof ParametersWithIV)) {
                throw new IllegalArgumentException("Poly1305 requires an IV when used with a block cipher.");
            }
            ParametersWithIV ivParams = (ParametersWithIV) params;
            nonce = ivParams.getIV();
            params = ivParams.getParameters();
        }
        if (!(params instanceof KeyParameter)) {
            throw new IllegalArgumentException("Poly1305 requires a key.");
        }
        KeyParameter keyParams = (KeyParameter) params;
        setKey(keyParams.getKey(), nonce);
        reset();
    }

    private void setKey(byte[] key, byte[] nonce) {
        byte[] kBytes;
        if (this.cipher != null && (nonce == null || nonce.length != 16)) {
            throw new IllegalArgumentException("Poly1305 requires a 128 bit IV.");
        }
        Poly1305KeyGenerator.checkKey(key);
        int t0 = Pack.littleEndianToInt(key, 16);
        int t1 = Pack.littleEndianToInt(key, 20);
        int t2 = Pack.littleEndianToInt(key, 24);
        int t3 = Pack.littleEndianToInt(key, 28);
        this.r0 = t0 & 67108863;
        this.r1 = ((t0 >>> 26) | (t1 << 6)) & 67108611;
        this.r2 = ((t1 >>> 20) | (t2 << 12)) & 67092735;
        this.r3 = ((t2 >>> 14) | (t3 << 18)) & 66076671;
        this.r4 = (t3 >>> 8) & 1048575;
        this.s1 = this.r1 * 5;
        this.s2 = this.r2 * 5;
        this.s3 = this.r3 * 5;
        this.s4 = this.r4 * 5;
        if (this.cipher == null) {
            kBytes = key;
        } else {
            kBytes = new byte[16];
            this.cipher.init(true, new KeyParameter(key, 0, 16));
            this.cipher.processBlock(nonce, 0, kBytes, 0);
        }
        this.k0 = Pack.littleEndianToInt(kBytes, 0);
        this.k1 = Pack.littleEndianToInt(kBytes, 4);
        this.k2 = Pack.littleEndianToInt(kBytes, 8);
        this.k3 = Pack.littleEndianToInt(kBytes, 12);
    }

    @Override // org.spongycastle.crypto.Mac
    public String getAlgorithmName() {
        return this.cipher == null ? "Poly1305" : "Poly1305-" + this.cipher.getAlgorithmName();
    }

    @Override // org.spongycastle.crypto.Mac
    public int getMacSize() {
        return 16;
    }

    @Override // org.spongycastle.crypto.Mac
    public void update(byte in) throws IllegalStateException {
        this.singleByte[0] = in;
        update(this.singleByte, 0, 1);
    }

    @Override // org.spongycastle.crypto.Mac
    public void update(byte[] in, int inOff, int len) throws DataLengthException, IllegalStateException {
        int copied = 0;
        while (len > copied) {
            if (this.currentBlockOffset == 16) {
                processBlock();
                this.currentBlockOffset = 0;
            }
            int toCopy = Math.min(len - copied, 16 - this.currentBlockOffset);
            System.arraycopy(in, copied + inOff, this.currentBlock, this.currentBlockOffset, toCopy);
            copied += toCopy;
            this.currentBlockOffset += toCopy;
        }
    }

    private void processBlock() {
        if (this.currentBlockOffset < 16) {
            this.currentBlock[this.currentBlockOffset] = 1;
            for (int i = this.currentBlockOffset + 1; i < 16; i++) {
                this.currentBlock[i] = 0;
            }
        }
        long t0 = 4294967295L & Pack.littleEndianToInt(this.currentBlock, 0);
        long t1 = 4294967295L & Pack.littleEndianToInt(this.currentBlock, 4);
        long t2 = 4294967295L & Pack.littleEndianToInt(this.currentBlock, 8);
        long t3 = 4294967295L & Pack.littleEndianToInt(this.currentBlock, 12);
        this.h0 = (int) (this.h0 + (t0 & 67108863));
        this.h1 = (int) (this.h1 + ((((t1 << 32) | t0) >>> 26) & 67108863));
        this.h2 = (int) (this.h2 + ((((t2 << 32) | t1) >>> 20) & 67108863));
        this.h3 = (int) (this.h3 + ((((t3 << 32) | t2) >>> 14) & 67108863));
        this.h4 = (int) (this.h4 + (t3 >>> 8));
        if (this.currentBlockOffset == 16) {
            this.h4 += 16777216;
        }
        long tp0 = mul32x32_64(this.h0, this.r0) + mul32x32_64(this.h1, this.s4) + mul32x32_64(this.h2, this.s3) + mul32x32_64(this.h3, this.s2) + mul32x32_64(this.h4, this.s1);
        long tp1 = mul32x32_64(this.h0, this.r1) + mul32x32_64(this.h1, this.r0) + mul32x32_64(this.h2, this.s4) + mul32x32_64(this.h3, this.s3) + mul32x32_64(this.h4, this.s2);
        long tp2 = mul32x32_64(this.h0, this.r2) + mul32x32_64(this.h1, this.r1) + mul32x32_64(this.h2, this.r0) + mul32x32_64(this.h3, this.s4) + mul32x32_64(this.h4, this.s3);
        long tp3 = mul32x32_64(this.h0, this.r3) + mul32x32_64(this.h1, this.r2) + mul32x32_64(this.h2, this.r1) + mul32x32_64(this.h3, this.r0) + mul32x32_64(this.h4, this.s4);
        long tp4 = mul32x32_64(this.h0, this.r4) + mul32x32_64(this.h1, this.r3) + mul32x32_64(this.h2, this.r2) + mul32x32_64(this.h3, this.r1) + mul32x32_64(this.h4, this.r0);
        this.h0 = ((int) tp0) & 67108863;
        long b = tp0 >>> 26;
        long tp12 = tp1 + b;
        this.h1 = ((int) tp12) & 67108863;
        long b2 = (tp12 >>> 26) & (-1);
        long tp22 = tp2 + b2;
        this.h2 = ((int) tp22) & 67108863;
        long b3 = (tp22 >>> 26) & (-1);
        long tp32 = tp3 + b3;
        this.h3 = ((int) tp32) & 67108863;
        long b4 = tp32 >>> 26;
        long tp42 = tp4 + b4;
        this.h4 = ((int) tp42) & 67108863;
        long b5 = tp42 >>> 26;
        this.h0 = (int) (this.h0 + (b5 * 5));
    }

    @Override // org.spongycastle.crypto.Mac
    public int doFinal(byte[] out, int outOff) throws DataLengthException, IllegalStateException {
        if (outOff + 16 > out.length) {
            throw new DataLengthException("Output buffer is too short.");
        }
        if (this.currentBlockOffset > 0) {
            processBlock();
        }
        int b = this.h0 >>> 26;
        this.h0 &= 67108863;
        this.h1 += b;
        int b2 = this.h1 >>> 26;
        this.h1 &= 67108863;
        this.h2 += b2;
        int b3 = this.h2 >>> 26;
        this.h2 &= 67108863;
        this.h3 += b3;
        int b4 = this.h3 >>> 26;
        this.h3 &= 67108863;
        this.h4 += b4;
        int b5 = this.h4 >>> 26;
        this.h4 &= 67108863;
        this.h0 += b5 * 5;
        int g0 = this.h0 + 5;
        int b6 = g0 >>> 26;
        int g02 = g0 & 67108863;
        int g1 = this.h1 + b6;
        int b7 = g1 >>> 26;
        int g12 = g1 & 67108863;
        int g2 = this.h2 + b7;
        int b8 = g2 >>> 26;
        int g22 = g2 & 67108863;
        int g3 = this.h3 + b8;
        int b9 = g3 >>> 26;
        int g32 = g3 & 67108863;
        int g4 = (this.h4 + b9) - 67108864;
        int b10 = (g4 >>> 31) - 1;
        int nb = b10 ^ (-1);
        this.h0 = (this.h0 & nb) | (g02 & b10);
        this.h1 = (this.h1 & nb) | (g12 & b10);
        this.h2 = (this.h2 & nb) | (g22 & b10);
        this.h3 = (this.h3 & nb) | (g32 & b10);
        this.h4 = (this.h4 & nb) | (g4 & b10);
        long f0 = ((this.h0 | (this.h1 << 26)) & 4294967295L) + (4294967295L & this.k0);
        long f3 = (((this.h3 >>> 18) | (this.h4 << 8)) & 4294967295L) + (4294967295L & this.k3);
        Pack.intToLittleEndian((int) f0, out, outOff);
        long f1 = (((this.h1 >>> 6) | (this.h2 << 20)) & 4294967295L) + (4294967295L & this.k1) + (f0 >>> 32);
        Pack.intToLittleEndian((int) f1, out, outOff + 4);
        long f2 = (((this.h2 >>> 12) | (this.h3 << 14)) & 4294967295L) + (4294967295L & this.k2) + (f1 >>> 32);
        Pack.intToLittleEndian((int) f2, out, outOff + 8);
        Pack.intToLittleEndian((int) (f3 + (f2 >>> 32)), out, outOff + 12);
        reset();
        return 16;
    }

    @Override // org.spongycastle.crypto.Mac
    public void reset() {
        this.currentBlockOffset = 0;
        this.h4 = 0;
        this.h3 = 0;
        this.h2 = 0;
        this.h1 = 0;
        this.h0 = 0;
    }

    private static final long mul32x32_64(int i1, int i2) {
        return i1 * i2;
    }
}
