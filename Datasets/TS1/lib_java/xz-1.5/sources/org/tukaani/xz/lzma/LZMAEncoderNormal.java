package org.tukaani.xz.lzma;

import org.tukaani.xz.LZMA2Options;
import org.tukaani.xz.lz.LZEncoder;
import org.tukaani.xz.lz.Matches;
import org.tukaani.xz.rangecoder.RangeEncoder;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMAEncoderNormal.class */
final class LZMAEncoderNormal extends LZMAEncoder {
    private static final int OPTS = 4096;
    private static int EXTRA_SIZE_BEFORE;
    private static int EXTRA_SIZE_AFTER;
    private final Optimum[] opts;
    private int optCur;
    private int optEnd;
    private Matches matches;
    private final int[] repLens;
    private final State nextState;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$lzma$LZMAEncoderNormal;

    static int getMemoryUsage(int i, int i2, int i3) {
        return LZEncoder.getMemoryUsage(i, Math.max(i2, EXTRA_SIZE_BEFORE), EXTRA_SIZE_AFTER, LZMA2Options.NICE_LEN_MAX, i3) + 256;
    }

    LZMAEncoderNormal(RangeEncoder rangeEncoder, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        super(rangeEncoder, LZEncoder.getInstance(i4, Math.max(i5, EXTRA_SIZE_BEFORE), EXTRA_SIZE_AFTER, i6, LZMA2Options.NICE_LEN_MAX, i7, i8), i, i2, i3, i4, i6);
        this.opts = new Optimum[4096];
        this.optCur = 0;
        this.optEnd = 0;
        this.repLens = new int[4];
        this.nextState = new State();
        for (int i9 = 0; i9 < 4096; i9++) {
            this.opts[i9] = new Optimum();
        }
    }

    @Override // org.tukaani.xz.lzma.LZMAEncoder, org.tukaani.xz.lzma.LZMACoder
    public void reset() {
        this.optCur = 0;
        this.optEnd = 0;
        super.reset();
    }

    private int convertOpts() {
        this.optEnd = this.optCur;
        int i = this.opts[this.optCur].optPrev;
        do {
            Optimum optimum = this.opts[this.optCur];
            if (optimum.prev1IsLiteral) {
                this.opts[i].optPrev = this.optCur;
                this.opts[i].backPrev = -1;
                int i2 = i;
                i--;
                this.optCur = i2;
                if (optimum.hasPrev2) {
                    this.opts[i].optPrev = i + 1;
                    this.opts[i].backPrev = optimum.backPrev2;
                    this.optCur = i;
                    i = optimum.optPrev2;
                }
            }
            int i3 = this.opts[i].optPrev;
            this.opts[i].optPrev = this.optCur;
            this.optCur = i;
            i = i3;
        } while (this.optCur > 0);
        this.optCur = this.opts[0].optPrev;
        this.back = this.opts[this.optCur].backPrev;
        return this.optCur;
    }

    @Override // org.tukaani.xz.lzma.LZMAEncoder
    int getNextSymbol() {
        int shortRepPrice;
        if (this.optCur < this.optEnd) {
            int i = this.opts[this.optCur].optPrev - this.optCur;
            this.optCur = this.opts[this.optCur].optPrev;
            this.back = this.opts[this.optCur].backPrev;
            return i;
        }
        if (!$assertionsDisabled && this.optCur != this.optEnd) {
            throw new AssertionError();
        }
        this.optCur = 0;
        this.optEnd = 0;
        this.back = -1;
        if (this.readAhead == -1) {
            this.matches = getMatches();
        }
        int min = Math.min(this.lz.getAvail(), LZMA2Options.NICE_LEN_MAX);
        if (min < 2) {
            return 1;
        }
        int i2 = 0;
        for (int i3 = 0; i3 < 4; i3++) {
            this.repLens[i3] = this.lz.getMatchLen(this.reps[i3], min);
            if (this.repLens[i3] < 2) {
                this.repLens[i3] = 0;
            } else if (this.repLens[i3] > this.repLens[i2]) {
                i2 = i3;
            }
        }
        if (this.repLens[i2] >= this.niceLen) {
            this.back = i2;
            skip(this.repLens[i2] - 1);
            return this.repLens[i2];
        }
        int i4 = 0;
        if (this.matches.count > 0) {
            i4 = this.matches.len[this.matches.count - 1];
            int i5 = this.matches.dist[this.matches.count - 1];
            if (i4 >= this.niceLen) {
                this.back = i5 + 4;
                skip(i4 - 1);
                return i4;
            }
        }
        int i6 = this.lz.getByte(0);
        int i7 = this.lz.getByte(this.reps[0] + 1);
        if (i4 < 2 && i6 != i7 && this.repLens[i2] < 2) {
            return 1;
        }
        int pos = this.lz.getPos();
        int i8 = pos & this.posMask;
        this.opts[1].set1(this.literalEncoder.getPrice(i6, i7, this.lz.getByte(1), pos, this.state), 0, -1);
        int anyMatchPrice = getAnyMatchPrice(this.state, i8);
        int anyRepPrice = getAnyRepPrice(anyMatchPrice, this.state);
        if (i7 == i6 && (shortRepPrice = getShortRepPrice(anyRepPrice, this.state, i8)) < this.opts[1].price) {
            this.opts[1].set1(shortRepPrice, 0, 0);
        }
        this.optEnd = Math.max(i4, this.repLens[i2]);
        if (this.optEnd < 2) {
            if (!$assertionsDisabled && this.optEnd != 0) {
                throw new AssertionError(this.optEnd);
            }
            this.back = this.opts[1].backPrev;
            return 1;
        }
        updatePrices();
        this.opts[0].state.set(this.state);
        System.arraycopy(this.reps, 0, this.opts[0].reps, 0, 4);
        for (int i9 = this.optEnd; i9 >= 2; i9--) {
            this.opts[i9].reset();
        }
        for (int i10 = 0; i10 < 4; i10++) {
            int i11 = this.repLens[i10];
            if (i11 >= 2) {
                int longRepPrice = getLongRepPrice(anyRepPrice, i10, this.state, i8);
                do {
                    int price = longRepPrice + this.repLenEncoder.getPrice(i11, i8);
                    if (price < this.opts[i11].price) {
                        this.opts[i11].set1(price, 0, i10);
                    }
                    i11--;
                } while (i11 >= 2);
            }
        }
        int max = Math.max(this.repLens[0] + 1, 2);
        if (max <= i4) {
            int normalMatchPrice = getNormalMatchPrice(anyMatchPrice, this.state);
            int i12 = 0;
            while (max > this.matches.len[i12]) {
                i12++;
            }
            while (true) {
                int i13 = this.matches.dist[i12];
                int matchAndLenPrice = getMatchAndLenPrice(normalMatchPrice, i13, max, i8);
                if (matchAndLenPrice < this.opts[max].price) {
                    this.opts[max].set1(matchAndLenPrice, 0, i13 + 4);
                }
                if (max == this.matches.len[i12]) {
                    i12++;
                    if (i12 == this.matches.count) {
                        break;
                    }
                }
                max++;
            }
        }
        int min2 = Math.min(this.lz.getAvail(), 4095);
        while (true) {
            int i14 = this.optCur + 1;
            this.optCur = i14;
            if (i14 >= this.optEnd) {
                break;
            }
            this.matches = getMatches();
            if (this.matches.count > 0 && this.matches.len[this.matches.count - 1] >= this.niceLen) {
                break;
            }
            min2--;
            pos++;
            int i15 = pos & this.posMask;
            updateOptStateAndReps();
            int anyMatchPrice2 = this.opts[this.optCur].price + getAnyMatchPrice(this.opts[this.optCur].state, i15);
            int anyRepPrice2 = getAnyRepPrice(anyMatchPrice2, this.opts[this.optCur].state);
            calc1BytePrices(pos, i15, min2, anyRepPrice2);
            if (min2 >= 2) {
                int calcLongRepPrices = calcLongRepPrices(pos, i15, min2, anyRepPrice2);
                if (this.matches.count > 0) {
                    calcNormalMatchPrices(pos, i15, min2, anyMatchPrice2, calcLongRepPrices);
                }
            }
        }
        return convertOpts();
    }

    private void updateOptStateAndReps() {
        int i;
        int i2 = this.opts[this.optCur].optPrev;
        if (!$assertionsDisabled && i2 >= this.optCur) {
            throw new AssertionError();
        }
        if (this.opts[this.optCur].prev1IsLiteral) {
            i2--;
            if (this.opts[this.optCur].hasPrev2) {
                this.opts[this.optCur].state.set(this.opts[this.opts[this.optCur].optPrev2].state);
                if (this.opts[this.optCur].backPrev2 < 4) {
                    this.opts[this.optCur].state.updateLongRep();
                } else {
                    this.opts[this.optCur].state.updateMatch();
                }
            } else {
                this.opts[this.optCur].state.set(this.opts[i2].state);
            }
            this.opts[this.optCur].state.updateLiteral();
        } else {
            this.opts[this.optCur].state.set(this.opts[i2].state);
        }
        if (i2 == this.optCur - 1) {
            if (!$assertionsDisabled && this.opts[this.optCur].backPrev != 0 && this.opts[this.optCur].backPrev != -1) {
                throw new AssertionError();
            }
            if (this.opts[this.optCur].backPrev == 0) {
                this.opts[this.optCur].state.updateShortRep();
            } else {
                this.opts[this.optCur].state.updateLiteral();
            }
            System.arraycopy(this.opts[i2].reps, 0, this.opts[this.optCur].reps, 0, 4);
            return;
        }
        if (this.opts[this.optCur].prev1IsLiteral && this.opts[this.optCur].hasPrev2) {
            i2 = this.opts[this.optCur].optPrev2;
            i = this.opts[this.optCur].backPrev2;
            this.opts[this.optCur].state.updateLongRep();
        } else {
            i = this.opts[this.optCur].backPrev;
            if (i < 4) {
                this.opts[this.optCur].state.updateLongRep();
            } else {
                this.opts[this.optCur].state.updateMatch();
            }
        }
        if (i >= 4) {
            this.opts[this.optCur].reps[0] = i - 4;
            System.arraycopy(this.opts[i2].reps, 0, this.opts[this.optCur].reps, 1, 3);
            return;
        }
        this.opts[this.optCur].reps[0] = this.opts[i2].reps[i];
        int i3 = 1;
        while (i3 <= i) {
            this.opts[this.optCur].reps[i3] = this.opts[i2].reps[i3 - 1];
            i3++;
        }
        while (i3 < 4) {
            this.opts[this.optCur].reps[i3] = this.opts[i2].reps[i3];
            i3++;
        }
    }

    private void calc1BytePrices(int i, int i2, int i3, int i4) {
        int shortRepPrice;
        boolean z = false;
        int i5 = this.lz.getByte(0);
        int i6 = this.lz.getByte(this.opts[this.optCur].reps[0] + 1);
        int price = this.opts[this.optCur].price + this.literalEncoder.getPrice(i5, i6, this.lz.getByte(1), i, this.opts[this.optCur].state);
        if (price < this.opts[this.optCur + 1].price) {
            this.opts[this.optCur + 1].set1(price, this.optCur, -1);
            z = true;
        }
        if (i6 == i5 && ((this.opts[this.optCur + 1].optPrev == this.optCur || this.opts[this.optCur + 1].backPrev != 0) && (shortRepPrice = getShortRepPrice(i4, this.opts[this.optCur].state, i2)) <= this.opts[this.optCur + 1].price)) {
            this.opts[this.optCur + 1].set1(shortRepPrice, this.optCur, 0);
            z = true;
        }
        if (z || i6 == i5 || i3 <= 2) {
            return;
        }
        int matchLen = this.lz.getMatchLen(1, this.opts[this.optCur].reps[0], Math.min(this.niceLen, i3 - 1));
        if (matchLen >= 2) {
            this.nextState.set(this.opts[this.optCur].state);
            this.nextState.updateLiteral();
            int longRepAndLenPrice = price + getLongRepAndLenPrice(0, matchLen, this.nextState, (i + 1) & this.posMask);
            int i7 = this.optCur + 1 + matchLen;
            while (this.optEnd < i7) {
                Optimum[] optimumArr = this.opts;
                int i8 = this.optEnd + 1;
                this.optEnd = i8;
                optimumArr[i8].reset();
            }
            if (longRepAndLenPrice < this.opts[i7].price) {
                this.opts[i7].set2(longRepAndLenPrice, this.optCur, 0);
            }
        }
    }

    private int calcLongRepPrices(int i, int i2, int i3, int i4) {
        int i5 = 2;
        int min = Math.min(i3, this.niceLen);
        for (int i6 = 0; i6 < 4; i6++) {
            int matchLen = this.lz.getMatchLen(this.opts[this.optCur].reps[i6], min);
            if (matchLen >= 2) {
                while (this.optEnd < this.optCur + matchLen) {
                    Optimum[] optimumArr = this.opts;
                    int i7 = this.optEnd + 1;
                    this.optEnd = i7;
                    optimumArr[i7].reset();
                }
                int longRepPrice = getLongRepPrice(i4, i6, this.opts[this.optCur].state, i2);
                for (int i8 = matchLen; i8 >= 2; i8--) {
                    int price = longRepPrice + this.repLenEncoder.getPrice(i8, i2);
                    if (price < this.opts[this.optCur + i8].price) {
                        this.opts[this.optCur + i8].set1(price, this.optCur, i6);
                    }
                }
                if (i6 == 0) {
                    i5 = matchLen + 1;
                }
                int matchLen2 = this.lz.getMatchLen(matchLen + 1, this.opts[this.optCur].reps[i6], Math.min(this.niceLen, (i3 - matchLen) - 1));
                if (matchLen2 >= 2) {
                    int price2 = longRepPrice + this.repLenEncoder.getPrice(matchLen, i2);
                    this.nextState.set(this.opts[this.optCur].state);
                    this.nextState.updateLongRep();
                    int price3 = price2 + this.literalEncoder.getPrice(this.lz.getByte(matchLen, 0), this.lz.getByte(0), this.lz.getByte(matchLen, 1), i + matchLen, this.nextState);
                    this.nextState.updateLiteral();
                    int longRepAndLenPrice = price3 + getLongRepAndLenPrice(0, matchLen2, this.nextState, (i + matchLen + 1) & this.posMask);
                    int i9 = this.optCur + matchLen + 1 + matchLen2;
                    while (this.optEnd < i9) {
                        Optimum[] optimumArr2 = this.opts;
                        int i10 = this.optEnd + 1;
                        this.optEnd = i10;
                        optimumArr2[i10].reset();
                    }
                    if (longRepAndLenPrice < this.opts[i9].price) {
                        this.opts[i9].set3(longRepAndLenPrice, this.optCur, i6, matchLen, 0);
                    }
                }
            }
        }
        return i5;
    }

    private void calcNormalMatchPrices(int i, int i2, int i3, int i4, int i5) {
        if (this.matches.len[this.matches.count - 1] > i3) {
            this.matches.count = 0;
            while (this.matches.len[this.matches.count] < i3) {
                this.matches.count++;
            }
            int[] iArr = this.matches.len;
            Matches matches = this.matches;
            int i6 = matches.count;
            matches.count = i6 + 1;
            iArr[i6] = i3;
        }
        if (this.matches.len[this.matches.count - 1] < i5) {
            return;
        }
        while (this.optEnd < this.optCur + this.matches.len[this.matches.count - 1]) {
            Optimum[] optimumArr = this.opts;
            int i7 = this.optEnd + 1;
            this.optEnd = i7;
            optimumArr[i7].reset();
        }
        int normalMatchPrice = getNormalMatchPrice(i4, this.opts[this.optCur].state);
        int i8 = 0;
        while (i5 > this.matches.len[i8]) {
            i8++;
        }
        int i9 = i5;
        while (true) {
            int i10 = this.matches.dist[i8];
            int matchAndLenPrice = getMatchAndLenPrice(normalMatchPrice, i10, i9, i2);
            if (matchAndLenPrice < this.opts[this.optCur + i9].price) {
                this.opts[this.optCur + i9].set1(matchAndLenPrice, this.optCur, i10 + 4);
            }
            if (i9 == this.matches.len[i8]) {
                int matchLen = this.lz.getMatchLen(i9 + 1, i10, Math.min(this.niceLen, (i3 - i9) - 1));
                if (matchLen >= 2) {
                    this.nextState.set(this.opts[this.optCur].state);
                    this.nextState.updateMatch();
                    int price = matchAndLenPrice + this.literalEncoder.getPrice(this.lz.getByte(i9, 0), this.lz.getByte(0), this.lz.getByte(i9, 1), i + i9, this.nextState);
                    this.nextState.updateLiteral();
                    int longRepAndLenPrice = price + getLongRepAndLenPrice(0, matchLen, this.nextState, (i + i9 + 1) & this.posMask);
                    int i11 = this.optCur + i9 + 1 + matchLen;
                    while (this.optEnd < i11) {
                        Optimum[] optimumArr2 = this.opts;
                        int i12 = this.optEnd + 1;
                        this.optEnd = i12;
                        optimumArr2[i12].reset();
                    }
                    if (longRepAndLenPrice < this.opts[i11].price) {
                        this.opts[i11].set3(longRepAndLenPrice, this.optCur, i10 + 4, i9, 0);
                    }
                }
                i8++;
                if (i8 == this.matches.count) {
                    return;
                }
            }
            i9++;
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
        if (class$org$tukaani$xz$lzma$LZMAEncoderNormal == null) {
            cls = class$("org.tukaani.xz.lzma.LZMAEncoderNormal");
            class$org$tukaani$xz$lzma$LZMAEncoderNormal = cls;
        } else {
            cls = class$org$tukaani$xz$lzma$LZMAEncoderNormal;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
        EXTRA_SIZE_BEFORE = 4096;
        EXTRA_SIZE_AFTER = 4096;
    }
}
