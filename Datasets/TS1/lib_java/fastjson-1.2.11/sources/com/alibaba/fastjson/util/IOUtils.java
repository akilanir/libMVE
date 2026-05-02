package com.alibaba.fastjson.util;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.asm.Opcodes;
import java.io.Closeable;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CoderResult;
import java.nio.charset.MalformedInputException;
import java.util.Arrays;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/util/IOUtils.class */
public class IOUtils {
    public static final Charset UTF8 = Charset.forName("UTF-8");
    public static final char[] DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    public static final boolean[] firstIdentifierFlags = new boolean[256];
    public static final boolean[] identifierFlags;
    public static final byte[] specicalFlags_doubleQuotes;
    public static final byte[] specicalFlags_singleQuotes;
    public static final boolean[] specicalFlags_doubleQuotesFlags;
    public static final boolean[] specicalFlags_singleQuotesFlags;
    public static final char[] replaceChars;
    public static final char[] ASCII_CHARS;
    static final char[] digits;
    static final char[] DigitTens;
    static final char[] DigitOnes;
    static final int[] sizeTable;
    public static final char[] CA;
    public static final int[] IA;

    static {
        char c = 0;
        while (true) {
            char c2 = c;
            if (c2 >= firstIdentifierFlags.length) {
                break;
            }
            if (c2 >= 'A' && c2 <= 'Z') {
                firstIdentifierFlags[c2] = true;
            } else if (c2 >= 'a' && c2 <= 'z') {
                firstIdentifierFlags[c2] = true;
            } else if (c2 == '_') {
                firstIdentifierFlags[c2] = true;
            }
            c = (char) (c2 + 1);
        }
        identifierFlags = new boolean[256];
        char c3 = 0;
        while (true) {
            char c4 = c3;
            if (c4 >= identifierFlags.length) {
                break;
            }
            if (c4 >= 'A' && c4 <= 'Z') {
                identifierFlags[c4] = true;
            } else if (c4 >= 'a' && c4 <= 'z') {
                identifierFlags[c4] = true;
            } else if (c4 == '_') {
                identifierFlags[c4] = true;
            } else if (c4 >= '0' && c4 <= '9') {
                identifierFlags[c4] = true;
            }
            c3 = (char) (c4 + 1);
        }
        specicalFlags_doubleQuotes = new byte[Opcodes.IF_ICMPLT];
        specicalFlags_singleQuotes = new byte[Opcodes.IF_ICMPLT];
        specicalFlags_doubleQuotesFlags = new boolean[Opcodes.IF_ICMPLT];
        specicalFlags_singleQuotesFlags = new boolean[Opcodes.IF_ICMPLT];
        replaceChars = new char[93];
        specicalFlags_doubleQuotes[0] = 4;
        specicalFlags_doubleQuotes[1] = 4;
        specicalFlags_doubleQuotes[2] = 4;
        specicalFlags_doubleQuotes[3] = 4;
        specicalFlags_doubleQuotes[4] = 4;
        specicalFlags_doubleQuotes[5] = 4;
        specicalFlags_doubleQuotes[6] = 4;
        specicalFlags_doubleQuotes[7] = 4;
        specicalFlags_doubleQuotes[8] = 1;
        specicalFlags_doubleQuotes[9] = 1;
        specicalFlags_doubleQuotes[10] = 1;
        specicalFlags_doubleQuotes[11] = 4;
        specicalFlags_doubleQuotes[12] = 1;
        specicalFlags_doubleQuotes[13] = 1;
        specicalFlags_doubleQuotes[34] = 1;
        specicalFlags_doubleQuotes[92] = 1;
        specicalFlags_singleQuotes[0] = 4;
        specicalFlags_singleQuotes[1] = 4;
        specicalFlags_singleQuotes[2] = 4;
        specicalFlags_singleQuotes[3] = 4;
        specicalFlags_singleQuotes[4] = 4;
        specicalFlags_singleQuotes[5] = 4;
        specicalFlags_singleQuotes[6] = 4;
        specicalFlags_singleQuotes[7] = 4;
        specicalFlags_singleQuotes[8] = 1;
        specicalFlags_singleQuotes[9] = 1;
        specicalFlags_singleQuotes[10] = 1;
        specicalFlags_singleQuotes[11] = 4;
        specicalFlags_singleQuotes[12] = 1;
        specicalFlags_singleQuotes[13] = 1;
        specicalFlags_singleQuotes[92] = 1;
        specicalFlags_singleQuotes[39] = 1;
        for (int i = 14; i <= 31; i++) {
            specicalFlags_doubleQuotes[i] = 4;
            specicalFlags_singleQuotes[i] = 4;
        }
        for (int i2 = 127; i2 <= 160; i2++) {
            specicalFlags_doubleQuotes[i2] = 4;
            specicalFlags_singleQuotes[i2] = 4;
        }
        for (int i3 = 0; i3 < 161; i3++) {
            specicalFlags_doubleQuotesFlags[i3] = specicalFlags_doubleQuotes[i3] != 0;
            specicalFlags_singleQuotesFlags[i3] = specicalFlags_singleQuotes[i3] != 0;
        }
        replaceChars[0] = '0';
        replaceChars[1] = '1';
        replaceChars[2] = '2';
        replaceChars[3] = '3';
        replaceChars[4] = '4';
        replaceChars[5] = '5';
        replaceChars[6] = '6';
        replaceChars[7] = '7';
        replaceChars[8] = 'b';
        replaceChars[9] = 't';
        replaceChars[10] = 'n';
        replaceChars[11] = 'v';
        replaceChars[12] = 'f';
        replaceChars[13] = 'r';
        replaceChars[34] = '\"';
        replaceChars[39] = '\'';
        replaceChars[47] = '/';
        replaceChars[92] = '\\';
        ASCII_CHARS = new char[]{'0', '0', '0', '1', '0', '2', '0', '3', '0', '4', '0', '5', '0', '6', '0', '7', '0', '8', '0', '9', '0', 'A', '0', 'B', '0', 'C', '0', 'D', '0', 'E', '0', 'F', '1', '0', '1', '1', '1', '2', '1', '3', '1', '4', '1', '5', '1', '6', '1', '7', '1', '8', '1', '9', '1', 'A', '1', 'B', '1', 'C', '1', 'D', '1', 'E', '1', 'F', '2', '0', '2', '1', '2', '2', '2', '3', '2', '4', '2', '5', '2', '6', '2', '7', '2', '8', '2', '9', '2', 'A', '2', 'B', '2', 'C', '2', 'D', '2', 'E', '2', 'F'};
        digits = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        DigitTens = new char[]{'0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '6', '6', '6', '6', '6', '6', '6', '6', '6', '6', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '9', '9', '9', '9', '9', '9', '9', '9', '9', '9'};
        DigitOnes = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
        sizeTable = new int[]{9, 99, 999, 9999, 99999, 999999, 9999999, 99999999, 999999999, Integer.MAX_VALUE};
        CA = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".toCharArray();
        IA = new int[256];
        Arrays.fill(IA, -1);
        int iS = CA.length;
        for (int i4 = 0; i4 < iS; i4++) {
            IA[CA[i4]] = i4;
        }
        IA[61] = 0;
    }

    public static void close(Closeable x) {
        if (x != null) {
            try {
                x.close();
            } catch (Exception e) {
            }
        }
    }

    public static int stringSize(long x) {
        long p = 10;
        for (int i = 1; i < 19; i++) {
            if (x < p) {
                return i;
            }
            p = 10 * p;
        }
        return 19;
    }

    public static void getChars(long i, int index, char[] buf) {
        int charPos = index;
        char sign = 0;
        if (i < 0) {
            sign = '-';
            i = -i;
        }
        while (i > 2147483647L) {
            long q = i / 100;
            int r = (int) (i - (((q << 6) + (q << 5)) + (q << 2)));
            i = q;
            int charPos2 = charPos - 1;
            buf[charPos2] = DigitOnes[r];
            charPos = charPos2 - 1;
            buf[charPos] = DigitTens[r];
        }
        int i2 = (int) i;
        while (i2 >= 65536) {
            int q2 = i2 / 100;
            int r2 = i2 - (((q2 << 6) + (q2 << 5)) + (q2 << 2));
            i2 = q2;
            int charPos3 = charPos - 1;
            buf[charPos3] = DigitOnes[r2];
            charPos = charPos3 - 1;
            buf[charPos] = DigitTens[r2];
        }
        do {
            int q22 = (i2 * 52429) >>> 19;
            charPos--;
            buf[charPos] = digits[i2 - ((q22 << 3) + (q22 << 1))];
            i2 = q22;
        } while (i2 != 0);
        if (sign != 0) {
            buf[charPos - 1] = sign;
        }
    }

    public static void getChars(int i, int index, char[] buf) {
        int charPos = index;
        char sign = 0;
        if (i < 0) {
            sign = '-';
            i = -i;
        }
        while (i >= 65536) {
            int q = i / 100;
            int r = i - (((q << 6) + (q << 5)) + (q << 2));
            i = q;
            int charPos2 = charPos - 1;
            buf[charPos2] = DigitOnes[r];
            charPos = charPos2 - 1;
            buf[charPos] = DigitTens[r];
        }
        do {
            int q2 = (i * 52429) >>> 19;
            charPos--;
            buf[charPos] = digits[i - ((q2 << 3) + (q2 << 1))];
            i = q2;
        } while (i != 0);
        if (sign != 0) {
            buf[charPos - 1] = sign;
        }
    }

    public static void getChars(byte b, int index, char[] buf) {
        int i = b;
        int charPos = index;
        char sign = 0;
        if (i < 0) {
            sign = '-';
            i = -i;
        }
        do {
            int q = (i * 52429) >>> 19;
            int r = i - ((q << 3) + (q << 1));
            charPos--;
            buf[charPos] = digits[r];
            i = q;
        } while (i != 0);
        if (sign != 0) {
            buf[charPos - 1] = sign;
        }
    }

    public static int stringSize(int x) {
        int i = 0;
        while (x > sizeTable[i]) {
            i++;
        }
        return i + 1;
    }

    public static void decode(CharsetDecoder charsetDecoder, ByteBuffer byteBuf, CharBuffer charByte) {
        try {
            CoderResult cr = charsetDecoder.decode(byteBuf, charByte, true);
            if (!cr.isUnderflow()) {
                cr.throwException();
            }
            CoderResult cr2 = charsetDecoder.flush(charByte);
            if (!cr2.isUnderflow()) {
                cr2.throwException();
            }
        } catch (CharacterCodingException x) {
            throw new JSONException("utf8 decode error, " + x.getMessage(), x);
        }
    }

    public static boolean firstIdentifier(char ch) {
        return ch < firstIdentifierFlags.length && firstIdentifierFlags[ch];
    }

    public static boolean isIdent(char ch) {
        return ch < identifierFlags.length && identifierFlags[ch];
    }

    public static byte[] decodeBase64(char[] chars, int offset, int charsLen) {
        int i;
        if (charsLen == 0) {
            return new byte[0];
        }
        int sIx = offset;
        int eIx = (offset + charsLen) - 1;
        while (sIx < eIx && IA[chars[sIx]] < 0) {
            sIx++;
        }
        while (eIx > 0 && IA[chars[eIx]] < 0) {
            eIx--;
        }
        int pad = chars[eIx] == '=' ? chars[eIx - 1] == '=' ? 2 : 1 : 0;
        int cCnt = (eIx - sIx) + 1;
        if (charsLen > 76) {
            i = (chars[76] == '\r' ? cCnt / 78 : 0) << 1;
        } else {
            i = 0;
        }
        int sepCnt = i;
        int len = (((cCnt - sepCnt) * 6) >> 3) - pad;
        byte[] bytes = new byte[len];
        int d = 0;
        int cc = 0;
        int eLen = (len / 3) * 3;
        while (d < eLen) {
            int i2 = sIx;
            int sIx2 = sIx + 1;
            int sIx3 = sIx2 + 1;
            int i3 = (IA[chars[i2]] << 18) | (IA[chars[sIx2]] << 12);
            int sIx4 = sIx3 + 1;
            int i4 = i3 | (IA[chars[sIx3]] << 6);
            sIx = sIx4 + 1;
            int i5 = i4 | IA[chars[sIx4]];
            int i6 = d;
            int d2 = d + 1;
            bytes[i6] = (byte) (i5 >> 16);
            int d3 = d2 + 1;
            bytes[d2] = (byte) (i5 >> 8);
            d = d3 + 1;
            bytes[d3] = (byte) i5;
            if (sepCnt > 0) {
                cc++;
                if (cc == 19) {
                    sIx += 2;
                    cc = 0;
                }
            }
        }
        if (d < len) {
            int i7 = 0;
            int j = 0;
            while (sIx <= eIx - pad) {
                int i8 = sIx;
                sIx++;
                i7 |= IA[chars[i8]] << (18 - (j * 6));
                j++;
            }
            int r = 16;
            while (d < len) {
                int i9 = d;
                d++;
                bytes[i9] = (byte) (i7 >> r);
                r -= 8;
            }
        }
        return bytes;
    }

    public static byte[] decodeBase64(String chars, int offset, int charsLen) {
        int i;
        if (charsLen == 0) {
            return new byte[0];
        }
        int sIx = offset;
        int eIx = (offset + charsLen) - 1;
        while (sIx < eIx && IA[chars.charAt(sIx)] < 0) {
            sIx++;
        }
        while (eIx > 0 && IA[chars.charAt(eIx)] < 0) {
            eIx--;
        }
        int pad = chars.charAt(eIx) == '=' ? chars.charAt(eIx - 1) == '=' ? 2 : 1 : 0;
        int cCnt = (eIx - sIx) + 1;
        if (charsLen > 76) {
            i = (chars.charAt(76) == '\r' ? cCnt / 78 : 0) << 1;
        } else {
            i = 0;
        }
        int sepCnt = i;
        int len = (((cCnt - sepCnt) * 6) >> 3) - pad;
        byte[] bytes = new byte[len];
        int d = 0;
        int cc = 0;
        int eLen = (len / 3) * 3;
        while (d < eLen) {
            int i2 = sIx;
            int sIx2 = sIx + 1;
            int sIx3 = sIx2 + 1;
            int i3 = (IA[chars.charAt(i2)] << 18) | (IA[chars.charAt(sIx2)] << 12);
            int sIx4 = sIx3 + 1;
            int i4 = i3 | (IA[chars.charAt(sIx3)] << 6);
            sIx = sIx4 + 1;
            int i5 = i4 | IA[chars.charAt(sIx4)];
            int i6 = d;
            int d2 = d + 1;
            bytes[i6] = (byte) (i5 >> 16);
            int d3 = d2 + 1;
            bytes[d2] = (byte) (i5 >> 8);
            d = d3 + 1;
            bytes[d3] = (byte) i5;
            if (sepCnt > 0) {
                cc++;
                if (cc == 19) {
                    sIx += 2;
                    cc = 0;
                }
            }
        }
        if (d < len) {
            int i7 = 0;
            int j = 0;
            while (sIx <= eIx - pad) {
                int i8 = sIx;
                sIx++;
                i7 |= IA[chars.charAt(i8)] << (18 - (j * 6));
                j++;
            }
            int r = 16;
            while (d < len) {
                int i9 = d;
                d++;
                bytes[i9] = (byte) (i7 >> r);
                r -= 8;
            }
        }
        return bytes;
    }

    public static byte[] decodeBase64(String s) {
        int i;
        int sLen = s.length();
        if (sLen == 0) {
            return new byte[0];
        }
        int sIx = 0;
        int eIx = sLen - 1;
        while (sIx < eIx && IA[s.charAt(sIx) & 255] < 0) {
            sIx++;
        }
        while (eIx > 0 && IA[s.charAt(eIx) & 255] < 0) {
            eIx--;
        }
        int pad = s.charAt(eIx) == '=' ? s.charAt(eIx - 1) == '=' ? 2 : 1 : 0;
        int cCnt = (eIx - sIx) + 1;
        if (sLen > 76) {
            i = (s.charAt(76) == '\r' ? cCnt / 78 : 0) << 1;
        } else {
            i = 0;
        }
        int sepCnt = i;
        int len = (((cCnt - sepCnt) * 6) >> 3) - pad;
        byte[] dArr = new byte[len];
        int d = 0;
        int cc = 0;
        int eLen = (len / 3) * 3;
        while (d < eLen) {
            int i2 = sIx;
            int sIx2 = sIx + 1;
            int sIx3 = sIx2 + 1;
            int i3 = (IA[s.charAt(i2)] << 18) | (IA[s.charAt(sIx2)] << 12);
            int sIx4 = sIx3 + 1;
            int i4 = i3 | (IA[s.charAt(sIx3)] << 6);
            sIx = sIx4 + 1;
            int i5 = i4 | IA[s.charAt(sIx4)];
            int i6 = d;
            int d2 = d + 1;
            dArr[i6] = (byte) (i5 >> 16);
            int d3 = d2 + 1;
            dArr[d2] = (byte) (i5 >> 8);
            d = d3 + 1;
            dArr[d3] = (byte) i5;
            if (sepCnt > 0) {
                cc++;
                if (cc == 19) {
                    sIx += 2;
                    cc = 0;
                }
            }
        }
        if (d < len) {
            int i7 = 0;
            int j = 0;
            while (sIx <= eIx - pad) {
                int i8 = sIx;
                sIx++;
                i7 |= IA[s.charAt(i8)] << (18 - (j * 6));
                j++;
            }
            int r = 16;
            while (d < len) {
                int i9 = d;
                d++;
                dArr[i9] = (byte) (i7 >> r);
                r -= 8;
            }
        }
        return dArr;
    }

    public static int encodeUTF8(char[] sa, int sp, int len, byte[] da) {
        int uc;
        int sl = sp + len;
        int dp = 0;
        int dlASCII = 0 + Math.min(len, da.length);
        while (dp < dlASCII && sa[sp] < 128) {
            int i = dp;
            dp++;
            int i2 = sp;
            sp++;
            da[i] = (byte) sa[i2];
        }
        while (sp < sl) {
            int i3 = sp;
            sp++;
            char c = sa[i3];
            if (c < 128) {
                int i4 = dp;
                dp++;
                da[i4] = (byte) c;
            } else if (c < 2048) {
                int i5 = dp;
                int dp2 = dp + 1;
                da[i5] = (byte) (192 | (c >> 6));
                dp = dp2 + 1;
                da[dp2] = (byte) (128 | (c & '?'));
            } else if (c >= 55296 && c < 57344) {
                int ip = sp - 1;
                if (Character.isHighSurrogate(c)) {
                    if (sl - ip < 2) {
                        uc = -1;
                    } else {
                        char d = sa[ip + 1];
                        if (Character.isLowSurrogate(d)) {
                            uc = Character.toCodePoint(c, d);
                        } else {
                            throw new JSONException("encodeUTF8 error", new MalformedInputException(1));
                        }
                    }
                } else {
                    if (Character.isLowSurrogate(c)) {
                        throw new JSONException("encodeUTF8 error", new MalformedInputException(1));
                    }
                    uc = c;
                }
                if (uc < 0) {
                    int i6 = dp;
                    dp++;
                    da[i6] = 63;
                } else {
                    int i7 = dp;
                    int dp3 = dp + 1;
                    da[i7] = (byte) (240 | (uc >> 18));
                    int dp4 = dp3 + 1;
                    da[dp3] = (byte) (128 | ((uc >> 12) & 63));
                    int dp5 = dp4 + 1;
                    da[dp4] = (byte) (128 | ((uc >> 6) & 63));
                    dp = dp5 + 1;
                    da[dp5] = (byte) (128 | (uc & 63));
                    sp++;
                }
            } else {
                int i8 = dp;
                int dp6 = dp + 1;
                da[i8] = (byte) (224 | (c >> '\f'));
                int dp7 = dp6 + 1;
                da[dp6] = (byte) (128 | ((c >> 6) & 63));
                dp = dp7 + 1;
                da[dp7] = (byte) (128 | (c & '?'));
            }
        }
        return dp;
    }

    public static int decodeUTF8(byte[] sa, int sp, int len, char[] da) {
        int sl = sp + len;
        int dp = 0;
        int dlASCII = Math.min(len, da.length);
        while (dp < dlASCII && sa[sp] >= 0) {
            int i = dp;
            dp++;
            int i2 = sp;
            sp++;
            da[i] = (char) sa[i2];
        }
        while (sp < sl) {
            int i3 = sp;
            sp++;
            byte b = sa[i3];
            if (b >= 0) {
                int i4 = dp;
                dp++;
                da[i4] = (char) b;
            } else if ((b >> 5) == -2 && (b & 30) != 0) {
                if (sp < sl) {
                    sp++;
                    byte b2 = sa[sp];
                    if ((b2 & 192) != 128) {
                        return -1;
                    }
                    int i5 = dp;
                    dp++;
                    da[i5] = (char) (((b << 6) ^ b2) ^ 3968);
                } else {
                    return -1;
                }
            } else if ((b >> 4) == -2) {
                if (sp + 1 < sl) {
                    int sp2 = sp + 1;
                    byte b3 = sa[sp];
                    sp = sp2 + 1;
                    byte b4 = sa[sp2];
                    if ((b == -32 && (b3 & 224) == 128) || (b3 & 192) != 128 || (b4 & 192) != 128) {
                        return -1;
                    }
                    char c = (char) (((b << 12) ^ (b3 << 6)) ^ (b4 ^ (-123008)));
                    if (Character.isSurrogate(c)) {
                        return -1;
                    }
                    int i6 = dp;
                    dp++;
                    da[i6] = c;
                } else {
                    return -1;
                }
            } else if ((b >> 3) == -2 && sp + 2 < sl) {
                int sp3 = sp + 1;
                byte b5 = sa[sp];
                int sp4 = sp3 + 1;
                byte b6 = sa[sp3];
                sp = sp4 + 1;
                byte b7 = sa[sp4];
                int uc = (((b << 18) ^ (b5 << 12)) ^ (b6 << 6)) ^ (b7 ^ 3678080);
                if ((b5 & 192) != 128 || (b6 & 192) != 128 || (b7 & 192) != 128 || !Character.isSupplementaryCodePoint(uc)) {
                    return -1;
                }
                int i7 = dp;
                int dp2 = dp + 1;
                da[i7] = Character.highSurrogate(uc);
                dp = dp2 + 1;
                da[dp2] = Character.lowSurrogate(uc);
            } else {
                return -1;
            }
        }
        return dp;
    }
}
