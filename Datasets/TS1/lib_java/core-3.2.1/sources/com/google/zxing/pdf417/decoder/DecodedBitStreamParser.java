package com.google.zxing.pdf417.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.CharacterSetECI;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.pdf417.PDF417Common;
import com.google.zxing.pdf417.PDF417ResultMetadata;
import java.io.ByteArrayOutputStream;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.util.Arrays;

/* loaded from: core-3.2.1.jar:com/google/zxing/pdf417/decoder/DecodedBitStreamParser.class */
final class DecodedBitStreamParser {
    private static final int TEXT_COMPACTION_MODE_LATCH = 900;
    private static final int BYTE_COMPACTION_MODE_LATCH = 901;
    private static final int NUMERIC_COMPACTION_MODE_LATCH = 902;
    private static final int BYTE_COMPACTION_MODE_LATCH_6 = 924;
    private static final int ECI_USER_DEFINED = 925;
    private static final int ECI_GENERAL_PURPOSE = 926;
    private static final int ECI_CHARSET = 927;
    private static final int BEGIN_MACRO_PDF417_CONTROL_BLOCK = 928;
    private static final int BEGIN_MACRO_PDF417_OPTIONAL_FIELD = 923;
    private static final int MACRO_PDF417_TERMINATOR = 922;
    private static final int MODE_SHIFT_TO_BYTE_COMPACTION_MODE = 913;
    private static final int MAX_NUMERIC_CODEWORDS = 15;
    private static final int PL = 25;
    private static final int LL = 27;
    private static final int AS = 27;
    private static final int ML = 28;
    private static final int AL = 28;
    private static final int PS = 29;
    private static final int PAL = 29;
    private static final char[] PUNCT_CHARS = {';', '<', '>', '@', '[', '\\', ']', '_', '`', '~', '!', '\r', '\t', ',', ':', '\n', '-', '.', '$', '/', '\"', '|', '*', '(', ')', '?', '{', '}', '\''};
    private static final char[] MIXED_CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '&', '\r', '\t', ',', ':', '#', '-', '.', '$', '/', '+', '%', '*', '=', '^'};
    private static final Charset DEFAULT_ENCODING = Charset.forName("ISO-8859-1");
    private static final BigInteger[] EXP900 = new BigInteger[16];
    private static final int NUMBER_OF_SEQUENCE_CODEWORDS = 2;

    /* loaded from: core-3.2.1.jar:com/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode.class */
    private enum Mode {
        ALPHA,
        LOWER,
        MIXED,
        PUNCT,
        ALPHA_SHIFT,
        PUNCT_SHIFT
    }

    static {
        EXP900[0] = BigInteger.ONE;
        BigInteger nineHundred = BigInteger.valueOf(900L);
        EXP900[1] = nineHundred;
        for (int i = NUMBER_OF_SEQUENCE_CODEWORDS; i < EXP900.length; i++) {
            EXP900[i] = EXP900[i - 1].multiply(nineHundred);
        }
    }

    private DecodedBitStreamParser() {
    }

    static DecoderResult decode(int[] codewords, String ecLevel) throws FormatException {
        int codeIndex;
        StringBuilder result = new StringBuilder(codewords.length * NUMBER_OF_SEQUENCE_CODEWORDS);
        Charset encoding = DEFAULT_ENCODING;
        int codeIndex2 = 1 + 1;
        int code = codewords[1];
        PDF417ResultMetadata resultMetadata = new PDF417ResultMetadata();
        while (codeIndex2 < codewords[0]) {
            switch (code) {
                case TEXT_COMPACTION_MODE_LATCH /* 900 */:
                    codeIndex = textCompaction(codewords, codeIndex2, result);
                    break;
                case BYTE_COMPACTION_MODE_LATCH /* 901 */:
                case BYTE_COMPACTION_MODE_LATCH_6 /* 924 */:
                    codeIndex = byteCompaction(code, codewords, encoding, codeIndex2, result);
                    break;
                case NUMERIC_COMPACTION_MODE_LATCH /* 902 */:
                    codeIndex = numericCompaction(codewords, codeIndex2, result);
                    break;
                case 903:
                case 904:
                case 905:
                case 906:
                case 907:
                case 908:
                case 909:
                case 910:
                case 911:
                case 912:
                case 914:
                case 915:
                case 916:
                case 917:
                case 918:
                case 919:
                case 920:
                case 921:
                default:
                    codeIndex = textCompaction(codewords, codeIndex2 - 1, result);
                    break;
                case MODE_SHIFT_TO_BYTE_COMPACTION_MODE /* 913 */:
                    int i = codeIndex2;
                    codeIndex = codeIndex2 + 1;
                    result.append((char) codewords[i]);
                    break;
                case MACRO_PDF417_TERMINATOR /* 922 */:
                case BEGIN_MACRO_PDF417_OPTIONAL_FIELD /* 923 */:
                    throw FormatException.getFormatInstance();
                case ECI_USER_DEFINED /* 925 */:
                    codeIndex = codeIndex2 + 1;
                    break;
                case ECI_GENERAL_PURPOSE /* 926 */:
                    codeIndex = codeIndex2 + NUMBER_OF_SEQUENCE_CODEWORDS;
                    break;
                case ECI_CHARSET /* 927 */:
                    int i2 = codeIndex2;
                    codeIndex = codeIndex2 + 1;
                    CharacterSetECI charsetECI = CharacterSetECI.getCharacterSetECIByValue(codewords[i2]);
                    encoding = Charset.forName(charsetECI.name());
                    break;
                case 928:
                    codeIndex = decodeMacroBlock(codewords, codeIndex2, resultMetadata);
                    break;
            }
            if (codeIndex < codewords.length) {
                int i3 = codeIndex;
                codeIndex2 = codeIndex + 1;
                code = codewords[i3];
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (result.length() == 0) {
            throw FormatException.getFormatInstance();
        }
        DecoderResult decoderResult = new DecoderResult(null, result.toString(), null, ecLevel);
        decoderResult.setOther(resultMetadata);
        return decoderResult;
    }

    private static int decodeMacroBlock(int[] codewords, int codeIndex, PDF417ResultMetadata resultMetadata) throws FormatException {
        if (codeIndex + NUMBER_OF_SEQUENCE_CODEWORDS > codewords[0]) {
            throw FormatException.getFormatInstance();
        }
        int[] segmentIndexArray = new int[NUMBER_OF_SEQUENCE_CODEWORDS];
        int i = 0;
        while (i < NUMBER_OF_SEQUENCE_CODEWORDS) {
            segmentIndexArray[i] = codewords[codeIndex];
            i++;
            codeIndex++;
        }
        resultMetadata.setSegmentIndex(Integer.parseInt(decodeBase900toBase10(segmentIndexArray, NUMBER_OF_SEQUENCE_CODEWORDS)));
        StringBuilder fileId = new StringBuilder();
        int codeIndex2 = textCompaction(codewords, codeIndex, fileId);
        resultMetadata.setFileId(fileId.toString());
        if (codewords[codeIndex2] == BEGIN_MACRO_PDF417_OPTIONAL_FIELD) {
            codeIndex2++;
            int[] additionalOptionCodeWords = new int[codewords[0] - codeIndex2];
            int additionalOptionCodeWordsIndex = 0;
            boolean end = false;
            while (codeIndex2 < codewords[0] && !end) {
                int i2 = codeIndex2;
                codeIndex2++;
                int code = codewords[i2];
                if (code < TEXT_COMPACTION_MODE_LATCH) {
                    int i3 = additionalOptionCodeWordsIndex;
                    additionalOptionCodeWordsIndex++;
                    additionalOptionCodeWords[i3] = code;
                } else {
                    switch (code) {
                        case MACRO_PDF417_TERMINATOR /* 922 */:
                            resultMetadata.setLastSegment(true);
                            codeIndex2++;
                            end = true;
                            break;
                        default:
                            throw FormatException.getFormatInstance();
                    }
                }
            }
            resultMetadata.setOptionalData(Arrays.copyOf(additionalOptionCodeWords, additionalOptionCodeWordsIndex));
        } else if (codewords[codeIndex2] == MACRO_PDF417_TERMINATOR) {
            resultMetadata.setLastSegment(true);
            codeIndex2++;
        }
        return codeIndex2;
    }

    private static int textCompaction(int[] codewords, int codeIndex, StringBuilder result) {
        int[] textCompactionData = new int[(codewords[0] - codeIndex) * NUMBER_OF_SEQUENCE_CODEWORDS];
        int[] byteCompactionData = new int[(codewords[0] - codeIndex) * NUMBER_OF_SEQUENCE_CODEWORDS];
        int index = 0;
        boolean end = false;
        while (codeIndex < codewords[0] && !end) {
            int i = codeIndex;
            codeIndex++;
            int code = codewords[i];
            if (code < TEXT_COMPACTION_MODE_LATCH) {
                textCompactionData[index] = code / 30;
                textCompactionData[index + 1] = code % 30;
                index += NUMBER_OF_SEQUENCE_CODEWORDS;
            } else {
                switch (code) {
                    case TEXT_COMPACTION_MODE_LATCH /* 900 */:
                        int i2 = index;
                        index++;
                        textCompactionData[i2] = TEXT_COMPACTION_MODE_LATCH;
                        break;
                    case BYTE_COMPACTION_MODE_LATCH /* 901 */:
                    case NUMERIC_COMPACTION_MODE_LATCH /* 902 */:
                    case MACRO_PDF417_TERMINATOR /* 922 */:
                    case BEGIN_MACRO_PDF417_OPTIONAL_FIELD /* 923 */:
                    case BYTE_COMPACTION_MODE_LATCH_6 /* 924 */:
                    case 928:
                        codeIndex--;
                        end = true;
                        break;
                    case MODE_SHIFT_TO_BYTE_COMPACTION_MODE /* 913 */:
                        textCompactionData[index] = MODE_SHIFT_TO_BYTE_COMPACTION_MODE;
                        codeIndex++;
                        byteCompactionData[index] = codewords[codeIndex];
                        index++;
                        break;
                }
            }
        }
        decodeTextCompaction(textCompactionData, byteCompactionData, index, result);
        return codeIndex;
    }

    private static void decodeTextCompaction(int[] textCompactionData, int[] byteCompactionData, int length, StringBuilder result) {
        Mode subMode = Mode.ALPHA;
        Mode priorToShiftMode = Mode.ALPHA;
        for (int i = 0; i < length; i++) {
            int subModeCh = textCompactionData[i];
            char ch = 0;
            switch (AnonymousClass1.$SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[subMode.ordinal()]) {
                case 1:
                    if (subModeCh < 26) {
                        ch = (char) (65 + subModeCh);
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == 27) {
                        subMode = Mode.LOWER;
                        break;
                    } else if (subModeCh == 28) {
                        subMode = Mode.MIXED;
                        break;
                    } else if (subModeCh == 29) {
                        priorToShiftMode = subMode;
                        subMode = Mode.PUNCT_SHIFT;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    } else if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
                case NUMBER_OF_SEQUENCE_CODEWORDS /* 2 */:
                    if (subModeCh < 26) {
                        ch = (char) (97 + subModeCh);
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == 27) {
                        priorToShiftMode = subMode;
                        subMode = Mode.ALPHA_SHIFT;
                        break;
                    } else if (subModeCh == 28) {
                        subMode = Mode.MIXED;
                        break;
                    } else if (subModeCh == 29) {
                        priorToShiftMode = subMode;
                        subMode = Mode.PUNCT_SHIFT;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    } else if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
                case PDF417Common.MIN_ROWS_IN_BARCODE /* 3 */:
                    if (subModeCh < PL) {
                        ch = MIXED_CHARS[subModeCh];
                        break;
                    } else if (subModeCh == PL) {
                        subMode = Mode.PUNCT;
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == 27) {
                        subMode = Mode.LOWER;
                        break;
                    } else if (subModeCh == 28) {
                        subMode = Mode.ALPHA;
                        break;
                    } else if (subModeCh == 29) {
                        priorToShiftMode = subMode;
                        subMode = Mode.PUNCT_SHIFT;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    } else if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
                case 4:
                    if (subModeCh < 29) {
                        ch = PUNCT_CHARS[subModeCh];
                        break;
                    } else if (subModeCh == 29) {
                        subMode = Mode.ALPHA;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    } else if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
                case 5:
                    subMode = priorToShiftMode;
                    if (subModeCh < 26) {
                        ch = (char) (65 + subModeCh);
                        break;
                    } else if (subModeCh == 26) {
                        ch = ' ';
                        break;
                    } else if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
                case 6:
                    subMode = priorToShiftMode;
                    if (subModeCh < 29) {
                        ch = PUNCT_CHARS[subModeCh];
                        break;
                    } else if (subModeCh == 29) {
                        subMode = Mode.ALPHA;
                        break;
                    } else if (subModeCh == MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                        result.append((char) byteCompactionData[i]);
                        break;
                    } else if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                        subMode = Mode.ALPHA;
                        break;
                    }
                    break;
            }
            if (ch != 0) {
                result.append(ch);
            }
        }
    }

    /* renamed from: com.google.zxing.pdf417.decoder.DecodedBitStreamParser$1, reason: invalid class name */
    /* loaded from: core-3.2.1.jar:com/google/zxing/pdf417/decoder/DecodedBitStreamParser$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode = new int[Mode.values().length];

        static {
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.ALPHA.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.LOWER.ordinal()] = DecodedBitStreamParser.NUMBER_OF_SEQUENCE_CODEWORDS;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.MIXED.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.PUNCT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.ALPHA_SHIFT.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode[Mode.PUNCT_SHIFT.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
        }
    }

    private static int byteCompaction(int mode, int[] codewords, Charset encoding, int codeIndex, StringBuilder result) {
        ByteArrayOutputStream decodedBytes = new ByteArrayOutputStream();
        if (mode == BYTE_COMPACTION_MODE_LATCH) {
            int count = 0;
            long value = 0;
            int[] byteCompactedCodewords = new int[6];
            boolean end = false;
            codeIndex++;
            int nextCode = codewords[codeIndex];
            while (codeIndex < codewords[0] && !end) {
                int i = count;
                count++;
                byteCompactedCodewords[i] = nextCode;
                value = (900 * value) + nextCode;
                int i2 = codeIndex;
                codeIndex++;
                nextCode = codewords[i2];
                if (nextCode == TEXT_COMPACTION_MODE_LATCH || nextCode == BYTE_COMPACTION_MODE_LATCH || nextCode == NUMERIC_COMPACTION_MODE_LATCH || nextCode == BYTE_COMPACTION_MODE_LATCH_6 || nextCode == 928 || nextCode == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || nextCode == MACRO_PDF417_TERMINATOR) {
                    codeIndex--;
                    end = true;
                } else if (count % 5 == 0 && count > 0) {
                    for (int j = 0; j < 6; j++) {
                        decodedBytes.write((byte) (value >> (8 * (5 - j))));
                    }
                    value = 0;
                    count = 0;
                }
            }
            if (codeIndex == codewords[0] && nextCode < TEXT_COMPACTION_MODE_LATCH) {
                int i3 = count;
                count++;
                byteCompactedCodewords[i3] = nextCode;
            }
            for (int i4 = 0; i4 < count; i4++) {
                decodedBytes.write((byte) byteCompactedCodewords[i4]);
            }
        } else if (mode == BYTE_COMPACTION_MODE_LATCH_6) {
            int count2 = 0;
            long value2 = 0;
            boolean end2 = false;
            while (codeIndex < codewords[0] && !end2) {
                int i5 = codeIndex;
                codeIndex++;
                int code = codewords[i5];
                if (code < TEXT_COMPACTION_MODE_LATCH) {
                    count2++;
                    value2 = (900 * value2) + code;
                } else if (code == TEXT_COMPACTION_MODE_LATCH || code == BYTE_COMPACTION_MODE_LATCH || code == NUMERIC_COMPACTION_MODE_LATCH || code == BYTE_COMPACTION_MODE_LATCH_6 || code == 928 || code == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || code == MACRO_PDF417_TERMINATOR) {
                    codeIndex--;
                    end2 = true;
                }
                if (count2 % 5 == 0 && count2 > 0) {
                    for (int j2 = 0; j2 < 6; j2++) {
                        decodedBytes.write((byte) (value2 >> (8 * (5 - j2))));
                    }
                    value2 = 0;
                    count2 = 0;
                }
            }
        }
        result.append(new String(decodedBytes.toByteArray(), encoding));
        return codeIndex;
    }

    private static int numericCompaction(int[] codewords, int codeIndex, StringBuilder result) throws FormatException {
        int count = 0;
        boolean end = false;
        int[] numericCodewords = new int[MAX_NUMERIC_CODEWORDS];
        while (codeIndex < codewords[0] && !end) {
            int i = codeIndex;
            codeIndex++;
            int code = codewords[i];
            if (codeIndex == codewords[0]) {
                end = true;
            }
            if (code < TEXT_COMPACTION_MODE_LATCH) {
                numericCodewords[count] = code;
                count++;
            } else if (code == TEXT_COMPACTION_MODE_LATCH || code == BYTE_COMPACTION_MODE_LATCH || code == BYTE_COMPACTION_MODE_LATCH_6 || code == 928 || code == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || code == MACRO_PDF417_TERMINATOR) {
                codeIndex--;
                end = true;
            }
            if (count % MAX_NUMERIC_CODEWORDS == 0 || code == NUMERIC_COMPACTION_MODE_LATCH || end) {
                if (count > 0) {
                    String s = decodeBase900toBase10(numericCodewords, count);
                    result.append(s);
                    count = 0;
                }
            }
        }
        return codeIndex;
    }

    private static String decodeBase900toBase10(int[] codewords, int count) throws FormatException {
        BigInteger result = BigInteger.ZERO;
        for (int i = 0; i < count; i++) {
            result = result.add(EXP900[(count - i) - 1].multiply(BigInteger.valueOf(codewords[i])));
        }
        String resultString = result.toString();
        if (resultString.charAt(0) != '1') {
            throw FormatException.getFormatInstance();
        }
        return resultString.substring(1);
    }
}
