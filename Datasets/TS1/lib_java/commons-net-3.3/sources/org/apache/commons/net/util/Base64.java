package org.apache.commons.net.util;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/util/Base64.class */
public class Base64 {
    private static final int DEFAULT_BUFFER_RESIZE_FACTOR = 2;
    private static final int DEFAULT_BUFFER_SIZE = 8192;
    private static final int MASK_8BITS = 255;
    private final byte[] encodeTable;
    private final int lineLength;
    private final byte[] lineSeparator;
    private final int decodeSize;
    private final int encodeSize;
    private byte[] buffer;
    private int pos;
    private int readPos;
    private int currentLinePos;
    private int modulus;
    private boolean eof;
    private int x;
    private static final byte[] CHUNK_SEPARATOR = {13, 10};
    private static final byte[] EMPTY_BYTE_ARRAY = new byte[0];
    static final int CHUNK_SIZE = 76;
    private static final byte[] STANDARD_ENCODE_TABLE = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, CHUNK_SIZE, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};
    private static final byte[] URL_SAFE_ENCODE_TABLE = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, CHUNK_SIZE, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 95};
    private static final int MASK_6BITS = 63;
    private static final byte PAD = 61;
    private static final byte[] DECODE_TABLE = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, 62, -1, MASK_6BITS, 52, 53, 54, 55, 56, 57, 58, 59, 60, PAD, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, MASK_6BITS, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51};

    public Base64() {
        this(false);
    }

    public Base64(boolean urlSafe) {
        this(CHUNK_SIZE, CHUNK_SEPARATOR, urlSafe);
    }

    public Base64(int lineLength) {
        this(lineLength, CHUNK_SEPARATOR);
    }

    public Base64(int lineLength, byte[] lineSeparator) {
        this(lineLength, lineSeparator, false);
    }

    public Base64(int lineLength, byte[] lineSeparator, boolean urlSafe) {
        if (lineSeparator == null) {
            lineLength = 0;
            lineSeparator = EMPTY_BYTE_ARRAY;
        }
        this.lineLength = lineLength > 0 ? (lineLength / 4) * 4 : 0;
        this.lineSeparator = new byte[lineSeparator.length];
        System.arraycopy(lineSeparator, 0, this.lineSeparator, 0, lineSeparator.length);
        if (lineLength > 0) {
            this.encodeSize = 4 + lineSeparator.length;
        } else {
            this.encodeSize = 4;
        }
        this.decodeSize = this.encodeSize - 1;
        if (containsBase64Byte(lineSeparator)) {
            String sep = newStringUtf8(lineSeparator);
            throw new IllegalArgumentException("lineSeperator must not contain base64 characters: [" + sep + "]");
        }
        this.encodeTable = urlSafe ? URL_SAFE_ENCODE_TABLE : STANDARD_ENCODE_TABLE;
    }

    public boolean isUrlSafe() {
        return this.encodeTable == URL_SAFE_ENCODE_TABLE;
    }

    boolean hasData() {
        return this.buffer != null;
    }

    int avail() {
        if (this.buffer != null) {
            return this.pos - this.readPos;
        }
        return 0;
    }

    private void resizeBuffer() {
        if (this.buffer == null) {
            this.buffer = new byte[DEFAULT_BUFFER_SIZE];
            this.pos = 0;
            this.readPos = 0;
        } else {
            byte[] b = new byte[this.buffer.length * 2];
            System.arraycopy(this.buffer, 0, b, 0, this.buffer.length);
            this.buffer = b;
        }
    }

    int readResults(byte[] b, int bPos, int bAvail) {
        if (this.buffer == null) {
            return this.eof ? -1 : 0;
        }
        int len = Math.min(avail(), bAvail);
        if (this.buffer != b) {
            System.arraycopy(this.buffer, this.readPos, b, bPos, len);
            this.readPos += len;
            if (this.readPos >= this.pos) {
                this.buffer = null;
            }
        } else {
            this.buffer = null;
        }
        return len;
    }

    void setInitialBuffer(byte[] out, int outPos, int outAvail) {
        if (out != null && out.length == outAvail) {
            this.buffer = out;
            this.pos = outPos;
            this.readPos = outPos;
        }
    }

    void encode(byte[] in, int inPos, int inAvail) {
        if (this.eof) {
            return;
        }
        if (inAvail < 0) {
            this.eof = true;
            if (this.buffer == null || this.buffer.length - this.pos < this.encodeSize) {
                resizeBuffer();
            }
            switch (this.modulus) {
                case 1:
                    byte[] bArr = this.buffer;
                    int i = this.pos;
                    this.pos = i + 1;
                    bArr[i] = this.encodeTable[(this.x >> 2) & MASK_6BITS];
                    byte[] bArr2 = this.buffer;
                    int i2 = this.pos;
                    this.pos = i2 + 1;
                    bArr2[i2] = this.encodeTable[(this.x << 4) & MASK_6BITS];
                    if (this.encodeTable == STANDARD_ENCODE_TABLE) {
                        byte[] bArr3 = this.buffer;
                        int i3 = this.pos;
                        this.pos = i3 + 1;
                        bArr3[i3] = PAD;
                        byte[] bArr4 = this.buffer;
                        int i4 = this.pos;
                        this.pos = i4 + 1;
                        bArr4[i4] = PAD;
                        break;
                    }
                    break;
                case 2:
                    byte[] bArr5 = this.buffer;
                    int i5 = this.pos;
                    this.pos = i5 + 1;
                    bArr5[i5] = this.encodeTable[(this.x >> 10) & MASK_6BITS];
                    byte[] bArr6 = this.buffer;
                    int i6 = this.pos;
                    this.pos = i6 + 1;
                    bArr6[i6] = this.encodeTable[(this.x >> 4) & MASK_6BITS];
                    byte[] bArr7 = this.buffer;
                    int i7 = this.pos;
                    this.pos = i7 + 1;
                    bArr7[i7] = this.encodeTable[(this.x << 2) & MASK_6BITS];
                    if (this.encodeTable == STANDARD_ENCODE_TABLE) {
                        byte[] bArr8 = this.buffer;
                        int i8 = this.pos;
                        this.pos = i8 + 1;
                        bArr8[i8] = PAD;
                        break;
                    }
                    break;
            }
            if (this.lineLength > 0 && this.pos > 0) {
                System.arraycopy(this.lineSeparator, 0, this.buffer, this.pos, this.lineSeparator.length);
                this.pos += this.lineSeparator.length;
                return;
            }
            return;
        }
        for (int i9 = 0; i9 < inAvail; i9++) {
            if (this.buffer == null || this.buffer.length - this.pos < this.encodeSize) {
                resizeBuffer();
            }
            int i10 = this.modulus + 1;
            this.modulus = i10;
            this.modulus = i10 % 3;
            int i11 = inPos;
            inPos++;
            int b = in[i11];
            if (b < 0) {
                b += 256;
            }
            this.x = (this.x << 8) + b;
            if (0 == this.modulus) {
                byte[] bArr9 = this.buffer;
                int i12 = this.pos;
                this.pos = i12 + 1;
                bArr9[i12] = this.encodeTable[(this.x >> 18) & MASK_6BITS];
                byte[] bArr10 = this.buffer;
                int i13 = this.pos;
                this.pos = i13 + 1;
                bArr10[i13] = this.encodeTable[(this.x >> 12) & MASK_6BITS];
                byte[] bArr11 = this.buffer;
                int i14 = this.pos;
                this.pos = i14 + 1;
                bArr11[i14] = this.encodeTable[(this.x >> 6) & MASK_6BITS];
                byte[] bArr12 = this.buffer;
                int i15 = this.pos;
                this.pos = i15 + 1;
                bArr12[i15] = this.encodeTable[this.x & MASK_6BITS];
                this.currentLinePos += 4;
                if (this.lineLength > 0 && this.lineLength <= this.currentLinePos) {
                    System.arraycopy(this.lineSeparator, 0, this.buffer, this.pos, this.lineSeparator.length);
                    this.pos += this.lineSeparator.length;
                    this.currentLinePos = 0;
                }
            }
        }
    }

    void decode(byte[] in, int inPos, int inAvail) {
        byte b;
        if (this.eof) {
        }
        if (inAvail < 0) {
            this.eof = true;
        }
        int i = 0;
        while (true) {
            if (i >= inAvail) {
                break;
            }
            if (this.buffer == null || this.buffer.length - this.pos < this.decodeSize) {
                resizeBuffer();
            }
            int i2 = inPos;
            inPos++;
            byte b2 = in[i2];
            if (b2 == PAD) {
                this.eof = true;
                break;
            }
            if (b2 >= 0 && b2 < DECODE_TABLE.length && (b = DECODE_TABLE[b2]) >= 0) {
                int i3 = this.modulus + 1;
                this.modulus = i3;
                this.modulus = i3 % 4;
                this.x = (this.x << 6) + b;
                if (this.modulus == 0) {
                    byte[] bArr = this.buffer;
                    int i4 = this.pos;
                    this.pos = i4 + 1;
                    bArr[i4] = (byte) ((this.x >> 16) & 255);
                    byte[] bArr2 = this.buffer;
                    int i5 = this.pos;
                    this.pos = i5 + 1;
                    bArr2[i5] = (byte) ((this.x >> 8) & 255);
                    byte[] bArr3 = this.buffer;
                    int i6 = this.pos;
                    this.pos = i6 + 1;
                    bArr3[i6] = (byte) (this.x & 255);
                }
            }
            i++;
        }
        if (this.eof && this.modulus != 0) {
            this.x <<= 6;
            switch (this.modulus) {
                case 2:
                    this.x <<= 6;
                    byte[] bArr4 = this.buffer;
                    int i7 = this.pos;
                    this.pos = i7 + 1;
                    bArr4[i7] = (byte) ((this.x >> 16) & 255);
                    break;
                case 3:
                    byte[] bArr5 = this.buffer;
                    int i8 = this.pos;
                    this.pos = i8 + 1;
                    bArr5[i8] = (byte) ((this.x >> 16) & 255);
                    byte[] bArr6 = this.buffer;
                    int i9 = this.pos;
                    this.pos = i9 + 1;
                    bArr6[i9] = (byte) ((this.x >> 8) & 255);
                    break;
            }
        }
    }

    public static boolean isBase64(byte octet) {
        return octet == PAD || (octet >= 0 && octet < DECODE_TABLE.length && DECODE_TABLE[octet] != -1);
    }

    public static boolean isArrayByteBase64(byte[] arrayOctet) {
        for (int i = 0; i < arrayOctet.length; i++) {
            if (!isBase64(arrayOctet[i]) && !isWhiteSpace(arrayOctet[i])) {
                return false;
            }
        }
        return true;
    }

    private static boolean containsBase64Byte(byte[] arrayOctet) {
        for (byte element : arrayOctet) {
            if (isBase64(element)) {
                return true;
            }
        }
        return false;
    }

    public static byte[] encodeBase64(byte[] binaryData) {
        return encodeBase64(binaryData, false);
    }

    public static String encodeBase64String(byte[] binaryData) {
        return newStringUtf8(encodeBase64(binaryData, true));
    }

    public static String encodeBase64StringUnChunked(byte[] binaryData) {
        return newStringUtf8(encodeBase64(binaryData, false));
    }

    public static String encodeBase64String(byte[] binaryData, boolean useChunking) {
        return newStringUtf8(encodeBase64(binaryData, useChunking));
    }

    public static byte[] encodeBase64URLSafe(byte[] binaryData) {
        return encodeBase64(binaryData, false, true);
    }

    public static String encodeBase64URLSafeString(byte[] binaryData) {
        return newStringUtf8(encodeBase64(binaryData, false, true));
    }

    public static byte[] encodeBase64Chunked(byte[] binaryData) {
        return encodeBase64(binaryData, true);
    }

    public byte[] decode(String pArray) {
        return decode(getBytesUtf8(pArray));
    }

    private byte[] getBytesUtf8(String pArray) {
        try {
            return pArray.getBytes("UTF8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public byte[] decode(byte[] pArray) {
        reset();
        if (pArray == null || pArray.length == 0) {
            return pArray;
        }
        long len = (pArray.length * 3) / 4;
        byte[] buf = new byte[(int) len];
        setInitialBuffer(buf, 0, buf.length);
        decode(pArray, 0, pArray.length);
        decode(pArray, 0, -1);
        byte[] result = new byte[this.pos];
        readResults(result, 0, result.length);
        return result;
    }

    public static byte[] encodeBase64(byte[] binaryData, boolean isChunked) {
        return encodeBase64(binaryData, isChunked, false);
    }

    public static byte[] encodeBase64(byte[] binaryData, boolean isChunked, boolean urlSafe) {
        return encodeBase64(binaryData, isChunked, urlSafe, Integer.MAX_VALUE);
    }

    public static byte[] encodeBase64(byte[] binaryData, boolean isChunked, boolean urlSafe, int maxResultSize) {
        if (binaryData == null || binaryData.length == 0) {
            return binaryData;
        }
        long len = getEncodeLength(binaryData, isChunked ? CHUNK_SIZE : 0, isChunked ? CHUNK_SEPARATOR : EMPTY_BYTE_ARRAY);
        if (len > maxResultSize) {
            throw new IllegalArgumentException("Input array too big, the output array would be bigger (" + len + ") than the specified maxium size of " + maxResultSize);
        }
        Base64 b64 = isChunked ? new Base64(urlSafe) : new Base64(0, CHUNK_SEPARATOR, urlSafe);
        return b64.encode(binaryData);
    }

    public static byte[] decodeBase64(String base64String) {
        return new Base64().decode(base64String);
    }

    public static byte[] decodeBase64(byte[] base64Data) {
        return new Base64().decode(base64Data);
    }

    private static boolean isWhiteSpace(byte byteToCheck) {
        switch (byteToCheck) {
            case 9:
            case 10:
            case 13:
            case 32:
                return true;
            default:
                return false;
        }
    }

    public String encodeToString(byte[] pArray) {
        return newStringUtf8(encode(pArray));
    }

    private static String newStringUtf8(byte[] encode) {
        try {
            String str = new String(encode, "UTF8");
            return str;
        } catch (UnsupportedEncodingException ue) {
            throw new RuntimeException(ue);
        }
    }

    public byte[] encode(byte[] pArray) {
        reset();
        if (pArray == null || pArray.length == 0) {
            return pArray;
        }
        long len = getEncodeLength(pArray, this.lineLength, this.lineSeparator);
        byte[] buf = new byte[(int) len];
        setInitialBuffer(buf, 0, buf.length);
        encode(pArray, 0, pArray.length);
        encode(pArray, 0, -1);
        if (this.buffer != buf) {
            readResults(buf, 0, buf.length);
        }
        if (isUrlSafe() && this.pos < buf.length) {
            byte[] smallerBuf = new byte[this.pos];
            System.arraycopy(buf, 0, smallerBuf, 0, this.pos);
            buf = smallerBuf;
        }
        return buf;
    }

    private static long getEncodeLength(byte[] pArray, int chunkSize, byte[] chunkSeparator) {
        int chunkSize2 = (chunkSize / 4) * 4;
        long len = (pArray.length * 4) / 3;
        long mod = len % 4;
        if (mod != 0) {
            len += 4 - mod;
        }
        if (chunkSize2 > 0) {
            boolean lenChunksPerfectly = len % ((long) chunkSize2) == 0;
            len += (len / chunkSize2) * chunkSeparator.length;
            if (!lenChunksPerfectly) {
                len += chunkSeparator.length;
            }
        }
        return len;
    }

    public static BigInteger decodeInteger(byte[] pArray) {
        return new BigInteger(1, decodeBase64(pArray));
    }

    public static byte[] encodeInteger(BigInteger bigInt) {
        if (bigInt == null) {
            throw new NullPointerException("encodeInteger called with null parameter");
        }
        return encodeBase64(toIntegerBytes(bigInt), false);
    }

    static byte[] toIntegerBytes(BigInteger bigInt) {
        int bitlen = ((bigInt.bitLength() + 7) >> 3) << 3;
        byte[] bigBytes = bigInt.toByteArray();
        if (bigInt.bitLength() % 8 != 0 && (bigInt.bitLength() / 8) + 1 == bitlen / 8) {
            return bigBytes;
        }
        int startSrc = 0;
        int len = bigBytes.length;
        if (bigInt.bitLength() % 8 == 0) {
            startSrc = 1;
            len--;
        }
        int startDst = (bitlen / 8) - len;
        byte[] resizedBytes = new byte[bitlen / 8];
        System.arraycopy(bigBytes, startSrc, resizedBytes, startDst, len);
        return resizedBytes;
    }

    private void reset() {
        this.buffer = null;
        this.pos = 0;
        this.readPos = 0;
        this.currentLinePos = 0;
        this.modulus = 0;
        this.eof = false;
    }

    int getLineLength() {
        return this.lineLength;
    }

    byte[] getLineSeparator() {
        return (byte[]) this.lineSeparator.clone();
    }
}
