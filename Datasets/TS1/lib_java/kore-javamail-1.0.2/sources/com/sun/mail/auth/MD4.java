package com.sun.mail.auth;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/auth/MD4.class */
public final class MD4 {
    private static final int blockSize = 64;
    private int bufOfs;
    private long bytesProcessed;
    private static final int S11 = 3;
    private static final int S12 = 7;
    private static final int S13 = 11;
    private static final int S14 = 19;
    private static final int S21 = 3;
    private static final int S22 = 5;
    private static final int S23 = 9;
    private static final int S24 = 13;
    private static final int S31 = 3;
    private static final int S32 = 9;
    private static final int S33 = 11;
    private static final int S34 = 15;
    private static final byte[] padding = new byte[136];
    private final byte[] buffer = new byte[blockSize];
    private final int[] state = new int[4];
    private final int[] x = new int[16];

    static {
        padding[0] = Byte.MIN_VALUE;
    }

    public MD4() {
        implReset();
    }

    public byte[] digest(byte[] in) {
        implReset();
        engineUpdate(in, 0, in.length);
        byte[] out = new byte[16];
        implDigest(out, 0);
        return out;
    }

    private void implReset() {
        this.state[0] = 1732584193;
        this.state[1] = -271733879;
        this.state[2] = -1732584194;
        this.state[3] = 271733878;
        this.bufOfs = 0;
        this.bytesProcessed = 0L;
    }

    private void implDigest(byte[] out, int ofs) {
        long bitsProcessed = this.bytesProcessed << 3;
        int index = ((int) this.bytesProcessed) & 63;
        int padLen = index < 56 ? 56 - index : 120 - index;
        engineUpdate(padding, 0, padLen);
        this.buffer[56] = (byte) bitsProcessed;
        this.buffer[57] = (byte) (bitsProcessed >> 8);
        this.buffer[58] = (byte) (bitsProcessed >> 16);
        this.buffer[59] = (byte) (bitsProcessed >> 24);
        this.buffer[60] = (byte) (bitsProcessed >> 32);
        this.buffer[61] = (byte) (bitsProcessed >> 40);
        this.buffer[62] = (byte) (bitsProcessed >> 48);
        this.buffer[63] = (byte) (bitsProcessed >> 56);
        implCompress(this.buffer, 0);
        for (int i = 0; i < this.state.length; i++) {
            int x = this.state[i];
            int i2 = ofs;
            int ofs2 = ofs + 1;
            out[i2] = (byte) x;
            int ofs3 = ofs2 + 1;
            out[ofs2] = (byte) (x >> 8);
            int ofs4 = ofs3 + 1;
            out[ofs3] = (byte) (x >> 16);
            ofs = ofs4 + 1;
            out[ofs4] = (byte) (x >> 24);
        }
    }

    private void engineUpdate(byte[] b, int ofs, int len) {
        if (len == 0) {
            return;
        }
        if (ofs < 0 || len < 0 || ofs > b.length - len) {
            throw new ArrayIndexOutOfBoundsException();
        }
        if (this.bytesProcessed < 0) {
            implReset();
        }
        this.bytesProcessed += len;
        if (this.bufOfs != 0) {
            int n = Math.min(len, blockSize - this.bufOfs);
            System.arraycopy(b, ofs, this.buffer, this.bufOfs, n);
            this.bufOfs += n;
            ofs += n;
            len -= n;
            if (this.bufOfs >= blockSize) {
                implCompress(this.buffer, 0);
                this.bufOfs = 0;
            }
        }
        while (len >= blockSize) {
            implCompress(b, ofs);
            len -= 64;
            ofs += blockSize;
        }
        if (len > 0) {
            System.arraycopy(b, ofs, this.buffer, 0, len);
            this.bufOfs = len;
        }
    }

    private static int FF(int a, int b, int c, int d, int x, int s) {
        int a2 = a + ((b & c) | ((b ^ (-1)) & d)) + x;
        return (a2 << s) | (a2 >>> (32 - s));
    }

    private static int GG(int a, int b, int c, int d, int x, int s) {
        int a2 = a + ((b & c) | (b & d) | (c & d)) + x + 1518500249;
        return (a2 << s) | (a2 >>> (32 - s));
    }

    private static int HH(int a, int b, int c, int d, int x, int s) {
        int a2 = a + ((b ^ c) ^ d) + x + 1859775393;
        return (a2 << s) | (a2 >>> (32 - s));
    }

    private void implCompress(byte[] buf, int ofs) {
        for (int xfs = 0; xfs < this.x.length; xfs++) {
            this.x[xfs] = (buf[ofs] & 255) | ((buf[ofs + 1] & 255) << 8) | ((buf[ofs + 2] & 255) << 16) | ((buf[ofs + 3] & 255) << 24);
            ofs += 4;
        }
        int a = this.state[0];
        int b = this.state[1];
        int c = this.state[2];
        int d = this.state[3];
        int a2 = FF(a, b, c, d, this.x[0], 3);
        int d2 = FF(d, a2, b, c, this.x[1], S12);
        int c2 = FF(c, d2, a2, b, this.x[2], 11);
        int b2 = FF(b, c2, d2, a2, this.x[3], S14);
        int a3 = FF(a2, b2, c2, d2, this.x[4], 3);
        int d3 = FF(d2, a3, b2, c2, this.x[5], S12);
        int c3 = FF(c2, d3, a3, b2, this.x[6], 11);
        int b3 = FF(b2, c3, d3, a3, this.x[S12], S14);
        int a4 = FF(a3, b3, c3, d3, this.x[8], 3);
        int d4 = FF(d3, a4, b3, c3, this.x[9], S12);
        int c4 = FF(c3, d4, a4, b3, this.x[10], 11);
        int b4 = FF(b3, c4, d4, a4, this.x[11], S14);
        int a5 = FF(a4, b4, c4, d4, this.x[12], 3);
        int d5 = FF(d4, a5, b4, c4, this.x[S24], S12);
        int c5 = FF(c4, d5, a5, b4, this.x[14], 11);
        int b5 = FF(b4, c5, d5, a5, this.x[S34], S14);
        int a6 = GG(a5, b5, c5, d5, this.x[0], 3);
        int d6 = GG(d5, a6, b5, c5, this.x[4], 5);
        int c6 = GG(c5, d6, a6, b5, this.x[8], 9);
        int b6 = GG(b5, c6, d6, a6, this.x[12], S24);
        int a7 = GG(a6, b6, c6, d6, this.x[1], 3);
        int d7 = GG(d6, a7, b6, c6, this.x[5], 5);
        int c7 = GG(c6, d7, a7, b6, this.x[9], 9);
        int b7 = GG(b6, c7, d7, a7, this.x[S24], S24);
        int a8 = GG(a7, b7, c7, d7, this.x[2], 3);
        int d8 = GG(d7, a8, b7, c7, this.x[6], 5);
        int c8 = GG(c7, d8, a8, b7, this.x[10], 9);
        int b8 = GG(b7, c8, d8, a8, this.x[14], S24);
        int a9 = GG(a8, b8, c8, d8, this.x[3], 3);
        int d9 = GG(d8, a9, b8, c8, this.x[S12], 5);
        int c9 = GG(c8, d9, a9, b8, this.x[11], 9);
        int b9 = GG(b8, c9, d9, a9, this.x[S34], S24);
        int a10 = HH(a9, b9, c9, d9, this.x[0], 3);
        int d10 = HH(d9, a10, b9, c9, this.x[8], 9);
        int c10 = HH(c9, d10, a10, b9, this.x[4], 11);
        int b10 = HH(b9, c10, d10, a10, this.x[12], S34);
        int a11 = HH(a10, b10, c10, d10, this.x[2], 3);
        int d11 = HH(d10, a11, b10, c10, this.x[10], 9);
        int c11 = HH(c10, d11, a11, b10, this.x[6], 11);
        int b11 = HH(b10, c11, d11, a11, this.x[14], S34);
        int a12 = HH(a11, b11, c11, d11, this.x[1], 3);
        int d12 = HH(d11, a12, b11, c11, this.x[9], 9);
        int c12 = HH(c11, d12, a12, b11, this.x[5], 11);
        int b12 = HH(b11, c12, d12, a12, this.x[S24], S34);
        int a13 = HH(a12, b12, c12, d12, this.x[3], 3);
        int d13 = HH(d12, a13, b12, c12, this.x[11], 9);
        int c13 = HH(c12, d13, a13, b12, this.x[S12], 11);
        int b13 = HH(b12, c13, d13, a13, this.x[S34], S34);
        int[] iArr = this.state;
        iArr[0] = iArr[0] + a13;
        int[] iArr2 = this.state;
        iArr2[1] = iArr2[1] + b13;
        int[] iArr3 = this.state;
        iArr3[2] = iArr3[2] + c13;
        int[] iArr4 = this.state;
        iArr4[3] = iArr4[3] + d13;
    }
}
