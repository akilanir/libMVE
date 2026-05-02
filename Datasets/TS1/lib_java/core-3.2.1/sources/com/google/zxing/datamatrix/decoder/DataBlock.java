package com.google.zxing.datamatrix.decoder;

import com.google.zxing.datamatrix.decoder.Version;

/* loaded from: core-3.2.1.jar:com/google/zxing/datamatrix/decoder/DataBlock.class */
final class DataBlock {
    private final int numDataCodewords;
    private final byte[] codewords;

    private DataBlock(int numDataCodewords, byte[] codewords) {
        this.numDataCodewords = numDataCodewords;
        this.codewords = codewords;
    }

    static DataBlock[] getDataBlocks(byte[] rawCodewords, Version version) {
        Version.ECBlocks ecBlocks = version.getECBlocks();
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
                int numBlockCodewords = ecBlocks.getECCodewords() + numDataCodewords;
                int i2 = numResultBlocks;
                numResultBlocks++;
                result[i2] = new DataBlock(numDataCodewords, new byte[numBlockCodewords]);
            }
        }
        int longerBlocksTotalCodewords = result[0].codewords.length;
        int longerBlocksNumDataCodewords = longerBlocksTotalCodewords - ecBlocks.getECCodewords();
        int shorterBlocksNumDataCodewords = longerBlocksNumDataCodewords - 1;
        int rawCodewordsOffset = 0;
        for (int i3 = 0; i3 < shorterBlocksNumDataCodewords; i3++) {
            for (int j = 0; j < numResultBlocks; j++) {
                int i4 = rawCodewordsOffset;
                rawCodewordsOffset++;
                result[j].codewords[i3] = rawCodewords[i4];
            }
        }
        boolean specialVersion = version.getVersionNumber() == 24;
        int numLongerBlocks = specialVersion ? 8 : numResultBlocks;
        for (int j2 = 0; j2 < numLongerBlocks; j2++) {
            int i5 = rawCodewordsOffset;
            rawCodewordsOffset++;
            result[j2].codewords[longerBlocksNumDataCodewords - 1] = rawCodewords[i5];
        }
        int max = result[0].codewords.length;
        for (int i6 = longerBlocksNumDataCodewords; i6 < max; i6++) {
            for (int j3 = 0; j3 < numResultBlocks; j3++) {
                int jOffset = specialVersion ? (j3 + 8) % numResultBlocks : j3;
                int iOffset = (!specialVersion || jOffset <= 7) ? i6 : i6 - 1;
                int i7 = rawCodewordsOffset;
                rawCodewordsOffset++;
                result[jOffset].codewords[iOffset] = rawCodewords[i7];
            }
        }
        if (rawCodewordsOffset != rawCodewords.length) {
            throw new IllegalArgumentException();
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
