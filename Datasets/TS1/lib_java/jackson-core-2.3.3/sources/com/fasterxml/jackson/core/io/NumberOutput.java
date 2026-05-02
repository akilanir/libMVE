package com.fasterxml.jackson.core.io;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/io/NumberOutput.class */
public final class NumberOutput {
    private static final char NULL_CHAR = 0;
    private static int MILLION = 1000000;
    private static int BILLION = 1000000000;
    private static long TEN_BILLION_L = 10000000000L;
    private static long THOUSAND_L = 1000;
    private static long MIN_INT_AS_LONG = -2147483648L;
    private static long MAX_INT_AS_LONG = 2147483647L;
    static final String SMALLEST_LONG = String.valueOf(Long.MIN_VALUE);
    static final char[] LEADING_TRIPLETS = new char[4000];
    static final char[] FULL_TRIPLETS = new char[4000];
    static final byte[] FULL_TRIPLETS_B;
    static final String[] sSmallIntStrs;
    static final String[] sSmallIntStrs2;

    static {
        int i = 0;
        int i2 = 0;
        while (i2 < 10) {
            char c = (char) (48 + i2);
            char c2 = i2 == 0 ? (char) 0 : c;
            int i3 = 0;
            while (i3 < 10) {
                char c3 = (char) (48 + i3);
                char c4 = (i2 == 0 && i3 == 0) ? (char) 0 : c3;
                for (int i4 = 0; i4 < 10; i4++) {
                    char c5 = (char) (48 + i4);
                    LEADING_TRIPLETS[i] = c2;
                    LEADING_TRIPLETS[i + 1] = c4;
                    LEADING_TRIPLETS[i + 2] = c5;
                    FULL_TRIPLETS[i] = c;
                    FULL_TRIPLETS[i + 1] = c3;
                    FULL_TRIPLETS[i + 2] = c5;
                    i += 4;
                }
                i3++;
            }
            i2++;
        }
        FULL_TRIPLETS_B = new byte[4000];
        for (int i5 = 0; i5 < 4000; i5++) {
            FULL_TRIPLETS_B[i5] = (byte) FULL_TRIPLETS[i5];
        }
        sSmallIntStrs = new String[]{"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
        sSmallIntStrs2 = new String[]{"-1", "-2", "-3", "-4", "-5", "-6", "-7", "-8", "-9", "-10"};
    }

    public static int outputInt(int i, char[] cArr, int i2) {
        int outputLeadingTriplet;
        int outputFullTriplet;
        if (i < 0) {
            if (i == Integer.MIN_VALUE) {
                return outputLong(i, cArr, i2);
            }
            i2++;
            cArr[i2] = '-';
            i = -i;
        }
        if (i < MILLION) {
            if (i < 1000) {
                if (i < 10) {
                    int i3 = i2;
                    outputFullTriplet = i2 + 1;
                    cArr[i3] = (char) (48 + i);
                } else {
                    outputFullTriplet = outputLeadingTriplet(i, cArr, i2);
                }
            } else {
                int i4 = i / 1000;
                outputFullTriplet = outputFullTriplet(i - (i4 * 1000), cArr, outputLeadingTriplet(i4, cArr, i2));
            }
            return outputFullTriplet;
        }
        boolean z = i >= BILLION;
        if (z) {
            i -= BILLION;
            if (i >= BILLION) {
                i -= BILLION;
                int i5 = i2;
                i2++;
                cArr[i5] = '2';
            } else {
                int i6 = i2;
                i2++;
                cArr[i6] = '1';
            }
        }
        int i7 = i / 1000;
        int i8 = i - (i7 * 1000);
        int i9 = i7 / 1000;
        int i10 = i7 - (i9 * 1000);
        if (z) {
            outputLeadingTriplet = outputFullTriplet(i9, cArr, i2);
        } else {
            outputLeadingTriplet = outputLeadingTriplet(i9, cArr, i2);
        }
        return outputFullTriplet(i8, cArr, outputFullTriplet(i10, cArr, outputLeadingTriplet));
    }

    public static int outputInt(int i, byte[] bArr, int i2) {
        int outputLeadingTriplet;
        int outputFullTriplet;
        if (i < 0) {
            if (i == Integer.MIN_VALUE) {
                return outputLong(i, bArr, i2);
            }
            i2++;
            bArr[i2] = 45;
            i = -i;
        }
        if (i < MILLION) {
            if (i < 1000) {
                if (i < 10) {
                    int i3 = i2;
                    outputFullTriplet = i2 + 1;
                    bArr[i3] = (byte) (48 + i);
                } else {
                    outputFullTriplet = outputLeadingTriplet(i, bArr, i2);
                }
            } else {
                int i4 = i / 1000;
                outputFullTriplet = outputFullTriplet(i - (i4 * 1000), bArr, outputLeadingTriplet(i4, bArr, i2));
            }
            return outputFullTriplet;
        }
        boolean z = i >= BILLION;
        if (z) {
            i -= BILLION;
            if (i >= BILLION) {
                i -= BILLION;
                int i5 = i2;
                i2++;
                bArr[i5] = 50;
            } else {
                int i6 = i2;
                i2++;
                bArr[i6] = 49;
            }
        }
        int i7 = i / 1000;
        int i8 = i - (i7 * 1000);
        int i9 = i7 / 1000;
        int i10 = i7 - (i9 * 1000);
        if (z) {
            outputLeadingTriplet = outputFullTriplet(i9, bArr, i2);
        } else {
            outputLeadingTriplet = outputLeadingTriplet(i9, bArr, i2);
        }
        return outputFullTriplet(i8, bArr, outputFullTriplet(i10, bArr, outputLeadingTriplet));
    }

    public static int outputLong(long j, char[] cArr, int i) {
        if (j < 0) {
            if (j > MIN_INT_AS_LONG) {
                return outputInt((int) j, cArr, i);
            }
            if (j == Long.MIN_VALUE) {
                int length = SMALLEST_LONG.length();
                SMALLEST_LONG.getChars(0, length, cArr, i);
                return i + length;
            }
            i++;
            cArr[i] = '-';
            j = -j;
        } else if (j <= MAX_INT_AS_LONG) {
            return outputInt((int) j, cArr, i);
        }
        int i2 = i;
        int calcLongStrLength = i + calcLongStrLength(j);
        int i3 = calcLongStrLength;
        while (j > MAX_INT_AS_LONG) {
            i3 -= 3;
            long j2 = j / THOUSAND_L;
            outputFullTriplet((int) (j - (j2 * THOUSAND_L)), cArr, i3);
            j = j2;
        }
        int i4 = (int) j;
        while (true) {
            int i5 = i4;
            if (i5 >= 1000) {
                i3 -= 3;
                int i6 = i5 / 1000;
                outputFullTriplet(i5 - (i6 * 1000), cArr, i3);
                i4 = i6;
            } else {
                outputLeadingTriplet(i5, cArr, i2);
                return calcLongStrLength;
            }
        }
    }

    public static int outputLong(long j, byte[] bArr, int i) {
        if (j < 0) {
            if (j > MIN_INT_AS_LONG) {
                return outputInt((int) j, bArr, i);
            }
            if (j == Long.MIN_VALUE) {
                int length = SMALLEST_LONG.length();
                for (int i2 = 0; i2 < length; i2++) {
                    int i3 = i;
                    i++;
                    bArr[i3] = (byte) SMALLEST_LONG.charAt(i2);
                }
                return i;
            }
            i++;
            bArr[i] = 45;
            j = -j;
        } else if (j <= MAX_INT_AS_LONG) {
            return outputInt((int) j, bArr, i);
        }
        int i4 = i;
        int calcLongStrLength = i + calcLongStrLength(j);
        int i5 = calcLongStrLength;
        while (j > MAX_INT_AS_LONG) {
            i5 -= 3;
            long j2 = j / THOUSAND_L;
            outputFullTriplet((int) (j - (j2 * THOUSAND_L)), bArr, i5);
            j = j2;
        }
        int i6 = (int) j;
        while (true) {
            int i7 = i6;
            if (i7 >= 1000) {
                i5 -= 3;
                int i8 = i7 / 1000;
                outputFullTriplet(i7 - (i8 * 1000), bArr, i5);
                i6 = i8;
            } else {
                outputLeadingTriplet(i7, bArr, i4);
                return calcLongStrLength;
            }
        }
    }

    public static String toString(int i) {
        if (i < sSmallIntStrs.length) {
            if (i >= 0) {
                return sSmallIntStrs[i];
            }
            int i2 = (-i) - 1;
            if (i2 < sSmallIntStrs2.length) {
                return sSmallIntStrs2[i2];
            }
        }
        return Integer.toString(i);
    }

    public static String toString(long j) {
        if (j <= 2147483647L && j >= -2147483648L) {
            return toString((int) j);
        }
        return Long.toString(j);
    }

    public static String toString(double d) {
        return Double.toString(d);
    }

    private static int outputLeadingTriplet(int i, char[] cArr, int i2) {
        int i3 = i << 2;
        int i4 = i3 + 1;
        char c = LEADING_TRIPLETS[i3];
        if (c != 0) {
            i2++;
            cArr[i2] = c;
        }
        int i5 = i4 + 1;
        char c2 = LEADING_TRIPLETS[i4];
        if (c2 != 0) {
            int i6 = i2;
            i2++;
            cArr[i6] = c2;
        }
        int i7 = i2;
        int i8 = i2 + 1;
        cArr[i7] = LEADING_TRIPLETS[i5];
        return i8;
    }

    private static int outputLeadingTriplet(int i, byte[] bArr, int i2) {
        int i3 = i << 2;
        int i4 = i3 + 1;
        char c = LEADING_TRIPLETS[i3];
        if (c != 0) {
            i2++;
            bArr[i2] = (byte) c;
        }
        int i5 = i4 + 1;
        char c2 = LEADING_TRIPLETS[i4];
        if (c2 != 0) {
            int i6 = i2;
            i2++;
            bArr[i6] = (byte) c2;
        }
        int i7 = i2;
        int i8 = i2 + 1;
        bArr[i7] = (byte) LEADING_TRIPLETS[i5];
        return i8;
    }

    private static int outputFullTriplet(int i, char[] cArr, int i2) {
        int i3 = i << 2;
        int i4 = i2 + 1;
        int i5 = i3 + 1;
        cArr[i2] = FULL_TRIPLETS[i3];
        int i6 = i4 + 1;
        cArr[i4] = FULL_TRIPLETS[i5];
        int i7 = i6 + 1;
        cArr[i6] = FULL_TRIPLETS[i5 + 1];
        return i7;
    }

    private static int outputFullTriplet(int i, byte[] bArr, int i2) {
        int i3 = i << 2;
        int i4 = i2 + 1;
        int i5 = i3 + 1;
        bArr[i2] = FULL_TRIPLETS_B[i3];
        int i6 = i4 + 1;
        bArr[i4] = FULL_TRIPLETS_B[i5];
        int i7 = i6 + 1;
        bArr[i6] = FULL_TRIPLETS_B[i5 + 1];
        return i7;
    }

    private static int calcLongStrLength(long j) {
        int i = 10;
        long j2 = TEN_BILLION_L;
        while (true) {
            long j3 = j2;
            if (j < j3 || i == 19) {
                break;
            }
            i++;
            j2 = (j3 << 3) + (j3 << 1);
        }
        return i;
    }
}
