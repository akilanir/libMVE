package org.apache.commons.compress.compressors.bzip2;

import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.compress.archivers.cpio.CpioConstants;
import org.apache.commons.compress.archivers.tar.TarConstants;
import org.apache.commons.compress.compressors.CompressorInputStream;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream.class */
public class BZip2CompressorInputStream extends CompressorInputStream implements BZip2Constants {
    private int last;
    private int origPtr;
    private int blockSize100k;
    private boolean blockRandomised;
    private int bsBuff;
    private int bsLive;
    private final CRC crc;
    private int nInUse;
    private InputStream in;
    private final boolean decompressConcatenated;
    private static final int EOF = 0;
    private static final int START_BLOCK_STATE = 1;
    private static final int RAND_PART_A_STATE = 2;
    private static final int RAND_PART_B_STATE = 3;
    private static final int RAND_PART_C_STATE = 4;
    private static final int NO_RAND_PART_A_STATE = 5;
    private static final int NO_RAND_PART_B_STATE = 6;
    private static final int NO_RAND_PART_C_STATE = 7;
    private int currentState;
    private int storedBlockCRC;
    private int storedCombinedCRC;
    private int computedBlockCRC;
    private int computedCombinedCRC;
    private int su_count;
    private int su_ch2;
    private int su_chPrev;
    private int su_i2;
    private int su_j2;
    private int su_rNToGo;
    private int su_rTPos;
    private int su_tPos;
    private char su_z;
    private Data data;

    public BZip2CompressorInputStream(InputStream in) throws IOException {
        this(in, false);
    }

    public BZip2CompressorInputStream(InputStream in, boolean decompressConcatenated) throws IOException {
        this.crc = new CRC();
        this.currentState = 1;
        this.in = in;
        this.decompressConcatenated = decompressConcatenated;
        init(true);
        initBlock();
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (this.in != null) {
            int r = read0();
            count(r < 0 ? -1 : 1);
            return r;
        }
        throw new IOException("stream closed");
    }

    @Override // java.io.InputStream
    public int read(byte[] dest, int offs, int len) throws IOException {
        int b;
        if (offs < 0) {
            throw new IndexOutOfBoundsException("offs(" + offs + ") < 0.");
        }
        if (len < 0) {
            throw new IndexOutOfBoundsException("len(" + len + ") < 0.");
        }
        if (offs + len > dest.length) {
            throw new IndexOutOfBoundsException("offs(" + offs + ") + len(" + len + ") > dest.length(" + dest.length + ").");
        }
        if (this.in == null) {
            throw new IOException("stream closed");
        }
        if (len == 0) {
            return 0;
        }
        int hi = offs + len;
        int destOffs = offs;
        while (destOffs < hi && (b = read0()) >= 0) {
            int i = destOffs;
            destOffs++;
            dest[i] = (byte) b;
            count(1);
        }
        int c = destOffs == offs ? -1 : destOffs - offs;
        return c;
    }

    private void makeMaps() {
        boolean[] inUse = this.data.inUse;
        byte[] seqToUnseq = this.data.seqToUnseq;
        int nInUseShadow = 0;
        for (int i = 0; i < 256; i++) {
            if (inUse[i]) {
                int i2 = nInUseShadow;
                nInUseShadow++;
                seqToUnseq[i2] = (byte) i;
            }
        }
        this.nInUse = nInUseShadow;
    }

    private int read0() throws IOException {
        switch (this.currentState) {
            case 0:
                return -1;
            case 1:
                return setupBlock();
            case 2:
                throw new IllegalStateException();
            case 3:
                return setupRandPartB();
            case 4:
                return setupRandPartC();
            case 5:
                throw new IllegalStateException();
            case 6:
                return setupNoRandPartB();
            case 7:
                return setupNoRandPartC();
            default:
                throw new IllegalStateException();
        }
    }

    private boolean init(boolean isFirstStream) throws IOException {
        if (null == this.in) {
            throw new IOException("No InputStream");
        }
        int magic0 = this.in.read();
        if (magic0 == -1 && !isFirstStream) {
            return false;
        }
        int magic1 = this.in.read();
        int magic2 = this.in.read();
        if (magic0 != 66 || magic1 != 90 || magic2 != 104) {
            throw new IOException(isFirstStream ? "Stream is not in the BZip2 format" : "Garbage after a valid BZip2 stream");
        }
        int blockSize = this.in.read();
        if (blockSize < 49 || blockSize > 57) {
            throw new IOException("BZip2 block size is invalid");
        }
        this.blockSize100k = blockSize - 48;
        this.bsLive = 0;
        this.computedCombinedCRC = 0;
        return true;
    }

    private void initBlock() throws IOException {
        do {
            char magic0 = bsGetUByte();
            char magic1 = bsGetUByte();
            char magic2 = bsGetUByte();
            char magic3 = bsGetUByte();
            char magic4 = bsGetUByte();
            char magic5 = bsGetUByte();
            if (magic0 != 23 || magic1 != 'r' || magic2 != 'E' || magic3 != '8' || magic4 != 'P' || magic5 != 144) {
                if (magic0 != '1' || magic1 != 'A' || magic2 != 'Y' || magic3 != '&' || magic4 != 'S' || magic5 != 'Y') {
                    this.currentState = 0;
                    throw new IOException("bad block header");
                }
                this.storedBlockCRC = bsGetInt();
                this.blockRandomised = bsR(1) == 1;
                if (this.data == null) {
                    this.data = new Data(this.blockSize100k);
                }
                getAndMoveToFrontDecode();
                this.crc.initialiseCRC();
                this.currentState = 1;
                return;
            }
        } while (!complete());
    }

    private void endBlock() throws IOException {
        this.computedBlockCRC = this.crc.getFinalCRC();
        if (this.storedBlockCRC != this.computedBlockCRC) {
            this.computedCombinedCRC = (this.storedCombinedCRC << 1) | (this.storedCombinedCRC >>> 31);
            this.computedCombinedCRC ^= this.storedBlockCRC;
            throw new IOException("BZip2 CRC error");
        }
        this.computedCombinedCRC = (this.computedCombinedCRC << 1) | (this.computedCombinedCRC >>> 31);
        this.computedCombinedCRC ^= this.computedBlockCRC;
    }

    private boolean complete() throws IOException {
        this.storedCombinedCRC = bsGetInt();
        this.currentState = 0;
        this.data = null;
        if (this.storedCombinedCRC != this.computedCombinedCRC) {
            throw new IOException("BZip2 CRC error");
        }
        return (this.decompressConcatenated && init(false)) ? false : true;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        InputStream inShadow = this.in;
        if (inShadow != null) {
            try {
                if (inShadow != System.in) {
                    inShadow.close();
                }
            } finally {
                this.data = null;
                this.in = null;
            }
        }
    }

    private int bsR(int n) throws IOException {
        int bsLiveShadow = this.bsLive;
        int bsBuffShadow = this.bsBuff;
        if (bsLiveShadow < n) {
            InputStream inShadow = this.in;
            do {
                int thech = inShadow.read();
                if (thech < 0) {
                    throw new IOException("unexpected end of stream");
                }
                bsBuffShadow = (bsBuffShadow << 8) | thech;
                bsLiveShadow += 8;
            } while (bsLiveShadow < n);
            this.bsBuff = bsBuffShadow;
        }
        this.bsLive = bsLiveShadow - n;
        return (bsBuffShadow >> (bsLiveShadow - n)) & ((1 << n) - 1);
    }

    private boolean bsGetBit() throws IOException {
        int bsLiveShadow = this.bsLive;
        int bsBuffShadow = this.bsBuff;
        if (bsLiveShadow < 1) {
            int thech = this.in.read();
            if (thech < 0) {
                throw new IOException("unexpected end of stream");
            }
            bsBuffShadow = (bsBuffShadow << 8) | thech;
            bsLiveShadow += 8;
            this.bsBuff = bsBuffShadow;
        }
        this.bsLive = bsLiveShadow - 1;
        return ((bsBuffShadow >> (bsLiveShadow - 1)) & 1) != 0;
    }

    private char bsGetUByte() throws IOException {
        return (char) bsR(8);
    }

    private int bsGetInt() throws IOException {
        return (((((bsR(8) << 8) | bsR(8)) << 8) | bsR(8)) << 8) | bsR(8);
    }

    private static void hbCreateDecodeTables(int[] limit, int[] base, int[] perm, char[] length, int minLen, int maxLen, int alphaSize) {
        int pp = 0;
        for (int i = minLen; i <= maxLen; i++) {
            for (int j = 0; j < alphaSize; j++) {
                if (length[j] == i) {
                    int i2 = pp;
                    pp++;
                    perm[i2] = j;
                }
            }
        }
        int i3 = 23;
        while (true) {
            i3--;
            if (i3 <= 0) {
                break;
            }
            base[i3] = 0;
            limit[i3] = 0;
        }
        for (int i4 = 0; i4 < alphaSize; i4++) {
            int i5 = length[i4] + 1;
            base[i5] = base[i5] + 1;
        }
        int b = base[0];
        for (int i6 = 1; i6 < 23; i6++) {
            b += base[i6];
            base[i6] = b;
        }
        int i7 = minLen;
        int vec = 0;
        int b2 = base[i7];
        while (i7 <= maxLen) {
            int nb = base[i7 + 1];
            int vec2 = vec + (nb - b2);
            b2 = nb;
            limit[i7] = vec2 - 1;
            vec = vec2 << 1;
            i7++;
        }
        for (int i8 = minLen + 1; i8 <= maxLen; i8++) {
            base[i8] = ((limit[i8 - 1] + 1) << 1) - base[i8];
        }
    }

    private void recvDecodingTables() throws IOException {
        Data dataShadow = this.data;
        boolean[] inUse = dataShadow.inUse;
        byte[] pos = dataShadow.recvDecodingTables_pos;
        byte[] selector = dataShadow.selector;
        byte[] selectorMtf = dataShadow.selectorMtf;
        int inUse16 = 0;
        for (int i = 0; i < 16; i++) {
            if (bsGetBit()) {
                inUse16 |= 1 << i;
            }
        }
        int i2 = 256;
        while (true) {
            i2--;
            if (i2 < 0) {
                break;
            } else {
                inUse[i2] = false;
            }
        }
        for (int i3 = 0; i3 < 16; i3++) {
            if ((inUse16 & (1 << i3)) != 0) {
                int i16 = i3 << 4;
                for (int j = 0; j < 16; j++) {
                    if (bsGetBit()) {
                        inUse[i16 + j] = true;
                    }
                }
            }
        }
        makeMaps();
        int alphaSize = this.nInUse + 2;
        int nGroups = bsR(3);
        int nSelectors = bsR(15);
        for (int i4 = 0; i4 < nSelectors; i4++) {
            int j2 = 0;
            while (bsGetBit()) {
                j2++;
            }
            selectorMtf[i4] = (byte) j2;
        }
        int v = nGroups;
        while (true) {
            v--;
            if (v < 0) {
                break;
            } else {
                pos[v] = (byte) v;
            }
        }
        for (int i5 = 0; i5 < nSelectors; i5++) {
            int v2 = selectorMtf[i5] & 255;
            byte tmp = pos[v2];
            while (v2 > 0) {
                pos[v2] = pos[v2 - 1];
                v2--;
            }
            pos[0] = tmp;
            selector[i5] = tmp;
        }
        char[][] len = dataShadow.temp_charArray2d;
        for (int t = 0; t < nGroups; t++) {
            int curr = bsR(5);
            char[] len_t = len[t];
            for (int i6 = 0; i6 < alphaSize; i6++) {
                while (bsGetBit()) {
                    curr += bsGetBit() ? -1 : 1;
                }
                len_t[i6] = (char) curr;
            }
        }
        createHuffmanDecodingTables(alphaSize, nGroups);
    }

    private void createHuffmanDecodingTables(int alphaSize, int nGroups) {
        Data dataShadow = this.data;
        char[][] len = dataShadow.temp_charArray2d;
        int[] minLens = dataShadow.minLens;
        int[][] limit = dataShadow.limit;
        int[][] base = dataShadow.base;
        int[][] perm = dataShadow.perm;
        for (int t = 0; t < nGroups; t++) {
            int minLen = 32;
            int maxLen = 0;
            char[] len_t = len[t];
            int i = alphaSize;
            while (true) {
                i--;
                if (i >= 0) {
                    char lent = len_t[i];
                    if (lent > maxLen) {
                        maxLen = lent;
                    }
                    if (lent < minLen) {
                        minLen = lent;
                    }
                }
            }
            hbCreateDecodeTables(limit[t], base[t], perm[t], len[t], minLen, maxLen, alphaSize);
            minLens[t] = minLen;
        }
    }

    private void getAndMoveToFrontDecode() throws IOException {
        this.origPtr = bsR(24);
        recvDecodingTables();
        InputStream inShadow = this.in;
        Data dataShadow = this.data;
        byte[] ll8 = dataShadow.ll8;
        int[] unzftab = dataShadow.unzftab;
        byte[] selector = dataShadow.selector;
        byte[] seqToUnseq = dataShadow.seqToUnseq;
        char[] yy = dataShadow.getAndMoveToFrontDecode_yy;
        int[] minLens = dataShadow.minLens;
        int[][] limit = dataShadow.limit;
        int[][] base = dataShadow.base;
        int[][] perm = dataShadow.perm;
        int limitLast = this.blockSize100k * BZip2Constants.BASEBLOCKSIZE;
        int i = 256;
        while (true) {
            i--;
            if (i < 0) {
                break;
            }
            yy[i] = (char) i;
            unzftab[i] = 0;
        }
        int groupNo = 0;
        int groupPos = 49;
        int eob = this.nInUse + 1;
        int nextSym = getAndMoveToFrontDecode0(0);
        int bsBuffShadow = this.bsBuff;
        int bsLiveShadow = this.bsLive;
        int lastShadow = -1;
        int zt = selector[0] & 255;
        int[] base_zt = base[zt];
        int[] limit_zt = limit[zt];
        int[] perm_zt = perm[zt];
        int minLens_zt = minLens[zt];
        while (nextSym != eob) {
            if (nextSym == 0 || nextSym == 1) {
                int s = -1;
                int i2 = 1;
                while (true) {
                    int n = i2;
                    if (nextSym == 0) {
                        s += n;
                    } else if (nextSym == 1) {
                        s += n << 1;
                    } else {
                        byte ch = seqToUnseq[yy[0]];
                        int i3 = ch & 255;
                        unzftab[i3] = unzftab[i3] + s + 1;
                        while (true) {
                            int i4 = s;
                            s--;
                            if (i4 < 0) {
                                break;
                            }
                            lastShadow++;
                            ll8[lastShadow] = ch;
                        }
                        if (lastShadow >= limitLast) {
                            throw new IOException("block overrun");
                        }
                    }
                    if (groupPos == 0) {
                        groupPos = 49;
                        groupNo++;
                        int zt2 = selector[groupNo] & 255;
                        base_zt = base[zt2];
                        limit_zt = limit[zt2];
                        perm_zt = perm[zt2];
                        minLens_zt = minLens[zt2];
                    } else {
                        groupPos--;
                    }
                    int zn = minLens_zt;
                    while (bsLiveShadow < zn) {
                        int thech = inShadow.read();
                        if (thech >= 0) {
                            bsBuffShadow = (bsBuffShadow << 8) | thech;
                            bsLiveShadow += 8;
                        } else {
                            throw new IOException("unexpected end of stream");
                        }
                    }
                    int zvec = (bsBuffShadow >> (bsLiveShadow - zn)) & ((1 << zn) - 1);
                    bsLiveShadow -= zn;
                    while (zvec > limit_zt[zn]) {
                        zn++;
                        while (bsLiveShadow < 1) {
                            int thech2 = inShadow.read();
                            if (thech2 >= 0) {
                                bsBuffShadow = (bsBuffShadow << 8) | thech2;
                                bsLiveShadow += 8;
                            } else {
                                throw new IOException("unexpected end of stream");
                            }
                        }
                        bsLiveShadow--;
                        zvec = (zvec << 1) | ((bsBuffShadow >> bsLiveShadow) & 1);
                    }
                    nextSym = perm_zt[zvec - base_zt[zn]];
                    i2 = n << 1;
                }
            } else {
                lastShadow++;
                if (lastShadow >= limitLast) {
                    throw new IOException("block overrun");
                }
                char tmp = yy[nextSym - 1];
                int i5 = seqToUnseq[tmp] & 255;
                unzftab[i5] = unzftab[i5] + 1;
                ll8[lastShadow] = seqToUnseq[tmp];
                if (nextSym <= 16) {
                    int j = nextSym - 1;
                    while (j > 0) {
                        int i6 = j;
                        j--;
                        yy[i6] = yy[j];
                    }
                } else {
                    System.arraycopy(yy, 0, yy, 1, nextSym - 1);
                }
                yy[0] = tmp;
                if (groupPos == 0) {
                    groupPos = 49;
                    groupNo++;
                    int zt3 = selector[groupNo] & 255;
                    base_zt = base[zt3];
                    limit_zt = limit[zt3];
                    perm_zt = perm[zt3];
                    minLens_zt = minLens[zt3];
                } else {
                    groupPos--;
                }
                int zn2 = minLens_zt;
                while (bsLiveShadow < zn2) {
                    int thech3 = inShadow.read();
                    if (thech3 >= 0) {
                        bsBuffShadow = (bsBuffShadow << 8) | thech3;
                        bsLiveShadow += 8;
                    } else {
                        throw new IOException("unexpected end of stream");
                    }
                }
                int zvec2 = (bsBuffShadow >> (bsLiveShadow - zn2)) & ((1 << zn2) - 1);
                bsLiveShadow -= zn2;
                while (zvec2 > limit_zt[zn2]) {
                    zn2++;
                    while (bsLiveShadow < 1) {
                        int thech4 = inShadow.read();
                        if (thech4 >= 0) {
                            bsBuffShadow = (bsBuffShadow << 8) | thech4;
                            bsLiveShadow += 8;
                        } else {
                            throw new IOException("unexpected end of stream");
                        }
                    }
                    bsLiveShadow--;
                    zvec2 = (zvec2 << 1) | ((bsBuffShadow >> bsLiveShadow) & 1);
                }
                nextSym = perm_zt[zvec2 - base_zt[zn2]];
            }
        }
        this.last = lastShadow;
        this.bsLive = bsLiveShadow;
        this.bsBuff = bsBuffShadow;
    }

    private int getAndMoveToFrontDecode0(int groupNo) throws IOException {
        InputStream inShadow = this.in;
        Data dataShadow = this.data;
        int zt = dataShadow.selector[groupNo] & 255;
        int[] limit_zt = dataShadow.limit[zt];
        int zn = dataShadow.minLens[zt];
        int zvec = bsR(zn);
        int bsLiveShadow = this.bsLive;
        int bsBuffShadow = this.bsBuff;
        while (zvec > limit_zt[zn]) {
            zn++;
            while (bsLiveShadow < 1) {
                int thech = inShadow.read();
                if (thech >= 0) {
                    bsBuffShadow = (bsBuffShadow << 8) | thech;
                    bsLiveShadow += 8;
                } else {
                    throw new IOException("unexpected end of stream");
                }
            }
            bsLiveShadow--;
            zvec = (zvec << 1) | ((bsBuffShadow >> bsLiveShadow) & 1);
        }
        this.bsLive = bsLiveShadow;
        this.bsBuff = bsBuffShadow;
        return dataShadow.perm[zt][zvec - dataShadow.base[zt][zn]];
    }

    private int setupBlock() throws IOException {
        if (this.currentState == 0 || this.data == null) {
            return -1;
        }
        int[] cftab = this.data.cftab;
        int[] tt = this.data.initTT(this.last + 1);
        byte[] ll8 = this.data.ll8;
        cftab[0] = 0;
        System.arraycopy(this.data.unzftab, 0, cftab, 1, CpioConstants.C_IRUSR);
        int c = cftab[0];
        for (int i = 1; i <= 256; i++) {
            c += cftab[i];
            cftab[i] = c;
        }
        int lastShadow = this.last;
        for (int i2 = 0; i2 <= lastShadow; i2++) {
            int i3 = ll8[i2] & 255;
            int i4 = cftab[i3];
            cftab[i3] = i4 + 1;
            tt[i4] = i2;
        }
        if (this.origPtr < 0 || this.origPtr >= tt.length) {
            throw new IOException("stream corrupted");
        }
        this.su_tPos = tt[this.origPtr];
        this.su_count = 0;
        this.su_i2 = 0;
        this.su_ch2 = CpioConstants.C_IRUSR;
        if (this.blockRandomised) {
            this.su_rNToGo = 0;
            this.su_rTPos = 0;
            return setupRandPartA();
        }
        return setupNoRandPartA();
    }

    private int setupRandPartA() throws IOException {
        if (this.su_i2 <= this.last) {
            this.su_chPrev = this.su_ch2;
            int su_ch2Shadow = this.data.ll8[this.su_tPos] & 255;
            this.su_tPos = this.data.tt[this.su_tPos];
            if (this.su_rNToGo == 0) {
                this.su_rNToGo = Rand.rNums(this.su_rTPos) - 1;
                int i = this.su_rTPos + 1;
                this.su_rTPos = i;
                if (i == 512) {
                    this.su_rTPos = 0;
                }
            } else {
                this.su_rNToGo--;
            }
            int su_ch2Shadow2 = su_ch2Shadow ^ (this.su_rNToGo == 1 ? 1 : 0);
            this.su_ch2 = su_ch2Shadow2;
            this.su_i2++;
            this.currentState = 3;
            this.crc.updateCRC(su_ch2Shadow2);
            return su_ch2Shadow2;
        }
        endBlock();
        initBlock();
        return setupBlock();
    }

    private int setupNoRandPartA() throws IOException {
        if (this.su_i2 <= this.last) {
            this.su_chPrev = this.su_ch2;
            int su_ch2Shadow = this.data.ll8[this.su_tPos] & 255;
            this.su_ch2 = su_ch2Shadow;
            this.su_tPos = this.data.tt[this.su_tPos];
            this.su_i2++;
            this.currentState = 6;
            this.crc.updateCRC(su_ch2Shadow);
            return su_ch2Shadow;
        }
        this.currentState = 5;
        endBlock();
        initBlock();
        return setupBlock();
    }

    private int setupRandPartB() throws IOException {
        if (this.su_ch2 != this.su_chPrev) {
            this.currentState = 2;
            this.su_count = 1;
            return setupRandPartA();
        }
        int i = this.su_count + 1;
        this.su_count = i;
        if (i >= 4) {
            this.su_z = (char) (this.data.ll8[this.su_tPos] & 255);
            this.su_tPos = this.data.tt[this.su_tPos];
            if (this.su_rNToGo == 0) {
                this.su_rNToGo = Rand.rNums(this.su_rTPos) - 1;
                int i2 = this.su_rTPos + 1;
                this.su_rTPos = i2;
                if (i2 == 512) {
                    this.su_rTPos = 0;
                }
            } else {
                this.su_rNToGo--;
            }
            this.su_j2 = 0;
            this.currentState = 4;
            if (this.su_rNToGo == 1) {
                this.su_z = (char) (this.su_z ^ 1);
            }
            return setupRandPartC();
        }
        this.currentState = 2;
        return setupRandPartA();
    }

    private int setupRandPartC() throws IOException {
        if (this.su_j2 < this.su_z) {
            this.crc.updateCRC(this.su_ch2);
            this.su_j2++;
            return this.su_ch2;
        }
        this.currentState = 2;
        this.su_i2++;
        this.su_count = 0;
        return setupRandPartA();
    }

    private int setupNoRandPartB() throws IOException {
        if (this.su_ch2 != this.su_chPrev) {
            this.su_count = 1;
            return setupNoRandPartA();
        }
        int i = this.su_count + 1;
        this.su_count = i;
        if (i >= 4) {
            this.su_z = (char) (this.data.ll8[this.su_tPos] & 255);
            this.su_tPos = this.data.tt[this.su_tPos];
            this.su_j2 = 0;
            return setupNoRandPartC();
        }
        return setupNoRandPartA();
    }

    private int setupNoRandPartC() throws IOException {
        if (this.su_j2 < this.su_z) {
            int su_ch2Shadow = this.su_ch2;
            this.crc.updateCRC(su_ch2Shadow);
            this.su_j2++;
            this.currentState = 7;
            return su_ch2Shadow;
        }
        this.su_i2++;
        this.su_count = 0;
        return setupNoRandPartA();
    }

    /* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data.class */
    private static final class Data {
        final boolean[] inUse = new boolean[CpioConstants.C_IRUSR];
        final byte[] seqToUnseq = new byte[CpioConstants.C_IRUSR];
        final byte[] selector = new byte[BZip2Constants.MAX_SELECTORS];
        final byte[] selectorMtf = new byte[BZip2Constants.MAX_SELECTORS];
        final int[] unzftab = new int[CpioConstants.C_IRUSR];
        final int[][] limit = new int[6][BZip2Constants.MAX_ALPHA_SIZE];
        final int[][] base = new int[6][BZip2Constants.MAX_ALPHA_SIZE];
        final int[][] perm = new int[6][BZip2Constants.MAX_ALPHA_SIZE];
        final int[] minLens = new int[6];
        final int[] cftab = new int[TarConstants.MAGIC_OFFSET];
        final char[] getAndMoveToFrontDecode_yy = new char[CpioConstants.C_IRUSR];
        final char[][] temp_charArray2d = new char[6][BZip2Constants.MAX_ALPHA_SIZE];
        final byte[] recvDecodingTables_pos = new byte[6];
        int[] tt;
        byte[] ll8;

        Data(int blockSize100k) {
            this.ll8 = new byte[blockSize100k * BZip2Constants.BASEBLOCKSIZE];
        }

        int[] initTT(int length) {
            int[] ttShadow = this.tt;
            if (ttShadow == null || ttShadow.length < length) {
                int[] iArr = new int[length];
                ttShadow = iArr;
                this.tt = iArr;
            }
            return ttShadow;
        }
    }

    public static boolean matches(byte[] signature, int length) {
        if (length < 3 || signature[0] != 66 || signature[1] != 90 || signature[2] != 104) {
            return false;
        }
        return true;
    }
}
