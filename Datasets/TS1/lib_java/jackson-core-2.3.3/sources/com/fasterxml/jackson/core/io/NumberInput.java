package com.fasterxml.jackson.core.io;

import java.math.BigDecimal;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/io/NumberInput.class */
public final class NumberInput {
    public static final String NASTY_SMALL_DOUBLE = "2.2250738585072012e-308";
    static final long L_BILLION = 1000000000;
    static final String MIN_LONG_STR_NO_SIGN = String.valueOf(Long.MIN_VALUE).substring(1);
    static final String MAX_LONG_STR = String.valueOf(Long.MAX_VALUE);

    public static int parseInt(char[] cArr, int i, int i2) {
        int i3 = cArr[i] - '0';
        int i4 = i2 + i;
        int i5 = i + 1;
        if (i5 < i4) {
            i3 = (i3 * 10) + (cArr[i5] - '0');
            int i6 = i5 + 1;
            if (i6 < i4) {
                i3 = (i3 * 10) + (cArr[i6] - '0');
                int i7 = i6 + 1;
                if (i7 < i4) {
                    i3 = (i3 * 10) + (cArr[i7] - '0');
                    int i8 = i7 + 1;
                    if (i8 < i4) {
                        i3 = (i3 * 10) + (cArr[i8] - '0');
                        int i9 = i8 + 1;
                        if (i9 < i4) {
                            i3 = (i3 * 10) + (cArr[i9] - '0');
                            int i10 = i9 + 1;
                            if (i10 < i4) {
                                i3 = (i3 * 10) + (cArr[i10] - '0');
                                int i11 = i10 + 1;
                                if (i11 < i4) {
                                    i3 = (i3 * 10) + (cArr[i11] - '0');
                                    int i12 = i11 + 1;
                                    if (i12 < i4) {
                                        i3 = (i3 * 10) + (cArr[i12] - '0');
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return i3;
    }

    public static int parseInt(String str) {
        char charAt = str.charAt(0);
        int length = str.length();
        boolean z = charAt == '-';
        int i = 1;
        if (z) {
            if (length != 1 && length <= 10) {
                i = 1 + 1;
                charAt = str.charAt(1);
            } else {
                return Integer.parseInt(str);
            }
        } else if (length > 9) {
            return Integer.parseInt(str);
        }
        if (charAt > '9' || charAt < '0') {
            return Integer.parseInt(str);
        }
        int i2 = charAt - '0';
        if (i < length) {
            int i3 = i;
            int i4 = i + 1;
            char charAt2 = str.charAt(i3);
            if (charAt2 > '9' || charAt2 < '0') {
                return Integer.parseInt(str);
            }
            i2 = (i2 * 10) + (charAt2 - '0');
            if (i4 < length) {
                int i5 = i4 + 1;
                char charAt3 = str.charAt(i4);
                if (charAt3 > '9' || charAt3 < '0') {
                    return Integer.parseInt(str);
                }
                i2 = (i2 * 10) + (charAt3 - '0');
                if (i5 < length) {
                    do {
                        int i6 = i5;
                        i5++;
                        char charAt4 = str.charAt(i6);
                        if (charAt4 > '9' || charAt4 < '0') {
                            return Integer.parseInt(str);
                        }
                        i2 = (i2 * 10) + (charAt4 - '0');
                    } while (i5 < length);
                }
            }
        }
        return z ? -i2 : i2;
    }

    public static long parseLong(char[] cArr, int i, int i2) {
        int i3 = i2 - 9;
        return (parseInt(cArr, i, i3) * L_BILLION) + parseInt(cArr, i + i3, 9);
    }

    public static long parseLong(String str) {
        if (str.length() <= 9) {
            return parseInt(str);
        }
        return Long.parseLong(str);
    }

    public static boolean inLongRange(char[] cArr, int i, int i2, boolean z) {
        String str = z ? MIN_LONG_STR_NO_SIGN : MAX_LONG_STR;
        int length = str.length();
        if (i2 < length) {
            return true;
        }
        if (i2 > length) {
            return false;
        }
        for (int i3 = 0; i3 < length; i3++) {
            int charAt = cArr[i + i3] - str.charAt(i3);
            if (charAt != 0) {
                return charAt < 0;
            }
        }
        return true;
    }

    public static boolean inLongRange(String str, boolean z) {
        String str2 = z ? MIN_LONG_STR_NO_SIGN : MAX_LONG_STR;
        int length = str2.length();
        int length2 = str.length();
        if (length2 < length) {
            return true;
        }
        if (length2 > length) {
            return false;
        }
        for (int i = 0; i < length; i++) {
            int charAt = str.charAt(i) - str2.charAt(i);
            if (charAt != 0) {
                return charAt < 0;
            }
        }
        return true;
    }

    public static int parseAsInt(String str, int i) {
        if (str == null) {
            return i;
        }
        String trim = str.trim();
        int length = trim.length();
        if (length == 0) {
            return i;
        }
        int i2 = 0;
        if (0 < length) {
            char charAt = trim.charAt(0);
            if (charAt == '+') {
                trim = trim.substring(1);
                length = trim.length();
            } else if (charAt == '-') {
                i2 = 0 + 1;
            }
        }
        while (i2 < length) {
            char charAt2 = trim.charAt(i2);
            if (charAt2 <= '9' && charAt2 >= '0') {
                i2++;
            } else {
                try {
                    return (int) parseDouble(trim);
                } catch (NumberFormatException e) {
                    return i;
                }
            }
        }
        try {
            return Integer.parseInt(trim);
        } catch (NumberFormatException e2) {
            return i;
        }
    }

    public static long parseAsLong(String str, long j) {
        if (str == null) {
            return j;
        }
        String trim = str.trim();
        int length = trim.length();
        if (length == 0) {
            return j;
        }
        int i = 0;
        if (0 < length) {
            char charAt = trim.charAt(0);
            if (charAt == '+') {
                trim = trim.substring(1);
                length = trim.length();
            } else if (charAt == '-') {
                i = 0 + 1;
            }
        }
        while (i < length) {
            char charAt2 = trim.charAt(i);
            if (charAt2 <= '9' && charAt2 >= '0') {
                i++;
            } else {
                try {
                    return (long) parseDouble(trim);
                } catch (NumberFormatException e) {
                    return j;
                }
            }
        }
        try {
            return Long.parseLong(trim);
        } catch (NumberFormatException e2) {
            return j;
        }
    }

    public static double parseAsDouble(String str, double d) {
        if (str == null) {
            return d;
        }
        String trim = str.trim();
        if (trim.length() == 0) {
            return d;
        }
        try {
            return parseDouble(trim);
        } catch (NumberFormatException e) {
            return d;
        }
    }

    public static double parseDouble(String str) throws NumberFormatException {
        if (NASTY_SMALL_DOUBLE.equals(str)) {
            return Double.MIN_VALUE;
        }
        return Double.parseDouble(str);
    }

    public static BigDecimal parseBigDecimal(String str) throws NumberFormatException {
        try {
            return new BigDecimal(str);
        } catch (NumberFormatException e) {
            throw _badBigDecimal(str);
        }
    }

    public static BigDecimal parseBigDecimal(char[] cArr) throws NumberFormatException {
        return parseBigDecimal(cArr, 0, cArr.length);
    }

    public static BigDecimal parseBigDecimal(char[] cArr, int i, int i2) throws NumberFormatException {
        try {
            return new BigDecimal(cArr, i, i2);
        } catch (NumberFormatException e) {
            throw _badBigDecimal(new String(cArr, i, i2));
        }
    }

    private static NumberFormatException _badBigDecimal(String str) {
        return new NumberFormatException("Value \"" + str + "\" can not be represented as BigDecimal");
    }
}
