package com.google.zxing.datamatrix.encoder;

import com.google.zxing.Dimension;
import java.util.Arrays;

/* loaded from: core-3.2.0.jar:com/google/zxing/datamatrix/encoder/HighLevelEncoder.class */
public final class HighLevelEncoder {
    private static final char PAD = 129;
    static final char LATCH_TO_C40 = 230;
    static final char LATCH_TO_BASE256 = 231;
    static final char UPPER_SHIFT = 235;
    private static final char MACRO_05 = 236;
    private static final char MACRO_06 = 237;
    static final char LATCH_TO_ANSIX12 = 238;
    static final char LATCH_TO_TEXT = 239;
    static final char LATCH_TO_EDIFACT = 240;
    static final char C40_UNLATCH = 254;
    static final char X12_UNLATCH = 254;
    private static final String MACRO_05_HEADER = "[)>\u001e05\u001d";
    private static final String MACRO_06_HEADER = "[)>\u001e06\u001d";
    private static final String MACRO_TRAILER = "\u001e\u0004";
    static final int ASCII_ENCODATION = 0;
    static final int C40_ENCODATION = 1;
    static final int TEXT_ENCODATION = 2;
    static final int X12_ENCODATION = 3;
    static final int EDIFACT_ENCODATION = 4;
    static final int BASE256_ENCODATION = 5;

    private HighLevelEncoder() {
    }

    private static char randomize253State(char ch, int codewordPosition) {
        int pseudoRandom = ((149 * codewordPosition) % 253) + C40_ENCODATION;
        int tempVariable = ch + pseudoRandom;
        return tempVariable <= 254 ? (char) tempVariable : (char) (tempVariable - 254);
    }

    public static String encodeHighLevel(String msg) {
        return encodeHighLevel(msg, SymbolShapeHint.FORCE_NONE, null, null);
    }

    public static String encodeHighLevel(String msg, SymbolShapeHint shape, Dimension minSize, Dimension maxSize) {
        Encoder[] encoders = {new ASCIIEncoder(), new C40Encoder(), new TextEncoder(), new X12Encoder(), new EdifactEncoder(), new Base256Encoder()};
        EncoderContext context = new EncoderContext(msg);
        context.setSymbolShape(shape);
        context.setSizeConstraints(minSize, maxSize);
        if (msg.startsWith(MACRO_05_HEADER) && msg.endsWith(MACRO_TRAILER)) {
            context.writeCodeword((char) 236);
            context.setSkipAtEnd(TEXT_ENCODATION);
            context.pos += MACRO_05_HEADER.length();
        } else if (msg.startsWith(MACRO_06_HEADER) && msg.endsWith(MACRO_TRAILER)) {
            context.writeCodeword((char) 237);
            context.setSkipAtEnd(TEXT_ENCODATION);
            context.pos += MACRO_06_HEADER.length();
        }
        int encodingMode = 0;
        while (context.hasMoreCharacters()) {
            encoders[encodingMode].encode(context);
            if (context.getNewEncoding() >= 0) {
                encodingMode = context.getNewEncoding();
                context.resetEncoderSignal();
            }
        }
        int len = context.getCodewordCount();
        context.updateSymbolInfo();
        int capacity = context.getSymbolInfo().getDataCapacity();
        if (len < capacity && encodingMode != 0 && encodingMode != BASE256_ENCODATION) {
            context.writeCodeword((char) 254);
        }
        StringBuilder codewords = context.getCodewords();
        if (codewords.length() < capacity) {
            codewords.append((char) 129);
        }
        while (codewords.length() < capacity) {
            codewords.append(randomize253State((char) 129, codewords.length() + C40_ENCODATION));
        }
        return context.getCodewords().toString();
    }

    static int lookAheadTest(CharSequence msg, int startpos, int currentMode) {
        float[] charCounts;
        if (startpos >= msg.length()) {
            return currentMode;
        }
        if (currentMode == 0) {
            charCounts = new float[]{0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.25f};
        } else {
            charCounts = new float[]{1.0f, 2.0f, 2.0f, 2.0f, 2.0f, 2.25f};
            charCounts[currentMode] = 0.0f;
        }
        int charsProcessed = 0;
        while (startpos + charsProcessed != msg.length()) {
            char c = msg.charAt(startpos + charsProcessed);
            charsProcessed += C40_ENCODATION;
            if (isDigit(c)) {
                charCounts[0] = (float) (r0[0] + 0.5d);
            } else if (isExtendedASCII(c)) {
                charCounts[0] = (int) Math.ceil(charCounts[0]);
                float[] fArr = charCounts;
                fArr[0] = fArr[0] + 2.0f;
            } else {
                charCounts[0] = (int) Math.ceil(charCounts[0]);
                float[] fArr2 = charCounts;
                fArr2[0] = fArr2[0] + 1.0f;
            }
            if (isNativeC40(c)) {
                float[] fArr3 = charCounts;
                fArr3[C40_ENCODATION] = fArr3[C40_ENCODATION] + 0.6666667f;
            } else if (isExtendedASCII(c)) {
                float[] fArr4 = charCounts;
                fArr4[C40_ENCODATION] = fArr4[C40_ENCODATION] + 2.6666667f;
            } else {
                float[] fArr5 = charCounts;
                fArr5[C40_ENCODATION] = fArr5[C40_ENCODATION] + 1.3333334f;
            }
            if (isNativeText(c)) {
                float[] fArr6 = charCounts;
                fArr6[TEXT_ENCODATION] = fArr6[TEXT_ENCODATION] + 0.6666667f;
            } else if (isExtendedASCII(c)) {
                float[] fArr7 = charCounts;
                fArr7[TEXT_ENCODATION] = fArr7[TEXT_ENCODATION] + 2.6666667f;
            } else {
                float[] fArr8 = charCounts;
                fArr8[TEXT_ENCODATION] = fArr8[TEXT_ENCODATION] + 1.3333334f;
            }
            if (isNativeX12(c)) {
                float[] fArr9 = charCounts;
                fArr9[3] = fArr9[3] + 0.6666667f;
            } else if (isExtendedASCII(c)) {
                float[] fArr10 = charCounts;
                fArr10[3] = fArr10[3] + 4.3333335f;
            } else {
                float[] fArr11 = charCounts;
                fArr11[3] = fArr11[3] + 3.3333333f;
            }
            if (isNativeEDIFACT(c)) {
                float[] fArr12 = charCounts;
                fArr12[EDIFACT_ENCODATION] = fArr12[EDIFACT_ENCODATION] + 0.75f;
            } else if (isExtendedASCII(c)) {
                float[] fArr13 = charCounts;
                fArr13[EDIFACT_ENCODATION] = fArr13[EDIFACT_ENCODATION] + 4.25f;
            } else {
                float[] fArr14 = charCounts;
                fArr14[EDIFACT_ENCODATION] = fArr14[EDIFACT_ENCODATION] + 3.25f;
            }
            if (isSpecialB256(c)) {
                float[] fArr15 = charCounts;
                fArr15[BASE256_ENCODATION] = fArr15[BASE256_ENCODATION] + 4.0f;
            } else {
                float[] fArr16 = charCounts;
                fArr16[BASE256_ENCODATION] = fArr16[BASE256_ENCODATION] + 1.0f;
            }
            if (charsProcessed >= EDIFACT_ENCODATION) {
                int[] intCharCounts = new int[6];
                byte[] mins = new byte[6];
                findMinimums(charCounts, intCharCounts, Integer.MAX_VALUE, mins);
                int minCount = getMinimumCount(mins);
                if (intCharCounts[0] < intCharCounts[BASE256_ENCODATION] && intCharCounts[0] < intCharCounts[C40_ENCODATION] && intCharCounts[0] < intCharCounts[TEXT_ENCODATION] && intCharCounts[0] < intCharCounts[3] && intCharCounts[0] < intCharCounts[EDIFACT_ENCODATION]) {
                    return 0;
                }
                if (intCharCounts[BASE256_ENCODATION] < intCharCounts[0] || mins[C40_ENCODATION] + mins[TEXT_ENCODATION] + mins[3] + mins[EDIFACT_ENCODATION] == 0) {
                    return BASE256_ENCODATION;
                }
                if (minCount == C40_ENCODATION && mins[EDIFACT_ENCODATION] > 0) {
                    return EDIFACT_ENCODATION;
                }
                if (minCount == C40_ENCODATION && mins[TEXT_ENCODATION] > 0) {
                    return TEXT_ENCODATION;
                }
                if (minCount == C40_ENCODATION && mins[3] > 0) {
                    return 3;
                }
                if (intCharCounts[C40_ENCODATION] + C40_ENCODATION < intCharCounts[0] && intCharCounts[C40_ENCODATION] + C40_ENCODATION < intCharCounts[BASE256_ENCODATION] && intCharCounts[C40_ENCODATION] + C40_ENCODATION < intCharCounts[EDIFACT_ENCODATION] && intCharCounts[C40_ENCODATION] + C40_ENCODATION < intCharCounts[TEXT_ENCODATION]) {
                    if (intCharCounts[C40_ENCODATION] < intCharCounts[3]) {
                        return C40_ENCODATION;
                    }
                    if (intCharCounts[C40_ENCODATION] == intCharCounts[3]) {
                        for (int p = startpos + charsProcessed + C40_ENCODATION; p < msg.length(); p += C40_ENCODATION) {
                            char tc = msg.charAt(p);
                            if (isX12TermSep(tc)) {
                                return 3;
                            }
                            if (!isNativeX12(tc)) {
                                return C40_ENCODATION;
                            }
                        }
                        return C40_ENCODATION;
                    }
                }
            }
        }
        byte[] mins2 = new byte[6];
        int[] intCharCounts2 = new int[6];
        int min = findMinimums(charCounts, intCharCounts2, Integer.MAX_VALUE, mins2);
        int minCount2 = getMinimumCount(mins2);
        if (intCharCounts2[0] == min) {
            return 0;
        }
        if (minCount2 == C40_ENCODATION && mins2[BASE256_ENCODATION] > 0) {
            return BASE256_ENCODATION;
        }
        if (minCount2 == C40_ENCODATION && mins2[EDIFACT_ENCODATION] > 0) {
            return EDIFACT_ENCODATION;
        }
        if (minCount2 == C40_ENCODATION && mins2[TEXT_ENCODATION] > 0) {
            return TEXT_ENCODATION;
        }
        if (minCount2 == C40_ENCODATION && mins2[3] > 0) {
            return 3;
        }
        return C40_ENCODATION;
    }

    private static int findMinimums(float[] charCounts, int[] intCharCounts, int min, byte[] mins) {
        Arrays.fill(mins, (byte) 0);
        for (int i = 0; i < 6; i += C40_ENCODATION) {
            intCharCounts[i] = (int) Math.ceil(charCounts[i]);
            int current = intCharCounts[i];
            if (min > current) {
                min = current;
                Arrays.fill(mins, (byte) 0);
            }
            if (min == current) {
                int i2 = i;
                mins[i2] = (byte) (mins[i2] + C40_ENCODATION);
            }
        }
        return min;
    }

    private static int getMinimumCount(byte[] mins) {
        int minCount = 0;
        for (int i = 0; i < 6; i += C40_ENCODATION) {
            minCount += mins[i];
        }
        return minCount;
    }

    static boolean isDigit(char ch) {
        return ch >= '0' && ch <= '9';
    }

    static boolean isExtendedASCII(char ch) {
        return ch >= 128 && ch <= 255;
    }

    private static boolean isNativeC40(char ch) {
        return ch == ' ' || (ch >= '0' && ch <= '9') || (ch >= 'A' && ch <= 'Z');
    }

    private static boolean isNativeText(char ch) {
        return ch == ' ' || (ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'z');
    }

    private static boolean isNativeX12(char ch) {
        return isX12TermSep(ch) || ch == ' ' || (ch >= '0' && ch <= '9') || (ch >= 'A' && ch <= 'Z');
    }

    private static boolean isX12TermSep(char ch) {
        return ch == '\r' || ch == '*' || ch == '>';
    }

    private static boolean isNativeEDIFACT(char ch) {
        return ch >= ' ' && ch <= '^';
    }

    private static boolean isSpecialB256(char ch) {
        return false;
    }

    public static int determineConsecutiveDigitCount(CharSequence msg, int startpos) {
        int count = 0;
        int len = msg.length();
        int idx = startpos;
        if (idx < len) {
            char ch = msg.charAt(idx);
            while (isDigit(ch) && idx < len) {
                count += C40_ENCODATION;
                idx += C40_ENCODATION;
                if (idx < len) {
                    ch = msg.charAt(idx);
                }
            }
        }
        return count;
    }

    static void illegalCharacter(char c) {
        String hex = Integer.toHexString(c);
        throw new IllegalArgumentException("Illegal character: " + c + " (0x" + ("0000".substring(0, EDIFACT_ENCODATION - hex.length()) + hex) + ')');
    }
}
