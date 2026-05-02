package com.google.android.exoplayer.util;

import java.util.Arrays;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/util/NalUnitUtil.class */
public final class NalUnitUtil {
    public static final int EXTENDED_SAR = 255;
    public static final byte[] NAL_START_CODE = {0, 0, 0, 1};
    public static final float[] ASPECT_RATIO_IDC_VALUES = {1.0f, 1.0f, 1.0909091f, 0.90909094f, 1.4545455f, 1.2121212f, 2.1818182f, 1.8181819f, 2.909091f, 2.4242425f, 1.6363636f, 1.3636364f, 1.939394f, 1.6161616f, 1.3333334f, 1.5f, 2.0f};
    private static final Object scratchEscapePositionsLock = new Object();
    private static int[] scratchEscapePositions = new int[10];

    public static int unescapeStream(byte[] data, int limit) {
        int unescapedLength;
        synchronized (scratchEscapePositionsLock) {
            int position = 0;
            int scratchEscapeCount = 0;
            while (position < limit) {
                position = findNextUnescapeIndex(data, position, limit);
                if (position < limit) {
                    if (scratchEscapePositions.length <= scratchEscapeCount) {
                        scratchEscapePositions = Arrays.copyOf(scratchEscapePositions, scratchEscapePositions.length * 2);
                    }
                    int i = scratchEscapeCount;
                    scratchEscapeCount++;
                    scratchEscapePositions[i] = position;
                    position += 3;
                }
            }
            unescapedLength = limit - scratchEscapeCount;
            int escapedPosition = 0;
            int unescapedPosition = 0;
            for (int i2 = 0; i2 < scratchEscapeCount; i2++) {
                int nextEscapePosition = scratchEscapePositions[i2];
                int copyLength = nextEscapePosition - escapedPosition;
                System.arraycopy(data, escapedPosition, data, unescapedPosition, copyLength);
                int unescapedPosition2 = unescapedPosition + copyLength;
                int unescapedPosition3 = unescapedPosition2 + 1;
                data[unescapedPosition2] = 0;
                unescapedPosition = unescapedPosition3 + 1;
                data[unescapedPosition3] = 0;
                escapedPosition += copyLength + 3;
            }
            int remainingLength = unescapedLength - unescapedPosition;
            System.arraycopy(data, escapedPosition, data, unescapedPosition, remainingLength);
        }
        return unescapedLength;
    }

    public static byte[] parseChildNalUnit(ParsableByteArray atom) {
        int length = atom.readUnsignedShort();
        int offset = atom.getPosition();
        atom.skipBytes(length);
        return CodecSpecificDataUtil.buildNalUnit(atom.data, offset, length);
    }

    public static int getNalUnitType(byte[] data, int offset) {
        return data[offset + 3] & 31;
    }

    public static int getH265NalUnitType(byte[] data, int offset) {
        return (data[offset + 3] & 126) >> 1;
    }

    public static int findNalUnit(byte[] data, int startOffset, int endOffset, boolean[] prefixFlags) {
        int length = endOffset - startOffset;
        Assertions.checkState(length >= 0);
        if (length == 0) {
            return endOffset;
        }
        if (prefixFlags != null) {
            if (prefixFlags[0]) {
                clearPrefixFlags(prefixFlags);
                return startOffset - 3;
            }
            if (length > 1 && prefixFlags[1] && data[startOffset] == 1) {
                clearPrefixFlags(prefixFlags);
                return startOffset - 2;
            }
            if (length > 2 && prefixFlags[2] && data[startOffset] == 0 && data[startOffset + 1] == 1) {
                clearPrefixFlags(prefixFlags);
                return startOffset - 1;
            }
        }
        int limit = endOffset - 1;
        int i = startOffset + 2;
        while (i < limit) {
            if ((data[i] & 254) == 0) {
                if (data[i - 2] == 0 && data[i - 1] == 0 && data[i] == 1) {
                    if (prefixFlags != null) {
                        clearPrefixFlags(prefixFlags);
                    }
                    return i - 2;
                }
                i -= 2;
            }
            i += 3;
        }
        if (prefixFlags != null) {
            prefixFlags[0] = length > 2 ? data[endOffset - 3] == 0 && data[endOffset - 2] == 0 && data[endOffset - 1] == 1 : length == 2 ? prefixFlags[2] && data[endOffset - 2] == 0 && data[endOffset - 1] == 1 : prefixFlags[1] && data[endOffset - 1] == 1;
            prefixFlags[1] = length > 1 ? data[endOffset - 2] == 0 && data[endOffset - 1] == 0 : prefixFlags[2] && data[endOffset - 1] == 0;
            prefixFlags[2] = data[endOffset - 1] == 0;
        }
        return endOffset;
    }

    public static void clearPrefixFlags(boolean[] prefixFlags) {
        prefixFlags[0] = false;
        prefixFlags[1] = false;
        prefixFlags[2] = false;
    }

    private static int findNextUnescapeIndex(byte[] bytes, int offset, int limit) {
        for (int i = offset; i < limit - 2; i++) {
            if (bytes[i] == 0 && bytes[i + 1] == 0 && bytes[i + 2] == 3) {
                return i;
            }
        }
        return limit;
    }

    private NalUnitUtil() {
    }
}
