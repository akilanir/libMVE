package org.bson.io;

import java.io.IOException;
import java.text.MessageFormat;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/io/UTF8Encoding.class */
class UTF8Encoding {
    private static final int MIN_2_BYTES = 128;
    private static final int MIN_3_BYTES = 2048;
    private static final int MIN_4_BYTES = 65536;
    private static final int MAX_CODE_POINT = 1114111;
    private char[] decoderArray = new char[1024];

    UTF8Encoding() {
    }

    private static final void checkByte(int ch, int pos, int len) throws IOException {
        if ((ch & 192) != 128) {
            throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: byte {0} of {1} byte sequence is not 10xxxxxx: {2}", new Integer(pos), new Integer(len), new Integer(ch)));
        }
    }

    private static final void checkMinimal(int ch, int minValue) throws IOException {
        int actualLen;
        int expectedLen;
        if (ch >= minValue) {
            return;
        }
        switch (minValue) {
            case 128:
                actualLen = 2;
                break;
            case MIN_3_BYTES /* 2048 */:
                actualLen = 3;
                break;
            case MIN_4_BYTES /* 65536 */:
                actualLen = 4;
                break;
            default:
                throw new IllegalArgumentException("unexpected minValue passed to checkMinimal: " + minValue);
        }
        if (ch < 128) {
            expectedLen = 1;
        } else if (ch < MIN_3_BYTES) {
            expectedLen = 2;
        } else if (ch < MIN_4_BYTES) {
            expectedLen = 3;
        } else {
            throw new IllegalArgumentException("unexpected ch passed to checkMinimal: " + ch);
        }
        throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: {0} bytes used to encode a {1} byte value: {2}", new Integer(actualLen), new Integer(expectedLen), new Integer(ch)));
    }

    public synchronized String decode(byte[] data, int offset, int length) throws IOException {
        char[] cdata = this.decoderArray;
        if (cdata.length < length) {
            char[] cArr = new char[length];
            this.decoderArray = cArr;
            cdata = cArr;
        }
        int in = offset;
        int out = 0;
        int end = length + offset;
        while (in < end) {
            try {
                int i = in;
                in++;
                int ch = data[i] & 255;
                if (ch >= 128) {
                    if (ch < 192) {
                        throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: initial byte is {0}: {1}", "10xxxxxx", new Integer(ch)));
                    }
                    if (ch < 224) {
                        checkByte(data[in], 2, 2);
                        in++;
                        ch = ((ch & 31) << 6) | (data[in] & 63);
                        checkMinimal(ch, 128);
                    } else if (ch < 240) {
                        checkByte(data[in], 2, 3);
                        int in2 = in + 1;
                        int ch2 = ((ch & 15) << 12) | ((data[in] & 63) << 6);
                        checkByte(data[in2], 3, 3);
                        in = in2 + 1;
                        ch = ch2 | (data[in2] & 63);
                        checkMinimal(ch, MIN_3_BYTES);
                    } else if (ch < 248) {
                        checkByte(data[in], 2, 4);
                        int in3 = in + 1;
                        int ch3 = ((ch & 7) << 18) | ((data[in] & 63) << 12);
                        checkByte(data[in3], 3, 4);
                        int in4 = in3 + 1;
                        int ch4 = ch3 | ((data[in3] & 63) << 6);
                        checkByte(data[in4], 4, 4);
                        in = in4 + 1;
                        ch = ch4 | (data[in4] & 63);
                        checkMinimal(ch, MIN_4_BYTES);
                    } else {
                        throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: initial byte is {0}: {1}", "11111xxx", new Integer(ch)));
                    }
                }
                if (ch > MAX_CODE_POINT) {
                    throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: final value is out of range: {0}", new Integer(ch)));
                }
                if (ch > 65535) {
                    int ch5 = ch - MIN_4_BYTES;
                    int i2 = out;
                    int out2 = out + 1;
                    cdata[i2] = (char) (55296 + (ch5 >> 10));
                    out = out2 + 1;
                    cdata[out2] = (char) (56320 + (ch5 & 1023));
                } else {
                    if (ch >= 55296 && ch < 57344) {
                        throw new IOException(MessageFormat.format("Illegal UTF-8 sequence: final value is a surrogate value: {0}", new Integer(ch)));
                    }
                    int i3 = out;
                    out++;
                    cdata[i3] = (char) ch;
                }
            } catch (ArrayIndexOutOfBoundsException e) {
                throw new IOException("Illegal UTF-8 sequence: multibyte sequence was truncated");
            }
        }
        if (in > end) {
            throw new IOException("Illegal UTF-8 sequence: multibyte sequence was truncated");
        }
        return new String(cdata, 0, out);
    }
}
