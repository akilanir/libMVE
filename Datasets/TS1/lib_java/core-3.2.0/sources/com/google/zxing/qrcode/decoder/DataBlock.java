package com.google.zxing.qrcode.decoder;

import com.google.zxing.qrcode.decoder.Version;

/* loaded from: core-3.2.0.jar:com/google/zxing/qrcode/decoder/DataBlock.class */
final class DataBlock {
    private final int numDataCodewords;
    private final byte[] codewords;

    private DataBlock(int numDataCodewords, byte[] codewords) {
        this.numDataCodewords = numDataCodewords;
        this.codewords = codewords;
    }

    static DataBlock[] getDataBlocks(byte[] rawCodewords, Version version, ErrorCorrectionLevel ecLevel) {
        if (rawCodewords.length != version.getTotalCodewords()) {
            throw new IllegalArgumentException();
        }
        Version.ECBlocks ecBlocks = version.getECBlocksForLevel(ecLevel);
        int totalBlocks = 0;
        Version.ECB[] ecBlockArray = ecBlocks.getECBlocks();
        for (Version.ECB ecb : ecBlockArray) {
            totalBlocks += ecb.getCount();
        }
        DataBlock[] result = new DataBlock[totalBlocks];
        int numResultBlocks = 0;
        for (Version.ECB ecBlock : ecBlockArray) {
            for (int i = 0; i < ecBlock.getCount(); i++) {
                int numDataCodewords = ecBlock.getDataCodewords();
                int numBlockCodewords = ecBlocks.getECCodewordsPerBlock() + numDataCodewords;
                int i2 = numResultBlocks;
                numResultBlocks++;
                result[i2] = new DataBlock(numDataCodewords, new byte[numBlockCodewords]);
            }
        }
        int shorterBlocksTotalCodewords = result[0].codewords.length;
        int longerBlocksStartAt = result.length - 1;
        while (longerBlocksStartAt >= 0) {
            int numCodewords = result[longerBlocksStartAt].codewords.length;
            if (numCodewords == shorterBlocksTotalCodewords) {
                break;
            }
            longerBlocksStartAt--;
        }
        int longerBlocksStartAt2 = longerBlocksStartAt + 1;
        int shorterBlocksNumDataCodewords = shorterBlocksTotalCodewords - ecBlocks.getECCodewordsPerBlock();
        int rawCodewordsOffset = 0;
        for (int i3 = 0; i3 < shorterBlocksNumDataCodewords; i3++) {
            for (int j = 0; j < numResultBlocks; j++) {
                int i4 = rawCodewordsOffset;
                rawCodewordsOffset++;
                result[j].codewords[i3] = rawCodewords[i4];
            }
        }
        for (int j2 = longerBlocksStartAt2; j2 < numResultBlocks; j2++) {
            int i5 = rawCodewordsOffset;
            rawCodewordsOffset++;
            result[j2].codewords[shorterBlocksNumDataCodewords] = rawCodewords[i5];
        }
        int max = result[0].codewords.length;
        for (int i6 = shorterBlocksNumDataCodewords; i6 < max; i6++) {
            int j3 = 0;
            while (j3 < numResultBlocks) {
                int iOffset = j3 < longerBlocksStartAt2 ? i6 : i6 + 1;
                int i7 = rawCodewordsOffset;
                rawCodewordsOffset++;
                result[j3].codewords[iOffset] = rawCodewords[i7];
                j3++;
            }
        }
        return result;
    }

    int getNumDataCodewords() {
        return this.numDataCodewords;
    }

    byte[] getCodewords() {
        return this.codewords;
    }
}
