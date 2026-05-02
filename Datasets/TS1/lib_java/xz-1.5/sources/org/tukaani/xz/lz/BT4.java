package org.tukaani.xz.lz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lz/BT4.class */
final class BT4 extends LZEncoder {
    private final Hash234 hash;
    private final int[] tree;
    private final Matches matches;
    private final int depthLimit;
    private final int cyclicSize;
    private int cyclicPos;
    private int lzPos;

    static int getMemoryUsage(int i) {
        return Hash234.getMemoryUsage(i) + (i / 128) + 10;
    }

    BT4(int i, int i2, int i3, int i4, int i5, int i6) {
        super(i, i2, i3, i4, i5);
        this.cyclicPos = -1;
        this.cyclicSize = i + 1;
        this.lzPos = this.cyclicSize;
        this.hash = new Hash234(i);
        this.tree = new int[this.cyclicSize * 2];
        this.matches = new Matches(i4 - 1);
        this.depthLimit = i6 > 0 ? i6 : 16 + (i4 / 2);
    }

    private int movePos() {
        int movePos = movePos(this.niceLen, 4);
        if (movePos != 0) {
            int i = this.lzPos + 1;
            this.lzPos = i;
            if (i == Integer.MAX_VALUE) {
                int i2 = Integer.MAX_VALUE - this.cyclicSize;
                this.hash.normalize(i2);
                normalize(this.tree, i2);
                this.lzPos -= i2;
            }
            int i3 = this.cyclicPos + 1;
            this.cyclicPos = i3;
            if (i3 == this.cyclicSize) {
                this.cyclicPos = 0;
            }
        }
        return movePos;
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x0196, code lost:
    
        r6.tree[r15] = 0;
        r6.tree[r16] = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x01aa, code lost:
    
        return r6.matches;
     */
    @Override // org.tukaani.xz.lz.LZEncoder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public org.tukaani.xz.lz.Matches getMatches() {
        /*
            Method dump skipped, instructions count: 736
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.tukaani.xz.lz.BT4.getMatches():org.tukaani.xz.lz.Matches");
    }

    /* JADX WARN: Code restructure failed: missing block: B:7:0x0035, code lost:
    
        r6.tree[r10] = 0;
        r6.tree[r11] = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0045, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void skip(int r7, int r8) {
        /*
            Method dump skipped, instructions count: 302
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.tukaani.xz.lz.BT4.skip(int, int):void");
    }

    @Override // org.tukaani.xz.lz.LZEncoder
    public void skip(int i) {
        while (true) {
            int i2 = i;
            i--;
            if (i2 <= 0) {
                return;
            }
            int i3 = this.niceLen;
            int movePos = movePos();
            if (movePos < i3) {
                if (movePos != 0) {
                    i3 = movePos;
                }
            }
            this.hash.calcHashes(this.buf, this.readPos);
            int hash4Pos = this.hash.getHash4Pos();
            this.hash.updateTables(this.lzPos);
            skip(i3, hash4Pos);
        }
    }
}
