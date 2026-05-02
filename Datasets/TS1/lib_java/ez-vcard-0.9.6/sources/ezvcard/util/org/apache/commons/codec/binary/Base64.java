package ezvcard.util.org.apache.commons.codec.binary;

import java.math.BigInteger;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/org/apache/commons/codec/binary/Base64.class */
public class Base64 extends BaseNCodec {
    private final byte[] encodeTable;
    private final byte[] decodeTable;
    private final byte[] lineSeparator;
    private final int decodeSize;
    private final int encodeSize;
    private int bitWorkArea;
    static final byte[] CHUNK_SEPARATOR = {13, 10};
    private static final byte[] STANDARD_ENCODE_TABLE = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};
    private static final byte[] URL_SAFE_ENCODE_TABLE = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 95};
    private static final int MASK_6BITS = 63;
    private static final int BYTES_PER_UNENCODED_BLOCK = 3;
    private static final int BYTES_PER_ENCODED_BLOCK = 4;
    private static final int BITS_PER_ENCODED_BYTE = 6;
    private static final byte[] DECODE_TABLE = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, 62, -1, MASK_6BITS, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, BYTES_PER_UNENCODED_BLOCK, BYTES_PER_ENCODED_BLOCK, 5, BITS_PER_ENCODED_BYTE, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, MASK_6BITS, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51};

    public Base64() {
        this(0);
    }

    public Base64(boolean urlSafe) {
        this(76, CHUNK_SEPARATOR, urlSafe);
    }

    public Base64(int lineLength) {
        this(lineLength, CHUNK_SEPARATOR);
    }

    public Base64(int lineLength, byte[] lineSeparator) {
        this(lineLength, lineSeparator, false);
    }

    public Base64(int lineLength, byte[] lineSeparator, boolean urlSafe) {
        super(BYTES_PER_UNENCODED_BLOCK, BYTES_PER_ENCODED_BLOCK, lineLength, lineSeparator == null ? 0 : lineSeparator.length);
        this.decodeTable = DECODE_TABLE;
        if (lineSeparator != null) {
            if (containsAlphabetOrPad(lineSeparator)) {
                String sep = StringUtils.newStringUtf8(lineSeparator);
                throw new IllegalArgumentException("lineSeparator must not contain base64 characters: [" + sep + "]");
            }
            if (lineLength > 0) {
                this.encodeSize = BYTES_PER_ENCODED_BLOCK + lineSeparator.length;
                this.lineSeparator = new byte[lineSeparator.length];
                System.arraycopy(lineSeparator, 0, this.lineSeparator, 0, lineSeparator.length);
            } else {
                this.encodeSize = BYTES_PER_ENCODED_BLOCK;
                this.lineSeparator = null;
            }
        } else {
            this.encodeSize = BYTES_PER_ENCODED_BLOCK;
            this.lineSeparator = null;
        }
        this.decodeSize = this.encodeSize - 1;
        this.encodeTable = urlSafe ? URL_SAFE_ENCODE_TABLE : STANDARD_ENCODE_TABLE;
    }

    public boolean isUrlSafe() {
        return this.encodeTable == URL_SAFE_ENCODE_TABLE;
    }

    @Override // ezvcard.util.org.apache.commons.codec.binary.BaseNCodec
    void encode(byte[] in, int inPos, int inAvail) {
        if (this.eof) {
            return;
        }
        if (inAvail < 0) {
            this.eof = true;
            if (0 == this.modulus && this.lineLength == 0) {
                return;
            }
            ensureBufferSize(this.encodeSize);
            int savedPos = this.pos;
            switch (this.modulus) {
                case 1:
                    byte[] bArr = this.buffer;
                    int i = this.pos;
                    this.pos = i + 1;
                    bArr[i] = this.encodeTable[(this.bitWorkArea >> 2) & MASK_6BITS];
                    byte[] bArr2 = this.buffer;
                    int i2 = this.pos;
                    this.pos = i2 + 1;
                    bArr2[i2] = this.encodeTable[(this.bitWorkArea << BYTES_PER_ENCODED_BLOCK) & MASK_6BITS];
                    if (this.encodeTable == STANDARD_ENCODE_TABLE) {
                        byte[] bArr3 = this.buffer;
                        int i3 = this.pos;
                        this.pos = i3 + 1;
                        bArr3[i3] = 61;
                        byte[] bArr4 = this.buffer;
                        int i4 = this.pos;
                        this.pos = i4 + 1;
                        bArr4[i4] = 61;
                        break;
                    }
                    break;
                case 2:
                    byte[] bArr5 = this.buffer;
                    int i5 = this.pos;
                    this.pos = i5 + 1;
                    bArr5[i5] = this.encodeTable[(this.bitWorkArea >> 10) & MASK_6BITS];
                    byte[] bArr6 = this.buffer;
                    int i6 = this.pos;
                    this.pos = i6 + 1;
                    bArr6[i6] = this.encodeTable[(this.bitWorkArea >> BYTES_PER_ENCODED_BLOCK) & MASK_6BITS];
                    byte[] bArr7 = this.buffer;
                    int i7 = this.pos;
                    this.pos = i7 + 1;
                    bArr7[i7] = this.encodeTable[(this.bitWorkArea << 2) & MASK_6BITS];
                    if (this.encodeTable == STANDARD_ENCODE_TABLE) {
                        byte[] bArr8 = this.buffer;
                        int i8 = this.pos;
                        this.pos = i8 + 1;
                        bArr8[i8] = 61;
                        break;
                    }
                    break;
            }
            this.currentLinePos += this.pos - savedPos;
            if (this.lineLength > 0 && this.currentLinePos > 0) {
                System.arraycopy(this.lineSeparator, 0, this.buffer, this.pos, this.lineSeparator.length);
                this.pos += this.lineSeparator.length;
                return;
            }
            return;
        }
        for (int i9 = 0; i9 < inAvail; i9++) {
            ensureBufferSize(this.encodeSize);
            this.modulus = (this.modulus + 1) % BYTES_PER_UNENCODED_BLOCK;
            int i10 = inPos;
            inPos++;
            int b = in[i10];
            if (b < 0) {
                b += 256;
            }
            this.bitWorkArea = (this.bitWorkArea << 8) + b;
            if (0 == this.modulus) {
                byte[] bArr9 = this.buffer;
                int i11 = this.pos;
                this.pos = i11 + 1;
                bArr9[i11] = this.encodeTable[(this.bitWorkArea >> 18) & MASK_6BITS];
                byte[] bArr10 = this.buffer;
                int i12 = this.pos;
                this.pos = i12 + 1;
                bArr10[i12] = this.encodeTable[(this.bitWorkArea >> 12) & MASK_6BITS];
                byte[] bArr11 = this.buffer;
                int i13 = this.pos;
                this.pos = i13 + 1;
                bArr11[i13] = this.encodeTable[(this.bitWorkArea >> BITS_PER_ENCODED_BYTE) & MASK_6BITS];
                byte[] bArr12 = this.buffer;
                int i14 = this.pos;
                this.pos = i14 + 1;
                bArr12[i14] = this.encodeTable[this.bitWorkArea & MASK_6BITS];
                this.currentLinePos += BYTES_PER_ENCODED_BLOCK;
                if (this.lineLength > 0 && this.lineLength <= this.currentLinePos) {
                    System.arraycopy(this.lineSeparator, 0, this.buffer, this.pos, this.lineSeparator.length);
                    this.pos += this.lineSeparator.length;
                    this.currentLinePos = 0;
                }
            }
        }
    }

    @Override // ezvcard.util.org.apache.commons.codec.binary.BaseNCodec
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
            ensureBufferSize(this.decodeSize);
            int i2 = inPos;
            inPos++;
            byte b2 = in[i2];
            if (b2 == 61) {
                this.eof = true;
                break;
            }
            if (b2 >= 0 && b2 < DECODE_TABLE.length && (b = DECODE_TABLE[b2]) >= 0) {
                this.modulus = (this.modulus + 1) % BYTES_PER_ENCODED_BLOCK;
                this.bitWorkArea = (this.bitWorkArea << BITS_PER_ENCODED_BYTE) + b;
                if (this.modulus == 0) {
                    byte[] bArr = this.buffer;
                    int i3 = this.pos;
                    this.pos = i3 + 1;
                    bArr[i3] = (byte) ((this.bitWorkArea >> 16) & 255);
                    byte[] bArr2 = this.buffer;
                    int i4 = this.pos;
                    this.pos = i4 + 1;
                    bArr2[i4] = (byte) ((this.bitWorkArea >> 8) & 255);
                    byte[] bArr3 = this.buffer;
                    int i5 = this.pos;
                    this.pos = i5 + 1;
                    bArr3[i5] = (byte) (this.bitWorkArea & 255);
                }
            }
            i++;
        }
        if (this.eof && this.modulus != 0) {
            ensureBufferSize(this.decodeSize);
            switch (this.modulus) {
                case 2:
                    this.bitWorkArea >>= BYTES_PER_ENCODED_BLOCK;
                    byte[] bArr4 = this.buffer;
                    int i6 = this.pos;
                    this.pos = i6 + 1;
                    bArr4[i6] = (byte) (this.bitWorkArea & 255);
                    break;
                case BYTES_PER_UNENCODED_BLOCK /* 3 */:
                    this.bitWorkArea >>= 2;
                    byte[] bArr5 = this.buffer;
                    int i7 = this.pos;
                    this.pos = i7 + 1;
                    bArr5[i7] = (byte) ((this.bitWorkArea >> 8) & 255);
                    byte[] bArr6 = this.buffer;
                    int i8 = this.pos;
                    this.pos = i8 + 1;
                    bArr6[i8] = (byte) (this.bitWorkArea & 255);
                    break;
            }
        }
    }

    public static boolean isArrayByteBase64(byte[] arrayOctet) {
        return isBase64(arrayOctet);
    }

    public static boolean isBase64(byte octet) {
        return octet == 61 || (octet >= 0 && octet < DECODE_TABLE.length && DECODE_TABLE[octet] != -1);
    }

    public static boolean isBase64(String base64) {
        return isBase64(StringUtils.getBytesUtf8(base64));
    }

    public static boolean isBase64(byte[] arrayOctet) {
        for (int i = 0; i < arrayOctet.length; i++) {
            if (!isBase64(arrayOctet[i]) && !isWhiteSpace(arrayOctet[i])) {
                return false;
            }
        }
        return true;
    }

    public static byte[] encodeBase64(byte[] binaryData) {
        return encodeBase64(binaryData, false);
    }

    public static String encodeBase64String(byte[] binaryData) {
        return StringUtils.newStringUtf8(encodeBase64(binaryData, false));
    }

    public static byte[] encodeBase64URLSafe(byte[] binaryData) {
        return encodeBase64(binaryData, false, true);
    }

    public static String encodeBase64URLSafeString(byte[] binaryData) {
        return StringUtils.newStringUtf8(encodeBase64(binaryData, false, true));
    }

    public static byte[] encodeBase64Chunked(byte[] binaryData) {
        return encodeBase64(binaryData, true);
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
        Base64 b64 = isChunked ? new Base64(urlSafe) : new Base64(0, CHUNK_SEPARATOR, urlSafe);
        long len = b64.getEncodedLength(binaryData);
        if (len > maxResultSize) {
            throw new IllegalArgumentException("Input array too big, the output array would be bigger (" + len + ") than the specified maximum size of " + maxResultSize);
        }
        return b64.encode(binaryData);
    }

    public static byte[] decodeBase64(String base64String) {
        return new Base64().decode(base64String);
    }

    public static byte[] decodeBase64(byte[] base64Data) {
        return new Base64().decode(base64Data);
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
        int bitlen = ((bigInt.bitLength() + 7) >> BYTES_PER_UNENCODED_BLOCK) << BYTES_PER_UNENCODED_BLOCK;
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

    @Override // ezvcard.util.org.apache.commons.codec.binary.BaseNCodec
    protected boolean isInAlphabet(byte octet) {
        return octet >= 0 && octet < this.decodeTable.length && this.decodeTable[octet] != -1;
    }
}
