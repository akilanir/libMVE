package org.apache.commons.lang3.math;

import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.math.BigInteger;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;

/* loaded from: commons-lang3-3.4.jar:org/apache/commons/lang3/math/NumberUtils.class */
public class NumberUtils {
    public static final Long LONG_ZERO = 0L;
    public static final Long LONG_ONE = 1L;
    public static final Long LONG_MINUS_ONE = -1L;
    public static final Integer INTEGER_ZERO = 0;
    public static final Integer INTEGER_ONE = 1;
    public static final Integer INTEGER_MINUS_ONE = -1;
    public static final Short SHORT_ZERO = 0;
    public static final Short SHORT_ONE = 1;
    public static final Short SHORT_MINUS_ONE = -1;
    public static final Byte BYTE_ZERO = (byte) 0;
    public static final Byte BYTE_ONE = (byte) 1;
    public static final Byte BYTE_MINUS_ONE = (byte) -1;
    public static final Double DOUBLE_ZERO = Double.valueOf(0.0d);
    public static final Double DOUBLE_ONE = Double.valueOf(1.0d);
    public static final Double DOUBLE_MINUS_ONE = Double.valueOf(-1.0d);
    public static final Float FLOAT_ZERO = Float.valueOf(0.0f);
    public static final Float FLOAT_ONE = Float.valueOf(1.0f);
    public static final Float FLOAT_MINUS_ONE = Float.valueOf(-1.0f);

    public static int toInt(String str) {
        return toInt(str, 0);
    }

    public static int toInt(String str, int defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    public static long toLong(String str) {
        return toLong(str, 0L);
    }

    public static long toLong(String str, long defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        try {
            return Long.parseLong(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    public static float toFloat(String str) {
        return toFloat(str, 0.0f);
    }

    public static float toFloat(String str, float defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        try {
            return Float.parseFloat(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    public static double toDouble(String str) {
        return toDouble(str, 0.0d);
    }

    public static double toDouble(String str, double defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        try {
            return Double.parseDouble(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    public static byte toByte(String str) {
        return toByte(str, (byte) 0);
    }

    public static byte toByte(String str, byte defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        try {
            return Byte.parseByte(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    public static short toShort(String str) {
        return toShort(str, (short) 0);
    }

    public static short toShort(String str, short defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        try {
            return Short.parseShort(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:112:0x02b7 A[Catch: NumberFormatException -> 0x02cd, TryCatch #6 {NumberFormatException -> 0x02cd, blocks: (B:110:0x02a8, B:112:0x02b7), top: B:188:0x02a8 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Number createNumber(java.lang.String r5) throws java.lang.NumberFormatException {
        /*
            Method dump skipped, instructions count: 936
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.math.NumberUtils.createNumber(java.lang.String):java.lang.Number");
    }

    private static String getMantissa(String str) {
        return getMantissa(str, str.length());
    }

    private static String getMantissa(String str, int stopPos) {
        char firstChar = str.charAt(0);
        boolean hasSign = firstChar == '-' || firstChar == '+';
        return hasSign ? str.substring(1, stopPos) : str.substring(0, stopPos);
    }

    private static boolean isAllZeros(String str) {
        if (str == null) {
            return true;
        }
        for (int i = str.length() - 1; i >= 0; i--) {
            if (str.charAt(i) != '0') {
                return false;
            }
        }
        return str.length() > 0;
    }

    public static Float createFloat(String str) {
        if (str == null) {
            return null;
        }
        return Float.valueOf(str);
    }

    public static Double createDouble(String str) {
        if (str == null) {
            return null;
        }
        return Double.valueOf(str);
    }

    public static Integer createInteger(String str) {
        if (str == null) {
            return null;
        }
        return Integer.decode(str);
    }

    public static Long createLong(String str) {
        if (str == null) {
            return null;
        }
        return Long.decode(str);
    }

    public static BigInteger createBigInteger(String str) {
        if (str == null) {
            return null;
        }
        int pos = 0;
        int radix = 10;
        boolean negate = false;
        if (str.startsWith("-")) {
            negate = true;
            pos = 1;
        }
        if (str.startsWith("0x", pos) || str.startsWith("0X", pos)) {
            radix = 16;
            pos += 2;
        } else if (str.startsWith("#", pos)) {
            radix = 16;
            pos++;
        } else if (str.startsWith("0", pos) && str.length() > pos + 1) {
            radix = 8;
            pos++;
        }
        BigInteger value = new BigInteger(str.substring(pos), radix);
        return negate ? value.negate() : value;
    }

    public static BigDecimal createBigDecimal(String str) {
        if (str == null) {
            return null;
        }
        if (StringUtils.isBlank(str)) {
            throw new NumberFormatException("A blank string is not a valid number");
        }
        if (str.trim().startsWith("--")) {
            throw new NumberFormatException(str + " is not a valid number.");
        }
        return new BigDecimal(str);
    }

    public static long min(long... array) {
        validateArray(array);
        long min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        return min;
    }

    public static int min(int... array) {
        validateArray(array);
        int min = array[0];
        for (int j = 1; j < array.length; j++) {
            if (array[j] < min) {
                min = array[j];
            }
        }
        return min;
    }

    public static short min(short... array) {
        validateArray(array);
        short min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        return min;
    }

    public static byte min(byte... array) {
        validateArray(array);
        byte min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
        }
        return min;
    }

    public static double min(double... array) {
        validateArray(array);
        double min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (!Double.isNaN(array[i])) {
                if (array[i] < min) {
                    min = array[i];
                }
            } else {
                return Double.NaN;
            }
        }
        return min;
    }

    public static float min(float... array) {
        validateArray(array);
        float min = array[0];
        for (int i = 1; i < array.length; i++) {
            if (!Float.isNaN(array[i])) {
                if (array[i] < min) {
                    min = array[i];
                }
            } else {
                return Float.NaN;
            }
        }
        return min;
    }

    public static long max(long... array) {
        validateArray(array);
        long max = array[0];
        for (int j = 1; j < array.length; j++) {
            if (array[j] > max) {
                max = array[j];
            }
        }
        return max;
    }

    public static int max(int... array) {
        validateArray(array);
        int max = array[0];
        for (int j = 1; j < array.length; j++) {
            if (array[j] > max) {
                max = array[j];
            }
        }
        return max;
    }

    public static short max(short... array) {
        validateArray(array);
        short max = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] > max) {
                max = array[i];
            }
        }
        return max;
    }

    public static byte max(byte... array) {
        validateArray(array);
        byte max = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] > max) {
                max = array[i];
            }
        }
        return max;
    }

    public static double max(double... array) {
        validateArray(array);
        double max = array[0];
        for (int j = 1; j < array.length; j++) {
            if (!Double.isNaN(array[j])) {
                if (array[j] > max) {
                    max = array[j];
                }
            } else {
                return Double.NaN;
            }
        }
        return max;
    }

    public static float max(float... array) {
        validateArray(array);
        float max = array[0];
        for (int j = 1; j < array.length; j++) {
            if (!Float.isNaN(array[j])) {
                if (array[j] > max) {
                    max = array[j];
                }
            } else {
                return Float.NaN;
            }
        }
        return max;
    }

    private static void validateArray(Object array) {
        if (array == null) {
            throw new IllegalArgumentException("The Array must not be null");
        }
        Validate.isTrue(Array.getLength(array) != 0, "Array cannot be empty.", new Object[0]);
    }

    public static long min(long a, long b, long c) {
        if (b < a) {
            a = b;
        }
        if (c < a) {
            a = c;
        }
        return a;
    }

    public static int min(int a, int b, int c) {
        if (b < a) {
            a = b;
        }
        if (c < a) {
            a = c;
        }
        return a;
    }

    public static short min(short a, short b, short c) {
        if (b < a) {
            a = b;
        }
        if (c < a) {
            a = c;
        }
        return a;
    }

    public static byte min(byte a, byte b, byte c) {
        if (b < a) {
            a = b;
        }
        if (c < a) {
            a = c;
        }
        return a;
    }

    public static double min(double a, double b, double c) {
        return Math.min(Math.min(a, b), c);
    }

    public static float min(float a, float b, float c) {
        return Math.min(Math.min(a, b), c);
    }

    public static long max(long a, long b, long c) {
        if (b > a) {
            a = b;
        }
        if (c > a) {
            a = c;
        }
        return a;
    }

    public static int max(int a, int b, int c) {
        if (b > a) {
            a = b;
        }
        if (c > a) {
            a = c;
        }
        return a;
    }

    public static short max(short a, short b, short c) {
        if (b > a) {
            a = b;
        }
        if (c > a) {
            a = c;
        }
        return a;
    }

    public static byte max(byte a, byte b, byte c) {
        if (b > a) {
            a = b;
        }
        if (c > a) {
            a = c;
        }
        return a;
    }

    public static double max(double a, double b, double c) {
        return Math.max(Math.max(a, b), c);
    }

    public static float max(float a, float b, float c) {
        return Math.max(Math.max(a, b), c);
    }

    public static boolean isDigits(String str) {
        if (StringUtils.isEmpty(str)) {
            return false;
        }
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isNumber(String str) {
        if (StringUtils.isEmpty(str)) {
            return false;
        }
        char[] chars = str.toCharArray();
        int sz = chars.length;
        boolean hasExp = false;
        boolean hasDecPoint = false;
        boolean allowSigns = false;
        boolean foundDigit = false;
        int start = chars[0] == '-' ? 1 : 0;
        if (sz > start + 1 && chars[start] == '0') {
            if (chars[start + 1] == 'x' || chars[start + 1] == 'X') {
                int i = start + 2;
                if (i == sz) {
                    return false;
                }
                while (i < chars.length) {
                    if ((chars[i] >= '0' && chars[i] <= '9') || ((chars[i] >= 'a' && chars[i] <= 'f') || (chars[i] >= 'A' && chars[i] <= 'F'))) {
                        i++;
                    } else {
                        return false;
                    }
                }
                return true;
            }
            if (Character.isDigit(chars[start + 1])) {
                for (int i2 = start + 1; i2 < chars.length; i2++) {
                    if (chars[i2] < '0' || chars[i2] > '7') {
                        return false;
                    }
                }
                return true;
            }
        }
        int sz2 = sz - 1;
        int i3 = start;
        while (true) {
            if (i3 >= sz2 && (i3 >= sz2 + 1 || !allowSigns || foundDigit)) {
                break;
            }
            if (chars[i3] >= '0' && chars[i3] <= '9') {
                foundDigit = true;
                allowSigns = false;
            } else if (chars[i3] == '.') {
                if (hasDecPoint || hasExp) {
                    return false;
                }
                hasDecPoint = true;
            } else if (chars[i3] == 'e' || chars[i3] == 'E') {
                if (hasExp || !foundDigit) {
                    return false;
                }
                hasExp = true;
                allowSigns = true;
            } else {
                if ((chars[i3] != '+' && chars[i3] != '-') || !allowSigns) {
                    return false;
                }
                allowSigns = false;
                foundDigit = false;
            }
            i3++;
        }
        if (i3 >= chars.length) {
            return !allowSigns && foundDigit;
        }
        if (chars[i3] >= '0' && chars[i3] <= '9') {
            return true;
        }
        if (chars[i3] == 'e' || chars[i3] == 'E') {
            return false;
        }
        if (chars[i3] == '.') {
            if (hasDecPoint || hasExp) {
                return false;
            }
            return foundDigit;
        }
        if (allowSigns || !(chars[i3] == 'd' || chars[i3] == 'D' || chars[i3] == 'f' || chars[i3] == 'F')) {
            return (chars[i3] == 'l' || chars[i3] == 'L') && foundDigit && !hasExp && !hasDecPoint;
        }
        return foundDigit;
    }

    public static boolean isParsable(String str) {
        if (StringUtils.endsWith(str, ".")) {
            return false;
        }
        if (StringUtils.startsWith(str, "-")) {
            return isDigits(StringUtils.replaceOnce(str.substring(1), ".", ""));
        }
        return isDigits(StringUtils.replaceOnce(str, ".", ""));
    }

    public static int compare(int x, int y) {
        if (x == y) {
            return 0;
        }
        if (x < y) {
            return -1;
        }
        return 1;
    }

    public static int compare(long x, long y) {
        if (x == y) {
            return 0;
        }
        if (x < y) {
            return -1;
        }
        return 1;
    }

    public static int compare(short x, short y) {
        if (x == y) {
            return 0;
        }
        if (x < y) {
            return -1;
        }
        return 1;
    }

    public static int compare(byte x, byte y) {
        return x - y;
    }
}
