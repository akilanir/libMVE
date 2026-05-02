package org.tukaani.xz.lzma;

import java.io.IOException;
import org.tukaani.xz.lz.LZDecoder;
import org.tukaani.xz.lzma.LZMACoder;
import org.tukaani.xz.rangecoder.RangeDecoder;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMADecoder.class */
public final class LZMADecoder extends LZMACoder {
    private final LZDecoder lz;
    private final RangeDecoder rc;
    private final LiteralDecoder literalDecoder;
    private final LengthDecoder matchLenDecoder;
    private final LengthDecoder repLenDecoder;

    /* renamed from: org.tukaani.xz.lzma.LZMADecoder$1, reason: invalid class name */
    /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMADecoder$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMADecoder$LengthDecoder.class */
    private class LengthDecoder extends LZMACoder.LengthCoder {
        private final LZMADecoder this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private LengthDecoder(LZMADecoder lZMADecoder) {
            super(lZMADecoder);
            this.this$0 = lZMADecoder;
        }

        int decode(int i) throws IOException {
            return this.this$0.rc.decodeBit(this.choice, 0) == 0 ? this.this$0.rc.decodeBitTree(this.low[i]) + 2 : this.this$0.rc.decodeBit(this.choice, 1) == 0 ? this.this$0.rc.decodeBitTree(this.mid[i]) + 2 + 8 : this.this$0.rc.decodeBitTree(this.high) + 2 + 8 + 8;
        }

        LengthDecoder(LZMADecoder lZMADecoder, AnonymousClass1 anonymousClass1) {
            this(lZMADecoder);
        }
    }

    /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMADecoder$LiteralDecoder.class */
    private class LiteralDecoder extends LZMACoder.LiteralCoder {
        LiteralSubdecoder[] subdecoders;
        private final LZMADecoder this$0;

        /* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder.class */
        private class LiteralSubdecoder extends LZMACoder.LiteralCoder.LiteralSubcoder {
            private final LiteralDecoder this$1;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            private LiteralSubdecoder(LiteralDecoder literalDecoder) {
                super(literalDecoder);
                this.this$1 = literalDecoder;
            }

            void decode() throws IOException {
                int i = 1;
                if (this.this$1.this$0.state.isLiteral()) {
                    do {
                        i = (i << 1) | this.this$1.this$0.rc.decodeBit(this.probs, i);
                    } while (i < 256);
                } else {
                    int i2 = this.this$1.this$0.lz.getByte(this.this$1.this$0.reps[0]);
                    int i3 = 256;
                    do {
                        i2 <<= 1;
                        int i4 = i2 & i3;
                        int decodeBit = this.this$1.this$0.rc.decodeBit(this.probs, i3 + i4 + i);
                        i = (i << 1) | decodeBit;
                        i3 &= (0 - decodeBit) ^ (i4 ^ (-1));
                    } while (i < 256);
                }
                this.this$1.this$0.lz.putByte((byte) i);
                this.this$1.this$0.state.updateLiteral();
            }

            LiteralSubdecoder(LiteralDecoder literalDecoder, AnonymousClass1 anonymousClass1) {
                this(literalDecoder);
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        LiteralDecoder(LZMADecoder lZMADecoder, int i, int i2) {
            super(lZMADecoder, i, i2);
            this.this$0 = lZMADecoder;
            this.subdecoders = new LiteralSubdecoder[1 << (i + i2)];
            for (int i3 = 0; i3 < this.subdecoders.length; i3++) {
                this.subdecoders[i3] = new LiteralSubdecoder(this, null);
            }
        }

        void reset() {
            for (int i = 0; i < this.subdecoders.length; i++) {
                this.subdecoders[i].reset();
            }
        }

        void decode() throws IOException {
            this.subdecoders[getSubcoderIndex(this.this$0.lz.getByte(0), this.this$0.lz.getPos())].decode();
        }
    }

    public LZMADecoder(LZDecoder lZDecoder, RangeDecoder rangeDecoder, int i, int i2, int i3) {
        super(i3);
        this.matchLenDecoder = new LengthDecoder(this, null);
        this.repLenDecoder = new LengthDecoder(this, null);
        this.lz = lZDecoder;
        this.rc = rangeDecoder;
        this.literalDecoder = new LiteralDecoder(this, i, i2);
        reset();
    }

    @Override // org.tukaani.xz.lzma.LZMACoder
    public void reset() {
        super.reset();
        this.literalDecoder.reset();
        this.matchLenDecoder.reset();
        this.repLenDecoder.reset();
    }

    public boolean endMarkerDetected() {
        return this.reps[0] == -1;
    }

    public void decode() throws IOException {
        this.lz.repeatPending();
        while (this.lz.hasSpace()) {
            int pos = this.lz.getPos() & this.posMask;
            if (this.rc.decodeBit(this.isMatch[this.state.get()], pos) == 0) {
                this.literalDecoder.decode();
            } else {
                this.lz.repeat(this.reps[0], this.rc.decodeBit(this.isRep, this.state.get()) == 0 ? decodeMatch(pos) : decodeRepMatch(pos));
            }
        }
        this.rc.normalize();
    }

    private int decodeMatch(int i) throws IOException {
        this.state.updateMatch();
        this.reps[3] = this.reps[2];
        this.reps[2] = this.reps[1];
        this.reps[1] = this.reps[0];
        int decode = this.matchLenDecoder.decode(i);
        int decodeBitTree = this.rc.decodeBitTree(this.distSlots[getDistState(decode)]);
        if (decodeBitTree < 4) {
            this.reps[0] = decodeBitTree;
        } else {
            int i2 = (decodeBitTree >> 1) - 1;
            this.reps[0] = (2 | (decodeBitTree & 1)) << i2;
            if (decodeBitTree < 14) {
                int[] iArr = this.reps;
                iArr[0] = iArr[0] | this.rc.decodeReverseBitTree(this.distSpecial[decodeBitTree - 4]);
            } else {
                int[] iArr2 = this.reps;
                iArr2[0] = iArr2[0] | (this.rc.decodeDirectBits(i2 - 4) << 4);
                int[] iArr3 = this.reps;
                iArr3[0] = iArr3[0] | this.rc.decodeReverseBitTree(this.distAlign);
            }
        }
        return decode;
    }

    private int decodeRepMatch(int i) throws IOException {
        int i2;
        if (this.rc.decodeBit(this.isRep0, this.state.get()) != 0) {
            if (this.rc.decodeBit(this.isRep1, this.state.get()) == 0) {
                i2 = this.reps[1];
            } else {
                if (this.rc.decodeBit(this.isRep2, this.state.get()) == 0) {
                    i2 = this.reps[2];
                } else {
                    i2 = this.reps[3];
                    this.reps[3] = this.reps[2];
                }
                this.reps[2] = this.reps[1];
            }
            this.reps[1] = this.reps[0];
            this.reps[0] = i2;
        } else if (this.rc.decodeBit(this.isRep0Long[this.state.get()], i) == 0) {
            this.state.updateShortRep();
            return 1;
        }
        this.state.updateLongRep();
        return this.repLenDecoder.decode(i);
    }
}
