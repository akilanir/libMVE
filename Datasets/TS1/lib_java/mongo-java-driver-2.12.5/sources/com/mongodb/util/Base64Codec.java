package com.mongodb.util;

import com.mongodb.Bytes;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/Base64Codec.class */
public class Base64Codec {
    private static final int BYTES_PER_UNENCODED_BLOCK = 3;
    private static final int BYTES_PER_ENCODED_BLOCK = 4;
    private static final int SixBitMask = 63;
    private static final byte PAD = 61;
    private static final byte[] EncodeTable = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};
    private static final int[] DecodeTable = new int[Bytes.QUERYOPTION_PARTIAL];

    static {
        for (int i = 0; i < EncodeTable.length; i++) {
            DecodeTable[EncodeTable[i]] = i;
        }
    }

    public byte[] decode(String s) {
        int delta = s.endsWith("==") ? 2 : s.endsWith("=") ? 1 : 0;
        byte[] buffer = new byte[((s.length() * 3) / 4) - delta];
        int pos = 0;
        for (int i = 0; i < s.length(); i += 4) {
            int c0 = DecodeTable[s.charAt(i)];
            int c1 = DecodeTable[s.charAt(i + 1)];
            int i2 = pos;
            int pos2 = pos + 1;
            buffer[i2] = (byte) (((c0 << 2) | (c1 >> 4)) & 255);
            if (pos2 >= buffer.length) {
                return buffer;
            }
            int c2 = DecodeTable[s.charAt(i + 2)];
            int pos3 = pos2 + 1;
            buffer[pos2] = (byte) (((c1 << 4) | (c2 >> 2)) & 255);
            if (pos3 >= buffer.length) {
                return buffer;
            }
            int c3 = DecodeTable[s.charAt(i + 3)];
            pos = pos3 + 1;
            buffer[pos3] = (byte) (((c2 << 6) | c3) & 255);
        }
        return buffer;
    }

    public String encode(byte[] in) {
        int modulus = 0;
        int bitWorkArea = 0;
        int numEncodedBytes = ((in.length / 3) * 4) + (in.length % 3 == 0 ? 0 : 4);
        byte[] buffer = new byte[numEncodedBytes];
        int pos = 0;
        for (int b : in) {
            modulus = (modulus + 1) % 3;
            if (b < 0) {
                b += 256;
            }
            bitWorkArea = (bitWorkArea << 8) + b;
            if (0 == modulus) {
                int i = pos;
                int pos2 = pos + 1;
                buffer[i] = EncodeTable[(bitWorkArea >> 18) & SixBitMask];
                int pos3 = pos2 + 1;
                buffer[pos2] = EncodeTable[(bitWorkArea >> 12) & SixBitMask];
                int pos4 = pos3 + 1;
                buffer[pos3] = EncodeTable[(bitWorkArea >> 6) & SixBitMask];
                pos = pos4 + 1;
                buffer[pos4] = EncodeTable[bitWorkArea & SixBitMask];
            }
        }
        switch (modulus) {
            case 1:
                int i2 = pos;
                int pos5 = pos + 1;
                buffer[i2] = EncodeTable[(bitWorkArea >> 2) & SixBitMask];
                int pos6 = pos5 + 1;
                buffer[pos5] = EncodeTable[(bitWorkArea << 4) & SixBitMask];
                buffer[pos6] = PAD;
                buffer[pos6 + 1] = PAD;
                break;
            case 2:
                int i3 = pos;
                int pos7 = pos + 1;
                buffer[i3] = EncodeTable[(bitWorkArea >> 10) & SixBitMask];
                int pos8 = pos7 + 1;
                buffer[pos7] = EncodeTable[(bitWorkArea >> 4) & SixBitMask];
                buffer[pos8] = EncodeTable[(bitWorkArea << 2) & SixBitMask];
                buffer[pos8 + 1] = PAD;
                break;
        }
        return new String(buffer);
    }
}
