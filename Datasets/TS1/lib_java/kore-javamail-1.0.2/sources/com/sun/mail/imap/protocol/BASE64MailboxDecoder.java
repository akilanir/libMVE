package com.sun.mail.imap.protocol;

import java.text.CharacterIterator;
import java.text.StringCharacterIterator;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/protocol/BASE64MailboxDecoder.class */
public class BASE64MailboxDecoder {
    static final char[] pem_array = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', ','};
    private static final byte[] pem_convert_array = new byte[256];

    public static String decode(String original) {
        if (original == null || original.length() == 0) {
            return original;
        }
        boolean changedString = false;
        int copyTo = 0;
        char[] chars = new char[original.length()];
        StringCharacterIterator iter = new StringCharacterIterator(original);
        char first = iter.first();
        while (true) {
            char c = first;
            if (c == 65535) {
                break;
            }
            if (c == '&') {
                changedString = true;
                copyTo = base64decode(chars, copyTo, iter);
            } else {
                int i = copyTo;
                copyTo++;
                chars[i] = c;
            }
            first = iter.next();
        }
        if (changedString) {
            return new String(chars, 0, copyTo);
        }
        return original;
    }

    protected static int base64decode(char[] buffer, int offset, CharacterIterator iter) {
        boolean firsttime = true;
        int leftover = -1;
        while (true) {
            byte orig_0 = (byte) iter.next();
            if (orig_0 == -1) {
                break;
            }
            if (orig_0 == 45) {
                if (firsttime) {
                    int i = offset;
                    offset++;
                    buffer[i] = '&';
                }
            } else {
                firsttime = false;
                byte orig_1 = (byte) iter.next();
                if (orig_1 == -1 || orig_1 == 45) {
                    break;
                }
                byte a = pem_convert_array[orig_0 & 255];
                byte b = pem_convert_array[orig_1 & 255];
                byte current = (byte) (((a << 2) & 252) | ((b >>> 4) & 3));
                if (leftover != -1) {
                    int i2 = offset;
                    offset++;
                    buffer[i2] = (char) ((leftover << 8) | (current & 255));
                    leftover = -1;
                } else {
                    leftover = current & 255;
                }
                byte orig_2 = (byte) iter.next();
                if (orig_2 != 61) {
                    if (orig_2 == -1 || orig_2 == 45) {
                        break;
                    }
                    byte b2 = pem_convert_array[orig_2 & 255];
                    byte current2 = (byte) (((b << 4) & 240) | ((b2 >>> 2) & 15));
                    if (leftover != -1) {
                        int i3 = offset;
                        offset++;
                        buffer[i3] = (char) ((leftover << 8) | (current2 & 255));
                        leftover = -1;
                    } else {
                        leftover = current2 & 255;
                    }
                    byte orig_3 = (byte) iter.next();
                    if (orig_3 == 61) {
                        continue;
                    } else {
                        if (orig_3 == -1 || orig_3 == 45) {
                            break;
                        }
                        byte current3 = (byte) (((b2 << 6) & 192) | (pem_convert_array[orig_3 & 255] & 63));
                        if (leftover != -1) {
                            int i4 = offset;
                            offset++;
                            buffer[i4] = (char) ((leftover << 8) | (current3 & 255));
                            leftover = -1;
                        } else {
                            leftover = current3 & 255;
                        }
                    }
                }
            }
        }
        return offset;
    }

    static {
        for (int i = 0; i < 255; i++) {
            pem_convert_array[i] = -1;
        }
        for (int i2 = 0; i2 < pem_array.length; i2++) {
            pem_convert_array[pem_array[i2]] = (byte) i2;
        }
    }
}
