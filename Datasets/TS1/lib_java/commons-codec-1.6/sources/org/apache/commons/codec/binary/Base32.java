package org.apache.commons.codec.binary;

/* loaded from: commons-codec-1.6.jar:org/apache/commons/codec/binary/Base32.class */
public class Base32 extends BaseNCodec {
    private static final int BITS_PER_ENCODED_BYTE = 5;
    private static final int BYTES_PER_UNENCODED_BLOCK = 5;
    private long bitWorkArea;
    private final int decodeSize;
    private final byte[] decodeTable;
    private final int encodeSize;
    private final byte[] encodeTable;
    private final byte[] lineSeparator;
    private static final byte[] CHUNK_SEPARATOR = {13, 10};
    private static final int MASK_5BITS = 31;
    private static final int BYTES_PER_ENCODED_BLOCK = 8;
    private static final byte[] DECODE_TABLE = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 63, -1, -1, 26, 27, 28, 29, 30, MASK_5BITS, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, BYTES_PER_ENCODED_BLOCK, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25};
    private static final byte[] ENCODE_TABLE = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 50, 51, 52, 53, 54, 55};
    private static final byte[] HEX_DECODE_TABLE = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 63, 0, 1, 2, 3, 4, 5, 6, 7, BYTES_PER_ENCODED_BLOCK, 9, -1, -1, -1, -1, -1, -1, -1, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, MASK_5BITS, 32};
    private static final byte[] HEX_ENCODE_TABLE = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86};

    public Base32() {
        this(false);
    }

    public Base32(boolean useHex) {
        this(0, null, useHex);
    }

    public Base32(int lineLength) {
        this(lineLength, CHUNK_SEPARATOR);
    }

    public Base32(int lineLength, byte[] lineSeparator) {
        this(lineLength, lineSeparator, false);
    }

    public Base32(int lineLength, byte[] lineSeparator, boolean useHex) {
        super(5, BYTES_PER_ENCODED_BLOCK, lineLength, lineSeparator == null ? 0 : lineSeparator.length);
        if (useHex) {
            this.encodeTable = HEX_ENCODE_TABLE;
            this.decodeTable = HEX_DECODE_TABLE;
        } else {
            this.encodeTable = ENCODE_TABLE;
            this.decodeTable = DECODE_TABLE;
        }
        if (lineLength > 0) {
            if (lineSeparator == null) {
                throw new IllegalArgumentException("lineLength " + lineLength + " > 0, but lineSeparator is null");
            }
            if (containsAlphabetOrPad(lineSeparator)) {
                String sep = StringUtils.newStringUtf8(lineSeparator);
                throw new IllegalArgumentException("lineSeparator must not contain Base32 characters: [" + sep + "]");
            }
            this.encodeSize = BYTES_PER_ENCODED_BLOCK + lineSeparator.length;
            this.lineSeparator = new byte[lineSeparator.length];
            System.arraycopy(lineSeparator, 0, this.lineSeparator, 0, lineSeparator.length);
        } else {
            this.encodeSize = BYTES_PER_ENCODED_BLOCK;
            this.lineSeparator = null;
        }
        this.decodeSize = this.encodeSize - 1;
    }

    @Override // org.apache.commons.codec.binary.BaseNCodec
    void decode(byte[] in, int inPos, int inAvail) {
        byte b;
        if (this.eof) {
        }
        if (inAvail < 0) {
            this.eof = true;
        }
        int i = 0;
        while (true) {
            if (i >= inAvail) {
                break;
            }
            int i2 = inPos;
            inPos++;
            byte b2 = in[i2];
            if (b2 == 61) {
                this.eof = true;
                break;
            }
            ensureBufferSize(this.decodeSize);
            if (b2 >= 0 && b2 < this.decodeTable.length && (b = this.decodeTable[b2]) >= 0) {
                this.modulus = (this.modulus + 1) % BYTES_PER_ENCODED_BLOCK;
                this.bitWorkArea = (this.bitWorkArea << 5) + b;
                if (this.modulus == 0) {
                    byte[] bArr = this.buffer;
                    int i3 = this.pos;
                    this.pos = i3 + 1;
                    bArr[i3] = (byte) ((this.bitWorkArea >> 32) & 255);
                    byte[] bArr2 = this.buffer;
                    int i4 = this.pos;
                    this.pos = i4 + 1;
                    bArr2[i4] = (byte) ((this.bitWorkArea >> 24) & 255);
                    byte[] bArr3 = this.buffer;
                    int i5 = this.pos;
                    this.pos = i5 + 1;
                    bArr3[i5] = (byte) ((this.bitWorkArea >> 16) & 255);
                    byte[] bArr4 = this.buffer;
                    int i6 = this.pos;
                    this.pos = i6 + 1;
                    bArr4[i6] = (byte) ((this.bitWorkArea >> 8) & 255);
                    byte[] bArr5 = this.buffer;
                    int i7 = this.pos;
                    this.pos = i7 + 1;
                    bArr5[i7] = (byte) (this.bitWorkArea & 255);
                }
            }
            i++;
        }
        if (this.eof && this.modulus >= 2) {
            ensureBufferSize(this.decodeSize);
            switch (this.modulus) {
                case 2:
                    byte[] bArr6 = this.buffer;
                    int i8 = this.pos;
                    this.pos = i8 + 1;
                    bArr6[i8] = (byte) ((this.bitWorkArea >> 2) & 255);
                    break;
                case 3:
                    byte[] bArr7 = this.buffer;
                    int i9 = this.pos;
                    this.pos = i9 + 1;
                    bArr7[i9] = (byte) ((this.bitWorkArea >> 7) & 255);
                    break;
                case 4:
                    this.bitWorkArea >>= 4;
                    byte[] bArr8 = this.buffer;
                    int i10 = this.pos;
                    this.pos = i10 + 1;
                    bArr8[i10] = (byte) ((this.bitWorkArea >> 8) & 255);
                    byte[] bArr9 = this.buffer;
                    int i11 = this.pos;
                    this.pos = i11 + 1;
                    bArr9[i11] = (byte) (this.bitWorkArea & 255);
                    break;
                case 5:
                    this.bitWorkArea >>= 1;
                    byte[] bArr10 = this.buffer;
                    int i12 = this.pos;
                    this.pos = i12 + 1;
                    bArr10[i12] = (byte) ((this.bitWorkArea >> 16) & 255);
                    byte[] bArr11 = this.buffer;
                    int i13 = this.pos;
                    this.pos = i13 + 1;
                    bArr11[i13] = (byte) ((this.bitWorkArea >> 8) & 255);
                    byte[] bArr12 = this.buffer;
                    int i14 = this.pos;
                    this.pos = i14 + 1;
                    bArr12[i14] = (byte) (this.bitWorkArea & 255);
                    break;
                case 6:
                    this.bitWorkArea >>= 6;
                    byte[] bArr13 = this.buffer;
                    int i15 = this.pos;
                    this.pos = i15 + 1;
                    bArr13[i15] = (byte) ((this.bitWorkArea >> 16) & 255);
                    byte[] bArr14 = this.buffer;
                    int i16 = this.pos;
                    this.pos = i16 + 1;
                    bArr14[i16] = (byte) ((this.bitWorkArea >> 8) & 255);
                    byte[] bArr15 = this.buffer;
                    int i17 = this.pos;
                    this.pos = i17 + 1;
                    bArr15[i17] = (byte) (this.bitWorkArea & 255);
                    break;
                case 7:
                    this.bitWorkArea >>= 3;
                    byte[] bArr16 = this.buffer;
                    int i18 = this.pos;
                    this.pos = i18 + 1;
                    bArr16[i18] = (byte) ((this.bitWorkArea >> 24) & 255);
                    byte[] bArr17 = this.buffer;
                    int i19 = this.pos;
                    this.pos = i19 + 1;
                    bArr17[i19] = (byte) ((this.bitWorkArea >> 16) & 255);
                    byte[] bArr18 = this.buffer;
                    int i20 = this.pos;
                    this.pos = i20 + 1;
                    bArr18[i20] = (byte) ((this.bitWorkArea >> 8) & 255);
                    byte[] bArr19 = this.buffer;
                    int i21 = this.pos;
                    this.pos = i21 + 1;
                    bArr19[i21] = (byte) (this.bitWorkArea & 255);
                    break;
            }
        }
    }

    @Override // org.apache.commons.codec.binary.BaseNCodec
    void encode(byte[] in, int inPos, int inAvail) {
        if (this.eof) {
            return;
        }
        if (inAvail < 0) {
            this.eof = true;
            if (0 == this.modulus && this.lineLength == 0) {
                return;
            }
            ensureBufferSize(this.encodeSize);
            int savedPos = this.pos;
            switch (this.modulus) {
                case 1:
                    byte[] bArr = this.buffer;
                    int i = this.pos;
                    this.pos = i + 1;
                    bArr[i] = this.encodeTable[((int) (this.bitWorkArea >> 3)) & MASK_5BITS];
                    byte[] bArr2 = this.buffer;
                    int i2 = this.pos;
                    this.pos = i2 + 1;
                    bArr2[i2] = this.encodeTable[((int) (this.bitWorkArea << 2)) & MASK_5BITS];
                    byte[] bArr3 = this.buffer;
                    int i3 = this.pos;
                    this.pos = i3 + 1;
                    bArr3[i3] = 61;
                    byte[] bArr4 = this.buffer;
                    int i4 = this.pos;
                    this.pos = i4 + 1;
                    bArr4[i4] = 61;
                    byte[] bArr5 = this.buffer;
                    int i5 = this.pos;
                    this.pos = i5 + 1;
                    bArr5[i5] = 61;
                    byte[] bArr6 = this.buffer;
                    int i6 = this.pos;
                    this.pos = i6 + 1;
                    bArr6[i6] = 61;
                    byte[] bArr7 = this.buffer;
                    int i7 = this.pos;
                    this.pos = i7 + 1;
                    bArr7[i7] = 61;
                    byte[] bArr8 = this.buffer;
                    int i8 = this.pos;
                    this.pos = i8 + 1;
                    bArr8[i8] = 61;
                    break;
                case 2:
                    byte[] bArr9 = this.buffer;
                    int i9 = this.pos;
                    this.pos = i9 + 1;
                    bArr9[i9] = this.encodeTable[((int) (this.bitWorkArea >> 11)) & MASK_5BITS];
                    byte[] bArr10 = this.buffer;
                    int i10 = this.pos;
                    this.pos = i10 + 1;
                    bArr10[i10] = this.encodeTable[((int) (this.bitWorkArea >> 6)) & MASK_5BITS];
                    byte[] bArr11 = this.buffer;
                    int i11 = this.pos;
                    this.pos = i11 + 1;
                    bArr11[i11] = this.encodeTable[((int) (this.bitWorkArea >> 1)) & MASK_5BITS];
                    byte[] bArr12 = this.buffer;
                    int i12 = this.pos;
                    this.pos = i12 + 1;
                    bArr12[i12] = this.encodeTable[((int) (this.bitWorkArea << 4)) & MASK_5BITS];
                    byte[] bArr13 = this.buffer;
                    int i13 = this.pos;
                    this.pos = i13 + 1;
                    bArr13[i13] = 61;
                    byte[] bArr14 = this.buffer;
                    int i14 = this.pos;
                    this.pos = i14 + 1;
                    bArr14[i14] = 61;
                    byte[] bArr15 = this.buffer;
                    int i15 = this.pos;
                    this.pos = i15 + 1;
                    bArr15[i15] = 61;
                    byte[] bArr16 = this.buffer;
                    int i16 = this.pos;
                    this.pos = i16 + 1;
                    bArr16[i16] = 61;
                    break;
                case 3:
                    byte[] bArr17 = this.buffer;
                    int i17 = this.pos;
                    this.pos = i17 + 1;
                    bArr17[i17] = this.encodeTable[((int) (this.bitWorkArea >> 19)) & MASK_5BITS];
                    byte[] bArr18 = this.buffer;
                    int i18 = this.pos;
                    this.pos = i18 + 1;
                    bArr18[i18] = this.encodeTable[((int) (this.bitWorkArea >> 14)) & MASK_5BITS];
                    byte[] bArr19 = this.buffer;
                    int i19 = this.pos;
                    this.pos = i19 + 1;
                    bArr19[i19] = this.encodeTable[((int) (this.bitWorkArea >> 9)) & MASK_5BITS];
                    byte[] bArr20 = this.buffer;
                    int i20 = this.pos;
                    this.pos = i20 + 1;
                    bArr20[i20] = this.encodeTable[((int) (this.bitWorkArea >> 4)) & MASK_5BITS];
                    byte[] bArr21 = this.buffer;
                    int i21 = this.pos;
                    this.pos = i21 + 1;
                    bArr21[i21] = this.encodeTable[((int) (this.bitWorkArea << 1)) & MASK_5BITS];
                    byte[] bArr22 = this.buffer;
                    int i22 = this.pos;
                    this.pos = i22 + 1;
                    bArr22[i22] = 61;
                    byte[] bArr23 = this.buffer;
                    int i23 = this.pos;
                    this.pos = i23 + 1;
                    bArr23[i23] = 61;
                    byte[] bArr24 = this.buffer;
                    int i24 = this.pos;
                    this.pos = i24 + 1;
                    bArr24[i24] = 61;
                    break;
                case 4:
                    byte[] bArr25 = this.buffer;
                    int i25 = this.pos;
                    this.pos = i25 + 1;
                    bArr25[i25] = this.encodeTable[((int) (this.bitWorkArea >> 27)) & MASK_5BITS];
                    byte[] bArr26 = this.buffer;
                    int i26 = this.pos;
                    this.pos = i26 + 1;
                    bArr26[i26] = this.encodeTable[((int) (this.bitWorkArea >> 22)) & MASK_5BITS];
                    byte[] bArr27 = this.buffer;
                    int i27 = this.pos;
                    this.pos = i27 + 1;
                    bArr27[i27] = this.encodeTable[((int) (this.bitWorkArea >> 17)) & MASK_5BITS];
                    byte[] bArr28 = this.buffer;
                    int i28 = this.pos;
                    this.pos = i28 + 1;
                    bArr28[i28] = this.encodeTable[((int) (this.bitWorkArea >> 12)) & MASK_5BITS];
                    byte[] bArr29 = this.buffer;
                    int i29 = this.pos;
                    this.pos = i29 + 1;
                    bArr29[i29] = this.encodeTable[((int) (this.bitWorkArea >> 7)) & MASK_5BITS];
                    byte[] bArr30 = this.buffer;
                    int i30 = this.pos;
                    this.pos = i30 + 1;
                    bArr30[i30] = this.encodeTable[((int) (this.bitWorkArea >> 2)) & MASK_5BITS];
                    byte[] bArr31 = this.buffer;
                    int i31 = this.pos;
                    this.pos = i31 + 1;
                    bArr31[i31] = this.encodeTable[((int) (this.bitWorkArea << 3)) & MASK_5BITS];
                    byte[] bArr32 = this.buffer;
                    int i32 = this.pos;
                    this.pos = i32 + 1;
                    bArr32[i32] = 61;
                    break;
            }
            this.currentLinePos += this.pos - savedPos;
            if (this.lineLength > 0 && this.currentLinePos > 0) {
                System.arraycopy(this.lineSeparator, 0, this.buffer, this.pos, this.lineSeparator.length);
                this.pos += this.lineSeparator.length;
                return;
            }
            return;
        }
        for (int i33 = 0; i33 < inAvail; i33++) {
            ensureBufferSize(this.encodeSize);
            this.modulus = (this.modulus + 1) % 5;
            int i34 = inPos;
            inPos++;
            int b = in[i34];
            if (b < 0) {
                b += 256;
            }
            this.bitWorkArea = (this.bitWorkArea << 8) + b;
            if (0 == this.modulus) {
                byte[] bArr33 = this.buffer;
                int i35 = this.pos;
                this.pos = i35 + 1;
                bArr33[i35] = this.encodeTable[((int) (this.bitWorkArea >> 35)) & MASK_5BITS];
                byte[] bArr34 = this.buffer;
                int i36 = this.pos;
                this.pos = i36 + 1;
                bArr34[i36] = this.encodeTable[((int) (this.bitWorkArea >> 30)) & MASK_5BITS];
                byte[] bArr35 = this.buffer;
                int i37 = this.pos;
                this.pos = i37 + 1;
                bArr35[i37] = this.encodeTable[((int) (this.bitWorkArea >> 25)) & MASK_5BITS];
                byte[] bArr36 = this.buffer;
                int i38 = this.pos;
                this.pos = i38 + 1;
                bArr36[i38] = this.encodeTable[((int) (this.bitWorkArea >> 20)) & MASK_5BITS];
                byte[] bArr37 = this.buffer;
                int i39 = this.pos;
                this.pos = i39 + 1;
                bArr37[i39] = this.encodeTable[((int) (this.bitWorkArea >> 15)) & MASK_5BITS];
                byte[] bArr38 = this.buffer;
                int i40 = this.pos;
                this.pos = i40 + 1;
                bArr38[i40] = this.encodeTable[((int) (this.bitWorkArea >> 10)) & MASK_5BITS];
                byte[] bArr39 = this.buffer;
                int i41 = this.pos;
                this.pos = i41 + 1;
                bArr39[i41] = this.encodeTable[((int) (this.bitWorkArea >> 5)) & MASK_5BITS];
                byte[] bArr40 = this.buffer;
                int i42 = this.pos;
                this.pos = i42 + 1;
                bArr40[i42] = this.encodeTable[((int) this.bitWorkArea) & MASK_5BITS];
                this.currentLinePos += BYTES_PER_ENCODED_BLOCK;
                if (this.lineLength > 0 && this.lineLength <= this.currentLinePos) {
                    System.arraycopy(this.lineSeparator, 0, this.buffer, this.pos, this.lineSeparator.length);
                    this.pos += this.lineSeparator.length;
                    this.currentLinePos = 0;
                }
            }
        }
    }

    @Override // org.apache.commons.codec.binary.BaseNCodec
    public boolean isInAlphabet(byte octet) {
        return octet >= 0 && octet < this.decodeTable.length && this.decodeTable[octet] != -1;
    }
}
