package com.google.android.exoplayer.extractor.webm;

import com.google.android.exoplayer.extractor.ExtractorInput;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/webm/VarintReader.class */
final class VarintReader {
    private static final int STATE_BEGIN_READING = 0;
    private static final int STATE_READ_CONTENTS = 1;
    private static final long[] VARINT_LENGTH_MASKS = {128, 64, 32, 16, 8, 4, 2, 1};
    private final byte[] scratch = new byte[8];
    private int state;
    private int length;

    public void reset() {
        this.state = 0;
        this.length = 0;
    }

    public long readUnsignedVarint(ExtractorInput input, boolean allowEndOfInput, boolean removeLengthMask, int maximumAllowedLength) throws IOException, InterruptedException {
        if (this.state == 0) {
            if (!input.readFully(this.scratch, 0, 1, allowEndOfInput)) {
                return -1L;
            }
            int firstByte = this.scratch[0] & 255;
            this.length = parseUnsignedVarintLength(firstByte);
            if (this.length == -1) {
                throw new IllegalStateException("No valid varint length mask found");
            }
            this.state = 1;
        }
        if (this.length > maximumAllowedLength) {
            this.state = 0;
            return -2L;
        }
        if (this.length != 1) {
            input.readFully(this.scratch, 1, this.length - 1);
        }
        this.state = 0;
        return assembleVarint(this.scratch, this.length, removeLengthMask);
    }

    public int getLastLength() {
        return this.length;
    }

    public static int parseUnsignedVarintLength(int firstByte) {
        int varIntLength = -1;
        int i = 0;
        while (true) {
            if (i >= VARINT_LENGTH_MASKS.length) {
                break;
            }
            if ((VARINT_LENGTH_MASKS[i] & firstByte) == 0) {
                i++;
            } else {
                varIntLength = i + 1;
                break;
            }
        }
        return varIntLength;
    }

    public static long assembleVarint(byte[] varintBytes, int varintLength, boolean removeLengthMask) {
        long varint = varintBytes[0] & 255;
        if (removeLengthMask) {
            varint &= VARINT_LENGTH_MASKS[varintLength - 1] ^ (-1);
        }
        for (int i = 1; i < varintLength; i++) {
            varint = (varint << 8) | (varintBytes[i] & 255);
        }
        return varint;
    }
}
