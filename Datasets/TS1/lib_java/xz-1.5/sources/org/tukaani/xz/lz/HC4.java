package org.tukaani.xz.lz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lz/HC4.class */
final class HC4 extends LZEncoder {
    private final Hash234 hash;
    private final int[] chain;
    private final Matches matches;
    private final int depthLimit;
    private final int cyclicSize;
    private int cyclicPos;
    private int lzPos;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$lz$HC4;

    static int getMemoryUsage(int i) {
        return Hash234.getMemoryUsage(i) + (i / 256) + 10;
    }

    HC4(int i, int i2, int i3, int i4, int i5, int i6) {
        super(i, i2, i3, i4, i5);
        this.cyclicPos = -1;
        this.hash = new Hash234(i);
        this.cyclicSize = i + 1;
        this.chain = new int[this.cyclicSize];
        this.lzPos = this.cyclicSize;
        this.matches = new Matches(i4 - 1);
        this.depthLimit = i6 > 0 ? i6 : 4 + (i4 / 4);
    }

    private int movePos() {
        int movePos = movePos(4, 4);
        if (movePos != 0) {
            int i = this.lzPos + 1;
            this.lzPos = i;
            if (i == Integer.MAX_VALUE) {
                int i2 = Integer.MAX_VALUE - this.cyclicSize;
                this.hash.normalize(i2);
                normalize(this.chain, i2);
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

    /* JADX WARN: Code restructure failed: missing block: B:43:0x0186, code lost:
    
        return r6.matches;
     */
    @Override // org.tukaani.xz.lz.LZEncoder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public org.tukaani.xz.lz.Matches getMatches() {
        /*
            Method dump skipped, instructions count: 596
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.tukaani.xz.lz.HC4.getMatches():org.tukaani.xz.lz.Matches");
    }

    @Override // org.tukaani.xz.lz.LZEncoder
    public void skip(int i) {
        if (!$assertionsDisabled && i < 0) {
            throw new AssertionError();
        }
        while (true) {
            int i2 = i;
            i--;
            if (i2 <= 0) {
                return;
            }
            if (movePos() != 0) {
                this.hash.calcHashes(this.buf, this.readPos);
                this.chain[this.cyclicPos] = this.hash.getHash4Pos();
                this.hash.updateTables(this.lzPos);
            }
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    static {
        Class cls;
        if (class$org$tukaani$xz$lz$HC4 == null) {
            cls = class$("org.tukaani.xz.lz.HC4");
            class$org$tukaani$xz$lz$HC4 = cls;
        } else {
            cls = class$org$tukaani$xz$lz$HC4;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
