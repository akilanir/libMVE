package org.apache.commons.compress.archivers.tar;

import java.io.IOException;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import org.apache.commons.compress.archivers.cpio.CpioConstants;
import org.apache.commons.compress.archivers.zip.ZipEncoding;
import org.apache.commons.compress.archivers.zip.ZipEncodingHelper;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/tar/TarUtils.class */
public class TarUtils {
    private static final int BYTE_MASK = 255;
    static final ZipEncoding DEFAULT_ENCODING = ZipEncodingHelper.getZipEncoding(null);
    static final ZipEncoding FALLBACK_ENCODING = new ZipEncoding() { // from class: org.apache.commons.compress.archivers.tar.TarUtils.1
        @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
        public boolean canEncode(String name) {
            return true;
        }

        @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
        public ByteBuffer encode(String name) {
            int length = name.length();
            byte[] buf = new byte[length];
            for (int i = 0; i < length; i++) {
                buf[i] = (byte) name.charAt(i);
            }
            return ByteBuffer.wrap(buf);
        }

        @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
        public String decode(byte[] buffer) {
            byte b;
            int length = buffer.length;
            StringBuilder result = new StringBuilder(length);
            int len$ = buffer.length;
            for (int i$ = 0; i$ < len$ && (b = buffer[i$]) != 0; i$++) {
                result.append((char) (b & TarUtils.BYTE_MASK));
            }
            return result.toString();
        }
    };

    private TarUtils() {
    }

    public static long parseOctal(byte[] buffer, int offset, int length) {
        long result = 0;
        int end = offset + length;
        int start = offset;
        if (length < 2) {
            throw new IllegalArgumentException("Length " + length + " must be at least 2");
        }
        if (buffer[start] == 0) {
            return 0L;
        }
        while (start < end && buffer[start] == 32) {
            start++;
        }
        byte b = buffer[end - 1];
        while (true) {
            byte trailer = b;
            if (start >= end || !(trailer == 0 || trailer == 32)) {
                break;
            }
            end--;
            b = buffer[end - 1];
        }
        while (start < end) {
            byte currentByte = buffer[start];
            if (currentByte < 48 || currentByte > 55) {
                throw new IllegalArgumentException(exceptionMessage(buffer, offset, length, start, currentByte));
            }
            result = (result << 3) + (currentByte - 48);
            start++;
        }
        return result;
    }

    public static long parseOctalOrBinary(byte[] buffer, int offset, int length) {
        if ((buffer[offset] & 128) == 0) {
            return parseOctal(buffer, offset, length);
        }
        boolean negative = buffer[offset] == -1;
        if (length < 9) {
            return parseBinaryLong(buffer, offset, length, negative);
        }
        return parseBinaryBigInteger(buffer, offset, length, negative);
    }

    private static long parseBinaryLong(byte[] buffer, int offset, int length, boolean negative) {
        if (length >= 9) {
            throw new IllegalArgumentException("At offset " + offset + ", " + length + " byte binary number exceeds maximum signed long value");
        }
        long val = 0;
        for (int i = 1; i < length; i++) {
            val = (val << 8) + (buffer[offset + i] & BYTE_MASK);
        }
        if (negative) {
            val = (val - 1) ^ (((long) Math.pow(2.0d, (length - 1) * 8)) - 1);
        }
        return negative ? -val : val;
    }

    private static long parseBinaryBigInteger(byte[] buffer, int offset, int length, boolean negative) {
        byte[] remainder = new byte[length - 1];
        System.arraycopy(buffer, offset + 1, remainder, 0, length - 1);
        BigInteger val = new BigInteger(remainder);
        if (negative) {
            val = val.add(BigInteger.valueOf(-1L)).not();
        }
        if (val.bitLength() > 63) {
            throw new IllegalArgumentException("At offset " + offset + ", " + length + " byte binary number exceeds maximum signed long value");
        }
        return negative ? -val.longValue() : val.longValue();
    }

    public static boolean parseBoolean(byte[] buffer, int offset) {
        return buffer[offset] == 1;
    }

    private static String exceptionMessage(byte[] buffer, int offset, int length, int current, byte currentByte) {
        String string = new String(buffer, offset, length);
        String s = "Invalid byte " + ((int) currentByte) + " at offset " + (current - offset) + " in '" + string.replaceAll("��", "{NUL}") + "' len=" + length;
        return s;
    }

    public static String parseName(byte[] buffer, int offset, int length) {
        try {
            return parseName(buffer, offset, length, DEFAULT_ENCODING);
        } catch (IOException e) {
            try {
                return parseName(buffer, offset, length, FALLBACK_ENCODING);
            } catch (IOException ex2) {
                throw new RuntimeException(ex2);
            }
        }
    }

    public static String parseName(byte[] buffer, int offset, int length, ZipEncoding encoding) throws IOException {
        int len = length;
        while (len > 0 && buffer[(offset + len) - 1] == 0) {
            len--;
        }
        if (len > 0) {
            byte[] b = new byte[len];
            System.arraycopy(buffer, offset, b, 0, len);
            return encoding.decode(b);
        }
        return "";
    }

    public static int formatNameBytes(String name, byte[] buf, int offset, int length) {
        try {
            return formatNameBytes(name, buf, offset, length, DEFAULT_ENCODING);
        } catch (IOException e) {
            try {
                return formatNameBytes(name, buf, offset, length, FALLBACK_ENCODING);
            } catch (IOException ex2) {
                throw new RuntimeException(ex2);
            }
        }
    }

    public static int formatNameBytes(String name, byte[] buf, int offset, int length, ZipEncoding encoding) throws IOException {
        ByteBuffer b;
        int len = name.length();
        ByteBuffer encode = encoding.encode(name);
        while (true) {
            b = encode;
            if (b.limit() <= length || len <= 0) {
                break;
            }
            len--;
            encode = encoding.encode(name.substring(0, len));
        }
        int limit = b.limit() - b.position();
        System.arraycopy(b.array(), b.arrayOffset(), buf, offset, limit);
        for (int i = limit; i < length; i++) {
            buf[offset + i] = 0;
        }
        return offset + length;
    }

    public static void formatUnsignedOctalString(long value, byte[] buffer, int offset, int length) {
        int remaining = length - 1;
        if (value == 0) {
            remaining--;
            buffer[offset + remaining] = 48;
        } else {
            long val = value;
            while (remaining >= 0 && val != 0) {
                buffer[offset + remaining] = (byte) (48 + ((byte) (val & 7)));
                val >>>= 3;
                remaining--;
            }
            if (val != 0) {
                throw new IllegalArgumentException(value + "=" + Long.toOctalString(value) + " will not fit in octal number buffer of length " + length);
            }
        }
        while (remaining >= 0) {
            buffer[offset + remaining] = 48;
            remaining--;
        }
    }

    public static int formatOctalBytes(long value, byte[] buf, int offset, int length) {
        int idx = length - 2;
        formatUnsignedOctalString(value, buf, offset, idx);
        buf[offset + idx] = 32;
        buf[offset + idx + 1] = 0;
        return offset + length;
    }

    public static int formatLongOctalBytes(long value, byte[] buf, int offset, int length) {
        int idx = length - 1;
        formatUnsignedOctalString(value, buf, offset, idx);
        buf[offset + idx] = 32;
        return offset + length;
    }

    public static int formatLongOctalOrBinaryBytes(long value, byte[] buf, int offset, int length) {
        long maxAsOctalChar = length == 8 ? TarConstants.MAXID : TarConstants.MAXSIZE;
        boolean negative = value < 0;
        if (!negative && value <= maxAsOctalChar) {
            return formatLongOctalBytes(value, buf, offset, length);
        }
        if (length < 9) {
            formatLongBinary(value, buf, offset, length, negative);
        }
        formatBigIntegerBinary(value, buf, offset, length, negative);
        buf[offset] = (byte) (negative ? BYTE_MASK : CpioConstants.C_IWUSR);
        return offset + length;
    }

    private static void formatLongBinary(long value, byte[] buf, int offset, int length, boolean negative) {
        int bits = (length - 1) * 8;
        long max = 1 << bits;
        long val = Math.abs(value);
        if (val >= max) {
            throw new IllegalArgumentException("Value " + value + " is too large for " + length + " byte field.");
        }
        if (negative) {
            val = ((val ^ (max - 1)) | (BYTE_MASK << bits)) + 1;
        }
        for (int i = (offset + length) - 1; i >= offset; i--) {
            buf[i] = (byte) val;
            val >>= 8;
        }
    }

    private static void formatBigIntegerBinary(long value, byte[] buf, int offset, int length, boolean negative) {
        BigInteger val = BigInteger.valueOf(value);
        byte[] b = val.toByteArray();
        int len = b.length;
        int off = (offset + length) - len;
        System.arraycopy(b, 0, buf, off, len);
        byte fill = (byte) (negative ? BYTE_MASK : 0);
        for (int i = offset + 1; i < off; i++) {
            buf[i] = fill;
        }
    }

    public static int formatCheckSumOctalBytes(long value, byte[] buf, int offset, int length) {
        int idx = length - 2;
        formatUnsignedOctalString(value, buf, offset, idx);
        buf[offset + idx] = 0;
        buf[offset + idx + 1] = 32;
        return offset + length;
    }

    public static long computeCheckSum(byte[] buf) {
        long sum = 0;
        for (byte element : buf) {
            sum += BYTE_MASK & element;
        }
        return sum;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0053 A[PHI: r12
      0x0053: PHI (r12v3 'digits' int) = (r12v1 'digits' int), (r12v1 'digits' int), (r12v6 'digits' int) binds: [B:10:0x002e, B:12:0x0035, B:14:0x003f] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean verifyCheckSum(byte[] r5) {
        /*
            r0 = 0
            r6 = r0
            r0 = 0
            r8 = r0
            r0 = 0
            r10 = r0
            r0 = 0
            r12 = r0
            r0 = 0
            r13 = r0
        Ld:
            r0 = r13
            r1 = r5
            int r1 = r1.length
            if (r0 >= r1) goto L78
            r0 = r5
            r1 = r13
            r0 = r0[r1]
            r14 = r0
            r0 = 148(0x94, float:2.07E-43)
            r1 = r13
            if (r0 > r1) goto L60
            r0 = r13
            r1 = 156(0x9c, float:2.19E-43)
            if (r0 >= r1) goto L60
            r0 = 48
            r1 = r14
            if (r0 > r1) goto L53
            r0 = r14
            r1 = 55
            if (r0 > r1) goto L53
            r0 = r12
            int r12 = r12 + 1
            r1 = 6
            if (r0 >= r1) goto L53
            r0 = r6
            r1 = 8
            long r0 = r0 * r1
            r1 = r14
            long r1 = (long) r1
            long r0 = r0 + r1
            r1 = 48
            long r0 = r0 - r1
            r6 = r0
            goto L5c
        L53:
            r0 = r12
            if (r0 <= 0) goto L5c
            r0 = 6
            r12 = r0
        L5c:
            r0 = 32
            r14 = r0
        L60:
            r0 = r8
            r1 = 255(0xff, float:3.57E-43)
            r2 = r14
            r1 = r1 & r2
            long r1 = (long) r1
            long r0 = r0 + r1
            r8 = r0
            r0 = r10
            r1 = r14
            long r1 = (long) r1
            long r0 = r0 + r1
            r10 = r0
            int r13 = r13 + 1
            goto Ld
        L78:
            r0 = r6
            r1 = r8
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 == 0) goto L8b
            r0 = r6
            r1 = r10
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 == 0) goto L8b
            r0 = r6
            r1 = r8
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 <= 0) goto L8f
        L8b:
            r0 = 1
            goto L90
        L8f:
            r0 = 0
        L90:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.tar.TarUtils.verifyCheckSum(byte[]):boolean");
    }
}
