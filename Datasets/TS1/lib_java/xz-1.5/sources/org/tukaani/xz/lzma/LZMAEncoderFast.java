package org.tukaani.xz.lzma;

import org.tukaani.xz.LZMA2Options;
import org.tukaani.xz.lz.LZEncoder;
import org.tukaani.xz.lz.Matches;
import org.tukaani.xz.rangecoder.RangeEncoder;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMAEncoderFast.class */
final class LZMAEncoderFast extends LZMAEncoder {
    private static int EXTRA_SIZE_BEFORE = 1;
    private static int EXTRA_SIZE_AFTER = 272;
    private Matches matches;

    static int getMemoryUsage(int i, int i2, int i3) {
        return LZEncoder.getMemoryUsage(i, Math.max(i2, EXTRA_SIZE_BEFORE), EXTRA_SIZE_AFTER, LZMA2Options.NICE_LEN_MAX, i3);
    }

    LZMAEncoderFast(RangeEncoder rangeEncoder, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        super(rangeEncoder, LZEncoder.getInstance(i4, Math.max(i5, EXTRA_SIZE_BEFORE), EXTRA_SIZE_AFTER, i6, LZMA2Options.NICE_LEN_MAX, i7, i8), i, i2, i3, i4, i6);
        this.matches = null;
    }

    private boolean changePair(int i, int i2) {
        return i < (i2 >>> 7);
    }

    @Override // org.tukaani.xz.lzma.LZMAEncoder
    int getNextSymbol() {
        if (this.readAhead == -1) {
            this.matches = getMatches();
        }
        this.back = -1;
        int min = Math.min(this.lz.getAvail(), LZMA2Options.NICE_LEN_MAX);
        if (min < 2) {
            return 1;
        }
        int i = 0;
        int i2 = 0;
        for (int i3 = 0; i3 < 4; i3++) {
            int matchLen = this.lz.getMatchLen(this.reps[i3], min);
            if (matchLen >= 2) {
                if (matchLen >= this.niceLen) {
                    this.back = i3;
                    skip(matchLen - 1);
                    return matchLen;
                }
                if (matchLen > i) {
                    i2 = i3;
                    i = matchLen;
                }
            }
        }
        int i4 = 0;
        int i5 = 0;
        if (this.matches.count > 0) {
            i4 = this.matches.len[this.matches.count - 1];
            i5 = this.matches.dist[this.matches.count - 1];
            if (i4 >= this.niceLen) {
                this.back = i5 + 4;
                skip(i4 - 1);
                return i4;
            }
            while (this.matches.count > 1 && i4 == this.matches.len[this.matches.count - 2] + 1 && changePair(this.matches.dist[this.matches.count - 2], i5)) {
                this.matches.count--;
                i4 = this.matches.len[this.matches.count - 1];
                i5 = this.matches.dist[this.matches.count - 1];
            }
            if (i4 == 2 && i5 >= 128) {
                i4 = 1;
            }
        }
        if (i >= 2 && (i + 1 >= i4 || ((i + 2 >= i4 && i5 >= 512) || (i + 3 >= i4 && i5 >= 32768)))) {
            this.back = i2;
            skip(i - 1);
            return i;
        }
        if (i4 < 2 || min <= 2) {
            return 1;
        }
        this.matches = getMatches();
        if (this.matches.count > 0) {
            int i6 = this.matches.len[this.matches.count - 1];
            int i7 = this.matches.dist[this.matches.count - 1];
            if (i6 >= i4 && i7 < i5) {
                return 1;
            }
            if ((i6 == i4 + 1 && !changePair(i5, i7)) || i6 > i4 + 1) {
                return 1;
            }
            if (i6 + 1 >= i4 && i4 >= 3 && changePair(i7, i5)) {
                return 1;
            }
        }
        int max = Math.max(i4 - 1, 2);
        for (int i8 = 0; i8 < 4; i8++) {
            if (this.lz.getMatchLen(this.reps[i8], max) == max) {
                return 1;
            }
        }
        this.back = i5 + 4;
        skip(i4 - 2);
        return i4;
    }
}
