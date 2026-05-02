package com.google.android.exoplayer.util;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/ParsableBitArray.class */
public final class ParsableBitArray {
    public byte[] data;
    private int byteOffset;
    private int bitOffset;
    private int byteLimit;

    public ParsableBitArray() {
    }

    public ParsableBitArray(byte[] data) {
        this(data, data.length);
    }

    public ParsableBitArray(byte[] data, int limit) {
        this.data = data;
        this.byteLimit = limit;
    }

    public void reset(byte[] data) {
        reset(data, data.length);
    }

    public void reset(byte[] data, int limit) {
        this.data = data;
        this.byteOffset = 0;
        this.bitOffset = 0;
        this.byteLimit = limit;
    }

    public int bitsLeft() {
        return ((this.byteLimit - this.byteOffset) * 8) - this.bitOffset;
    }

    public int getPosition() {
        return (this.byteOffset * 8) + this.bitOffset;
    }

    public void setPosition(int position) {
        this.byteOffset = position / 8;
        this.bitOffset = position - (this.byteOffset * 8);
        assertValidOffset();
    }

    public void skipBits(int n) {
        this.byteOffset += n / 8;
        this.bitOffset += n % 8;
        if (this.bitOffset > 7) {
            this.byteOffset++;
            this.bitOffset -= 8;
        }
        assertValidOffset();
    }

    public boolean readBit() {
        return readBits(1) == 1;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v27, types: [byte[]] */
    /* JADX WARN: Type inference failed for: r0v28 */
    /* JADX WARN: Type inference failed for: r0v29 */
    /* JADX WARN: Type inference failed for: r0v38 */
    public int readBits(int numBits) {
        ?? r0;
        if (numBits == 0) {
            return 0;
        }
        int returnValue = 0;
        int wholeBytes = numBits / 8;
        for (int i = 0; i < wholeBytes; i++) {
            if (this.bitOffset != 0) {
                r0 = ((this.data[this.byteOffset] & 255) << this.bitOffset) | ((this.data[this.byteOffset + 1] & 255) >>> (8 - this.bitOffset));
            } else {
                r0 = this.data[this.byteOffset];
            }
            int byteValue = r0;
            numBits -= 8;
            returnValue |= (byteValue & 255) << numBits;
            this.byteOffset++;
        }
        if (numBits > 0) {
            int nextBit = this.bitOffset + numBits;
            byte writeMask = (byte) (255 >> (8 - numBits));
            if (nextBit > 8) {
                returnValue |= (((this.data[this.byteOffset] & 255) << (nextBit - 8)) | ((this.data[this.byteOffset + 1] & 255) >> (16 - nextBit))) & writeMask;
                this.byteOffset++;
            } else {
                returnValue |= ((this.data[this.byteOffset] & 255) >> (8 - nextBit)) & writeMask;
                if (nextBit == 8) {
                    this.byteOffset++;
                }
            }
            this.bitOffset = nextBit % 8;
        }
        assertValidOffset();
        return returnValue;
    }

    public boolean canReadExpGolombCodedNum() {
        int initialByteOffset = this.byteOffset;
        int initialBitOffset = this.bitOffset;
        int leadingZeros = 0;
        while (this.byteOffset < this.byteLimit && !readBit()) {
            leadingZeros++;
        }
        boolean hitLimit = this.byteOffset == this.byteLimit;
        this.byteOffset = initialByteOffset;
        this.bitOffset = initialBitOffset;
        return !hitLimit && bitsLeft() >= (leadingZeros * 2) + 1;
    }

    public int readUnsignedExpGolombCodedInt() {
        return readExpGolombCodeNum();
    }

    public int readSignedExpGolombCodedInt() {
        int codeNum = readExpGolombCodeNum();
        return (codeNum % 2 == 0 ? -1 : 1) * ((codeNum + 1) / 2);
    }

    private int readExpGolombCodeNum() {
        int leadingZeros = 0;
        while (!readBit()) {
            leadingZeros++;
        }
        return ((1 << leadingZeros) - 1) + (leadingZeros > 0 ? readBits(leadingZeros) : 0);
    }

    private void assertValidOffset() {
        Assertions.checkState(this.byteOffset >= 0 && this.bitOffset >= 0 && this.bitOffset < 8 && (this.byteOffset < this.byteLimit || (this.byteOffset == this.byteLimit && this.bitOffset == 0)));
    }
}
