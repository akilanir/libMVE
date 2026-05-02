package org.tukaani.xz.lzma;

import org.tukaani.xz.rangecoder.RangeCoder;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMACoder.class */
abstract class LZMACoder {
    static final int POS_STATES_MAX = 16;
    static final int MATCH_LEN_MIN = 2;
    static final int MATCH_LEN_MAX = 273;
    static final int DIST_STATES = 4;
    static final int DIST_SLOTS = 64;
    static final int DIST_MODEL_START = 4;
    static final int DIST_MODEL_END = 14;
    static final int FULL_DISTANCES = 128;
    static final int ALIGN_BITS = 4;
    static final int ALIGN_SIZE = 16;
    static final int ALIGN_MASK = 15;
    static final int REPS = 4;
    final int posMask;
    final int[] reps = new int[4];
    final State state = new State();
    final short[][] isMatch = new short[12][16];
    final short[] isRep = new short[12];
    final short[] isRep0 = new short[12];
    final short[] isRep1 = new short[12];
    final short[] isRep2 = new short[12];
    final short[][] isRep0Long = new short[12][16];
    final short[][] distSlots = new short[4][DIST_SLOTS];
    final short[][] distSpecial = {new short[2], new short[2], new short[4], new short[4], new short[8], new short[8], new short[16], new short[16], new short[32], new short[32]};
    final short[] distAlign = new short[16];

    /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMACoder$LengthCoder.class */
    abstract class LengthCoder {
        static final int LOW_SYMBOLS = 8;
        static final int MID_SYMBOLS = 8;
        static final int HIGH_SYMBOLS = 256;
        final short[] choice = new short[2];
        final short[][] low = new short[16][8];
        final short[][] mid = new short[16][8];
        final short[] high = new short[256];
        private final LZMACoder this$0;

        LengthCoder(LZMACoder lZMACoder) {
            this.this$0 = lZMACoder;
        }

        void reset() {
            RangeCoder.initProbs(this.choice);
            for (int i = 0; i < this.low.length; i++) {
                RangeCoder.initProbs(this.low[i]);
            }
            for (int i2 = 0; i2 < this.low.length; i2++) {
                RangeCoder.initProbs(this.mid[i2]);
            }
            RangeCoder.initProbs(this.high);
        }
    }

    /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMACoder$LiteralCoder.class */
    abstract class LiteralCoder {
        private final int lc;
        private final int literalPosMask;
        private final LZMACoder this$0;

        /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMACoder$LiteralCoder$LiteralSubcoder.class */
        abstract class LiteralSubcoder {
            final short[] probs = new short[768];
            private final LiteralCoder this$1;

            LiteralSubcoder(LiteralCoder literalCoder) {
                this.this$1 = literalCoder;
            }

            void reset() {
                RangeCoder.initProbs(this.probs);
            }
        }

        LiteralCoder(LZMACoder lZMACoder, int i, int i2) {
            this.this$0 = lZMACoder;
            this.lc = i;
            this.literalPosMask = (1 << i2) - 1;
        }

        final int getSubcoderIndex(int i, int i2) {
            return (i >> (8 - this.lc)) + ((i2 & this.literalPosMask) << this.lc);
        }
    }

    static final int getDistState(int i) {
        if (i < 6) {
            return i - 2;
        }
        return 3;
    }

    /* JADX WARN: Type inference failed for: r1v18, types: [short[], short[][]] */
    LZMACoder(int i) {
        this.posMask = (1 << i) - 1;
    }

    void reset() {
        this.reps[0] = 0;
        this.reps[1] = 0;
        this.reps[2] = 0;
        this.reps[3] = 0;
        this.state.reset();
        for (int i = 0; i < this.isMatch.length; i++) {
            RangeCoder.initProbs(this.isMatch[i]);
        }
        RangeCoder.initProbs(this.isRep);
        RangeCoder.initProbs(this.isRep0);
        RangeCoder.initProbs(this.isRep1);
        RangeCoder.initProbs(this.isRep2);
        for (int i2 = 0; i2 < this.isRep0Long.length; i2++) {
            RangeCoder.initProbs(this.isRep0Long[i2]);
        }
        for (int i3 = 0; i3 < this.distSlots.length; i3++) {
            RangeCoder.initProbs(this.distSlots[i3]);
        }
        for (int i4 = 0; i4 < this.distSpecial.length; i4++) {
            RangeCoder.initProbs(this.distSpecial[i4]);
        }
        RangeCoder.initProbs(this.distAlign);
    }
}
