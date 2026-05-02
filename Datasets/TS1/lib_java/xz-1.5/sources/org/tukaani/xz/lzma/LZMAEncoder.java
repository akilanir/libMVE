package org.tukaani.xz.lzma;

import org.tukaani.xz.lz.LZEncoder;
import org.tukaani.xz.lz.Matches;
import org.tukaani.xz.lzma.LZMACoder;
import org.tukaani.xz.rangecoder.RangeEncoder;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMAEncoder.class */
public abstract class LZMAEncoder extends LZMACoder {
    public static final int MODE_FAST = 1;
    public static final int MODE_NORMAL = 2;
    private static final int LZMA2_UNCOMPRESSED_LIMIT = 2096879;
    private static final int LZMA2_COMPRESSED_LIMIT = 65510;
    private static final int DIST_PRICE_UPDATE_INTERVAL = 128;
    private static final int ALIGN_PRICE_UPDATE_INTERVAL = 16;
    private final RangeEncoder rc;
    final LZEncoder lz;
    final LiteralEncoder literalEncoder;
    final LengthEncoder matchLenEncoder;
    final LengthEncoder repLenEncoder;
    final int niceLen;
    private int distPriceCount;
    private int alignPriceCount;
    private final int distSlotPricesSize;
    private final int[][] distSlotPrices;
    private final int[][] fullDistPrices;
    private final int[] alignPrices;
    int back;
    int readAhead;
    private int uncompressedSize;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$lzma$LZMAEncoder;

    /* renamed from: org.tukaani.xz.lzma.LZMAEncoder$1, reason: invalid class name */
    /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMAEncoder$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMAEncoder$LengthEncoder.class */
    class LengthEncoder extends LZMACoder.LengthCoder {
        private static final int PRICE_UPDATE_INTERVAL = 32;
        private final int[] counters;
        private final int[][] prices;
        private final LZMAEncoder this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        LengthEncoder(LZMAEncoder lZMAEncoder, int i, int i2) {
            super(lZMAEncoder);
            this.this$0 = lZMAEncoder;
            int i3 = 1 << i;
            this.counters = new int[i3];
            this.prices = new int[i3][Math.max((i2 - 2) + 1, LZMAEncoder.ALIGN_PRICE_UPDATE_INTERVAL)];
        }

        @Override // org.tukaani.xz.lzma.LZMACoder.LengthCoder
        void reset() {
            super.reset();
            for (int i = 0; i < this.counters.length; i++) {
                this.counters[i] = 0;
            }
        }

        void encode(int i, int i2) {
            int i3 = i - 2;
            if (i3 < 8) {
                this.this$0.rc.encodeBit(this.choice, 0, 0);
                this.this$0.rc.encodeBitTree(this.low[i2], i3);
            } else {
                this.this$0.rc.encodeBit(this.choice, 0, 1);
                int i4 = i3 - 8;
                if (i4 < 8) {
                    this.this$0.rc.encodeBit(this.choice, 1, 0);
                    this.this$0.rc.encodeBitTree(this.mid[i2], i4);
                } else {
                    this.this$0.rc.encodeBit(this.choice, 1, 1);
                    this.this$0.rc.encodeBitTree(this.high, i4 - 8);
                }
            }
            int[] iArr = this.counters;
            iArr[i2] = iArr[i2] - 1;
        }

        int getPrice(int i, int i2) {
            return this.prices[i2][i - 2];
        }

        void updatePrices() {
            for (int i = 0; i < this.counters.length; i++) {
                if (this.counters[i] <= 0) {
                    this.counters[i] = PRICE_UPDATE_INTERVAL;
                    updatePrices(i);
                }
            }
        }

        private void updatePrices(int i) {
            int bitPrice = RangeEncoder.getBitPrice(this.choice[0], 0);
            int i2 = 0;
            while (i2 < 8) {
                this.prices[i][i2] = bitPrice + RangeEncoder.getBitTreePrice(this.low[i], i2);
                i2++;
            }
            int bitPrice2 = RangeEncoder.getBitPrice(this.choice[0], 1);
            int bitPrice3 = RangeEncoder.getBitPrice(this.choice[1], 0);
            while (i2 < LZMAEncoder.ALIGN_PRICE_UPDATE_INTERVAL) {
                this.prices[i][i2] = bitPrice2 + bitPrice3 + RangeEncoder.getBitTreePrice(this.mid[i], i2 - 8);
                i2++;
            }
            int bitPrice4 = RangeEncoder.getBitPrice(this.choice[1], 1);
            while (i2 < this.prices[i].length) {
                this.prices[i][i2] = bitPrice2 + bitPrice4 + RangeEncoder.getBitTreePrice(this.high, (i2 - 8) - 8);
                i2++;
            }
        }
    }

    /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder.class */
    class LiteralEncoder extends LZMACoder.LiteralCoder {
        LiteralSubencoder[] subencoders;
        static final boolean $assertionsDisabled;
        private final LZMAEncoder this$0;

        /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder.class */
        private class LiteralSubencoder extends LZMACoder.LiteralCoder.LiteralSubcoder {
            private final LiteralEncoder this$1;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            private LiteralSubencoder(LiteralEncoder literalEncoder) {
                super(literalEncoder);
                this.this$1 = literalEncoder;
            }

            void encode() {
                int i = this.this$1.this$0.lz.getByte(this.this$1.this$0.readAhead) | 256;
                if (this.this$1.this$0.state.isLiteral()) {
                    do {
                        this.this$1.this$0.rc.encodeBit(this.probs, i >>> 8, (i >>> 7) & 1);
                        i <<= 1;
                    } while (i < 65536);
                } else {
                    int i2 = this.this$1.this$0.lz.getByte(this.this$1.this$0.reps[0] + 1 + this.this$1.this$0.readAhead);
                    int i3 = 256;
                    do {
                        i2 <<= 1;
                        this.this$1.this$0.rc.encodeBit(this.probs, i3 + (i2 & i3) + (i >>> 8), (i >>> 7) & 1);
                        i <<= 1;
                        i3 &= (i2 ^ i) ^ (-1);
                    } while (i < 65536);
                }
                this.this$1.this$0.state.updateLiteral();
            }

            int getNormalPrice(int i) {
                int i2 = 0;
                int i3 = i | 256;
                do {
                    i2 += RangeEncoder.getBitPrice(this.probs[i3 >>> 8], (i3 >>> 7) & 1);
                    i3 <<= 1;
                } while (i3 < 65536);
                return i2;
            }

            int getMatchedPrice(int i, int i2) {
                int i3 = 0;
                int i4 = 256;
                int i5 = i | 256;
                do {
                    i2 <<= 1;
                    i3 += RangeEncoder.getBitPrice(this.probs[i4 + (i2 & i4) + (i5 >>> 8)], (i5 >>> 7) & 1);
                    i5 <<= 1;
                    i4 &= (i2 ^ i5) ^ (-1);
                } while (i5 < 65536);
                return i3;
            }

            LiteralSubencoder(LiteralEncoder literalEncoder, AnonymousClass1 anonymousClass1) {
                this(literalEncoder);
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        LiteralEncoder(LZMAEncoder lZMAEncoder, int i, int i2) {
            super(lZMAEncoder, i, i2);
            this.this$0 = lZMAEncoder;
            this.subencoders = new LiteralSubencoder[1 << (i + i2)];
            for (int i3 = 0; i3 < this.subencoders.length; i3++) {
                this.subencoders[i3] = new LiteralSubencoder(this, null);
            }
        }

        void reset() {
            for (int i = 0; i < this.subencoders.length; i++) {
                this.subencoders[i].reset();
            }
        }

        void encodeInit() {
            if (!$assertionsDisabled && this.this$0.readAhead < 0) {
                throw new AssertionError();
            }
            this.subencoders[0].encode();
        }

        void encode() {
            if (!$assertionsDisabled && this.this$0.readAhead < 0) {
                throw new AssertionError();
            }
            this.subencoders[getSubcoderIndex(this.this$0.lz.getByte(1 + this.this$0.readAhead), this.this$0.lz.getPos() - this.this$0.readAhead)].encode();
        }

        int getPrice(int i, int i2, int i3, int i4, State state) {
            int bitPrice = RangeEncoder.getBitPrice(this.this$0.isMatch[state.get()][i4 & this.this$0.posMask], 0);
            int subcoderIndex = getSubcoderIndex(i3, i4);
            return bitPrice + (state.isLiteral() ? this.subencoders[subcoderIndex].getNormalPrice(i) : this.subencoders[subcoderIndex].getMatchedPrice(i, i2));
        }

        static {
            Class cls;
            if (LZMAEncoder.class$org$tukaani$xz$lzma$LZMAEncoder == null) {
                cls = LZMAEncoder.class$("org.tukaani.xz.lzma.LZMAEncoder");
                LZMAEncoder.class$org$tukaani$xz$lzma$LZMAEncoder = cls;
            } else {
                cls = LZMAEncoder.class$org$tukaani$xz$lzma$LZMAEncoder;
            }
            $assertionsDisabled = !cls.desiredAssertionStatus();
        }
    }

    public static int getMemoryUsage(int i, int i2, int i3, int i4) {
        int memoryUsage;
        switch (i) {
            case 1:
                memoryUsage = 80 + LZMAEncoderFast.getMemoryUsage(i2, i3, i4);
                break;
            case 2:
                memoryUsage = 80 + LZMAEncoderNormal.getMemoryUsage(i2, i3, i4);
                break;
            default:
                throw new IllegalArgumentException();
        }
        return memoryUsage;
    }

    public static LZMAEncoder getInstance(RangeEncoder rangeEncoder, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9) {
        switch (i4) {
            case 1:
                return new LZMAEncoderFast(rangeEncoder, i, i2, i3, i5, i6, i7, i8, i9);
            case 2:
                return new LZMAEncoderNormal(rangeEncoder, i, i2, i3, i5, i6, i7, i8, i9);
            default:
                throw new IllegalArgumentException();
        }
    }

    public static int getDistSlot(int i) {
        if (i <= 4) {
            return i;
        }
        int i2 = i;
        int i3 = 31;
        if ((i2 & (-65536)) == 0) {
            i2 <<= ALIGN_PRICE_UPDATE_INTERVAL;
            i3 = 15;
        }
        if ((i2 & (-16777216)) == 0) {
            i2 <<= 8;
            i3 -= 8;
        }
        if ((i2 & (-268435456)) == 0) {
            i2 <<= 4;
            i3 -= 4;
        }
        if ((i2 & (-1073741824)) == 0) {
            i2 <<= 2;
            i3 -= 2;
        }
        if ((i2 & Integer.MIN_VALUE) == 0) {
            i3--;
        }
        return (i3 << 1) + ((i >>> (i3 - 1)) & 1);
    }

    abstract int getNextSymbol();

    LZMAEncoder(RangeEncoder rangeEncoder, LZEncoder lZEncoder, int i, int i2, int i3, int i4, int i5) {
        super(i3);
        this.distPriceCount = 0;
        this.alignPriceCount = 0;
        this.fullDistPrices = new int[4][DIST_PRICE_UPDATE_INTERVAL];
        this.alignPrices = new int[ALIGN_PRICE_UPDATE_INTERVAL];
        this.back = 0;
        this.readAhead = -1;
        this.uncompressedSize = 0;
        this.rc = rangeEncoder;
        this.lz = lZEncoder;
        this.niceLen = i5;
        this.literalEncoder = new LiteralEncoder(this, i, i2);
        this.matchLenEncoder = new LengthEncoder(this, i3, i5);
        this.repLenEncoder = new LengthEncoder(this, i3, i5);
        this.distSlotPricesSize = getDistSlot(i4 - 1) + 1;
        this.distSlotPrices = new int[4][this.distSlotPricesSize];
        reset();
    }

    public LZEncoder getLZEncoder() {
        return this.lz;
    }

    @Override // org.tukaani.xz.lzma.LZMACoder
    public void reset() {
        super.reset();
        this.literalEncoder.reset();
        this.matchLenEncoder.reset();
        this.repLenEncoder.reset();
        this.distPriceCount = 0;
        this.alignPriceCount = 0;
        this.uncompressedSize += this.readAhead + 1;
        this.readAhead = -1;
    }

    public int getUncompressedSize() {
        return this.uncompressedSize;
    }

    public void resetUncompressedSize() {
        this.uncompressedSize = 0;
    }

    public boolean encodeForLZMA2() {
        if (!this.lz.isStarted() && !encodeInit()) {
            return false;
        }
        while (this.uncompressedSize <= LZMA2_UNCOMPRESSED_LIMIT && this.rc.getPendingSize() <= LZMA2_COMPRESSED_LIMIT) {
            if (!encodeSymbol()) {
                return false;
            }
        }
        return true;
    }

    private boolean encodeInit() {
        if (!$assertionsDisabled && this.readAhead != -1) {
            throw new AssertionError();
        }
        if (!this.lz.hasEnoughData(0)) {
            return false;
        }
        skip(1);
        this.rc.encodeBit(this.isMatch[this.state.get()], 0, 0);
        this.literalEncoder.encodeInit();
        this.readAhead--;
        if (!$assertionsDisabled && this.readAhead != -1) {
            throw new AssertionError();
        }
        this.uncompressedSize++;
        if ($assertionsDisabled || this.uncompressedSize == 1) {
            return true;
        }
        throw new AssertionError();
    }

    private boolean encodeSymbol() {
        if (!this.lz.hasEnoughData(this.readAhead + 1)) {
            return false;
        }
        int nextSymbol = getNextSymbol();
        if (!$assertionsDisabled && this.readAhead < 0) {
            throw new AssertionError();
        }
        int pos = (this.lz.getPos() - this.readAhead) & this.posMask;
        if (this.back != -1) {
            this.rc.encodeBit(this.isMatch[this.state.get()], pos, 1);
            if (this.back < 4) {
                if (!$assertionsDisabled && this.lz.getMatchLen(-this.readAhead, this.reps[this.back], nextSymbol) != nextSymbol) {
                    throw new AssertionError();
                }
                this.rc.encodeBit(this.isRep, this.state.get(), 1);
                encodeRepMatch(this.back, nextSymbol, pos);
            } else {
                if (!$assertionsDisabled && this.lz.getMatchLen(-this.readAhead, this.back - 4, nextSymbol) != nextSymbol) {
                    throw new AssertionError();
                }
                this.rc.encodeBit(this.isRep, this.state.get(), 0);
                encodeMatch(this.back - 4, nextSymbol, pos);
            }
        } else {
            if (!$assertionsDisabled && nextSymbol != 1) {
                throw new AssertionError();
            }
            this.rc.encodeBit(this.isMatch[this.state.get()], pos, 0);
            this.literalEncoder.encode();
        }
        this.readAhead -= nextSymbol;
        this.uncompressedSize += nextSymbol;
        return true;
    }

    private void encodeMatch(int i, int i2, int i3) {
        this.state.updateMatch();
        this.matchLenEncoder.encode(i2, i3);
        int distSlot = getDistSlot(i);
        this.rc.encodeBitTree(this.distSlots[getDistState(i2)], distSlot);
        if (distSlot >= 4) {
            int i4 = (distSlot >>> 1) - 1;
            int i5 = i - ((2 | (distSlot & 1)) << i4);
            if (distSlot < 14) {
                this.rc.encodeReverseBitTree(this.distSpecial[distSlot - 4], i5);
            } else {
                this.rc.encodeDirectBits(i5 >>> 4, i4 - 4);
                this.rc.encodeReverseBitTree(this.distAlign, i5 & 15);
                this.alignPriceCount--;
            }
        }
        this.reps[3] = this.reps[2];
        this.reps[2] = this.reps[1];
        this.reps[1] = this.reps[0];
        this.reps[0] = i;
        this.distPriceCount--;
    }

    private void encodeRepMatch(int i, int i2, int i3) {
        if (i == 0) {
            this.rc.encodeBit(this.isRep0, this.state.get(), 0);
            this.rc.encodeBit(this.isRep0Long[this.state.get()], i3, i2 == 1 ? 0 : 1);
        } else {
            int i4 = this.reps[i];
            this.rc.encodeBit(this.isRep0, this.state.get(), 1);
            if (i == 1) {
                this.rc.encodeBit(this.isRep1, this.state.get(), 0);
            } else {
                this.rc.encodeBit(this.isRep1, this.state.get(), 1);
                this.rc.encodeBit(this.isRep2, this.state.get(), i - 2);
                if (i == 3) {
                    this.reps[3] = this.reps[2];
                }
                this.reps[2] = this.reps[1];
            }
            this.reps[1] = this.reps[0];
            this.reps[0] = i4;
        }
        if (i2 == 1) {
            this.state.updateShortRep();
        } else {
            this.repLenEncoder.encode(i2, i3);
            this.state.updateLongRep();
        }
    }

    Matches getMatches() {
        this.readAhead++;
        Matches matches = this.lz.getMatches();
        if ($assertionsDisabled || this.lz.verifyMatches(matches)) {
            return matches;
        }
        throw new AssertionError();
    }

    void skip(int i) {
        this.readAhead += i;
        this.lz.skip(i);
    }

    int getAnyMatchPrice(State state, int i) {
        return RangeEncoder.getBitPrice(this.isMatch[state.get()][i], 1);
    }

    int getNormalMatchPrice(int i, State state) {
        return i + RangeEncoder.getBitPrice(this.isRep[state.get()], 0);
    }

    int getAnyRepPrice(int i, State state) {
        return i + RangeEncoder.getBitPrice(this.isRep[state.get()], 1);
    }

    int getShortRepPrice(int i, State state, int i2) {
        return i + RangeEncoder.getBitPrice(this.isRep0[state.get()], 0) + RangeEncoder.getBitPrice(this.isRep0Long[state.get()][i2], 0);
    }

    int getLongRepPrice(int i, int i2, State state, int i3) {
        int bitPrice;
        if (i2 == 0) {
            bitPrice = i + RangeEncoder.getBitPrice(this.isRep0[state.get()], 0) + RangeEncoder.getBitPrice(this.isRep0Long[state.get()][i3], 1);
        } else {
            int bitPrice2 = i + RangeEncoder.getBitPrice(this.isRep0[state.get()], 1);
            bitPrice = i2 == 1 ? bitPrice2 + RangeEncoder.getBitPrice(this.isRep1[state.get()], 0) : bitPrice2 + RangeEncoder.getBitPrice(this.isRep1[state.get()], 1) + RangeEncoder.getBitPrice(this.isRep2[state.get()], i2 - 2);
        }
        return bitPrice;
    }

    int getLongRepAndLenPrice(int i, int i2, State state, int i3) {
        return getLongRepPrice(getAnyRepPrice(getAnyMatchPrice(state, i3), state), i, state, i3) + this.repLenEncoder.getPrice(i2, i3);
    }

    int getMatchAndLenPrice(int i, int i2, int i3, int i4) {
        int i5;
        int price = i + this.matchLenEncoder.getPrice(i3, i4);
        int distState = getDistState(i3);
        if (i2 < DIST_PRICE_UPDATE_INTERVAL) {
            i5 = price + this.fullDistPrices[distState][i2];
        } else {
            i5 = price + this.distSlotPrices[distState][getDistSlot(i2)] + this.alignPrices[i2 & 15];
        }
        return i5;
    }

    private void updateDistPrices() {
        this.distPriceCount = DIST_PRICE_UPDATE_INTERVAL;
        for (int i = 0; i < 4; i++) {
            for (int i2 = 0; i2 < this.distSlotPricesSize; i2++) {
                this.distSlotPrices[i][i2] = RangeEncoder.getBitTreePrice(this.distSlots[i], i2);
            }
            for (int i3 = 14; i3 < this.distSlotPricesSize; i3++) {
                int[] iArr = this.distSlotPrices[i];
                int i4 = i3;
                iArr[i4] = iArr[i4] + RangeEncoder.getDirectBitsPrice(((i3 >>> 1) - 1) - 4);
            }
            for (int i5 = 0; i5 < 4; i5++) {
                this.fullDistPrices[i][i5] = this.distSlotPrices[i][i5];
            }
        }
        int i6 = 4;
        for (int i7 = 4; i7 < 14; i7++) {
            int i8 = (2 | (i7 & 1)) << ((i7 >>> 1) - 1);
            int length = this.distSpecial[i7 - 4].length;
            for (int i9 = 0; i9 < length; i9++) {
                int reverseBitTreePrice = RangeEncoder.getReverseBitTreePrice(this.distSpecial[i7 - 4], i6 - i8);
                for (int i10 = 0; i10 < 4; i10++) {
                    this.fullDistPrices[i10][i6] = this.distSlotPrices[i10][i7] + reverseBitTreePrice;
                }
                i6++;
            }
        }
        if (!$assertionsDisabled && i6 != DIST_PRICE_UPDATE_INTERVAL) {
            throw new AssertionError();
        }
    }

    private void updateAlignPrices() {
        this.alignPriceCount = ALIGN_PRICE_UPDATE_INTERVAL;
        for (int i = 0; i < ALIGN_PRICE_UPDATE_INTERVAL; i++) {
            this.alignPrices[i] = RangeEncoder.getReverseBitTreePrice(this.distAlign, i);
        }
    }

    void updatePrices() {
        if (this.distPriceCount <= 0) {
            updateDistPrices();
        }
        if (this.alignPriceCount <= 0) {
            updateAlignPrices();
        }
        this.matchLenEncoder.updatePrices();
        this.repLenEncoder.updatePrices();
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
        if (class$org$tukaani$xz$lzma$LZMAEncoder == null) {
            cls = class$("org.tukaani.xz.lzma.LZMAEncoder");
            class$org$tukaani$xz$lzma$LZMAEncoder = cls;
        } else {
            cls = class$org$tukaani$xz$lzma$LZMAEncoder;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
