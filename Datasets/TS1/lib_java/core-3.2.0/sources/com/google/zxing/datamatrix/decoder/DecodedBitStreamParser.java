package com.google.zxing.datamatrix.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.aztec.encoder.Encoder;
import com.google.zxing.common.BitSource;
import com.google.zxing.pdf417.PDF417Common;
import java.io.UnsupportedEncodingException;
import java.util.Collection;

/* loaded from: core-3.2.0.jar:com/google/zxing/datamatrix/decoder/DecodedBitStreamParser.class */
final class DecodedBitStreamParser {
    private static final char[] C40_BASIC_SET_CHARS = {'*', '*', '*', ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
    private static final char[] C40_SHIFT2_SET_CHARS = {'!', '\"', '#', '$', '%', '&', '\'', '(', ')', '*', '+', ',', '-', '.', '/', ':', ';', '<', '=', '>', '?', '@', '[', '\\', ']', '^', '_'};
    private static final char[] TEXT_BASIC_SET_CHARS = {'*', '*', '*', ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    private static final char[] TEXT_SHIFT2_SET_CHARS = C40_SHIFT2_SET_CHARS;
    private static final char[] TEXT_SHIFT3_SET_CHARS = {'`', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '{', '|', '}', '~', 127};

    /* loaded from: core-3.2.0.jar:com/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode.class */
    private enum Mode {
        PAD_ENCODE,
        ASCII_ENCODE,
        C40_ENCODE,
        TEXT_ENCODE,
        ANSIX12_ENCODE,
        EDIFACT_ENCODE,
        BASE256_ENCODE
    }

    private DecodedBitStreamParser() {
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00ce  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static com.google.zxing.common.DecoderResult decode(byte[] r7) throws com.google.zxing.FormatException {
        /*
            com.google.zxing.common.BitSource r0 = new com.google.zxing.common.BitSource
            r1 = r0
            r2 = r7
            r1.<init>(r2)
            r8 = r0
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r1 = r0
            r2 = 100
            r1.<init>(r2)
            r9 = r0
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r1 = r0
            r2 = 0
            r1.<init>(r2)
            r10 = r0
            java.util.ArrayList r0 = new java.util.ArrayList
            r1 = r0
            r2 = 1
            r1.<init>(r2)
            r11 = r0
            com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$Mode r0 = com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.Mode.ASCII_ENCODE
            r12 = r0
        L2b:
            r0 = r12
            com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$Mode r1 = com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.Mode.ASCII_ENCODE
            if (r0 != r1) goto L3e
            r0 = r8
            r1 = r9
            r2 = r10
            com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$Mode r0 = decodeAsciiSegment(r0, r1, r2)
            r12 = r0
            goto L9b
        L3e:
            int[] r0 = com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.AnonymousClass1.$SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode
            r1 = r12
            int r1 = r1.ordinal()
            r0 = r0[r1]
            switch(r0) {
                case 1: goto L68;
                case 2: goto L70;
                case 3: goto L78;
                case 4: goto L80;
                case 5: goto L88;
                default: goto L92;
            }
        L68:
            r0 = r8
            r1 = r9
            decodeC40Segment(r0, r1)
            goto L96
        L70:
            r0 = r8
            r1 = r9
            decodeTextSegment(r0, r1)
            goto L96
        L78:
            r0 = r8
            r1 = r9
            decodeAnsiX12Segment(r0, r1)
            goto L96
        L80:
            r0 = r8
            r1 = r9
            decodeEdifactSegment(r0, r1)
            goto L96
        L88:
            r0 = r8
            r1 = r9
            r2 = r11
            decodeBase256Segment(r0, r1, r2)
            goto L96
        L92:
            com.google.zxing.FormatException r0 = com.google.zxing.FormatException.getFormatInstance()
            throw r0
        L96:
            com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$Mode r0 = com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.Mode.ASCII_ENCODE
            r12 = r0
        L9b:
            r0 = r12
            com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$Mode r1 = com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.Mode.PAD_ENCODE
            if (r0 == r1) goto Laa
            r0 = r8
            int r0 = r0.available()
            if (r0 > 0) goto L2b
        Laa:
            r0 = r10
            int r0 = r0.length()
            if (r0 <= 0) goto Lb7
            r0 = r9
            r1 = r10
            java.lang.StringBuilder r0 = r0.append(r1)
        Lb7:
            com.google.zxing.common.DecoderResult r0 = new com.google.zxing.common.DecoderResult
            r1 = r0
            r2 = r7
            r3 = r9
            java.lang.String r3 = r3.toString()
            r4 = r11
            boolean r4 = r4.isEmpty()
            if (r4 == 0) goto Lce
            r4 = 0
            goto Ld0
        Lce:
            r4 = r11
        Ld0:
            r5 = 0
            r1.<init>(r2, r3, r4, r5)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.datamatrix.decoder.DecodedBitStreamParser.decode(byte[]):com.google.zxing.common.DecoderResult");
    }

    /* renamed from: com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$1, reason: invalid class name */
    /* loaded from: core-3.2.0.jar:com/google/zxing/datamatrix/decoder/DecodedBitStreamParser$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode = new int[Mode.values().length];

        static {
            try {
                $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[Mode.C40_ENCODE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[Mode.TEXT_ENCODE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[Mode.ANSIX12_ENCODE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[Mode.EDIFACT_ENCODE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode[Mode.BASE256_ENCODE.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    private static Mode decodeAsciiSegment(BitSource bits, StringBuilder result, StringBuilder resultTrailer) throws FormatException {
        boolean upperShift = false;
        do {
            int oneByte = bits.readBits(8);
            if (oneByte == 0) {
                throw FormatException.getFormatInstance();
            }
            if (oneByte <= 128) {
                if (upperShift) {
                    oneByte += 128;
                }
                result.append((char) (oneByte - 1));
                return Mode.ASCII_ENCODE;
            }
            if (oneByte == 129) {
                return Mode.PAD_ENCODE;
            }
            if (oneByte <= 229) {
                int value = oneByte - 130;
                if (value < 10) {
                    result.append('0');
                }
                result.append(value);
            } else {
                if (oneByte == 230) {
                    return Mode.C40_ENCODE;
                }
                if (oneByte == 231) {
                    return Mode.BASE256_ENCODE;
                }
                if (oneByte == 232) {
                    result.append((char) 29);
                } else if (oneByte != 233 && oneByte != 234) {
                    if (oneByte == 235) {
                        upperShift = true;
                    } else if (oneByte == 236) {
                        result.append("[)>\u001e05\u001d");
                        resultTrailer.insert(0, "\u001e\u0004");
                    } else if (oneByte == 237) {
                        result.append("[)>\u001e06\u001d");
                        resultTrailer.insert(0, "\u001e\u0004");
                    } else {
                        if (oneByte == 238) {
                            return Mode.ANSIX12_ENCODE;
                        }
                        if (oneByte == 239) {
                            return Mode.TEXT_ENCODE;
                        }
                        if (oneByte == 240) {
                            return Mode.EDIFACT_ENCODE;
                        }
                        if (oneByte != 241 && oneByte >= 242 && (oneByte != 254 || bits.available() != 0)) {
                            throw FormatException.getFormatInstance();
                        }
                    }
                }
            }
        } while (bits.available() > 0);
        return Mode.ASCII_ENCODE;
    }

    private static void decodeC40Segment(BitSource bits, StringBuilder result) throws FormatException {
        int firstByte;
        boolean upperShift = false;
        int[] cValues = new int[3];
        int shift = 0;
        while (bits.available() != 8 && (firstByte = bits.readBits(8)) != 254) {
            parseTwoBytes(firstByte, bits.readBits(8), cValues);
            for (int i = 0; i < 3; i++) {
                int cValue = cValues[i];
                switch (shift) {
                    case Encoder.DEFAULT_AZTEC_LAYERS /* 0 */:
                        if (cValue < 3) {
                            shift = cValue + 1;
                            break;
                        } else if (cValue < C40_BASIC_SET_CHARS.length) {
                            char c40char = C40_BASIC_SET_CHARS[cValue];
                            if (upperShift) {
                                result.append((char) (c40char + 128));
                                upperShift = false;
                                break;
                            } else {
                                result.append(c40char);
                                break;
                            }
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                    case 1:
                        if (upperShift) {
                            result.append((char) (cValue + 128));
                            upperShift = false;
                        } else {
                            result.append((char) cValue);
                        }
                        shift = 0;
                        break;
                    case 2:
                        if (cValue < C40_SHIFT2_SET_CHARS.length) {
                            char c40char2 = C40_SHIFT2_SET_CHARS[cValue];
                            if (upperShift) {
                                result.append((char) (c40char2 + 128));
                                upperShift = false;
                            } else {
                                result.append(c40char2);
                            }
                        } else if (cValue == 27) {
                            result.append((char) 29);
                        } else if (cValue == 30) {
                            upperShift = true;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        shift = 0;
                        break;
                    case PDF417Common.MIN_ROWS_IN_BARCODE /* 3 */:
                        if (upperShift) {
                            result.append((char) (cValue + 224));
                            upperShift = false;
                        } else {
                            result.append((char) (cValue + 96));
                        }
                        shift = 0;
                        break;
                    default:
                        throw FormatException.getFormatInstance();
                }
            }
            if (bits.available() <= 0) {
                return;
            }
        }
    }

    private static void decodeTextSegment(BitSource bits, StringBuilder result) throws FormatException {
        int firstByte;
        boolean upperShift = false;
        int[] cValues = new int[3];
        int shift = 0;
        while (bits.available() != 8 && (firstByte = bits.readBits(8)) != 254) {
            parseTwoBytes(firstByte, bits.readBits(8), cValues);
            for (int i = 0; i < 3; i++) {
                int cValue = cValues[i];
                switch (shift) {
                    case Encoder.DEFAULT_AZTEC_LAYERS /* 0 */:
                        if (cValue < 3) {
                            shift = cValue + 1;
                            break;
                        } else if (cValue < TEXT_BASIC_SET_CHARS.length) {
                            char textChar = TEXT_BASIC_SET_CHARS[cValue];
                            if (upperShift) {
                                result.append((char) (textChar + 128));
                                upperShift = false;
                                break;
                            } else {
                                result.append(textChar);
                                break;
                            }
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                    case 1:
                        if (upperShift) {
                            result.append((char) (cValue + 128));
                            upperShift = false;
                        } else {
                            result.append((char) cValue);
                        }
                        shift = 0;
                        break;
                    case 2:
                        if (cValue < TEXT_SHIFT2_SET_CHARS.length) {
                            char textChar2 = TEXT_SHIFT2_SET_CHARS[cValue];
                            if (upperShift) {
                                result.append((char) (textChar2 + 128));
                                upperShift = false;
                            } else {
                                result.append(textChar2);
                            }
                        } else if (cValue == 27) {
                            result.append((char) 29);
                        } else if (cValue == 30) {
                            upperShift = true;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        shift = 0;
                        break;
                    case PDF417Common.MIN_ROWS_IN_BARCODE /* 3 */:
                        if (cValue < TEXT_SHIFT3_SET_CHARS.length) {
                            char textChar3 = TEXT_SHIFT3_SET_CHARS[cValue];
                            if (upperShift) {
                                result.append((char) (textChar3 + 128));
                                upperShift = false;
                            } else {
                                result.append(textChar3);
                            }
                            shift = 0;
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                    default:
                        throw FormatException.getFormatInstance();
                }
            }
            if (bits.available() <= 0) {
                return;
            }
        }
    }

    private static void decodeAnsiX12Segment(BitSource bits, StringBuilder result) throws FormatException {
        int firstByte;
        int[] cValues = new int[3];
        while (bits.available() != 8 && (firstByte = bits.readBits(8)) != 254) {
            parseTwoBytes(firstByte, bits.readBits(8), cValues);
            for (int i = 0; i < 3; i++) {
                int cValue = cValues[i];
                if (cValue == 0) {
                    result.append('\r');
                } else if (cValue == 1) {
                    result.append('*');
                } else if (cValue == 2) {
                    result.append('>');
                } else if (cValue == 3) {
                    result.append(' ');
                } else if (cValue < 14) {
                    result.append((char) (cValue + 44));
                } else if (cValue < 40) {
                    result.append((char) (cValue + 51));
                } else {
                    throw FormatException.getFormatInstance();
                }
            }
            if (bits.available() <= 0) {
                return;
            }
        }
    }

    private static void parseTwoBytes(int firstByte, int secondByte, int[] result) {
        int fullBitValue = ((firstByte << 8) + secondByte) - 1;
        int temp = fullBitValue / 1600;
        result[0] = temp;
        int fullBitValue2 = fullBitValue - (temp * 1600);
        int temp2 = fullBitValue2 / 40;
        result[1] = temp2;
        result[2] = fullBitValue2 - (temp2 * 40);
    }

    private static void decodeEdifactSegment(BitSource bits, StringBuilder result) {
        while (bits.available() > 16) {
            for (int i = 0; i < 4; i++) {
                int edifactValue = bits.readBits(6);
                if (edifactValue == 31) {
                    int bitsLeft = 8 - bits.getBitOffset();
                    if (bitsLeft != 8) {
                        bits.readBits(bitsLeft);
                        return;
                    }
                    return;
                }
                if ((edifactValue & 32) == 0) {
                    edifactValue |= 64;
                }
                result.append((char) edifactValue);
            }
            if (bits.available() <= 0) {
                return;
            }
        }
    }

    private static void decodeBase256Segment(BitSource bits, StringBuilder result, Collection<byte[]> byteSegments) throws FormatException {
        int count;
        int codewordPosition = 1 + bits.getByteOffset();
        int codewordPosition2 = codewordPosition + 1;
        int d1 = unrandomize255State(bits.readBits(8), codewordPosition);
        if (d1 == 0) {
            count = bits.available() / 8;
        } else if (d1 < 250) {
            count = d1;
        } else {
            codewordPosition2++;
            count = (250 * (d1 - 249)) + unrandomize255State(bits.readBits(8), codewordPosition2);
        }
        if (count < 0) {
            throw FormatException.getFormatInstance();
        }
        byte[] bytes = new byte[count];
        for (int i = 0; i < count; i++) {
            if (bits.available() < 8) {
                throw FormatException.getFormatInstance();
            }
            int i2 = codewordPosition2;
            codewordPosition2++;
            bytes[i] = (byte) unrandomize255State(bits.readBits(8), i2);
        }
        byteSegments.add(bytes);
        try {
            result.append(new String(bytes, "ISO8859_1"));
        } catch (UnsupportedEncodingException uee) {
            throw new IllegalStateException("Platform does not support required encoding: " + uee);
        }
    }

    private static int unrandomize255State(int randomizedBase256Codeword, int base256CodewordPosition) {
        int pseudoRandomNumber = ((149 * base256CodewordPosition) % 255) + 1;
        int tempVariable = randomizedBase256Codeword - pseudoRandomNumber;
        return tempVariable >= 0 ? tempVariable : tempVariable + 256;
    }
}
