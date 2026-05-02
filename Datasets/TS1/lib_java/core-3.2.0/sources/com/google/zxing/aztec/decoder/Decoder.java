package com.google.zxing.aztec.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.aztec.AztecDetectorResult;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonDecoder;
import com.google.zxing.common.reedsolomon.ReedSolomonException;
import com.google.zxing.pdf417.PDF417Common;
import java.util.Arrays;

/* loaded from: core-3.2.0.jar:com/google/zxing/aztec/decoder/Decoder.class */
public final class Decoder {
    private static final String[] UPPER_TABLE = {"CTRL_PS", " ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "CTRL_LL", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private static final String[] LOWER_TABLE = {"CTRL_PS", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "CTRL_US", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private static final String[] MIXED_TABLE = {"CTRL_PS", " ", "\u0001", "\u0002", "\u0003", "\u0004", "\u0005", "\u0006", "\u0007", "\b", "\t", "\n", "\u000b", "\f", "\r", "\u001b", "\u001c", "\u001d", "\u001e", "\u001f", "@", "\\", "^", "_", "`", "|", "~", "\u007f", "CTRL_LL", "CTRL_UL", "CTRL_PL", "CTRL_BS"};
    private static final String[] PUNCT_TABLE = {"", "\r", "\r\n", ". ", ", ", ": ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "[", "]", "{", "}", "CTRL_UL"};
    private static final String[] DIGIT_TABLE = {"CTRL_PS", " ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", "CTRL_UL", "CTRL_US"};
    private AztecDetectorResult ddata;

    /* loaded from: core-3.2.0.jar:com/google/zxing/aztec/decoder/Decoder$Table.class */
    private enum Table {
        UPPER,
        LOWER,
        MIXED,
        DIGIT,
        PUNCT,
        BINARY
    }

    public DecoderResult decode(AztecDetectorResult detectorResult) throws FormatException {
        this.ddata = detectorResult;
        BitMatrix matrix = detectorResult.getBits();
        boolean[] rawbits = extractBits(matrix);
        boolean[] correctedBits = correctBits(rawbits);
        String result = getEncodedData(correctedBits);
        return new DecoderResult(null, result, null, null);
    }

    public static String highLevelDecode(boolean[] correctedBits) {
        return getEncodedData(correctedBits);
    }

    private static String getEncodedData(boolean[] correctedBits) {
        int endIndex = correctedBits.length;
        Table latchTable = Table.UPPER;
        Table shiftTable = Table.UPPER;
        StringBuilder result = new StringBuilder(20);
        int index = 0;
        while (index < endIndex) {
            if (shiftTable == Table.BINARY) {
                if (endIndex - index < 5) {
                    break;
                }
                int length = readCode(correctedBits, index, 5);
                index += 5;
                if (length == 0) {
                    if (endIndex - index < 11) {
                        break;
                    }
                    length = readCode(correctedBits, index, 11) + 31;
                    index += 11;
                }
                int charCount = 0;
                while (true) {
                    if (charCount >= length) {
                        break;
                    }
                    if (endIndex - index < 8) {
                        index = endIndex;
                        break;
                    }
                    int code = readCode(correctedBits, index, 8);
                    result.append((char) code);
                    index += 8;
                    charCount++;
                }
                shiftTable = latchTable;
            } else {
                int size = shiftTable == Table.DIGIT ? 4 : 5;
                if (endIndex - index < size) {
                    break;
                }
                int code2 = readCode(correctedBits, index, size);
                index += size;
                String str = getCharacter(shiftTable, code2);
                if (str.startsWith("CTRL_")) {
                    shiftTable = getTable(str.charAt(5));
                    if (str.charAt(6) == 'L') {
                        latchTable = shiftTable;
                    }
                } else {
                    result.append(str);
                    shiftTable = latchTable;
                }
            }
        }
        return result.toString();
    }

    private static Table getTable(char t) {
        switch (t) {
            case 'B':
                return Table.BINARY;
            case 'C':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'I':
            case 'J':
            case 'K':
            case 'N':
            case 'O':
            case 'Q':
            case 'R':
            case 'S':
            case 'T':
            case 'U':
            default:
                return Table.UPPER;
            case 'D':
                return Table.DIGIT;
            case 'L':
                return Table.LOWER;
            case 'M':
                return Table.MIXED;
            case 'P':
                return Table.PUNCT;
        }
    }

    /* renamed from: com.google.zxing.aztec.decoder.Decoder$1, reason: invalid class name */
    /* loaded from: core-3.2.0.jar:com/google/zxing/aztec/decoder/Decoder$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$zxing$aztec$decoder$Decoder$Table = new int[Table.values().length];

        static {
            try {
                $SwitchMap$com$google$zxing$aztec$decoder$Decoder$Table[Table.UPPER.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$zxing$aztec$decoder$Decoder$Table[Table.LOWER.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$google$zxing$aztec$decoder$Decoder$Table[Table.MIXED.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$google$zxing$aztec$decoder$Decoder$Table[Table.PUNCT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$google$zxing$aztec$decoder$Decoder$Table[Table.DIGIT.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    private static String getCharacter(Table table, int code) {
        switch (AnonymousClass1.$SwitchMap$com$google$zxing$aztec$decoder$Decoder$Table[table.ordinal()]) {
            case 1:
                return UPPER_TABLE[code];
            case 2:
                return LOWER_TABLE[code];
            case PDF417Common.MIN_ROWS_IN_BARCODE /* 3 */:
                return MIXED_TABLE[code];
            case 4:
                return PUNCT_TABLE[code];
            case 5:
                return DIGIT_TABLE[code];
            default:
                throw new IllegalStateException("Bad table");
        }
    }

    private boolean[] correctBits(boolean[] rawbits) throws FormatException {
        int codewordSize;
        GenericGF gf;
        if (this.ddata.getNbLayers() <= 2) {
            codewordSize = 6;
            gf = GenericGF.AZTEC_DATA_6;
        } else if (this.ddata.getNbLayers() <= 8) {
            codewordSize = 8;
            gf = GenericGF.AZTEC_DATA_8;
        } else if (this.ddata.getNbLayers() <= 22) {
            codewordSize = 10;
            gf = GenericGF.AZTEC_DATA_10;
        } else {
            codewordSize = 12;
            gf = GenericGF.AZTEC_DATA_12;
        }
        int numDataCodewords = this.ddata.getNbDatablocks();
        int numCodewords = rawbits.length / codewordSize;
        if (numCodewords < numDataCodewords) {
            throw FormatException.getFormatInstance();
        }
        int offset = rawbits.length % codewordSize;
        int numECCodewords = numCodewords - numDataCodewords;
        int[] dataWords = new int[numCodewords];
        int i = 0;
        while (i < numCodewords) {
            dataWords[i] = readCode(rawbits, offset, codewordSize);
            i++;
            offset += codewordSize;
        }
        try {
            ReedSolomonDecoder rsDecoder = new ReedSolomonDecoder(gf);
            rsDecoder.decode(dataWords, numECCodewords);
            int mask = (1 << codewordSize) - 1;
            int stuffedBits = 0;
            for (int i2 = 0; i2 < numDataCodewords; i2++) {
                int dataWord = dataWords[i2];
                if (dataWord == 0 || dataWord == mask) {
                    throw FormatException.getFormatInstance();
                }
                if (dataWord == 1 || dataWord == mask - 1) {
                    stuffedBits++;
                }
            }
            boolean[] correctedBits = new boolean[(numDataCodewords * codewordSize) - stuffedBits];
            int index = 0;
            for (int i3 = 0; i3 < numDataCodewords; i3++) {
                int dataWord2 = dataWords[i3];
                if (dataWord2 == 1 || dataWord2 == mask - 1) {
                    Arrays.fill(correctedBits, index, (index + codewordSize) - 1, dataWord2 > 1);
                    index += codewordSize - 1;
                } else {
                    for (int bit = codewordSize - 1; bit >= 0; bit--) {
                        int i4 = index;
                        index++;
                        correctedBits[i4] = (dataWord2 & (1 << bit)) != 0;
                    }
                }
            }
            return correctedBits;
        } catch (ReedSolomonException ex) {
            throw FormatException.getFormatInstance(ex);
        }
    }

    boolean[] extractBits(BitMatrix matrix) {
        boolean compact = this.ddata.isCompact();
        int layers = this.ddata.getNbLayers();
        int baseMatrixSize = compact ? 11 + (layers * 4) : 14 + (layers * 4);
        int[] alignmentMap = new int[baseMatrixSize];
        boolean[] rawbits = new boolean[totalBitsInLayer(layers, compact)];
        if (compact) {
            for (int i = 0; i < alignmentMap.length; i++) {
                alignmentMap[i] = i;
            }
        } else {
            int matrixSize = baseMatrixSize + 1 + (2 * (((baseMatrixSize / 2) - 1) / 15));
            int origCenter = baseMatrixSize / 2;
            int center = matrixSize / 2;
            for (int i2 = 0; i2 < origCenter; i2++) {
                int newOffset = i2 + (i2 / 15);
                alignmentMap[(origCenter - i2) - 1] = (center - newOffset) - 1;
                alignmentMap[origCenter + i2] = center + newOffset + 1;
            }
        }
        int rowOffset = 0;
        for (int i3 = 0; i3 < layers; i3++) {
            int rowSize = compact ? ((layers - i3) * 4) + 9 : ((layers - i3) * 4) + 12;
            int low = i3 * 2;
            int high = (baseMatrixSize - 1) - low;
            for (int j = 0; j < rowSize; j++) {
                int columnOffset = j * 2;
                for (int k = 0; k < 2; k++) {
                    rawbits[rowOffset + columnOffset + k] = matrix.get(alignmentMap[low + k], alignmentMap[low + j]);
                    rawbits[rowOffset + (2 * rowSize) + columnOffset + k] = matrix.get(alignmentMap[low + j], alignmentMap[high - k]);
                    rawbits[rowOffset + (4 * rowSize) + columnOffset + k] = matrix.get(alignmentMap[high - k], alignmentMap[high - j]);
                    rawbits[rowOffset + (6 * rowSize) + columnOffset + k] = matrix.get(alignmentMap[high - j], alignmentMap[low + k]);
                }
            }
            rowOffset += rowSize * 8;
        }
        return rawbits;
    }

    private static int readCode(boolean[] rawbits, int startIndex, int length) {
        int res = 0;
        for (int i = startIndex; i < startIndex + length; i++) {
            res <<= 1;
            if (rawbits[i]) {
                res |= 1;
            }
        }
        return res;
    }

    private static int totalBitsInLayer(int layers, boolean compact) {
        return ((compact ? 88 : 112) + (16 * layers)) * layers;
    }
}
