package com.sun.mail.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/ASCIIUtility.class */
public class ASCIIUtility {
    private ASCIIUtility() {
    }

    public static int parseInt(byte[] b, int start, int end, int radix) throws NumberFormatException {
        int limit;
        if (b == null) {
            throw new NumberFormatException("null");
        }
        int result = 0;
        boolean negative = false;
        int i = start;
        if (end > start) {
            if (b[i] == 45) {
                negative = true;
                limit = Integer.MIN_VALUE;
                i++;
            } else {
                limit = -2147483647;
            }
            int multmin = limit / radix;
            if (i < end) {
                int i2 = i;
                i++;
                int digit = Character.digit((char) b[i2], radix);
                if (digit < 0) {
                    throw new NumberFormatException("illegal number: " + toString(b, start, end));
                }
                result = -digit;
            }
            while (i < end) {
                int i3 = i;
                i++;
                int digit2 = Character.digit((char) b[i3], radix);
                if (digit2 < 0) {
                    throw new NumberFormatException("illegal number");
                }
                if (result < multmin) {
                    throw new NumberFormatException("illegal number");
                }
                int result2 = result * radix;
                if (result2 < limit + digit2) {
                    throw new NumberFormatException("illegal number");
                }
                result = result2 - digit2;
            }
            if (negative) {
                if (i > start + 1) {
                    return result;
                }
                throw new NumberFormatException("illegal number");
            }
            return -result;
        }
        throw new NumberFormatException("illegal number");
    }

    public static int parseInt(byte[] b, int start, int end) throws NumberFormatException {
        return parseInt(b, start, end, 10);
    }

    public static long parseLong(byte[] b, int start, int end, int radix) throws NumberFormatException {
        long limit;
        if (b == null) {
            throw new NumberFormatException("null");
        }
        long result = 0;
        boolean negative = false;
        int i = start;
        if (end > start) {
            if (b[i] == 45) {
                negative = true;
                limit = Long.MIN_VALUE;
                i++;
            } else {
                limit = -9223372036854775807L;
            }
            long multmin = limit / radix;
            if (i < end) {
                int i2 = i;
                i++;
                int digit = Character.digit((char) b[i2], radix);
                if (digit < 0) {
                    throw new NumberFormatException("illegal number: " + toString(b, start, end));
                }
                result = -digit;
            }
            while (i < end) {
                int i3 = i;
                i++;
                int digit2 = Character.digit((char) b[i3], radix);
                if (digit2 < 0) {
                    throw new NumberFormatException("illegal number");
                }
                if (result < multmin) {
                    throw new NumberFormatException("illegal number");
                }
                long result2 = result * radix;
                if (result2 < limit + digit2) {
                    throw new NumberFormatException("illegal number");
                }
                result = result2 - digit2;
            }
            if (negative) {
                if (i > start + 1) {
                    return result;
                }
                throw new NumberFormatException("illegal number");
            }
            return -result;
        }
        throw new NumberFormatException("illegal number");
    }

    public static long parseLong(byte[] b, int start, int end) throws NumberFormatException {
        return parseLong(b, start, end, 10);
    }

    public static String toString(byte[] b, int start, int end) {
        int size = end - start;
        char[] theChars = new char[size];
        int i = 0;
        int j = start;
        while (i < size) {
            int i2 = i;
            i++;
            int i3 = j;
            j++;
            theChars[i2] = (char) (b[i3] & 255);
        }
        return new String(theChars);
    }

    public static String toString(byte[] b) {
        return toString(b, 0, b.length);
    }

    public static String toString(ByteArrayInputStream is) {
        int size = is.available();
        char[] theChars = new char[size];
        byte[] bytes = new byte[size];
        is.read(bytes, 0, size);
        int i = 0;
        while (i < size) {
            int i2 = i;
            int i3 = i;
            i++;
            theChars[i2] = (char) (bytes[i3] & 255);
        }
        return new String(theChars);
    }

    public static byte[] getBytes(String s) {
        char[] chars = s.toCharArray();
        int size = chars.length;
        byte[] bytes = new byte[size];
        int i = 0;
        while (i < size) {
            int i2 = i;
            int i3 = i;
            i++;
            bytes[i2] = (byte) chars[i3];
        }
        return bytes;
    }

    public static byte[] getBytes(InputStream is) throws IOException {
        byte[] buf;
        if (is instanceof ByteArrayInputStream) {
            int size = is.available();
            buf = new byte[size];
            is.read(buf, 0, size);
        } else {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf2 = new byte[1024];
            while (true) {
                int len = is.read(buf2, 0, 1024);
                if (len == -1) {
                    break;
                }
                bos.write(buf2, 0, len);
            }
            buf = bos.toByteArray();
        }
        return buf;
    }
}
