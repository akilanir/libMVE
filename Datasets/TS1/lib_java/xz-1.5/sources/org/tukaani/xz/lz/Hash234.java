package org.tukaani.xz.lz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lz/Hash234.class */
final class Hash234 extends CRC32Hash {
    private static final int HASH_2_SIZE = 1024;
    private static final int HASH_2_MASK = 1023;
    private static final int HASH_3_SIZE = 65536;
    private static final int HASH_3_MASK = 65535;
    private final int hash4Mask;
    private final int[] hash4Table;
    private final int[] hash2Table = new int[1024];
    private final int[] hash3Table = new int[HASH_3_SIZE];
    private int hash2Value = 0;
    private int hash3Value = 0;
    private int hash4Value = 0;

    static int getHash4Size(int i) {
        int i2 = i - 1;
        int i3 = i2 | (i2 >>> 1);
        int i4 = i3 | (i3 >>> 2);
        int i5 = i4 | (i4 >>> 4);
        int i6 = ((i5 | (i5 >>> 8)) >>> 1) | HASH_3_MASK;
        if (i6 > 16777216) {
            i6 >>>= 1;
        }
        return i6 + 1;
    }

    static int getMemoryUsage(int i) {
        return ((66560 + getHash4Size(i)) / 256) + 4;
    }

    Hash234(int i) {
        this.hash4Table = new int[getHash4Size(i)];
        this.hash4Mask = this.hash4Table.length - 1;
    }

    void calcHashes(byte[] bArr, int i) {
        int i2 = crcTable[bArr[i] & 255] ^ (bArr[i + 1] & 255);
        this.hash2Value = i2 & HASH_2_MASK;
        int i3 = i2 ^ ((bArr[i + 2] & 255) << 8);
        this.hash3Value = i3 & HASH_3_MASK;
        this.hash4Value = (i3 ^ (crcTable[bArr[i + 3] & 255] << 5)) & this.hash4Mask;
    }

    int getHash2Pos() {
        return this.hash2Table[this.hash2Value];
    }

    int getHash3Pos() {
        return this.hash3Table[this.hash3Value];
    }

    int getHash4Pos() {
        return this.hash4Table[this.hash4Value];
    }

    void updateTables(int i) {
        this.hash2Table[this.hash2Value] = i;
        this.hash3Table[this.hash3Value] = i;
        this.hash4Table[this.hash4Value] = i;
    }

    void normalize(int i) {
        LZEncoder.normalize(this.hash2Table, i);
        LZEncoder.normalize(this.hash3Table, i);
        LZEncoder.normalize(this.hash4Table, i);
    }
}
